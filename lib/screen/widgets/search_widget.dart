
import 'package:flutter/material.dart';

import '../../utlis/screen_navigation.dart';
import '../../utlis/string_constants.dart';
class SearchWidget extends StatelessWidget {
  SearchWidget({super.key, required this.searchedTextEditingController,required this.onSearchedCallback});

  TextEditingController searchedTextEditingController;
  Function(String searchedText) onSearchedCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),child:
    GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
            ScreenAddresses.searchScreen,
            arguments: {
              StringConstants.searchFilter:
              searchedTextEditingController.text
            }
        ).then((result) {
          if (result != null && result is Map<String, dynamic>) {
            String message = result[ StringConstants.searchFilter];
            onSearchedCallback(message);
          }
        });
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(11),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xff000000).withOpacity(0.35),
                offset: Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 1)
          ],
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 7, left: 14),
              child: Icon(
                Icons.search,
                size: 20.0,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Text(
                (searchedTextEditingController.text.isEmpty) ? "Search city" : searchedTextEditingController.text,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 17,
                    color: (searchedTextEditingController.text.isEmpty) ? Colors.grey : Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        // ),
      ),
    ));
  }
}