<?php

namespace Controllers\Admin\Orders;

use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Security;
use Utilities\Site;
use Dao\Orders\OrderItems;
use Utilities\Validators;
use Dao\Admin\Pedidos;

class Envio extends PrivateController
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
            Site::redirectTo('index.php?page=Admin-Orders-Envios');
            return;
        }

        // Obtener datos base de la orden
        $order = Pedidos::getByOrderId($this->orderId);
        if (!$order || intval($order['orderid']) !== $this->orderId) {
            Site::redirectTo('index.php?page=Admin-Orders-Envios');
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
            $order['shipping_status'] = $this->viewData['order']['shipping_status'];
        }

        // Marcar la opción seleccionada para el select
        $order['status_PENDING'] = ($order['shipping_status'] === 'PENDING') ? ' selected' : '';
        $order['status_SHIPPING'] = ($order['shipping_status'] === 'SHIPPING') ? ' selected' : '';
        $order['status_DELIVERED'] = ($order['shipping_status'] === 'DELIVERED') ? ' selected' : '';
        $order['shippingClass'] = $this->getShippingClass($order['shipping_status']);

        $this->viewData['order'] = $order;

        Renderer::render('Admin/Orders/Envio', $this->viewData);
    }

    private function getShippingClass(string $status): string
    {
        return match ($status) {
            'PENDING' => 'text-warning',
            'SHIPPING' => 'text-info',
            'DELIVERED' => 'text-success',
            default => '',
        };
    }

    private function getBodyData(): void
    {
        $this->viewData['order']['orderid'] = intval($_POST['orderid'] ?? 0);
        $this->viewData['order']['shipping_status'] = $_POST['shipping_status'] ?? '';

        // Validación básica
        $validStatuses = ['PENDING', 'SHIPPING', 'DELIVERED'];
        if (!in_array($this->viewData['order']['shipping_status'], $validStatuses)) {
            $this->viewData['errors']['shipping_status'] = 'Estado no válido.';
        }
    }

    private function processData(): void
    {
        if (count($this->viewData['errors']) > 0) {
            return; // No continúa si hay errores
        }

        $orderId = $this->viewData['order']['orderid'];
        $shippingStatus = $this->viewData['order']['shipping_status'];

        // Guardar
        Pedidos::updateShippingStatus($orderId, $shippingStatus);

        // Redirigir con mensaje
        Site::redirectToWithMsg('index.php?page=Admin-Orders-Envios', 'Envio actualizado correctamente');
    }
}
