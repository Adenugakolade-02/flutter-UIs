import 'package:flutter/material.dart';
import 'package:rps_ui_e2/screens/product_details.dart';
import 'package:rps_ui_e2/widgets/product_item.dart';
import 'package:rps_ui_e2/utils/constants.dart';
import 'package:rps_ui_e2/utils/widget_functions.dart';

const PRODUCT_DATA = [
  {"image": "pizza.png", "name": "Pizza", "rest": "Maritine Star Restaurant", "rating": "4.5 (164)", "price": 20, "currency": "\$"},
  {"image": "burger.png", "name": "Burger", "rest": "Maritine Star Restaurant", "rating": "4.7 (199)", "price": 10, "currency": "\$"},
  {"image": "fries.png", "name": "Fries", "rest": "Maritine Star Restaurant", "rating": "4.2 (101)", "price": 10, "currency": "\$"},
  {"image": "hotdog.png", "name": "HotDog", "rest": "Maritine Star Restaurant", "rating": "3.9 (150)", "price": 15, "currency": "\$"},
];

const CATEGORIES = [
  {"image": "salad.png", "name": "Salad"},
  {"image": "fastfood.png", "name": "Fast Food"},
  {"image": "desert.png", "name": "Desert"},
  {"image": "drinks.png", "name": "Drinks"},
  {"image": "drinks.png", "name": "Drinks"},
];

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, constraints){
        
        return Container(

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: constraints.maxHeight *0.4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: COLOR_GREEN,
                    ),
                    Image.asset('assets/images/tree_v.png'),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset('assets/images/avatar.png')
                                ),
                              ),
                              addHorizontalSpace(10),
                              
                              Expanded(
                                
                                child: Text(
                                  'How hungry are you today?',
                                  style: textTheme.headline5!.apply(color: Colors.white),
                                ),
                              )
                          ],),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              hintText: 'Search for food items',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),
                              prefixIcon: Icon(Icons.search, color: Colors.white,),
                              suffixIcon: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                                child: Icon(Icons.menu, color: Colors.white),
                              ),
                              fillColor: Colors.white24,
                              filled: true
                            )
                          ),
                          addVerticalSpace(10)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
              Container(
                // height: 400,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          addVerticalSpace(constraints.maxWidth*0.35),
                          Row(
                            children:[
                              Text('Popular Foods', style: textTheme.headline5),
                              Expanded(child: Center(),),
                              Text('View All >', style: textTheme.subtitle2!.apply(color: COLOR_ORANGE))
                            ]
                          ),
                          addVerticalSpace(10),
                          
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: PRODUCT_DATA.map((data) => InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetails(productData:data ,)));
                                },
                                child: ProductItem(productData: data, width: constraints.maxWidth*0.5))).toList(),),
                          )
                        ]
                      ),
                      
                      
                      Positioned(
                        top: -constraints.maxWidth*0.15,
                        left: 0,
                        child: Container(
                          height: constraints.maxWidth*0.35,
                          width: constraints.maxWidth,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            
                            physics: BouncingScrollPhysics(),
                            
                            children:CATEGORIES.map((categories) => 
                            
                            Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              width: constraints.maxWidth*0.25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children:[
                                    Image.asset('assets/images/${categories['image']}'),
                                    addVerticalSpace(10),
                                    Text('${categories['name']}', style: textTheme.bodyText2!.apply(color: COLOR_BLACK),)
                                  ]
                                ),
                              ),
                            )).toList()
                          )
                        )
                      )
                  ],),
                ),
              )
            ]
          ),
        ),
          );
      }),
    );
  }
}