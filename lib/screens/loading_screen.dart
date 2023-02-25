import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_oop2_w2/services/location.dart';

//const apiKey ='https://api.openweathermap.org/data/2.5/weather?lat=37.42342342342342&lon=122.08395287867832&appid=8137ace68448d41da44e9bf9fd681a85';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void getLocation()async{
    determinePosition() ;
    GeolocatorPlatform location = GeolocatorPlatform.instance;
    final position= await location.getCurrentPosition();
    print(position);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
