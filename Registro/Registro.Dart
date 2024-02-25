import 'dart:io';
import '../Metas/Metas.dart';
class Registro {

  Metas meta = Metas();

  List<Map<String, dynamic>> transacciones = [];

  List<double> montos = [];
  List<String> categorias = [];
  List<String> conceptos = [];

  bool presupuesto = false;  
  double saldo = 0;
  double ingresos = 0;
  double gastos = 0;
  
  void mostrarRegistro() {
    bool running = true;

    while (running) {
      print('Registro de Transacciones:');
      print('1. Ingresar Monto');
      print('2. Retirar Dinero');
      print('3. Salir');

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
          ingresos += montoIngresado;
          saldo += montoIngresado; 

          transacciones.add({
          'tipo': 'Ingreso',
          'monto': montoIngresado,
          'categoria': inputCategoria,
          'concepto': inputConcepto,
        });

          break;
        case '2':
          if (saldo <= 0) {
            print('No hay montos ingresados todavía.');
          } else {
            stdout.write('Ingrese el monto a retirar: ');
            String inputRetiro = stdin.readLineSync() ?? '';
            double montoRetiro = double.tryParse(inputRetiro) ?? 0;
            if (montoRetiro <= 0) {
              print('El monto a retirar debe ser mayor que cero.');
            } else {
              if(!presupuesto){
                  if (saldo >= montoRetiro) {
                montos.add(-montoRetiro); 
                stdout.write('Ingrese el concepto del retiro: ');
                String inputConceptoRetiro = stdin.readLineSync() ?? '';
                conceptos.add(inputConceptoRetiro);

                saldo -= montoRetiro;
                gastos += montoRetiro;
                print('Se retiró \$${montoRetiro} correctamente. Concepto: $inputConceptoRetiro');

                transacciones.add({
                  'tipo': 'Retiro',
                  'monto': -montoRetiro,
                  'concepto': inputConceptoRetiro,
                });

                if(gastos > meta.presupuestoEstablecido){
                  print("presupuesto alcazado o excedido");
                  presupuesto = true;
                }
              } else {
                print('No hay suficientes fondos para retirar \$${montoRetiro}.');
              }
              }else{
                print("Presupuesto excedido");
              }
              
            }
          }
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
  double getSaldo() {
  return saldo;
}
double getIngresos() {
  return ingresos;
}
double getGastos() {
  return gastos;
}
}

