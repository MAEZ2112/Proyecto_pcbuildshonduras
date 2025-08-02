<?php
namespace Dao\Admin;

use Dao\Table;

class Transactions extends Table {

  public static function getTransactionById(int $transactionId) {
    $sqlstr = "SELECT 
      t.transactionId,
      t.usercod,
      t.orderid,
      t.transdate,
      t.transstatus,
      t.amount,
      t.currency,
      t.orderjson,
      u.username
    FROM transactions t
    LEFT JOIN usuario u ON t.usercod = u.usercod
    WHERE t.transactionId = :transactionId";

    $params = ["transactionId" => $transactionId];
    return self::obtenerUnRegistro($sqlstr, $params);
  }

  public static function getAllTransactions(
    string $orderBy = "transdate",
    bool $orderDescending = true,
    int $page = 0,
    int $itemsPerPage = 10,
    string $transstatus = "",
    float $minAmount = 0.0
) {
    $sqlstr = "SELECT 
      t.transactionId, t.usercod, t.orderid, t.transdate, t.transstatus, t.amount, t.currency, u.username
      FROM transactions t
      LEFT JOIN usuario u ON t.usercod = u.usercod";

    $sqlstrCount = "SELECT COUNT(*) as count FROM transactions t";

    $conditions = [];
    $params = [];

    if ($transstatus !== "") {
        $conditions[] = "t.transstatus = :transstatus";
        $params["transstatus"] = $transstatus;
    }

    if ($minAmount > 0) {
        $conditions[] = "t.amount >= :minAmount";
        $params["minAmount"] = $minAmount;
    }

    if (count($conditions) > 0) {
        $where = " WHERE " . implode(" AND ", $conditions);
        $sqlstr .= $where;
        $sqlstrCount .= $where;
    }

    $validOrderBy = ["transactionId", "transdate", "amount", "transstatus"];
    if ($orderBy !== "" && in_array($orderBy, $validOrderBy)) {
        $sqlstr .= " ORDER BY " . $orderBy;
        if ($orderDescending) {
            $sqlstr .= " DESC";
        }
    }

    $totalRecords = self::obtenerUnRegistro($sqlstrCount, $params)["count"];
    $pagesCount = ceil($totalRecords / $itemsPerPage);
    if ($page > $pagesCount - 1) {
        $page = max(0, $pagesCount - 1);
    }

    $sqlstr .= " LIMIT " . ($page * $itemsPerPage) . ", " . $itemsPerPage;

    $records = self::obtenerRegistros($sqlstr, $params);
    return [
        "transactions" => $records,
        "total" => $totalRecords,
        "page" => $page,
        "itemsPerPage" => $itemsPerPage
    ];
}
}