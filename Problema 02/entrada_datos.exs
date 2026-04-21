defmodule EntradaDatos do
  def main do
    valor_total = "Ingrese el valor total de la compra: "
    |> ingresar(:entero)
    valor_recibido = "Ingrese el valor recibido por el cliente: "
    |> ingresar(:entero)
    calcular_cambio(valor_total, valor_recibido)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp ingresar(mensaje, :entero) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.to_integer()
  end

  defp calcular_cambio(valor_total, valor_recibido) do
    valor_recibido - valor_total
  end

  defp generar_mensaje(cambio) do
    "El cambio a devolver es: $#{cambio}"
  end
end

EntradaDatos.main()
