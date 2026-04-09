defmodule RecorrerLista do

  # Caso base (cuando la lista está vacía)
  def recorrer([]) do
    :ok
  end

  # Caso recursivo
  def recorrer([cabeza | cola]) do
    IO.puts("Elemento: #{cabeza}")
    recorrer(cola)
  end

end

RecorrerLista.recorrer([1, 2, 3, 4, 5])
