//***********************************************************
//*  UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE               *
//*PROGRAMACION MOVIL                                       *
//*SUMA DE DOS NUMEROS                                      *
//*APK                                      *
//*FERNANDO RODRIGUEZ ANTONY TORRES  ``                     *
//***********************************************************



import 'package:flutter/material.dart';
import 'package:suma/view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        
      ),
      home: View(),
      
    );
  }
}