 import 'package:flutter/material.dart';

Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && <= 300:
        return Image.asset("assets/images/thunder.png",scale: 1.5,);

      case >= 300 && <= 400:
        return Image.asset("assets/images/fog.png",);

      case >= 500 && <= 600:
        return Image.asset("assets/images/rain.png");

      case >= 600 && <= 700:
        return Image.asset("assets/images/snow.png");

      case >= 700 && < 800:
        return Image.asset("assets/images/clear.png");

      case == 800:
        return Image.asset("assets/images/clear.png");

      case >= 800 && <= 900:
        return Image.asset("assets/images/cloudy.png",scale: 1.5);

      default:
        return Image.asset('assets/images/clear.png');
    }
    
  }