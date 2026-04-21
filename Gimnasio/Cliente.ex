defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0

  def crear_cliente(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def ingresar(mensaje) do
    mensaje
    |> Util.mostrar_mensaje()

    nombre = "Ingrese nombre: "
    |> Util.ingresar(:texto)

    edad = "Ingrese edad: "
    |> Util.ingresar(:entero)

    altura = "Ingrese altura: "
    |> Util.ingresar(:real)

    crear_cliente(nombre, edad, altura)
  end

  def generar_mensaje_clientes(lista_clientes, parser) do
    lista_clientes
    |> Enum.map(parser)
    |> Enum.join("\n")
  end

  def escribir_csv(clientes, nombre) do
    clientes
    |> generar_mensaje_clientes(&convertir_cliente_linea_csv/1)
    |> (&("nombre, edad, altura\n"<> &1)).()
    |> (&File.write(nombre, &1)).()
  end

  defp convertir_cliente_linea_csv(cliente) do
    "#{cliente.nombre},#{cliente.edad}, #{cliente.altura}"
  end
end
