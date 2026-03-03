defmodule Hotel do
  def main do
    noches =
      "Ingrese el numero de noches: "
      |> Util.ingresar(:entero)
    tipo_cliente =
      "Ingrese el tipo de cliente: Frecuente (F), Corporativo (C), Ocasional (O) "
      |> Util.ingresar(:texto)
      |> calculo_tipo_cliente()
    temporada =
      "Ingrese la temporada: Alta (1), Baja (0) "
      |> Util.ingresar(:entero)
    tarifa_base(noches)
      |> aplicar_descuento(tipo_cliente)
      |> aplicar_recargo(temporada)
      |> calcular_total()
      |> generar_mensaje()
      |> Util.mostrar_mensaje()
  end

  defp calculo_tipo_cliente(tipo_cliente) do
    case String.downcase(tipo_cliente) do
      "f" -> :frecuente
      "c" -> :corporativo
      "o" -> :ocasional
      _ -> "Incorrecto"
    end
  end

  def tarifa_base(noches) when noches <= 2 do
    base = noches * 120000
    {base}
  end

  def tarifa_base(noches) when noches < 5 and noches > 2 do
    base = noches * 100000
    {base}
  end

  def tarifa_base(noches) when noches >= 5 do
    base = noches * 85000
    {base}
  end

  defp aplicar_descuento({base}, tipo_cliente) do
    descuento =
      case tipo_cliente do
        :frecuente -> base * 0.20
        :corporativo -> base * 0.15
        :ocasional -> 0
        _ -> :error
      end
    {base, descuento}
  end

  defp aplicar_recargo({base, descuento}, temporada) do
    recargo =
      case temporada do
        0 -> 0
        1 -> descuento * 0.25
        _ -> :error
      end

    {base, descuento, recargo}
  end

  defp calcular_total({base, descuento, recargo}) do
    total = base - descuento + recargo
    {base, descuento, recargo, total}
  end

  defp generar_mensaje({base, descuento, recargo, total}) do
    "El costo base es: $#{base} \n El descuento es: $#{descuento} \n El recargo es: $#{recargo} \n El total es: $#{total}"
  end
end

Hotel.main()
