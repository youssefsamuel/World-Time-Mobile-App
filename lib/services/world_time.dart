import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String urlLocation;
  bool isDay = false;

  WorldTime({required this.location, required this.flag, required this.urlLocation}); // and according to this data we can get the time using the api.

  Future<void> getTime() async {
    bool completed = false;
    while (!completed)
      {
        try{
          var url = Uri.parse('http://worldtimeapi.org/api/timezone/$urlLocation');
          Response response = await get(url);
          Map data = jsonDecode(response.body);
          String datetime = data['datetime'];
          String offset = data['utc_offset'].substring(0, 3);
          DateTime now = DateTime.parse(datetime);
          now = now.add(Duration(hours: int.parse(offset)));
          time = DateFormat.jm().format(now);
          if (now.hour > 6 && now.hour < 20)
          {
            isDay = true;
          }
          else
          {
            isDay = false;
          }
          completed = true;
        }
        catch(e){
          print('Caught Error: $e');
        }
      }


  }
}
