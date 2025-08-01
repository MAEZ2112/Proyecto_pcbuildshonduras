<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
class Error extends PublicController
{
    public function run(): void
    {
            $orderData = \Dao\Orders\Orders::getLastOrderIdByUser(\Utilities\Security::getUserId());

            if ($orderData && isset($orderData['orderid'])) {
                $orderId = $orderData['orderid'];
                \Dao\Orders\OrderItems::deleteByOrderId($orderId);
                \Dao\Orders\Orders::deleteOrder($orderId);
            }

        $viewData = array(
            "errorMessage" => "An error occurred during the checkout process. Please try again later."

        );

        // Render the error view
        \Views\Renderer::render("paypal/error", $viewData);
    }
}

?>
