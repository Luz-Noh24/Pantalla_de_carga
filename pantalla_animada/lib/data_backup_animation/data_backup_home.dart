import 'package:flutter/material.dart';
import 'package:pantalla_animada/data_backup_animation/data_backup_initial_page.dart';

const mainDataBackupColor = Color(0xFF5113AA);
const secondaryDataBackupColor = Color(0xFFBC53FA);
const backgroundColor = Color(0xFFfce7fe);

class DataBackupHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
   {
    return Scaffold
    (
      backgroundColor: backgroundColor,
      body: Stack
      (
        children: [DataBackupInitialPage()],
      ),
    );
  }
}