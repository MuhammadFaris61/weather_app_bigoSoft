import 'package:flutter/material.dart';

void alertDialog(VoidCallback onBtnPressed, String titleText,
    String subText, String btnText, BuildContext context) {
  var theme = Theme.of(context);
  Dialog errorDialog = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14)), //this right here
    surfaceTintColor:Colors.white,
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 18,
      ),
      child: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                titleText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subText,
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: onBtnPressed,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    color: theme.primaryColor,
                  ),
                  height: 45,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      btnText,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => errorDialog);
}
