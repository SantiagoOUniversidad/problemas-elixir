defmodule Util do
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        IO.puts("Entrada no válida. Por favor, ingrese un número real.")
        ingresar(mensaje, :real)
    end
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        IO.puts("Entrada no válida. Por favor, ingrese un número entero.")
        ingresar(mensaje, :entero)
    end
  end
end
