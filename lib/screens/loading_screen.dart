import 'dart:convert';

import 'package:clima_oop2_w2/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_oop2_w2/services/location.dart';
import 'package:http/http.dart';

const apiKey ='8137ace68448d41da44e9bf9fd681a85';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late var lat;
  late var long;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation()async{
    determinePosition() ;
    GeolocatorPlatform location = GeolocatorPlatform.instance;
    final position= await location.getCurrentPosition();
    lat=position.latitude;
    long=position.longitude;
    getData();
    print(position);
  }
  void getData() async{
    String url ='https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey';
    Response response = await get(Uri.parse(url));
    print(response.body);
    String data=response.body;
    var decodedData=jsonDecode(data);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData: decodedData,);
    }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(''),
      ),
    );
  }
}
