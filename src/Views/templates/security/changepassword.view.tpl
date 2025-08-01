<section class="depth-2 px-4 py-5">
  <h1>Cambiar contraseña</h1>
</section>

<section class="depth-2 px-4 py-4 my-4 grid row">
  <form 
    method="POST"
   action="index.php?page=sec_changepassword"
    class="grid col-12 col-m-8 offset-m-2 col-l-6 offset-l-3"
  >

    <!-- Email -->
    <div class="row my-2">
      <label for="useremail" class="col-12 col-m-4 col-l-3">Correo electrónico:</label>
      <input type="email" name="useremail" id="useremail" value="{{useremail}}"class="col-12 col-m-8 col-l-9" />
      {{if useremail_error}}<div class="error col-12">{{useremail_error}}</div>{{endif useremail_error}}

    </div>

    <!-- Nueva contraseña -->
    <div class="row my-2">
      <label for="newPassword" class="col-12 col-m-4 col-l-3">Nueva contraseña:</label>
      <input type="password" name="newPassword" id="newPassword"
        class="col-12 col-m-8 col-l-9" required />
      {{if userpswd_error}}<div class="error col-12">{{userpswd_error}}</div>{{endif userpswd_error}}

    </div>

    <!-- Verificar contraseña -->
    <div class="row my-2">
      <label for="verifyPassword" class="col-12 col-m-4 col-l-3">Verificar contraseña:</label>
      <input type="password" name="verifyPassword" id="verifyPassword"
        class="col-12 col-m-8 col-l-9" required />
      {{if verifypswd_error}}<div class="error col-12">{{verifypswd_error}}</div>{{endif verifypswd_error}}
    </div>

<div class="success col-12 text-center my-2" style="color: green; font-weight: bold;">
   {{success}}
</div>

    <!-- Botones -->
    <div class="row my-4 align-center flex-end">
      <button class="primary col-12 col-m-2" type="submit" name="btnConfirmar">Confirmar</button>
      &nbsp;
      <button class="col-12 col-m-2" type="button" id="btnCancelar">Regresar</button>
    </div>
  </form>
</section>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("btnCancelar").addEventListener("click", (e) => {
      e.preventDefault();
window.location.assign("index.php?page=sec_login");
    });
  });
</script>