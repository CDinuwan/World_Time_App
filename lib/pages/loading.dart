import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {

 // String wtime='loading';

  void setupWorldTime()async
  {
    WorldTime time=WorldTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin');
    await time.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
    'location':time.location,
    'flag':time.flag,
    'time':time.time, 
    'isDayTime':time.isDayTime,
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
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitFadingCube(
        color: Colors.white,
      size: 80.0,
      ),
     ),
    );
  }
}