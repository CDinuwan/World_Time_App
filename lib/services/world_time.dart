import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

    String location;//location name for the UI
    String time;//Time of that location
    String flag;//url to an assert flag icon
    String url;//location url for api end point


    WorldTime({this.location,this.flag,this.url});

    Future<void> getTime() async {
      
      try{
        //make the request 
      Response response=await get('http://worldtimeapi.org/api/timezone/k$url');
      Map data=jsonDecode(response.body);
      //print(data);
      //get properties from data.

      String datetime=data['datetime'];
      String offset =data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create datetime object

      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours:int.parse(offset)));

      //set time property
      time=now.toString();
      }
      catch(e)
      {
        print('caught error:$e');
        time='could not get time data';
      }

      
  }

}


