defmodule Numero_Perfecto do
  def main do
    mensaje = "Ingresa el numero: "
    |> Util.ingresar(:entero)
    |> es_perfecto?()
    |> Util.mostrar_mensaje()
  end

  # función inicial
  def es_perfecto?(n) do
    es_perfecto?(n, 1, 0)
  end

  # caso base (cuando i llega a n)
  def es_perfecto?(n, i, suma) when i == n do
    suma == n
  end

  # si es divisor
  def es_perfecto?(n, i, suma) when rem(n, i) == 0 do
    es_perfecto?(n, i + 1, suma + i)
  end

  # si no es divisor
  def es_perfecto?(n, i, suma) do
    es_perfecto?(n, i + 1, suma)
  end
end

Numero_Perfecto.main()
