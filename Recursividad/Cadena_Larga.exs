defmodule Cadena_Larga do

  def contar_cadenas([], cont), do: IO.puts(cont)

  def contar_cadenas([head | tail], cont) do
    longitud = String.length(head)
    if longitud > cont do
      contar_cadenas(tail, longitud)
    else
      contar_cadenas(tail, cont)
    end
  end
end

Cadena_Larga.contar_cadenas(["elixir", "hola", "mundo"], 0)
