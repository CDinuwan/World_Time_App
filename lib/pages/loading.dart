import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {

void getData() async {
    
    Response response=await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data=jsonDecode(response.body);
    print(data);
    print(data['title']);   
  }
  
  @override
  void initState() { 
    super.initState();
    getData();
    print('Hey There!');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text('Loading screen'),
    );
  }
}