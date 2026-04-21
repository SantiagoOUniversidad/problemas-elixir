defmodule Estructura do

  def main do
    crear_lista_clientes()
    |> Cliente.escribir_csv("clientes.csv")
  end

  defp crear_lista_clientes() do
    [
      Cliente.crear_cliente("Ana", 16, 1.7),
      Cliente.crear_cliente("Santiago", 18, 1.8),
      Cliente.crear_cliente("Juan", 17, 1.7),
      Cliente.crear_cliente("Esteban", 20, 1.6),
      Cliente.crear_cliente("Jose", 23, 1.9),
      Cliente.crear_cliente("Nicolas", 44, 1.5)
    ]
  end
end

Estructura.main()
