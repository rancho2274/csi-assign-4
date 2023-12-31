import 'package:flutter/material.dart';
import 'package:csi_assign_3/utilities/constants.dart';
import 'package:csi_assign_3/services/weather.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override

  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
 WeatherModel weather = WeatherModel();
  int temperature=0;
  String weatherIcon='';
  String cityName= '';
  String temp1='';
  @override
  void initState() {

    super.initState();
    updatUI(widget.locationWeather);
  }

  void updatUI(dynamic weatherData){
    setState(() {
      var condition = weatherData['weather'][0]['id'];
      double temp= weatherData['main']['temp'];
      var cityName= weatherData['name'];
      temperature=temp.toInt();
      weatherIcon=weather.getWeatherIcon(condition);
      temp1=weather.getMessage(temperature);
      print(cityName);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      var weatherData= await weather.getLocationWeather();
                    updatUI(weatherData);
                      },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$temp1 in Pune' ,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}