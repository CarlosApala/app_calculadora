class PrecisionNumeros {
  int precision;
  PrecisionNumeros({required this.precision});

  Map<String, String> va = {"calor": "jose carlos", "estudiante": "udabol"};

  double processPrecision(double numero) {
    String convertir = numero.toString();

    String valorDecimal =
        convertir.substring(convertir.indexOf(".") + 1, convertir.length);
    String valorEntero = convertir.substring(0, convertir.indexOf("."));
    String total = valorEntero + "." + valorDecimal;
    return double.parse(total);
  }

  double procesarNumeroPreciso(
    String numerador,
    String multiplicador,
  ) {
    String numDecimalAux =
        numerador.substring(numerador.indexOf(".") + 1, numerador.length);
    String numEntAux = numerador.substring(0, numerador.indexOf("."));

    String multDecimalAux = multiplicador.substring(
        multiplicador.indexOf(".") + 1, multiplicador.length);
    String multEntAux = multiplicador.substring(0, multiplicador.indexOf("."));

    return 00;
  }
}
