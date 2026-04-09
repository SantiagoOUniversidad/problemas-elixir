defmodule Contar_Letras do

  def main do
    mensaje_ingresado = "Ingresa la palabra: "
    |> Util.ingresar(:texto)
    |> String.graphemes()
    |> contar_vocales()
    |> Util.mostrar_mensaje()
  end

  #Inicializador
  def contar_vocales(lista) do
    contar_vocales(lista, 0)
  end

  #Caso base
  def contar_vocales([], contador), do: contador

  #Es vocal?
  def contar_vocales([head | tail], contador) do
    if es_vocal?(head) do
      contar_vocales(tail, contador + 1)
    else
      contar_vocales(tail, contador)
    end
  end

  def es_vocal?(letra) do
    letra in ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
  end

end

Contar_Letras.main()
