import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Presentation/Widgets/background_color.dart';
import 'package:weather_app/Presentation/Widgets/get_weather_icons.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/constants/colors.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // Background Color with Blur Effect
              const BackgroundColor(
                  height: 300,
                  width: 300,
                  x: 2.5,
                  y: -0.3,
                  containerColor: homePageBackgroundColor1,
                  shape: BoxShape.circle),
              const BackgroundColor(
                height: 300,
                width: 300,
                x: -2.5,
                y: -0.3,
                containerColor: homePageBackgroundColor1,
                shape: BoxShape.circle,
              ),
              const BackgroundColor(
                  height: 300,
                  width: 300,
                  x: 0,
                  y: -1.2,
                  containerColor: homePageBackgroundColor2,
                  shape: BoxShape.rectangle),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              // Background Color finished

              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "🏳  ${state.weather.areaName}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Good Morning",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Center(
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.35,
                                child: getWeatherIcon(
                                    state.weather.weatherConditionCode!)),
                          ),

                          const SizedBox(height: 20),

                          // Temperature And Date Section Starts
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "${state.weather.temperature!.celsius!.round()}°C",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 60,
                                  ),
                                ),
                                Text(
                                  state.weather.weatherMain!.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    DateFormat('EEEE dd •')
                                        .add_jm()
                                        .format(state.weather.date!),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Temperature And Date Section Ends

                          const SizedBox(height: 30),

                          // Final Section

                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/clear.png",
                                          scale: 10,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sunrise',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              DateFormat('').add_jm().format(
                                                  state.weather.sunrise!),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/sunset.png",
                                          scale: 10,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sunset',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              DateFormat('').add_jm().format(
                                                  state.weather.sunset!),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/max.png',
                                          scale: 10,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Maximum Temp',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              ("${state.weather.tempMax!.celsius!.round()} °C"),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/min.png",
                                          scale: 10,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Minimum Temp',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "${state.weather.tempMin!.celsius!.round()} °C",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(horizontal: 30),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Row(
                              //         children: [
                              //           Image.asset(
                              //             "assets/images/max.png",
                              //             scale: 10,
                              //           ),
                              //           const SizedBox(
                              //             width: 15,
                              //           ),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               const Text(
                              //                 'Temperature Maximum',
                              //                 style: TextStyle(
                              //                   color: Colors.white,
                              //                   fontWeight: FontWeight.w300,
                              //                 ),
                              //               ),
                              //               const SizedBox(
                              //                 height: 3,
                              //               ),
                              //               Text(
                              //                 "${state.weather.tempMax!.celsius!.round()} °C",
                              //                 style: const TextStyle(
                              //                   color: Colors.white,
                              //                   fontWeight: FontWeight.w300,
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ],
                              //       ),
                              //       Row(
                              //         children: [
                              //           Image.asset(
                              //             "assets/images/min.png",
                              //             scale: 10,
                              //           ),
                              //           const SizedBox(
                              //             width: 15,
                              //           ),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               const Text(
                              //                 'Sunset',
                              //                 style: TextStyle(
                              //                   color: Colors.white,
                              //                   fontWeight: FontWeight.w300,
                              //                 ),
                              //               ),
                              //               const SizedBox(
                              //                 height: 3,
                              //               ),
                              //               Text(
                              //                 "${state.weather.tempMin!.celsius!.round()} °C",
                              //                 style: const TextStyle(
                              //                   color: Colors.white,
                              //                   fontWeight: FontWeight.w300,
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),

                          
                        ],
                      ),
                    );
                  } else {
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
