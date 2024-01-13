import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screen/widgets/simple_text_widget.dart';

import '../../utlis/global.dart';
import '../../utlis/string_constants.dart';

class WeatherListItemWidget extends StatelessWidget {
  WeatherListItemWidget({super.key, required this.weather});

  final Weather weather;
  DateTime? datetime;

  @override
  Widget build(BuildContext context) {
    datetime = weather.date;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.35),
              offset: Offset(1, 1),
              blurRadius: 5,
            )
          ],
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleTextWidget(
                  text: "${DateFormat('EEEE').format(weather.date!)}"),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "${StringConstants.fetchImageUrl}${weather.weatherIcon}.png",
                            scale: 0.5))),
              ),
              SimpleTextWidget(
                  text: capitalizeEveryWord("${weather.weatherDescription}")),
            ],
          ),

          // Icon(
          //   Icons.cloud,
          //   size: 70.0,
          //   color: Colors.grey,
          // ),
          SizedBox(
            width: 5,
          ),
          Spacer(),
          Column(
            children: [
              SimpleTextWidget(
                  text:
                      "${weather.temperature?.celsius?.toStringAsFixed(0)}°C"),
              SizedBox(
                height: 5,
              ),
              if (datetime != null)
                SimpleTextWidget(text: "${formatDateTime(datetime!.toUtc())}"),
            ],
          )
        ],
      ),
    );
  }
}
