import 'package:flutter/material.dart';
import 'package:pantalla_animada/data_backup_animation/data_backup_initial_page.dart';
 // Asegúrate de importar el archivo donde está definido DataBackupInitialPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Backup App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DataBackupInitialPage(), // Aquí se muestra la página inicial de copia de seguridad de datos
    );
  }
}
