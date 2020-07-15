import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Search',
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange, width: .5),
    borderRadius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange, width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);
