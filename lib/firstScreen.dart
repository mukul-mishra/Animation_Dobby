import 'package:flutter/material.dart';

class DobbyScreen extends StatefulWidget {
  @override
  _DobbyScreenState createState() => _DobbyScreenState();
}

class _DobbyScreenState extends State<DobbyScreen> {
  double sliderVal = 0;
  @override
  initState() {
    super.initState();
    sliderVal = 0;
  }

  Container rotate() {
    return Container(
      child: AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: sliderVal >= 50 ? 1 : 0,
        child: Transform.scale(
          scale: sliderVal == 0 ? 0 : sliderVal / 80,
          child: Transform.rotate(
            //origin: Offset(50.0, 50.0),
            angle: sliderVal,
            child: Container(
              //padding: EdgeInsets.all(0),
              height: 300,
              width: 300,
              //color: Colors.red,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/dobby.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*Container scale() {
    return Container(
      child: AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: sliderVal >= 50 ? 1 : 0,
        //origin: Offset(50.0, 50.0),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Center(
            child: Text(
              'I Have No Master',
              style: TextStyle(fontSize: 25, color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }*/

  Slider slider() {
    return Slider(
        activeColor: Colors.red,
        value: sliderVal,
        min: 0,
        max: 100,
        onChanged: (val) {
          setState(() {
            sliderVal = val;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          slider(),
          rotate(),
        ],
      ),
    );
  }
}
