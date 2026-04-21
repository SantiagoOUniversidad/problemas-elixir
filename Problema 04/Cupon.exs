defmodule Cupon do

  def main do
    cupon =
      "Ingrese el cupon: "
      |> Util.ingresar(:texto)

    cupon
      |> iniciar_validacion()
      |> verificar_caracteres()
      |> verificar_mayuscula()
      |> verificar_numero()
      |> verificar_espacios()
      |> verificar_condiciones()
      |> generar_mensaje()
      |> Util.mostrar_mensaje()
  end

  # Inicia estructura {cupon, lista_errores}
  defp iniciar_validacion(cupon) do
    {cupon, []}
  end

  # Regla: mínimo 10 caracteres
  defp verificar_caracteres({cupon, errores}) do
    if String.length(cupon) < 10 do
      {cupon, ["El cupón debe tener al menos 10 caracteres" | errores]}
    else
      {cupon, errores}
    end
  end

  # Regla: debe tener mayúscula
  defp verificar_mayuscula({cupon, errores}) do
    tiene_mayuscula =
      cupon != String.downcase(cupon)

    if tiene_mayuscula do
      {cupon, errores}
    else
      {cupon, ["Debe contener al menos una letra mayúscula" | errores]}
    end
  end

  # Regla: debe tener número
  defp verificar_numero({cupon, errores}) do
    tiene_numero =
      Regex.match?(~r/[0-9]/, cupon)

    if tiene_numero do
      {cupon, errores}
    else
      {cupon, ["Debe contener al menos un número" | errores]}
    end
  end

  # Regla: no debe tener espacios
  defp verificar_espacios({cupon, errores}) do
    tiene_espacios =
      String.contains?(cupon, " ")

    if tiene_espacios do
      {cupon, ["El cupón no debe contener espacios" | errores]}
    else
      {cupon, errores}
    end
  end

  # Genera resultado final
  defp verificar_condiciones({_, []}) do
    {:ok, "Cupón válido"}
  end

  defp verificar_condiciones({_, errores}) do
    mensaje =
      errores
      |> Enum.reverse()
      |> Enum.join(" y ")

    {:error, mensaje}
  end

  defp generar_mensaje({:ok, mensaje}) do
  mensaje
end

defp generar_mensaje({:error, mensaje}) do
  mensaje
end

end

Cupon.main()
