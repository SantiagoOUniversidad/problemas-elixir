defmodule Potencias_NoRecursivo do
  def main do
    numero = "Ingresa el primer numero: "
    |> Util.ingresar(:entero)
    numero2 = "Ingresa el segundo numero: "
    |> Util.ingresar(:entero)
    verificar_potencia(numero, numero2)
    |> Util.mostrar_mensaje()
  end

  def verificar_potencia(n1, n2) do
    resultado = :math.log(n1) / :math.log(n2)
    if resultado == round(resultado) do
      "True"
    else
      "False"
    end
  end
end

Potencias.main()
