import 'dart:io';
import '../Registro/Registro.dart';

class Financiera {
  Registro registro;
   Financiera(this.registro);
  void mostrarFinanciero() {
    bool running = true;

    while (running) {
      print('Seguimiento de Saldo y Estado Financiero::');
      print('1. Saldo Actual');
      print('2. Estado Financiero');
      print('3. Salir');
      stdout.write('Seleccione una opción: ');
      String input = stdin.readLineSync() ?? '';

      switch (input) {
         case '1':
          double saldo = registro.getSaldo();
          double ingresos = registro.getIngresos();
          double gastos = registro.getGastos();

          if (saldo < 0) {
            print('No hay montos ingresados todavía.');
          } else {
            print('Saldo actual: \$${saldo}');
            print('Ingresos: \$${ingresos}');
            print('Gastos: \$${gastos}');


          }
          break;
        case '2':
          print('Ha seleccionado la opción 2: Retirar.');
          break;
        case '3':
          print('Saliendo del registro de transacciones...');
          running = false;
          break;
        default:
          print('Opción no válida. Por favor, seleccione una opción válida.');
      }
    }
  }
}
