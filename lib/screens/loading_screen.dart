import 'package:csi_assign_3/screens/location_screen.dart';
import 'package:csi_assign_3/services/weather.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
// import 'package:http/http.dart';
// import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apikey= 'fbe083ccb0dd9907c0195a1fdc58fc86';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // double latitude=0;
  // double longitude=0;

  void initState(){
    super.initState();
    getlocationdata();

  }

  void getlocationdata() async{
    WeatherModel weatherModel= WeatherModel();
   var weatherData = await weatherModel.getLocationWeather();
   Navigator.push(context, MaterialPageRoute(builder: (context){
     return LocationScreen(locationWeather: weatherData,);
   }));
  }


    // print(data);
    // var longitude =jsonDecode(data)['coord']['lon'];
    // var description= jsonDecode(data)['weather'][0]['description'];

    // print(temperature);
    // print(condition);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: SpinKitThreeBounce(
        color: Colors.white,
        size: 50,
      ),
    ),
    );
  }
}