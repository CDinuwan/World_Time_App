import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context)=>Load(),
    '/home':(context)=>Home(),
    '/location':(context)=>chooseLocation(),
  },
));
 