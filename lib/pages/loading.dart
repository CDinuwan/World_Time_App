import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {

  String wtime='loading';

  void setupWorldTime()async
  {
    WorldTime time=WorldTime(location:'berlin',flag:'germany.png',url:'Europe/Berlin');
    await time.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':time.location,
      'flag':time.flag,
      'time':time.time, 
    });
  }
  
  @override
  void initState() { 
    super.initState();
    setupWorldTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(padding: EdgeInsets.all(50.0),
      child:Text(wtime),
    ));
  }
}