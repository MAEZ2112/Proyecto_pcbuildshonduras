<?php

namespace Dao\Admin;

use Dao\Table;

class Pedidos extends Table
{
    public static function getPedidos(): array
    {
        $sql = "SELECT 
            o.orderid,
            u.username,
            o.order_status,
            o.orderdate,
            o.total,
            o.currency
        FROM ordenes AS o
        INNER JOIN usuario AS u ON o.usercod = u.usercod
        ORDER BY o.orderdate ASC;";
        
        return self::obtenerRegistros($sql, []);
    }

    public static function getOrdersStatusCompleted(): array
    {
        $sql = "SELECT 
            o.orderid,
            u.username,
            o.shipping_status,
            o.orderdate,
            o.total,
            o.currency
        FROM ordenes AS o
        INNER JOIN usuario AS u ON o.usercod = u.usercod
        WHERE o.order_status = 'COMPLETED'
        ORDER BY o.orderdate ASC;";
        
        return self::obtenerRegistros($sql, []);
    }

    public static function updateOrderStatus(int $orderId, string $status)
    {
        $sql = "UPDATE ordenes SET order_status = :status WHERE orderid = :orderId";
        return self::executeNonQuery($sql, ['status' => $status, 'orderId' => $orderId]);
    }

    public static function updateShippingStatus(int $orderId, string $status)
    {
        $sql = "UPDATE ordenes SET shipping_status = :status WHERE orderid = :orderId";
        return self::executeNonQuery($sql, ['status' => $status, 'orderId' => $orderId]);
    }

    public static function getOrderDetails(int $orderId): array
    {
        $sql = "SELECT 
            o.orderid,
            od.id_producto,
            p.nombre_producto,
            od.cantidad,
            od.precio,
            o.total,
            o.currency,
            o.order_status,
            o.orderdate
        FROM ordenes_detalle AS od
        INNER JOIN ordenes AS o ON od.orderid = o.orderid
        INNER JOIN producto AS p ON od.id_producto = p.id_producto
        WHERE o.orderid = :orderId;";

        return self::obtenerRegistros($sql, ['orderId' => $orderId]);
    }

    public static function getByOrderId(int $orderId): array
    {
        $sql = "SELECT 
            o.orderid,
            o.usercod,
            o.order_status,
            o.shipping_status,
            o.orderdate,
            o.total,
            u.username,
            pt.currency
        FROM ordenes AS o
        LEFT JOIN usuario AS u ON o.usercod = u.usercod
        LEFT JOIN transactions AS pt ON o.transactionId = pt.transactionId
        WHERE o.orderid = :orderId";

        return self::obtenerUnRegistro($sql, ['orderId' => $orderId]);
    }

}
