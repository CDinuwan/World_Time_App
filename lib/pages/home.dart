import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty ? data:ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage=data['isDayTime'] ? 'daytime.jpg':'nighttime.jpg';
    Color bgColor=data['isDayTime'] ? Colors.blue:Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
          decoration:BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asserts/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
                  child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(onPressed:
                () async {
                  dynamic results= await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time':results['time'],
                      'location':results['location'],
                      'isDayTime':results['isDayTime'],
                      'flag':results['flag'],
                    };
                  },);
                }, icon: Icon(Icons.edit_location),
                 label: Text('Edit Location',
                 style:TextStyle(
                   letterSpacing:2.0,
                   color:Colors.white,
                 ))),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize:28.0,
                        letterSpacing:2.0,color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20.0),
                Text(
                  data['time'],
                  style:TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}