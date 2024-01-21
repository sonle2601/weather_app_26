import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/utils/dimension.dart';

import '../bloc/weather_bloc_bloc.dart';
import '../utils/constants.dart';
import '../widgets/weather_item.dart';
import 'DetailPage.dart';

class HomeTest2 extends StatefulWidget {
  const HomeTest2({super.key});

  @override
  State<HomeTest2> createState() => _HomeTest2State();
}

class _HomeTest2State extends State<HomeTest2> {
  Widget getWeatherIconMain(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/thunderstorm.png',
          scale: 2.4,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/lightrain.png',
          scale: 2.4,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/heavyrain.png',
          scale: 2.4,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          scale: 2.4,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/heavycloud.png',
          scale: 2.4,
        );
      case == 800:
        return Image.asset(
          'assets/clear.png',
          scale: 2.4,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          scale: 2.3,
        );
      default:
        return Image.asset('assets/clear.png');
    }
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/thunderstorm.png',
          width: 35,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/lightrain.png',
          width: 35,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/heavyrain.png',
          width: 35,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          width: 35,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/heavycloud.png',
          width: 35,
        );
      case == 800:
        return Image.asset(
          'assets/clear.png',
          width: 35,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          width: 35,
        );
      default:
        return Image.asset(
          'assets/clear.png',
          width: 35,
        );
    }
  }

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Constants cs = Constants();
  List<dynamic> consolidatedWeatherList = [];

  String location = 'HaNoi';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return Scaffold(
            backgroundColor: Colors.white,

            body: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.weather.areaName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    DateFormat("EEEE, d MMMM").format(state.weather.date!),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        color: cs.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: cs.primaryColor.withOpacity(.5),
                            offset: const Offset(0, 25),
                            blurRadius: 10,
                            spreadRadius: -12,
                          )
                        ]),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            top: -40,
                            left: 20,
                            child: getWeatherIconMain(
                                state.weather.weatherConditionCode!)),
                        Positioned(
                          bottom: 30,
                          left: 60,
                          child: Text(
                            "${state.weather.weatherMain}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "${state.weather.temperature!.celsius!.round()}°C",
                                  style: TextStyle(
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = linearGradient,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        weatherItem(
                          text: 'Wind Speed',
                          value: state.weather.windSpeed!.ceil().round(),
                          unit: ' km/h',
                          imageUrl: 'assets/windspeed.png',
                        ),
                        weatherItem(
                            text: 'Humidity',
                            value: state.weather.humidity!.ceil().round(),
                            unit: '',
                            imageUrl: 'assets/humidity.png'),
                        weatherItem(
                          text: 'Max Temp',
                          value: state.weather.tempMax!.celsius!.round(),
                          unit: ' °C',
                          imageUrl: 'assets/max-temp.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Next 7 Days',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: cs.primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            String today =
                                DateTime.now().toString().substring(0, 10);
                            var selectedDay = state.weatherList[index * 8].date;
                            var futureWeatherName =
                                state.weatherList[index * 8].weatherMain;
                            // var weatherUrl =
                            // futureWeatherName.replaceAll(' ', '').toLowerCase();

                            var parsedDate = state.weatherList[index * 8].date;
                            var newDate = DateFormat('EEEE')
                                .format(parsedDate!)
                                .substring(0, 3); //formateed date

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              consolidatedWeatherList:
                                                  state.weatherList,
                                              selectedId: index,
                                              location: location,
                                            )));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                margin: const EdgeInsets.only(
                                    right: 20, bottom: 10, top: 10),
                                width: 80,
                                decoration: BoxDecoration(
                                    color: selectedDay == today
                                        ? cs.primaryColor
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1),
                                        blurRadius: 5,
                                        color: selectedDay == today
                                            ? cs.primaryColor
                                            : Colors.black54.withOpacity(.2),
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${state.weatherList[index * 8].temperature!.celsius!.round()}°C",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: selectedDay == today
                                            ? Colors.white
                                            : cs.primaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    getWeatherIcon(state.weatherList[index * 8]
                                        .weatherConditionCode!),
                                    Text(
                                      newDate,
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: selectedDay == today
                                            ? Colors.white
                                            : cs.primaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
