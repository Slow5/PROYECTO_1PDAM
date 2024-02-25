import 'dart:io';

class Metas{

  bool valor = false; 
  bool valorDos = false;
  double metaEstablecida = 0;
  double monto = 0;
  double presupuestoEstablecido = 0;

  void mostrarMeta() {
  bool running = true;

  while (running) {
    print('Establecimiento de Metas y Presupuestos:');
    print('1. Establecer Meta Financiera');
    print('2. Ingresar a la Meta');
    print('3. Establecer presupuesto');
    print('4. Salir');
    stdout.write('Seleccione una opción: ');
    String input = stdin.readLineSync() ?? '';

    switch (input) {
      case '1':
        print('Ha seleccionado la opción 1: Ingresar Monto.');
        establecida();
        break;
      case '2':
        print('Ha seleccionado la opción 2: Ingresar a la Meta.');
        ingresarMeta();
        break;
      case '3':
        print('Ha seleccionado la opcion 3: Establecer Presupuesto Total');
        presupuesto();
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

  void establecida(){ 
    if(!valor){
        stdout.write('Ingrese la meta de ahorro: ');
        String inputMeta = stdin.readLineSync() ?? '';
        metaEstablecida = double.tryParse(inputMeta) ?? 0;
        print("Meta establecida");
    
        valor = true;
    
    }else{
      print("Ya se ha establecido un meta");
    }
  }

  void ingresarMeta(){
    if(monto >= metaEstablecida){
      
      print("Meta cumplida");
      print("Meta Inicial Establecida: $metaEstablecida" );
      print("Ahorro Total: $monto");

    }else{

      stdout.write('Ingresar monto de ahorro: ');
      String ahorro = stdin.readLineSync() ?? ''; 
      monto = double.tryParse(ahorro) ?? 0;
      print("Valor ingresado");

    }

    
  }
  void presupuesto(){
      if(!valorDos){
        
        stdout.write('Ingresar Presupuesto Mensual: ');
        String pre = stdin.readLineSync() ?? '';
        presupuestoEstablecido = double.tryParse(pre) ?? 0;
        
        valorDos = true;

      }else{
        print("Ya se establecio un presupuesto");
      }
    }
}
