import 'dart:io';
import '../Registro/Registro.dart';
import '../Metas/Metas.dart';
import '../EstadoFinanciero/Financiero.dart';

void main() {
  bool running = true;
  Registro registro = Registro();
  

  while (running) {
    print('Bienvenido al Sistema de Cálculo Financiero:');
    print('1. Registro de Transacciones');
    print('2. Seguimiento de saldo y Estado Financiero');
    print('3. Metas');
    print('4. Salir');
    stdout.write('Seleccione una opción: ');
    String input = stdin.readLineSync() ?? '';

    switch (input) {
      case '1':
        print('Ha seleccionado la opción 1: Registro de Transacciones.');
       registro.mostrarRegistro();
        break;
      case '2':
        print('Ha seleccionado la opción 2: Seguimiento de saldo y Estado Financiero.');
        Financiera().mostrarFinanciero();
        break;
      case '3':
        print('Ha seleccionado la opción 3: Metas.');
        Metas().mostrarMeta();
        break;
      case '4':
        print('Saliendo del programa...');
        running = false;
        break;
      default:
        print('Opción no válida. Por favor, seleccione una opción válida.');
    }
  }
}
