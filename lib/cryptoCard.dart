import 'package:flutter/material.dart';
class Reusable {
  Reusable ({this.currencyname,this.value,this.currency});
  String? currencyname;
  String? value;
  String? currency;
  reusablecard() {
    Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $currencyname = $value $currency',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),

      ),
    );

  }
}

