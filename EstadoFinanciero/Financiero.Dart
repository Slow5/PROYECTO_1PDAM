import 'dart:io';

class Financiera{
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
        print('Ha seleccionado la opción 1: Ingresar Monto.');
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
