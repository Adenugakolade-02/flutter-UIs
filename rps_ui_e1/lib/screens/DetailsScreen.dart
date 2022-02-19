import 'package:flutter/material.dart';
import 'package:rps_ui_e1/utils/constants.dart';
import 'package:rps_ui_e1/utils/widget_functions.dart';
import 'package:rps_ui_e1/widgets/BorderBox.dart';
import 'package:rps_ui_e1/utils/custom_functions.dart';

class DetailScreen extends StatelessWidget {
  final dynamic itemData;

  const DetailScreen({Key key, @required this.itemData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: 15);
    final EdgeInsets padding =
        EdgeInsets.symmetric(horizontal: 10, vertical: 13);
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  ImageWithIcons(
                    image: itemData['image'],
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${formatCurrency(itemData["amount"])}',
                              style: themeData.textTheme.headline1,
                            ),
                            addVerticalSpace(10),
                            Text(
                              itemData['address'],
                              style: themeData.textTheme.bodyText2,
                            )
                          ],
                        ),
                        Container(
                          child: Text('20 Hours ago'),
                          padding: padding,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
                            color: COLOR_WHITE),
                        )
                        // BorderBox(
                        //   child: Text('20 Hours ago'),
                        //   height: 70,
                        //   width: 100,
                        //   padding: padding,
                        // )
                      ],
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      'House Information',
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.only(left: 15),
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              children: [
                                NumbersWithInfo(
                                  number: itemData['area'],
                                  info: 'Square Foot',
                                ),
                                NumbersWithInfo(
                                    number: itemData['bedrooms'],
                                    info: 'bedrooms'),
                                NumbersWithInfo(
                                    number: itemData['bathrooms'],
                                    info: 'bathrooms'),
                                NumbersWithInfo(
                                    number: itemData['garage'], info: 'Garage'),
                              ],
                            ),
                          ),
                          addVerticalSpace(10),
                          Padding(
                            padding: sidePadding,
                            child: Text(itemData['description'],
                                textAlign: TextAlign.justify,
                                style: themeData.textTheme.bodyText2),
                          )
                        ],
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                ],
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MapView(
                      text: "Message",
                      icon: Icons.message,
                      width: size.width * 0.35,
                    ),
                    addHorizontalSpace(10),
                    MapView(
                      text: "Call",
                      icon: Icons.call,
                      width: size.width * 0.35,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWithIcons extends StatelessWidget {
  final String image;

  const ImageWithIcons({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: 15);

    return Container(
      height: 200,
      width: size.width,
      child: Stack(children: [
        Image.asset(image),
        Positioned(
          width: size.width,
          top: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BorderBox(
                padding: sidePadding,
                height: 50,
                width: 50,
                child: Icon(
                  Icons.keyboard_backspace,
                  color: COLOR_BLACK,
                ),
              ),
              BorderBox(
                padding: sidePadding,
                height: 50,
                width: 50,
                child: Icon(
                  Icons.favorite_border,
                  color: COLOR_BLACK,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class NumbersWithInfo extends StatelessWidget {
  final int number;
  final String info;

  const NumbersWithInfo({Key key, @required this.number, @required this.info})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        BorderBox(
          height: 80,
          width: 80,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          child: Text('$number', style: themeData.textTheme.headline3),
        ),
        addHorizontalSpace(10),
        Text(info, style: themeData.textTheme.headline6)
      ],
    );
  }
}
