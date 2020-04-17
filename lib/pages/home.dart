import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage=data['isDaytime']?'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2018/06/Nighttime-photography-02.jpg?fit=1500%2C1061&ssl=1':'http://2.bp.blogspot.com/-KJnC9qySGRA/UKLKae5S-ZI/AAAAAAAABc8/purHsd8LRNw/s1600/beautiful_sunshine_1920x1080.jpg';


    return Scaffold(
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image:NetworkImage('http://2.bp.blogspot.com/-KJnC9qySGRA/UKLKae5S-ZI/AAAAAAAABc8/purHsd8LRNw/s1600/beautiful_sunshine_1920x1080.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(onPressed: 
                () {
                  Navigator.pushNamed(context, '/location');
                }, icon: Icon(Icons.edit_location), label: Text('Edit Location')),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize:28.0,
                        letterSpacing:2.0
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20.0),
                Text(
                  data['time'],
                  style:TextStyle(
                    fontSize: 66.0
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