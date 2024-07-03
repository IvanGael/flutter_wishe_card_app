import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:wishe_card_app/models/card_item.dart';
import 'package:wishe_card_app/widgets/color_picker.dart';
import 'package:wishe_card_app/widgets/greeting_card.dart';

class GreetingCardScreen extends StatefulWidget {
  const GreetingCardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GreetingCardScreenState createState() => _GreetingCardScreenState();
}

class _GreetingCardScreenState extends State<GreetingCardScreen> {
  late Color selectedColor;
  List<CardItem> cards = [];

  Widget _cardItem(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 500,
          front: GreetingCard(
              wish: 'Merry Christmas',
              color: cards.isEmpty ? Colors.deepPurple[900]! : cards[index].selectedColor,
              assetAnimation: 'assets/animations/snow.riv'),
          back: GreetingCard(
              wish: 'Nativity Celebration',
              color: cards.isEmpty ? Colors.deepPurple[900]! : cards[index].selectedColor,
              assetAnimation: 'assets/animations/christmas4.riv'),
        ),
        ColorPicker(
          onSelectColor: (c) {
            setState(() {
              cards[index].selectedColor = c;
            });
          },
          direction: "row",
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.red[600]!;
  }

  @override
  Widget build(BuildContext context) {
    cards = [
      CardItem(widget: _cardItem(0), selectedColor: Colors.redAccent),
      CardItem(widget: _cardItem(1), selectedColor: Colors.deepPurple[900]!)
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Greeting cards',
          style: TextStyle(
              fontSize: 22, fontFamily: "Inter", fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 600,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    return cards[index].widget;
                  },
                  separatorBuilder: (_, __) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 10),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
