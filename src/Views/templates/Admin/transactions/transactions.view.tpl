<h1>Transacciones Registradas</h1>

<section class="grid">
  <div class="row">
    <form class="col-12 col-m-8" action="index.php" method="get">
      <div class="flex align-center">
        <input type="hidden" name="page" value="Admin_Transactions_Transactions">
        <div class="col-8 row">
          <!-- Filtro por estado -->
          <label class="col-3" for="transstatus">Estado:</label>
          <select class="col-9" name="transstatus" id="transstatus">
            <option value="" {{status_EMP}}>Todos</option>
            <option value="COMPLETED" {{status_COMPLETED}}>Completado</option>
            <option value="PENDING" {{status_PENDING}}>Pendiente</option>
            <option value="FAILED" {{status_FAILED}}>Fallido</option>
          </select>

          <!-- Filtro por monto mínimo -->
          <label class="col-3" for="minAmount">Monto mínimo:</label>
          <input class="col-9" type="number" step="0.01" name="minAmount" id="minAmount" value="{{minAmount}}" />

          
        </div>

        <!-- Botón de búsqueda -->
        <div class="col-4 align-end">
          <button type="submit">Buscar</button>
        </div>
      </div>
    </form>
  </div>
</section>

<section class="WWList">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th style="text-align:center">ID</th>
        <th style="text-align:center">Usuario</th>
        <th style="text-align:center">Orden</th>
        <th style="text-align:center">Fecha</th>
        <th style="text-align:center">Estado</th>
        <th style="text-align:center">Monto</th>
        <th style="text-align:center">Moneda</th>
        <th style="text-align:center">Acciones</th>
      </tr>
    </thead>
    <tbody>
      {{foreach transactions}}
      <tr>
        <td style="text-align:center">{{transactionId}}</td>
        <td style="text-align:center">{{usercod}}</td>
        <td style="text-align:center">{{orderid}}</td>
        <td style="text-align:center">{{transdate}}</td>
        <td style="text-align:center">{{transstatus}}</td>
        <td style="text-align:center">USD {{amount}}</td>
        <td style="text-align:center">{{currency}}</td>
        <td style="text-align: center;">
         
          <a href="index.php?page=Admin-Transactions-Transaction&mode=DSP&transactionId={{transactionId}}">Detalles</a>
         
        </td>
      </tr>
      {{endfor transactions}}
    </tbody>
  </table>
  {{pagination}}
</section>