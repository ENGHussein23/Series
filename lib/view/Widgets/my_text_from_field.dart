import 'package:flutter/material.dart';

class MyTextFromField extends StatelessWidget{
  final _OutlineInputBorder=OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8),
  );
  late TextEditingController myController;
  late String myLabel;
  MyTextFromField(this.myController,this.myLabel);

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller: myController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: myLabel,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder:_OutlineInputBorder,
        focusedBorder:_OutlineInputBorder,
        border: _OutlineInputBorder,
      ),
    );
  }


}