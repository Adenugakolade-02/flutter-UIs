import 'package:flutter/material.dart';
import 'package:rps_ui_e1/screens/DetailsScreen.dart';
import 'package:rps_ui_e1/utils/constants.dart';
import 'package:rps_ui_e1/utils/widget_functions.dart';
import 'package:rps_ui_e1/utils/custom_functions.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double height, width;

  const BorderBox(
      {Key key, this.padding, this.height, this.width, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding ?? const EdgeInsets.all(8),
      width: width,
      height: height,
      child: child,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
          color: COLOR_WHITE),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key key, this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: COLOR_GREY.withAlpha(25),
      ),
      margin: EdgeInsets.only(left: 25),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Text(text, style: themeData.textTheme.headline5),
    );
  }
}

class displayContent extends StatelessWidget {
  final dynamic itemData;
  final EdgeInsets padding;
  final dynamic newScreen;

  const displayContent(
      {Key key,
      @required this.itemData,
      @required this.newScreen,
      this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => this.newScreen));
      },
      child: Padding(
        padding: this.padding ?? EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Stack(children: <Widget>[
              ClipRRect(
                child: Image.asset(itemData['image']),
                borderRadius: BorderRadius.circular(25),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: BorderBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.favorite_border,
                    color: COLOR_WHITE,
                  ),
                ),
              )
            ]),
            addVerticalSpace(15),
            Row(children: [
              Text(
                "${formatCurrency(itemData["amount"])}",
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(
                "${itemData['address']}",
                style: themeData.textTheme.bodyText2,
              )
            ]),
            addVerticalSpace(15),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headline5,
            ),
            addVerticalSpace(25),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen {}

class MapView extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;

  const MapView({Key key, this.icon, this.text, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return TextButton(
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      onPressed: () {},
      style: TextButton.styleFrom(
          maximumSize: Size(150,50) ,
          backgroundColor: COLOR_DARK_BLUE,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          icon,
          color: COLOR_BLACK,
        ),
        addHorizontalSpace(10),
        Text(
          this.text,
          style: themeData.textTheme.bodyText2,
        )
      ]),
    );
  }
}
