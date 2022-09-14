import 'dart:core';
import 'package:ninja_id/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Cairo', flag: 'egypt.png', urlLocation: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', urlLocation: 'Africa/Nairobi'),
    WorldTime(location: 'Paris', flag: 'france.png', urlLocation: 'Europe/Paris'),
    WorldTime(location: 'Berlin', flag: 'germany.jpg', urlLocation: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'uk.png', urlLocation: 'Europe/London'),
    WorldTime(location: 'Rome', flag: 'italy.png', urlLocation: 'Europe/Rome'),
    WorldTime(location: 'Madrid', flag: 'spain.jpg', urlLocation: 'Europe/Madrid'),
    WorldTime(location: 'Athens', flag: 'greece.png', urlLocation: 'Europe/Athens'),
    WorldTime(location: 'Casablanca', flag: 'morocco.png', urlLocation: 'Africa/Casablanca'),
    WorldTime(location: 'Seoul', flag: 'south_korea.jpg', urlLocation: 'Asia/Seoul'),
    WorldTime(location: 'Accra', flag: 'ghana.jpg', urlLocation: 'Africa/Accra'),
    WorldTime(location: 'Algiers', flag: 'algeria.png', urlLocation: 'Africa/Algiers'),
    WorldTime(location: 'Khartoum', flag: 'sudan.png', urlLocation: 'Africa/Khartoum'),
    WorldTime(location: 'Tunis', flag: 'tunisia.jpg', urlLocation: 'Africa/Tunis'),
    WorldTime(location: 'Mexico_City', flag: 'mexico.jpg', urlLocation: 'America/Mexico_City'),
  ];


  void updateWorldTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    locations.sort((a,b) => a.location.compareTo(b.location));
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateWorldTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
      );
  }
}
