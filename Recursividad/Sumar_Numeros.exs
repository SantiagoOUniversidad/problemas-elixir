defmodule Sumar_Numeros do

  #Caso Base
  def sumar(0) do
    :ok
  end

  #Caso Recursivo
  def sumar(n) do
    IO.puts(n)
    resta = n - 1
    sumar(resta)
  end

end

Sumar_Numeros.sumar(5)
