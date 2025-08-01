<?php

namespace Controllers\Admin\Orders;

use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Security;
use Utilities\Site;
use Dao\Orders\OrderItems;
use Utilities\Validators;
use Dao\Admin\Pedidos;

class Pedido extends PrivateController
{
    private $orderId = 0;
    private $viewData = [
        'errors' => [],
        'order' => [],
        'items' => [],
        'readOnly' => true,
    ];

    public function run(): void
    {
        $this->orderId = intval($_GET['id'] ?? $_POST['orderid'] ?? 0);
        if ($this->orderId <= 0) {
            Site::redirectTo('index.php?page=Admin-Orders-Pedidos');
            return;
        }

        // Obtener datos base de la orden
        $order = Pedidos::getByOrderId($this->orderId);
        if (!$order || intval($order['orderid']) !== $this->orderId) {
            Site::redirectTo('index.php?page=Admin-Orders-Pedidos');
            return;
        }

        // Obtener productos
        $items = OrderItems::getByOrderId($this->orderId);
        foreach ($items as &$item) {
            $item['precio'] = number_format($item['precio'], 2);
            $item['subtotal'] = number_format($item['precio'] * $item['cantidad'], 2);
        }

        // Formatear fecha y total
        $date = new \DateTime($order['orderdate']);
        $order['orderdate'] = $date->format('Y-m-d');
        $order['total'] = number_format($order['total'], 2);

        $this->viewData['items'] = $items;

        if ($this->isPostBack()) {
            $this->getBodyData();
            $this->processData();

            // Combinar el estado actualizado (aunque sea fallido) con el resto del pedido original
            $order['order_status'] = $this->viewData['order']['order_status'];
        }

        // Marcar la opción seleccionada para el select
        $order['status_PENDING'] = ($order['order_status'] === 'PENDING') ? ' selected' : '';
        $order['status_COMPLETED'] = ($order['order_status'] === 'COMPLETED') ? ' selected' : '';
        $order['status_CANCELLED'] = ($order['order_status'] === 'CANCELLED') ? ' selected' : '';
        $order['statusClass'] = $this->getStatusClass($order['order_status']);

        $this->viewData['order'] = $order;

        Renderer::render('Admin/Orders/Pedido', $this->viewData);
    }

    private function getStatusClass(string $status): string
    {
        return match ($status) {
            'COMPLETED' => 'text-success',
            'PENDING' => 'text-warning',
            'FAILED', 'CANCELLED' => 'text-danger',
            default => '',
        };
    }

    private function getBodyData(): void
    {
        $this->viewData['order']['orderid'] = intval($_POST['orderid'] ?? 0);
        $this->viewData['order']['order_status'] = $_POST['order_status'] ?? '';

        // Validación básica
        $validStatuses = ['PENDING', 'COMPLETED', 'CANCELLED'];
        if (!in_array($this->viewData['order']['order_status'], $validStatuses)) {
            $this->viewData['errors']['order_status'] = 'Estado no válido.';
        }
    }

    private function processData(): void
    {
        if (count($this->viewData['errors']) > 0) {
            return; // No continúa si hay errores
        }

        $orderId = $this->viewData['order']['orderid'];
        $orderStatus = $this->viewData['order']['order_status'];

        // Guardar
        Pedidos::updateOrderStatus($orderId, $orderStatus);

        // Redirigir con mensaje
        Site::redirectToWithMsg('index.php?page=Admin-Orders-Pedidos', 'Pedido actualizado correctamente');
    }
}
