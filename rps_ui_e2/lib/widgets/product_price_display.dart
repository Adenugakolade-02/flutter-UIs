import 'package:flutter/material.dart';
import 'package:rps_ui_e2/utils/button.dart';
import 'package:rps_ui_e2/utils/widget_functions.dart';

class ProductPriceDisplay extends StatelessWidget {
  final int amount;
  final String title;
  final String location;
  final BoxConstraints constraints;

  const ProductPriceDisplay({Key? key, required this.amount, required this.title, required this.location, required this.constraints}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(10),
                    height: constraints.maxHeight*0.12,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                               children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(this.title,style: textTheme.headline6),
                              addVerticalSpace(5),
                              
                              RichText(text: TextSpan(children: [
                                WidgetSpan(child: Icon(Icons.place, color: Colors.red, size:15 ,)),
                                TextSpan(text:this.location, style: textTheme.caption)
                              ]))
                            ]
                          ),
                          Expanded(child: Center(),),
                          Center(
                            child: RichText(text: TextSpan(children: [
                              TextSpan(text: '\$', style: textTheme.subtitle2!.apply(color: Colors.red)),
                              TextSpan(text:'${this.amount}', style: textTheme.headline5!.apply(color: Colors.red))
                            ])),
                          ),
                          
                        ],
                      ),
                      Positioned(
                                top: -constraints.maxWidth*0.10,
                                right: 0,
                                child: SquareIconButton(
                                  circle: true,
                                  boxShape: BoxShape.circle,
                                  onPressed: (){},
                                  iconColor: Colors.white,
                                  buttonColor: Colors.red,
                                  icon: Icons.favorite,
                                  width: 70,
                                    )),
                      ],
                    ),
                  );
  }
}