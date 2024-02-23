import 'dart:io';

class Metas{
  void mostrarMeta() {
  bool running = true;

  while (running) {
    print('Establecimiento de Metas y Presupuestos:');
    print('1. Establecer Meta Financiera');
    print('2. Meta Financiera');
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
