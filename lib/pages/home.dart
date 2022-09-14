import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty? ModalRoute.of(context)!.settings.arguments as Map : data;
    String backgroundImage = data['isDay'] ? 'day.jpg' : 'night.jpg';
    return Scaffold(
      backgroundColor: data['isDay'] ? Colors.lightBlue[700]:Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$backgroundImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: data['isDay']?Colors.black54:Colors.white,
                        fontSize: 40.0,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    data['time'],
                    style: TextStyle(
                      color: data['isDay']?Colors.black54:Colors.white,
                      fontSize: 71.0,
                    ),
                  ),
                ),
                SizedBox(height: 70.0),
                IconButton(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      if (result != null)
                      {
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'isDay': result['isDay'],
                          };
                        });
                      }
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: data['isDay']?Colors.black54:Colors.white,
                      size: 30,
                    )
                ),
                Text(
                  'Edit Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: data['isDay']?Colors.black54:Colors.white,
                    letterSpacing: 2.0,
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
