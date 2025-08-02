<section class="depth-2 px-4 py-5">
  <h1>{{FormTitle}}</h1>
</section>

<section class="depth-2 px-4 py-4 my-4 grid">
  <form 
    method="POST"
    action="index.php?page=Admin_Transactions_Transaction&mode={{~mode}}&transactionId={{transactionId}}"
    class="grid col-12 col-m-8 offset-m-2 col-l-6 offset-l-3"
  >

    <input type="hidden" name="transactionId" value="{{transactionId}}" />
    <input type="hidden" name="xsrtoken" value="{{xsrtoken}}" />

    <!-- ID Transacción -->
    <div class="row my-2">
      <label for="transactionId" class="col-12 col-m-4 col-l-3">ID Transacción:</label>
      <input type="text" id="transactionId" value="{{transactionId}}" readonly disabled
        class="col-12 col-m-8 col-l-9" />
    </div>

    <!-- Código de Usuario -->
    <div class="row my-2">
      <label for="usercod" class="col-12 col-m-4 col-l-3">Nombre de Usuario:</label>
      <input type="text" name="usercod" id="usercod" value="{{username}}" {{~readonly}} 
        class="col-12 col-m-8 col-l-9" />
      {{if usercod_error}}<div class="error col-12">{{usercod_error}}</div>{{endif usercod_error}}
    </div>

    <!-- ID de Orden -->
    <div class="row my-2">
      <label for="orderid" class="col-12 col-m-4 col-l-3">ID de Orden:</label>
      <input type="text" name="orderid" id="orderid" value="{{orderid}}" {{~readonly}} 
        class="col-12 col-m-8 col-l-9" />
      {{if orderid_error}}<div class="error col-12">{{orderid_error}}</div>{{endif orderid_error}}
    </div>

    <!-- Fecha de Transacción -->
    <div class="row my-2">
      <label for="transdate" class="col-12 col-m-4 col-l-3">Fecha:</label>
      <input type="text" id="transdate" value="{{transdate}}" readonly disabled 
        class="col-12 col-m-8 col-l-9" />
    </div>

    <!-- Estado -->
    <div class="row my-2">
      <label for="transstatus" class="col-12 col-m-4 col-l-3">Estado:</label>
      <select name="transstatus" id="transstatus" class="col-12 col-m-8 col-l-9" {{if ~readonly}} disabled {{endif ~readonly}}>
        <option value="{{transstatus}}" selected>{{transstatus}}</option>
      </select> 
      {{if transstatus_error}}<div class="error col-12">{{transstatus_error}}</div>{{endif transstatus_error}}
    </div>

    <!-- Monto -->
    <div class="row my-2">
      <label for="amount" class="col-12 col-m-4 col-l-3">Monto:</label>
      <input type="number" step="0.01" name="amount" id="amount" value="{{amount}}" {{~readonly}} 
        class="col-12 col-m-8 col-l-9" />
      {{if amount_error}}<div class="error col-12">{{amount_error}}</div>{{endif amount_error}}
    </div>

    <!-- Moneda -->
    <div class="row my-2">
      <label for="currency" class="col-12 col-m-4 col-l-3">Moneda:</label>
      <input type="text" name="currency" id="currency" value="{{currency}}" {{~readonly}} 
        class="col-12 col-m-8 col-l-9" />
      {{if currency_error}}<div class="error col-12">{{currency_error}}</div>{{endif currency_error}}
    </div>

    <!-- JSON de Orden -->
    <div class="row my-2">
      <label for="orderjson" class="col-12 col-m-4 col-l-3">Detalle de Orden (JSON):</label>
      <textarea name="orderjson" id="orderjson" rows="6" style="resize:none; height:140px;" {{~readonly}} 
        class="col-12 col-m-8 col-l-9">{{orderjson}}</textarea>
      {{if orderjson_error}}<div class="error col-12">{{orderjson_error}}</div>{{endif orderjson_error}}
    </div>

    <!-- Botones -->
    <div class="row my-4 align-center flex-end">
      {{if showCommitBtn}}
      <button class="primary col-12 col-m-2" type="submit" name="btnConfirmar">Confirmar</button>
      &nbsp;
      {{endif showCommitBtn}}

      <button class="col-12 col-m-2" type="button" id="btnCancelar">
        {{if showCommitBtn}}Cancelar{{endif showCommitBtn}}
        {{ifnot showCommitBtn}}Regresar{{endifnot showCommitBtn}}
      </button>
    </div>

  </form>
</section>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("btnCancelar").addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=Admin_Transactions_Transactions");
    });
  });
</script>