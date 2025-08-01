<?php

namespace Controllers\Admin\Orders;

use Controllers\PrivateController;
use Dao\Admin\Pedidos as PedidosDao;
use Views\Renderer;
use Utilities\Site;

class Pedidos extends PrivateController
{
    private $viewData = [];
    public function __construct(){
        parent::__construct();
        $this->viewData['pageTitle'] = 'Manejo de Pedidos';
        $this->viewData['pageNav'] = 'Menu_Pedidos';
        $this->viewData['pageDescription'] = 'Manejo de pedidos realizados por los usuarios.';
    }

    public function run(): void
    {
        $this->viewData['orders'] = PedidosDao::getPedidos();
        Site::addLink("public/css/paginas/pedidos.css");
        Renderer::render('Admin/Orders/Pedidos', $this->viewData);
    }


}