import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: [
          CarouselSlider(
            items: [

              //1st Image of Slider
              Container(
                // margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/cme3.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //2nd IMAGE
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/campus.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd IMAGE
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/cme2.jpeg'), fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th IMAGE
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/cme1.jpeg'), fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th IMAGE
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/enterance.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 190.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.9,
            ),
          ),
        ]);
  }
}