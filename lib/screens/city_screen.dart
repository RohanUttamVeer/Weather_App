import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/getWeather.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(1.0), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: Colors.white,
                    // icon: Icon(
                    //   Icons.search,
                    //   color: Colors.white,
                    //   size: 40,
                    // ),
                    hintText: 'enter city name',
                    hintStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'GET WEATHER',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
