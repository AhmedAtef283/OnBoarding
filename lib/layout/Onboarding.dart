import 'package:first_app/defults/Components.dart';
import 'package:first_app/modules/OnBoarding/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}


class BoardingModel {
  final String image;

  final String title;

  final String detail;

  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.detail,
  });
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLast = false;

  @override
  var BoardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'images/people-ordering-food-cafe-online_74855-5913.webp',
      title: 'Choose Your Specific Order',
      detail: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    BoardingModel(
      image: 'images/concept-credit-card-payment-landing-page_52683-24923.webp',
      title: 'Pay It Online',
      detail: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    BoardingModel(
      image: 'images/express-courier-scooter-shipping-order_74855-6447.webp',
      title: 'Fast Delivery',
      detail: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    PageController _controller;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      isLast = true;
                      print("Last");
                    } else {
                      isLast = false;
                      print("Not Last");
                    }
                  },
                  itemBuilder: (context, index) =>
                      BuildOnboardItem(boarding[index]),
                  itemCount: boarding.length,
                  controller: BoardController),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: BoardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotWidth: 9,
                    dotHeight: 10,
                    spacing: 3,
                    expansionFactor: 4.0,
                    activeDotColor: Colors.blueAccent,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: () {
                      BoardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                      if (isLast){
                        navigateAndRemove(context, LoginScreen());
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                    backgroundColor: Colors.blueAccent),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget BuildOnboardItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                '${model.image}',
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                '${model.title}',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '${model.detail}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      );
}
