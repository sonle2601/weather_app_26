import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/hometest2.dart';
import 'package:weather_app/utils/dimension.dart';

import '../bloc/weather_bloc_bloc.dart';
import '../utils/constants.dart';
import '../widgets/weather_item.dart';

class DetailPage extends StatefulWidget {
  final List<Weather> consolidatedWeatherList;
  final int selectedId;
  final String location;

  const DetailPage(
      {Key? key,
      required this.consolidatedWeatherList,
      required this.selectedId,
      required this.location})
      : super(key: key);


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget getWeatherIconMain(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/thunderstorm.png',
          scale: 3,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/lightrain.png',
          scale: 3,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/heavyrain.png',
          scale: 3,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          scale: 3,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/heavycloud.png',
          scale: 3,
        );
      case == 800:
        return Image.asset(
          'assets/clear.png',
          scale: 3,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          scale: 3,
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


  @override
  Widget build(BuildContext context) {
    Dimension.init(context);
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    //Create a shader linear gradient
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    int selectedIndex = widget.selectedId;
    var weatherStateName =
        widget.consolidatedWeatherList[selectedIndex].weatherMain;
    return Scaffold(
        backgroundColor: myConstants.secondaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: myConstants.secondaryColor,
          elevation: 0.0,
          title: Text(widget.location),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: Dimension.height10,
              left: Dimension.height10,
              child: SizedBox(
                height: Dimension.height100,
                width: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      var futureWeatherName =
                          widget.consolidatedWeatherList[index * 8].weatherMain;
                      // var weatherURL =
                      // futureWeatherName.replaceAll(' ', '').toLowerCase();
                      var parsedDate =
                          widget.consolidatedWeatherList[index * 8].date;
                      var newDate = DateFormat('EEEE')
                          .format(parsedDate!)
                          .substring(0, 3);

                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.only(right: 20),
                        width: Dimension.width80,
                        decoration: BoxDecoration(
                            color: index * 8 == selectedIndex * 8
                                ? Colors.white
                                : const Color(0xff9ebcf9),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.blue.withOpacity(.3),
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.consolidatedWeatherList[index * 8]
                                      .temperature!.celsius!
                                      .round()
                                      .toString() +
                                  "°C",
                              style: TextStyle(
                                fontSize: Dimension.font14,
                                color: index * 8 == selectedIndex * 8
                                    ? Colors.blue
                                    : Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            getWeatherIcon(widget
                                .consolidatedWeatherList[index * 8]
                                .weatherConditionCode!),
                            Text(
                              newDate,
                              style: TextStyle(
                                fontSize: Dimension.font14,
                                color: index * 8 == selectedIndex * 8
                                    ? Colors.blue
                                    : Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: size.height * .65,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    )),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      right: Dimension.width20,
                      left: Dimension.width20,
                      child: Container(
                        width: size.width * .7,
                        height: Dimension.height220,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.center,
                                colors: [
                                  Color(0xffa9c1f5),
                                  Color(0xff6696f5),
                                ]),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.1),
                                offset: const Offset(0, 25),
                                blurRadius: 3,
                                spreadRadius: -10,
                              ),
                            ]),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -Dimension.height60,
                              left: Dimension.width10,
                              child: getWeatherIconMain(widget
                                  .consolidatedWeatherList[selectedIndex * 8]
                                  .weatherConditionCode!),
                            ),
                            Positioned(
                                top: Dimension.height80,
                                left: Dimension.width40,
                                child: Padding(
                                  padding:  EdgeInsets.only(bottom: Dimension.height20),
                                  child: Text(
                                    weatherStateName!,
                                    style:  TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: Dimension.font20,
                                    ),
                                  ),
                                )),
                            Positioned(
                              bottom: Dimension.height20,
                              left: Dimension.width20,
                              child: Container(
                                width: size.width * .8,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    weatherItem(
                                      text: '',
                                      value: widget
                                          .consolidatedWeatherList[
                                              selectedIndex * 8]
                                          .windSpeed!
                                          .ceil()!
                                          .round(),
                                      unit: 'km/h',
                                      imageUrl: 'assets/windspeed.png',
                                    ),
                                    weatherItem(
                                        text: '',
                                        value: widget
                                            .consolidatedWeatherList[
                                                selectedIndex * 8]
                                            .humidity!
                                            .ceil()
                                            .round(),
                                        unit: '',
                                        imageUrl: 'assets/humidity.png'),
                                    weatherItem(
                                      text: '',
                                      value: widget
                                          .consolidatedWeatherList[
                                              selectedIndex * 8]
                                          .tempMax!
                                          .celsius!
                                          .round(),
                                      unit: '°C',
                                      imageUrl: 'assets/max-temp.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: Dimension.height10,
                              right: Dimension.width20,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget
                                        .consolidatedWeatherList[
                                            selectedIndex * 8]
                                        .temperature!
                                        .celsius!
                                        .round()
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: Dimension.font70,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..shader = linearGradient,
                                    ),
                                  ),
                                  Text(
                                    'o',
                                    style: TextStyle(
                                      fontSize: Dimension.font40,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..shader = linearGradient,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: Dimension.height250,
                        left: Dimension.width20,
                        child: SizedBox(
                          height: Dimension.height260,
                          width: size.width * .9,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                var futureWeatherName = widget
                                    .consolidatedWeatherList[index * 8]
                                    .weatherMain;

                                var myDate = widget
                                    .consolidatedWeatherList[index * 8].date;
                                var currentDate =
                                    DateFormat('d MMMM, EEEE').format(myDate!);
                                return Container(
                                  margin:  EdgeInsets.only(
                                      left: Dimension.width10, top: Dimension.height10, right: Dimension.width10, bottom: Dimension.height4),
                                  height: Dimension.height80,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: myConstants.secondaryColor
                                              .withOpacity(.1),
                                          spreadRadius: 5,
                                          blurRadius: 20,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          currentDate,
                                          style: const TextStyle(
                                            color: Color(0xff6696f5),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              widget
                                                  .consolidatedWeatherList[
                                                      index * 8]
                                                  .tempMax!
                                                  .celsius!
                                                  .round()
                                                  .toString()+"°",
                                              style:  TextStyle(
                                                color: Colors.grey,
                                                fontSize: Dimension.font30,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                             Text(
                                              '/',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: Dimension.font30,
                                              ),
                                            ),
                                            Text(
                                              widget
                                                  .consolidatedWeatherList[
                                                      index * 8]
                                                  .tempMin!
                                                  .celsius!
                                                  .round()
                                                  .toString()+"°",
                                              style:  TextStyle(
                                                color: Colors.grey,
                                                fontSize: Dimension.font24,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            getWeatherIcon(widget.consolidatedWeatherList[index*8].weatherConditionCode!),
                                            Text(widget
                                                .consolidatedWeatherList[
                                                    index * 8]
                                                .weatherMain
                                                .toString()),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
