import 'dart:math';

class PurifcarDouble {
  PurifcarDouble();

  void purificar(String numero, String mult) {
    // primer paso convertir string a double

    double numerod = double.parse(mult);
    double multd = double.parse(numero);

    print(numerod + multd);

    // se parar decimales y  convertirlo en entero los numeros
    int decimalNum1 = int.parse(numerod.abs().toString().substring(
        numerod.toString().indexOf(".") + 1, numerod.toString().length));
    int decimalMult2 = int.parse(multd
        .abs()
        .toString()
        .toString()
        .substring(multd.toString().indexOf(".") + 1, multd.toString().length));

    // separar los numeros enteros de los decimales
    int enteroNum1 = int.parse(
        numerod.abs().toString().substring(0, numerod.toString().indexOf(".")));
    int enteroMult = int.parse(
        multd.abs().toString().substring(0, multd.toString().indexOf(".")));

    // sumar decimales convertidos en enteros
    int fin = decimalNum1 + decimalMult2;
    // sumar enteros puros
    int finEntero = enteroNum1 + enteroMult;

    // convertir decimales enteros a decimales
    double finde = fin.toDouble() * (pow(0.1, 2));
    // recortar los decimales al necesario
    String de53 =
        finde.toString().substring(0, 2 + fin.abs().toString().length);

    // unir los enteros con los decimales por una suma
    double asdf = finEntero + double.parse(de53);
    print(asdf);
  }

  void sustraerElement(String dfs, String sustaer) {
    String ds = dfs;

    String kf = ds.substring(0, ds.indexOf(sustaer));
    String kl = ds.substring(ds.indexOf(sustaer) + 1, ds.length);

    print(ds.substring(2, 3));
    print(kf + kl);
  }
}
