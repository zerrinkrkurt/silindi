import 'dart:math';

import 'package:bootcamp/home_page.dart';
import 'package:bootcamp/intro_screens/intro_page_1.dart';
import 'package:bootcamp/intro_screens/intro_page_2.dart';
import 'package:bootcamp/intro_screens/intro_page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
//hangi sayfada olduğumuzu takip etmek için controller
  PageController _controller = PageController();

//son sayfada olup olmadığımızı takip et
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          // dot indicators
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },


                  
                 
                  child:

                   Text('Atla'),
                   
                

                   
                   
                ),

                // dot indicators
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: Color(0xffDAD8D8),
                    activeDotColor: Colors.black,
                  ),
                ),

                //next ore done

                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        },
                        child: Text('Bitti'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('Devam et'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
