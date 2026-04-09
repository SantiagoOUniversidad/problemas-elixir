defmodule Potencias do

  def main do
    n = "Ingresa el numero n: "
    |> Util.ingresar(:entero)

    b = "Ingresa la base b: "
    |> Util.ingresar(:entero)

    es_potencia(n, b)
    |> Util.mostrar_mensaje()
  end

  # Caso base: si llega a 1 → sí es potencia
  def es_potencia(1, _b), do: true

  # Caso inválido
  def es_potencia(n, b) when n < b or b <= 1, do: false

  # Caso recursivo
  def es_potencia(n, b) do
    if rem(n, b) == 0 do
      es_potencia(div(n, b), b)
    else
      false
    end
  end

end

Potencias.main()
