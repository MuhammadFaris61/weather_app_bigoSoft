import 'package:flutter/material.dart';
import 'package:weather_app/screen/widgets/title_text_widget.dart';
import 'package:weather_app/utlis/string_constants.dart';
import '../utlis/global.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();


  List<Map<String, dynamic>> _filteredCities = [];
  Map? modelRoute ;

  void filterCities() {
    List<Map<String, dynamic>> filteredList = [];
    if (_searchController.text.isEmpty) {
      filteredList.addAll(cities);
    } else {
      for (var city in cities) {
        if (city["name"].toLowerCase().contains(_searchController.text.toLowerCase())) {
          filteredList.add(city);
        }
      }
    }
    setState(() {
      _filteredCities.clear();
      _filteredCities.addAll(filteredList);
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchArgumentValue();
    return Scaffold(
          appBar: AppBar(
            title: const TitleTextWidget(text: StringConstants.appTitleText),
          ),
          body:SafeArea(child:
      Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: StringConstants.searchCity,
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredCities.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_filteredCities[index]["name"]),
                subtitle: Text(
                    "Latitude: ${_filteredCities[index]["latitude"]}, Longitude: ${_filteredCities[index]["longitude"]}"),
              onTap: (){
                Navigator.pop(context, {StringConstants.searchFilter:_filteredCities[index]["name"]});
              },
              );
            },
          ),
        ),
      ],
    ),));
  }
  void fetchArgumentValue(){
    if(modelRoute==null){
      modelRoute =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      if(modelRoute![StringConstants.searchFilter].isNotEmpty){
        _searchController.text=modelRoute![StringConstants.searchFilter];
        filterCities();
      }else{
        _filteredCities.addAll(cities);
      }
      _searchController.addListener(() {
        filterCities();
      });
    }
  }
}
