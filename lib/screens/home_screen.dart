import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/utils/dimension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  Widget getWelcome(int time){
    switch (time){
      case >= 1 && <= 12:
      {
        return const Text(
          "Good Morning",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        );
      }
      case >12 && <= 17:
        {
          return const Text(
            "Good Afternoon",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          );
        }
      case >17 && <=23:
        {
          return const Text(
            "Good Evening",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          );
        }

      default:
        return const Text(
                    "Good Morning",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
    ),
    );

    }
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300 :
        return Image.asset(
            'assets/1.png'
        );
      case >= 300 && < 400 :
        return Image.asset(
            'assets/2.png'
        );
      case >= 500 && < 600 :
        return Image.asset(
            'assets/3.png'
        );
      case >= 600 && < 700 :
        return Image.asset(
            'assets/4.png'
        );
      case >= 700 && < 800 :
        return Image.asset(
            'assets/5.png'
        );
      case == 800 :
        return Image.asset(
            'assets/6.png'
        );
      case > 800 && <= 804 :
        return Image.asset(
          'assets/7.png',
          scale: 2.3,
        );
      default:
        return Image.asset(
            'assets/7.png'
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimension.init(context);
    // print("Curent height : "+MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: Dimension.screenHeight,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(7, -0.3),
                child: Container(
                  height: Dimension.height300,
                  width: Dimension.width300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-7, -0.3),
                child: Container(
                  height: Dimension.height300,
                  width: Dimension.width300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.2),
                child: Container(
                  height: Dimension.height200,
                  width: Dimension.width600,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFAB40)
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if(state is WeatherBlocSuccess){
                    return SizedBox(
                      width: Dimension.screenWidth,
                      height: Dimension.screenHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            " ${state.weather.areaName}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                          SizedBox(height: 10,),
                        const Text(
                          "Good Morning",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                          Center(
                            child: getWeatherIcon(state.weather.weatherConditionCode!)
                          ),
                           Center(
                            child: Text(
                              "${state.weather.temperature!.celsius!.round()} °C",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                           Center(
                            child: Text(
                              "${state.weather.weatherMain}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                           Center(
                            child: Text(
                              DateFormat("EEEE dd .").add_jm().format(state.weather.date!),
                              // "Friday 16 . 09.42 am",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 10,
                                  ),

                                  SizedBox(height: 5,),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Surise",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      SizedBox(height: 3,),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunrise!),

                                        // "5:34 am",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/12.png',
                                    scale: 10,
                                  ),

                                  SizedBox(height: 5,),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sunset",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      SizedBox(height: 3,),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunset!),
                                        // "5:34 pm",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Color(0x7A7A7AFF),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 10,
                                  ),

                                  SizedBox(height: 5,),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Temp Max",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      SizedBox(height: 3,),
                                      Text(
                                        "${state.weather.tempMax!.celsius!.round()}°C",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 10,
                                  ),

                                  SizedBox(height: 5,),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Temp Min",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      SizedBox(height: 3,),
                                      Text(
                                        "${state.weather.tempMin!.celsius!.round()}°C",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }else{
                      return Container();
                  }

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
