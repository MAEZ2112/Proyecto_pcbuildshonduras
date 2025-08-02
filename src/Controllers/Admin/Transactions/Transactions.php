<?php
namespace Controllers\Admin\Transactions;

use Controllers\PrivateController;
use Utilities\Context;
use Utilities\Paging;
use Dao\Admin\Transactions as DaoTransactions;
use Views\Renderer;

class Transactions extends PrivateController
{
    private array $viewData = [];
    private string $orderBy = "transdate";
    private bool $orderDescending = true;
    private int $pageNumber = 1;
    private int $itemsPerPage = 10;
    private int $transactionsCount = 0;
    private int $pages = 1;
    private array $transactions = [];
    private string $transstatus = "";
    private float $minAmount = 0.0;

    public function run(): void
    {
        $this->getParamsFromContext();
        $this->getParamsFromRequest();

        $tmp = DaoTransactions::getAllTransactions(
            $this->orderBy,
            $this->orderDescending,
            $this->pageNumber - 1,
            $this->itemsPerPage,
            $this->transstatus,
            $this->minAmount
        );

        $this->transactions = $tmp["transactions"];
        $this->transactionsCount = $tmp["total"];
        $this->pages = $this->transactionsCount > 0 ? ceil($this->transactionsCount / $this->itemsPerPage) : 1;

        if ($this->pageNumber > $this->pages) {
            $this->pageNumber = $this->pages;
        }

        $this->setParamsToContext();
        $this->setParamsToDataView();
        Renderer::render("admin/transactions/transactions", $this->viewData);
    }

    private function getParamsFromRequest(): void
    {
        $this->transstatus = $_GET["transstatus"] ?? $this->transstatus;
        $this->minAmount = isset($_GET["minAmount"]) ? floatval($_GET["minAmount"]) : $this->minAmount;

        $this->orderBy = $_GET["orderBy"] ?? $this->orderBy;
        if (!in_array($this->orderBy, ["transactionId", "transdate", "amount", "transstatus"])) {
            $this->orderBy = "transdate";
        }

        $this->orderDescending = isset($_GET["orderDescending"]) ? boolval($_GET["orderDescending"]) : $this->orderDescending;
        $this->pageNumber = isset($_GET["pageNum"]) ? max(1, intval($_GET["pageNum"])) : $this->pageNumber;
        $this->itemsPerPage = isset($_GET["itemsPerPage"]) ? max(1, intval($_GET["itemsPerPage"])) : $this->itemsPerPage;
    }

    private function getParamsFromContext(): void
    {
        $this->orderBy = Context::getContextByKey("admin_transactions_orderBy", $this->orderBy);
        $this->orderDescending = boolval(Context::getContextByKey("admin_transactions_orderDescending", $this->orderDescending));
        $this->pageNumber = intval(Context::getContextByKey("admin_transactions_page", $this->pageNumber));
        $this->itemsPerPage = intval(Context::getContextByKey("admin_transactions_itemsPerPage", $this->itemsPerPage));
        if ($this->pageNumber < 1) $this->pageNumber = 1;
        if ($this->itemsPerPage < 1) $this->itemsPerPage = 10;
    }

    private function setParamsToContext(): void
    {
        Context::setContext("admin_transactions_orderBy", $this->orderBy, true);
        Context::setContext("admin_transactions_orderDescending", $this->orderDescending, true);
        Context::setContext("admin_transactions_page", $this->pageNumber, true);
        Context::setContext("admin_transactions_itemsPerPage", $this->itemsPerPage, true);
    }

    private function setParamsToDataView(): void
    {
        $this->viewData["orderBy"] = $this->orderBy;
        $this->viewData["orderDescending"] = $this->orderDescending;
        $this->viewData["pageNum"] = $this->pageNumber;
        $this->viewData["itemsPerPage"] = $this->itemsPerPage;
        $this->viewData["transactionsCount"] = $this->transactionsCount;
        $this->viewData["pages"] = $this->pages;
        $this->viewData["transactions"] = $this->transactions;
        $this->viewData["transstatus"] = $this->transstatus;
        $this->viewData["minAmount"] = $this->minAmount;

        // Marcar columnas ordenadas
        if ($this->orderBy !== "") {
            $orderByKey = "Order" . ucfirst($this->orderBy);
            $orderByKeyNoOrder = "OrderBy" . ucfirst($this->orderBy);
            $this->viewData[$orderByKeyNoOrder] = true;
            if ($this->orderDescending) {
                $orderByKey .= "Desc";
            }
            $this->viewData[$orderByKey] = true;
        }

        // Marcar estado seleccionado
        $statusOptions = ["COMPLETED", "PENDING", "FAILED"];
        foreach ($statusOptions as $status) {
            $this->viewData["status_" . $status] = ($this->transstatus === $status) ? "selected" : "";
        }
        $this->viewData["status_EMP"] = ($this->transstatus === "") ? "selected" : "";

        // Paginación
        $this->viewData["pagination"] = Paging::getPagination(
            $this->transactionsCount,
            $this->itemsPerPage,
            $this->pageNumber,
            "index.php?page=Admin_Transactions_Transactions",
            "Admin_Transactions_Transactions"
        );
    }
}
?>