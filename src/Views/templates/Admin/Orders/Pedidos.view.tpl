<div class="container">
    <h1>{{pageTitle}}</h1>
    <p>{{pageDescription}}</p>

    <div class="tabs">
        <span class="tab active" data-status="PENDING">PENDING</span>
        <span class="tab" data-status="COMPLETED">COMPLETED</span>
        <span class="tab" data-status="CANCELLED">CANCELLED</span>
    </div>
    <div class="table-container">
        <table class="order-table">
            <thead>
                <tr>
                    <th>ID de Pedido</th>
                    <th>Usuario</th>
                    <th>Estado</th>
                    <th>Fecha</th>
                    <th>Total</th>
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tbody id="orderTable">
                {{foreach orders}}
                <tr data-status="{{order_status}}">
                    <td>{{orderid}}</td>
                    <td>{{username}}</td>
                    <td><span class="badge status-{{order_status}}">{{order_status}}</span></td>
                    <td>{{orderdate}}</td>
                    <td>{{total}} - {{currency}}</td>
                    <td class="actions">
                        <a class="btn edit" href="index.php?page=Admin-Orders-Pedido&id={{orderid}}"><i class="fas fa-edit"></i> Cambiar estado</a>
                    </td>
                </tr>
                {{endfor orders}}
            </tbody>
        </table>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', () => {

        const tabs = document.querySelectorAll('.tab');
        const rows = document.querySelectorAll('#orderTable tr');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');
                const status = tab.dataset.status;
                console.log('Filtrando por:', status);
                rows.forEach(row => {
                    console.log('Estado actual:', row.dataset.status);
                    row.style.display = (row.dataset.status === status) ? '' : 'none';
                });
            });
        });

        // Activar el primer tab (PENDING) al cargar
        tabs[0].click();
    });
</script>