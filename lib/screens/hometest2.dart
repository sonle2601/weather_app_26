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


  @override
  Widget build(BuildContext context) {
    Dimension.init(context);
    Size size = MediaQuery.of(context).size;
    String today =DateTime.now().toString().substring(0, 10);

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
                    height: Dimension.height15,
                  ),
                  Text(
                    state.weather.areaName.toString(),
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimension.font30,
                    ),
                  ),
                  Text(
                    DateFormat("EEEE, d MMMM").format(state.weather.date!),
                    style:  TextStyle(
                      color: Colors.grey,
                      fontSize: Dimension.font16,
                    ),
                  ),
                   SizedBox(
                    height: Dimension.height40,
                  ),
                  Container(
                    width: size.width,
                    height: Dimension.height200,
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
                            top: -Dimension.height70,
                            left: -Dimension.width15,
                            child: getWeatherIconMain(state.weather.weatherConditionCode!)),
                        Positioned(
                          bottom: Dimension.height40,
                          left: Dimension.width50,
                          child: Text(
                            "${state.weather.weatherMain}",
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: Dimension.font30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: Dimension.height20,
                          right: Dimension.width20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: Dimension.height4),
                                child: Text(
                                  "${state.weather.temperature!.celsius!.round()}°C",
                                  style: TextStyle(
                                    fontSize: Dimension.font60,
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
                   SizedBox(
                    height: Dimension.height20,
                  ),
                  Container(
                    padding:  EdgeInsets.symmetric(horizontal: Dimension.width40),
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
                   SizedBox(
                    height: Dimension.height10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimension.font24,
                        ),
                      ),
                      Text(
                        'Next 5 Days',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimension.font18,
                            color: cs.primaryColor),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: Dimension.height20,
                  ),
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            var selectedDay = state.weatherList[index * 8].date;
                            var dayNow = DateFormat('yyyy-MM-dd').format(selectedDay!);

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
                                              location: state.weatherList[index].areaName!,
                                            )));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                margin:  EdgeInsets.only(
                                    right: Dimension.width20, bottom: Dimension.height10, top: Dimension.height10),
                                width: Dimension.width80,
                                decoration: BoxDecoration(
                                    color: dayNow.toString() == today
                                        ? cs.primaryColor
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1),
                                        blurRadius: 5,
                                        color: dayNow.toString() == today
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
                                        fontSize: Dimension.font18,
                                        color: dayNow.toString() == today
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
                                        fontSize: Dimension.font18,
                                        color: dayNow.toString() == today
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
