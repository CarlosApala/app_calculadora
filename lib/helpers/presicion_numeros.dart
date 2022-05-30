class PrecisionNumeros {
  int precision;
  PrecisionNumeros({required this.precision});

  Map<String, String> va = {"calor": "jose carlos", "estudiante": "udabol"};

  double processPrecision(double numero) {
    double valor = numero - numero.toInt();
    return numero.toInt() +
        double.parse(valor % 10 == 0.0
            ? valor.toString()
            : valor.toString().substring(
                0,
                valor.toString().length < precision
                    ? valor.toString().length - 2
                    : precision));
  }
}
