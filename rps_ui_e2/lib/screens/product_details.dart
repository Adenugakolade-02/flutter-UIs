import 'package:flutter/material.dart';
import 'package:rps_ui_e2/utils/button.dart';
import 'package:rps_ui_e2/utils/constants.dart';
import 'package:rps_ui_e2/utils/widget_functions.dart';
import 'package:rps_ui_e2/widgets/product_price_display.dart';
import 'package:rps_ui_e2/widgets/ratings_Minute_KM.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductDetails({Key? key, required this.productData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        return SingleChildScrollView(
                  child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Stack(
                children: [
                Column(
                  
                children: [
                  Container(
                    height: constraints.maxHeight*0.45,
                    width: constraints.maxWidth,
                    color: Colors.grey,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children:[
                        Center(
                          child: Container(
                            // alignment: Alignment.center,
                            width: constraints.maxWidth*0.5,
                            height: constraints.maxWidth*0.5,
                            child: Image.asset('assets/images/${productData['image']}')),
                        ),
                        Positioned(top: 58, left: 8,
                          child: SquareIconButton(
                            circle: false,
                            width: 50,
                            onPressed: (){},
                            boxShape: BoxShape.rectangle, 
                            icon: Icons.keyboard_backspace_outlined, 
                            iconColor: COLOR_ORANGE,
                            buttonColor: COLOR_ORANGE.withAlpha(45),)
                            ),
                     
                      ]
                    )
                  ),
                  ProductPriceDisplay(amount: productData['price'], title: productData['name'], location: productData['rest'], constraints: constraints),
                  
                  Divider(color: Colors.grey),
                  
                  SizedBox(
                    height: constraints.maxHeight*0.10,
                    child: RatingMinKM(ratings: productData['rating'],),
                  ),
                
                Divider(color: Colors.grey),
                
                addVerticalSpace(10),
                
                Text('OverView',style: textTheme.headline6,),
                
                addVerticalSpace(10),
                
                Padding(padding: const EdgeInsets.all(10),
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                ),
                  ],
                  ),
                  // Divider(color: Colors.red,),
                  

              Positioned(
                bottom: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white30
                  ),
                  height: constraints.maxHeight*0.10,
                  width: constraints.maxWidth,
                  child: Row(
                    children: [
                      addHorizontalSpace(5),
                      SquareIconButton(
                          circle: false,
                          boxShape: BoxShape.rectangle,
                          onPressed: (){},
                          iconColor: Colors.white,
                          buttonColor: COLOR_GREEN,
                          icon: Icons.shopping_bag,
                          width: 70,
                          ),
                      addHorizontalSpace(20),
                      Text('Add to Cart', style: textTheme.headline5!.apply(color: COLOR_GREEN)),
                      
                    ]
                  ),
                )),
                ],
            ),
          ),
        );
      }),
    );
  }
}