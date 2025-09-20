import 'score_counter.dart';
import 'digit_scroll_animation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WingspanPage extends StatefulWidget {
  const WingspanPage({super.key, required this.title});

  final String title;

  @override
  State<WingspanPage> createState() => _WingspanPageState();
}

class _WingspanPageState extends State<WingspanPage>
    with AutomaticKeepAliveClientMixin<WingspanPage> {
  int sum = 0;
  bool scoreRevealed = false;

  @override
  bool get wantKeepAlive => true;

  void addToSum(int value) {
    setState(() {
      sum += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_1_birds.png", cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_2_bonus.png", cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_3_goals.png", cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_4_eggs.png", cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_5_food.png", cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_6_tucked.png",
              cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_7_nectar.png",
              cb: addToSum),
          SizedBox(
            width: 320.0,
            height: 80.0,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  scoreRevealed = !scoreRevealed;
                });
                HapticFeedback.vibrate();
              },
              child: scoreRevealed
                  ? DigitScrollAnimation(
                      value: sum,
                      duration: const Duration(seconds: 5),
                    )
                  : Text(
                      'reveal score',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
