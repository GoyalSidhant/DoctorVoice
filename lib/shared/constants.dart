import 'package:flutter/material.dart';
InputDecoration textFormDecoration=InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white,width: 2.0),
    borderRadius: BorderRadius.circular(10.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.tealAccent,width: 2.0),
    borderRadius: BorderRadius.circular(10.0),

  ),
);
