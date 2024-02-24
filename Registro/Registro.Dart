import 'dart:io';

class Registro {
  List<double> montos = [];
  List<String> categorias = [];
  List<String> conceptos = [];

  void mostrarRegistro() {
    bool running = true;

    while (running) {
      print('Registro de Transacciones:');
      print('1. Ingresar Monto');
      print('2. Consultar Saldo');
      print('3. Retirar Dinero');
      print('4. Salir');

      stdout.write('Seleccione una opción: ');
      String input = stdin.readLineSync() ?? '';

      switch (input) {
        case '1':
          stdout.write('Ingrese el monto a ingresar: ');
          String inputMonto = stdin.readLineSync() ?? '';
          double montoIngresado = double.tryParse(inputMonto) ?? 0;
          montos.add(montoIngresado);

          stdout.write('Ingrese la categoría del ingreso: ');
          String inputCategoria = stdin.readLineSync() ?? '';
          categorias.add(inputCategoria);

          stdout.write('Ingrese el concepto del ingreso: ');
          String inputConcepto = stdin.readLineSync() ?? '';
          conceptos.add(inputConcepto);
          break;
        case '2':
          if (montos.isEmpty) {
            print('No hay montos ingresados todavía.');
          } else {
            double total = 0;
            for (double monto in montos) {
              total += monto;
            }
            print('Total de montos ingresados: \$${total}');
          }
          break; 
 case '3':
  if (montos.isEmpty) {
    print('No hay montos ingresados todavía.');
  } else {
    stdout.write('Ingrese el monto a retirar: ');
    String inputRetiro = stdin.readLineSync() ?? '';
    double montoRetiro = double.tryParse(inputRetiro) ?? 0;
    if (montoRetiro <= 0) {
      print('El monto a retirar debe ser mayor que cero.');
    } else {
      double total = 0;
      for (double monto in montos) {
        total += monto;
      }
      if (total >= montoRetiro) {
        montos.removeLast();
        // Resto del código
        total -= montoRetiro; // Restar el monto retirado al total
        print('Se retiró \$${montoRetiro} correctamente.');
      } else {
        print('No hay suficientes fondos para retirar \$${montoRetiro}.');
      }
    }
  }
  break;


        case '4':
          print('Saliendo del registro de transacciones...');
          running = false;
          break;
        default:
          print('Opción no válida. Por favor, seleccione una opción válida.');
      }
    }
  }
}

