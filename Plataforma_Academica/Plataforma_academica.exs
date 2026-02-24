defmodule PlataformaAcademica do
  def main do
    nombre_usuario =
      "Ingrese su nombre de usuario: "
      |> Util.ingresar(:texto)
    edad_usuario =
      "Ingrese su edad: "
      |> Util.ingresar(:entero)
    credenciales =
      "Posee Credenciales? (si/no): "
    intentos_fallidos =
      "Número de intentos fallidos: "
      |> Util.ingresar(:entero)
    verificar_credenciales(edad_usuario, credenciales, intentos_fallidos)
      |> generar_mensaje(edad_usuario)
      |> Util.mostrar_mensaje()
  end

  defp verificar_credenciales(edad, credenciales, intentos_fallidos) do
    if edad < 18 or credenciales == "no" or intentos_fallidos > 3 do
      mensaje =
        if edad < 18 do
          "Acceso denegado. Restriccion de edad."
        else
          "Acceso denegado. No posee credenciales."
        end
      {:error, mensaje}
    else
      {:ok, "Acceso concedido."}
    end
  end

  defp generar_mensaje(resultado, edad) do
    case resultado do
      {:ok, "Acceso concedido."} -> "Acceso concedido."
      {:error, mensaje} -> mensaje
    end
  end
end

PlataformaAcademica.main()
