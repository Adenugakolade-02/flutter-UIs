import 'package:flutter/material.dart';
import 'package:rps_ui_e2/utils/button.dart';
import 'package:rps_ui_e2/utils/constants.dart';
import 'package:rps_ui_e2/utils/widget_functions.dart';

class RatingMinKM extends StatelessWidget {
  final String ratings;

  const RatingMinKM({Key? key, required this.ratings}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(text: TextSpan(children: [
            WidgetSpan(child: Icon(Icons.star, color: COLOR_ORANGE,)),
            TextSpan(text: this.ratings, style: textTheme.subtitle2),
          ])),
          RichText(text: TextSpan(children: [
            WidgetSpan(child: Icon(Icons.timer, color: Colors.red,)),
            TextSpan(text: '18 Mins', style: textTheme.subtitle2),
          ])),
          RichText(text: TextSpan(children: [
            WidgetSpan(child: Icon(Icons.place, color: COLOR_GREEN,)),
            TextSpan(text: '2.3KM', style: textTheme.subtitle2),
          ])),
        ],
      ),
    );
  }
}