<?php
namespace Controllers\Sec;

class ChangePassword extends \Controllers\PublicController
{
    private $email = "";
    private $newPassword = "";
    private $confirmPassword = "";

    private $useremail_error = "";
    private $userpswd_error = "";
    private $verifypswd_error = "";

    private $error = "";
    private $success = "";

    public function run(): void
    {
        if ($this->isPostBack()) {
            // Captura de datos del formulario
            $this->email = $_POST["useremail"] ?? "";
            $this->newPassword = $_POST["newPassword"] ?? "";
            $this->confirmPassword = $_POST["verifyPassword"] ?? "";

            // Validaciones
            $user = \Dao\Security\Security::getUsuarioByEmail($this->email);

            if (!$user) {
                $this->useremail_error = "No se encontró un usuario con ese correo.";
            }

            if ($this->newPassword !== $this->confirmPassword) {
                $this->verifypswd_error = "Las contraseñas no coinciden.";
            }

            if (!\Utilities\Validators::IsValidPassword($this->newPassword)) {
                $this->userpswd_error = "Contraseña débil: debe tener mayúscula, minúscula, número y carácter especial";
            }

            // Si no hay errores, actualiza la contraseña
            if (
                empty($this->useremail_error) &&
                empty($this->userpswd_error) &&
                empty($this->verifypswd_error)
            ) {
                $hashed = \Dao\Security\Security::preparePasswordForStorage($this->newPassword);
                \Dao\Security\Security::updatePassword($user["usercod"], $hashed);
                $this->success = "Contraseña actualizada correctamente. Ya puedes iniciar sesión.";
            } else {
                $this->error = "Por favor corrige los errores e intenta de nuevo.";
            }
        }

        // Renderiza la vista con los datos
        \Views\Renderer::render("security/changepassword", $this->getViewData());
    }

    private function getViewData(): array
    {
        return [
            "useremail" => $this->email,
            "userpswd_error" => $this->userpswd_error,
            "verifypswd_error" => $this->verifypswd_error,
            "useremail_error" => $this->useremail_error,
            "success" => $this->success,
            "error" => $this->error
        ];
    }
}