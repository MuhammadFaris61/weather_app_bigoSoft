import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screen/widgets/search_widget.dart';
import 'package:weather_app/screen/widgets/simple_text_widget.dart';
import 'package:weather_app/screen/widgets/title_text_widget.dart';
import 'package:weather_app/screen/widgets/weather_list_item_widget.dart';
import 'package:weather_app/utlis/screen_navigation.dart';
import 'package:weather_app/utlis/string_constants.dart';



class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 late WeatherProvider weatherProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      weatherProvider.fetchWeatherCredentials(context);
    });


  }
  TextEditingController searchTextEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    weatherProvider= Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const TitleTextWidget(text: StringConstants.appTitleText),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            SearchWidget(
              onSearchedCallback: (String searchedText) {
                searchTextEditingController.text=searchedText;
                if(searchedText.isNotEmpty){
                  weatherProvider.fetchWeatherCredentials(context,searchedText);
                }
              }, searchedTextEditingController: searchTextEditingController,

            ),

            const SizedBox(height: 10),
            Expanded(child:
                Consumer<WeatherProvider>(builder: (context, provider, child) {
              return Column(
                children: [
                   Row(
                    children: [
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
                    child:   TitleTextWidget(
                        text: StringConstants.locationText,
                      ),),
                      const SizedBox(
                        width: 5,
                      ),
                      SimpleTextWidget(
                        text: provider.getCityName,
                      )
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: provider.getWeatherList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return WeatherListItemWidget(
                              weather: provider.getWeatherList[index],
                            );
                          }))
                ],
              );
            }))
          ])),
    );
  }
}








