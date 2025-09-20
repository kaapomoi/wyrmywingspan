import 'score_counter.dart';
import 'digit_scroll_animation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WyrmspanPage extends StatefulWidget {
  const WyrmspanPage({super.key, required this.title});

  final String title;

  @override
  State<WyrmspanPage> createState() => _WyrmspanPageState();
}

class _WyrmspanPageState extends State<WyrmspanPage>
    with AutomaticKeepAliveClientMixin<WyrmspanPage> {
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
          ScoreCounter(iconPath: "assets/wyrms/guild.png", cb: addToSum),
          ScoreCounter(iconPath: "assets/wyrms/dragon.png", cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wyrms/end_game_flag.png", cb: addToSum),
          ScoreCounter(iconPath: "assets/wyrms/egg.png", cb: addToSum),
          ScoreCounter(iconPath: "assets/wyrms/resource.png", cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_6_tucked.png",
              cb: addToSum),
          ScoreCounter(
              iconPath: "assets/wings/EndGameSlider_3_goals.png", cb: addToSum),
          ScoreCounter(iconPath: "assets/wyrms/combo.png", cb: addToSum),
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
