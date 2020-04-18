import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url:'Europe/London',location:'London',flag:'uk.png'),
    WorldTime(url:'Europe/Berlin',location:'Athens',flag:'greece.png'),
    WorldTime(url:'Africa/Cairo',location:'Cairo',flag:'egypt.png'),
    WorldTime(url:'Africa/Nairobi',location:'Nairobi',flag:'kenya.png'),
    WorldTime(url:'America/Chicago',location:'Chicago',flag:'usa.png'),
    WorldTime(url:'America/New_York',location:'New York',flag:'usa.png'),
    WorldTime(url:'Asia/Seoul',location:'Seoul',flag:'south_korea.png'),
  ];

  void updateTime(index) async{
    WorldTime time =locations[index];
    await time.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':time.location,
      'flag':time.flag,
      'time':time.time,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:1.0,horizontal:4.0),
              child: Card(
                child:ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location
                  ),
                  //leading: CircleAvatar(
                    //backgroundImage:NetworkImage(),
                  //),
                ),
              ),
            );
          }),
    );
  }
}