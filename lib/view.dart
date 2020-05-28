//***********************************************************
//*  UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE               *
//*PROGRAMACION MOVIL                                       *
//*SUMA DE DOS NUMEROS                                      *
//*APK                                      *
//*FERNANDO RODRIGUEZ ANTONY TORRES  ``                     *
//***********************************************************


import 'package:flutter/material.dart';
import 'package:suma/suma.dart';
import 'package:string_validator/string_validator.dart';

class View extends StatefulWidget {

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  final FocusNode _suma1 = FocusNode();
  final FocusNode _suma2 = FocusNode();
  Suma calculadora= Suma();
  String _numero1;
  String _numero2;

  double _resultado;

    void  _validareAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
          setState(() {
        _num1.clear();
        _num2.clear();
      _resultado=calculadora.sumarNumeros(double.parse(_numero1),double.parse(_numero2),);
    });
      
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SUMA 2 NUMEROS'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          SizedBox(
            height: 30,
          ),
          _buildForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: RaisedButton.icon(
                onPressed: _validareAndSaveForm,
                //textColor: textColor,
                elevation: 8,
                color: Color(0xFF21BFBD),
                icon: Icon(Icons.add),
                label: Text('SUMAR'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ))
            ],
          ),
          SizedBox(height: 50,),
            Text(
                (_numero1 !=null  && _numero1!=null) ? '$_numero1 + $_numero2 =': '',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
            ),

              Text(
              _resultado == null ? '' : "$_resultado", 
              style: TextStyle(
                fontSize: 40,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildFields(),
      ),
    );
  }

  List<Widget> _buildFields() {
    return [
      TextFormField(
        //initialValue: _numero2,
        focusNode: _suma1,
        textInputAction: TextInputAction.next,
        controller: _num2,
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).requestFocus(_suma2),
        validator: (value) => (value.isNotEmpty && isFloat(value)) ? null : 'No se permite el uso de caracteres especiales solo el .',
        decoration: InputDecoration(
            labelText: 'Numero 1',
            fillColor: Colors.green,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
        onSaved: (value) => _numero2 = value,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.add,
            size: 80,
            color: Color(0xFF21BFBD),
          )
        ],
      ),
      TextFormField(
        //initialValue: _numero1,
        focusNode: _suma2,
        controller:_num1 ,
        textInputAction: TextInputAction.done,
        onEditingComplete:  _validareAndSaveForm,
        keyboardType: TextInputType.number,
        validator: (value) => (value.isNotEmpty && isFloat(value)) ? null : 'No se permite el uso de caracteres especiales solo el .',
        decoration: InputDecoration(
            labelText: 'Numero 2',
            fillColor: Colors.green,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
        onSaved: (value) => _numero1 = value,
      ),
    ];
  }
}
