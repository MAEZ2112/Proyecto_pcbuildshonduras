{{with order}}
<section class="container-m row px-4 py-4">
    <h1 class="col-12">Detalle de Pedido #{{orderid}}</h1>
</section>

<section class="container-m row px-4 py-4">
    <form action="index.php?page=Admin-Orders-Pedido" method="post" class="col-12 col-m-8 offset-m-2">
        <input type="hidden" name="orderid" value="{{orderid}}">
        <input type="hidden" name="action" value="update">

        <div class="row my-2 align-center">
            <label class="col-12 col-m-3" for="orderdate">Fecha</label>
            <input class="col-12 col-m-9" type="text" id="orderdate" readonly value="{{orderdate}}" />
        </div>

        <div class="row my-2 align-center">
            <label class="col-12 col-m-3" for="total">Monto Total</label>
            <input class="col-12 col-m-9" type="text" id="total" readonly value="{{total}} {{currency}}" />
        </div>

        <div class="row my-2 align-center">
            <label class="col-12 col-m-3" for="order_status">Estado de Pedido</label>
            <select class="col-12 col-m-9 {{statusClass}}" id="order_status" name="order_status">
                <option value="PENDING"{{status_PENDING}}>PENDING</option>
                <option value="COMPLETED"{{status_COMPLETED}}>COMPLETED</option>
                <option value="CANCELLED"{{status_CANCELLED}}>CANCELLED</option>
            </select>
        </div>

        <div class="row my-2 align-center">
            <label class="col-12 col-m-3" for="shipping_status">Estado de Envío</label>
            <input class="col-12 col-m-9" type="text" id="shipping_status" readonly value="{{shipping_status}}" />
        </div>
        <br>
        <div class="row mt-4">
            <button class="col-12 col-m-3" type="button" id="btnCancelar">Regresar</button>
            <button class="col-12 col-m-3" type="submit" id="btnConfirmar" name="btnConfirmar">Cambiar Estado</button>
        </div>

    </form>
</section>
{{endwith order}}

<section class="container-m row px-4 py-4">
    <div class="col-12 col-m-8 offset-m-2">
        <h2>Productos</h2>
        <table class="order-table col-12">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th class="center">Cantidad</th>
                    <th class="right">Precio</th>
                    <th class="right">Subtotal</th>
                </tr>
            </thead>
            <tbody>
                {{foreach items}}
                <tr>
                    <td>{{nombre_producto}}</td>
                    <td class="center">{{cantidad}}</td>
                    <td class="right">{{precio}}</td>
                    <td class="right">{{subtotal}}</td>
                </tr>
                {{endfor items}}
            </tbody>
        </table>
    </div>
</section>


<style>
    :root {
        --primary-morado: #6c3bbf;
        --secondary-morado: #a084e8;
        --accent-morado: #d1b3ff;
        --table-bg: #f8f6fc;
        --table-header-bg: #ede7f6;
        --table-row-hover: #f3eaff;
        --table-border: #c1a6e6;
        --text-main: #3d2352;
        --text-light: #7c5ca7;
    }

    .order-table {
        border-collapse: collapse;
        background: var(--table-bg);
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 16px rgba(108, 59, 191, 0.08);
        width: 100%;
        font-family: 'Segoe UI', 'Arial', sans-serif;
    }

    .order-table thead {
        background: var(--table-header-bg);
    }

    .order-table th {
        padding: 14px 16px;
        font-weight: 700;
        font-size: 18px;
        text-align: left;
        color: var(--primary-morado);
        border-bottom: 2px solid var(--table-border);
        letter-spacing: 0.5px;
    }

    .order-table td {
        padding: 12px 16px;
        font-size: 16px;
        color: var(--text-main);
        border-bottom: 1px solid var(--table-border);
        background: transparent;
        transition: background 0.2s;
    }

    .order-table tbody tr:nth-child(even) {
        background: var(--accent-morado);
    }

    .order-table .center {
        text-align: center;
    }

    .order-table .right {
        text-align: right;
    }

    .order-table tbody tr:hover {
        background: var(--table-row-hover);
        transition: background 0.2s;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .order-table th, .order-table td {
            font-size: 15px;
            padding: 10px 8px;
        }
    }
</style>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const btnCancelar = document.getElementById("btnCancelar");
        btnCancelar.addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Admin-Orders-Pedidos");
        });
    });
</script>