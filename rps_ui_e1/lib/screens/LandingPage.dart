import 'package:flutter/material.dart';
import 'package:rps_ui_e1/sample_data.dart';
import 'package:rps_ui_e1/screens/DetailsScreen.dart';
import 'package:rps_ui_e1/utils/constants.dart';
import 'package:rps_ui_e1/utils/widget_functions.dart';
import 'package:rps_ui_e1/widgets/BorderBox.dart';
import 'package:rps_ui_e1/screens/retraialScreen.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: 15);
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: sidePadding,
          height: size.height,
          width: size.width,
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderBox(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                        BorderBox(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.settings,
                            color: COLOR_BLACK,
                          ),
                        )
                      ]),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'city',
                    style: themeData.textTheme.bodyText2,
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text('San Fransico',
                      style: themeData.textTheme.headline1),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: VerticalDivider(
                    thickness: padding,
                    color: COLOR_GREY,
                  ),
                ),
                Padding(
                  padding: sidePadding,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      // physics: ScrollPhysics.
                      child: Row(
                        children:
                            ["<\$220,000", "For Sale", "3-4 Beds", ">1000 sqft"]
                                .map((items) => ChoiceOption(
                                      text: items,
                                    ))
                                .toList(),
                      )),
                ),
                addVerticalSpace(15),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: RE_DATA.length,
                      itemBuilder: (context, index) {
                        return displayContent(
                          itemData: RE_DATA[index],
                          padding: sidePadding,
                          newScreen: DetailsPage(itemData: RE_DATA[index]),
                        );
                      }),
                )
              ],
            ),
            Positioned(
              left: (size.width/2)-75,
              bottom: 20,
              child: Center(
                child: MapView(
                  icon: Icons.map_rounded,
                  text: 'Map View',
                  // width: size.width * 0.35,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
