import 'package:geolocator/geolocator.dart';

class Location{
  double latitude=0;
  double longitude=0;
  Future <void> getCurrentLocation()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission== LocationPermission.denied){
      permission= await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude=position.latitude;
    longitude=position.longitude;

  }
}

