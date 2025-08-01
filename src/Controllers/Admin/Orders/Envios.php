<?php

namespace Controllers\Admin\Orders;

use Controllers\PrivateController;
use Dao\Admin\Pedidos as PedidosDao;
use Views\Renderer;
use Utilities\Site;

class Envios extends PrivateController
{
    private $viewData = [];
    public function __construct(){
        parent::__construct();
        $this->viewData['pageTitle'] = 'Manejo de Envios';
        $this->viewData['pageNav'] = 'Menu_Envios';
        $this->viewData['pageDescription'] = 'Manejo de envios con Ordenes ya Completas.';
    }

    public function run(): void
    {
        $this->viewData['orders'] = PedidosDao::getOrdersStatusCompleted();
        Site::addLink("public/css/paginas/pedidos.css");
        Renderer::render('Admin/Orders/Envios', $this->viewData);
    }


}