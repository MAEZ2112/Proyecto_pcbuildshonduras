<?php

namespace Controllers\Admin\Transactions;

use Controllers\PrivateController;
use Dao\Admin\Transactions as TransactionsDAO;
use Utilities\Site;
use Views\Renderer;

const LIST_URL = "index.php?page=Admin_Transactions_Transactions";

class Transaction extends PrivateController
{
    private array $viewData;
    private array $modes;
    private array $transaction = [];

    public function __construct()
    {
        parent::__construct();
        $this->viewData = [
            "mode" => "",
            "transactionId" => 0,
            "usercod" => 0,
            "orderid" => "",
            "transdate" => "",
            "transstatus" => "",
            "amount" => 0.0,
            "currency" => "",
            "orderjson" => "",
            "FormTitle" => "",
            "readonly" => "readonly",
            "showCommitBtn" => false,
            "errors" => []
        ];
        $this->modes = [
            "DSP" => "Detalle de la Transacción: %s"
        ];
    }

    public function run(): void
    {
        $this->getQueryParamsData();
        $this->getDataFromDB();
        $this->prepareViewData();
        Renderer::render("admin/transactions/transaction", $this->viewData);
    }

    private function throwError(string $message, string $logMessage = "")
    {
        if (!empty($logMessage)) {
            error_log(sprintf("%s - %s", $this->name, $logMessage));
        }
        Site::redirectToWithMsg(LIST_URL, $message);
    }

    private function getQueryParamsData()
    {
        if (!isset($_GET["mode"])) {
            $this->throwError("Modo de ejecución no especificado", "Falta el parámetro mode");
        }

        $this->viewData["mode"] = $_GET["mode"];
        if (!isset($this->modes[$this->viewData["mode"]])) {
            $this->throwError("Modo inválido", "Valor desconocido en el parámetro mode: " . $this->viewData["mode"]);
        }

        if (!isset($_GET["transactionId"]) || !is_numeric($_GET["transactionId"])) {
            $this->throwError("ID de transacción inválido", "ID ausente o no numérico");
        }

        $this->viewData["transactionId"] = intval($_GET["transactionId"]);
    }

    private function getDataFromDB()
    {
        $tmpTransaction = TransactionsDAO::getTransactionById($this->viewData["transactionId"]);
        if (!$tmpTransaction) {
            $this->throwError("Transacción no encontrada", "ID " . $this->viewData["transactionId"] . " no existe");
        }

        foreach ($tmpTransaction as $key => $value) {
            $this->viewData[$key] = $value;
        }
    }

    private function prepareViewData()
    {
        $this->viewData["FormTitle"] = sprintf(
            $this->modes[$this->viewData["mode"]],
            $this->viewData["transactionId"]
        );          

        $this->viewData["timestamp"] = time();
        $this->viewData["xsrtoken"] = hash("sha256", json_encode($this->viewData));
        $_SESSION[$this->name . "-xsrtoken"] = $this->viewData["xsrtoken"];
    }
}