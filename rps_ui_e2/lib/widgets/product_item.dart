import 'package:flutter/material.dart';
import 'package:rps_ui_e2/utils/widget_functions.dart';
import 'package:rps_ui_e2/utils/constants.dart';

class ProductItem extends StatelessWidget {
  final Map<String, dynamic> productData;
  final double width;

  const ProductItem({Key? key, required this.productData, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    final height = width *4/3;
    
    return Container(
      margin : EdgeInsets.all(20.0),
      width: width,
      height: height+40,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              
              Expanded(flex: 2, child: Container()),
              
              Expanded(flex:7, child:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white
              ),
              ),),

            ]
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/${productData['image']}',width: width*0.80,)
                ),
                
                Expanded(child: Center()),
                
                Text('${productData['name']}', style: textTheme.headline6),
                
                addVerticalSpace(5),
                
                RichText(text: TextSpan(
                  children:[
                    WidgetSpan(child: Icon(Icons.location_on, color: Colors.red,size: 15,)),
                    
                    TextSpan(text: '${productData['rest']}', style: textTheme.caption)
                  ])),
                
                addVerticalSpace(10),
                
                Row(
                  children: [
                    Expanded(flex:5, child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.star, color: COLOR_ORANGE),),
                          TextSpan(text: '${productData['rating']}', style: textTheme.subtitle2)
                        ]
                      )
                    )),
                    Expanded(flex:3, child: RichText(
                      text: TextSpan(children: [
                        TextSpan(text:'\$', style: textTheme.subtitle2),
                        TextSpan(text: '${productData['price']}',style: textTheme.headline5!.apply(color: COLOR_ORANGE))
                      ])))
                  ]
                )
              ],
            ),
          )
        ],
      )
    );
  }
}