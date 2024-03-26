import 'package:flutter/material.dart';

class AnimatedListCard extends StatelessWidget {
  const AnimatedListCard({
    super.key,
    required this.space,
    required this.color,
    required this.onTap,
  });
  final Color color;
  final double space;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: Alignment(0, space),
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardScreen extends StatefulWidget {
  const CardScreen({
    super.key,
  });

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Stack(
        children: [
          for (int i = 0; i < animedtListCardModel.length; i++)
            AnimatedListCard(
              space: i == selectedIndex ? -1 : animedtListCardModel[i].space,
              color: animedtListCardModel[i].color,
              onTap: () {
                setState(() {
                  selectedIndex = i;
                });
              },
            )
        ],
      ),
    );
  }
}

class AnimatedListModel {
  Color color;
  double space;

  AnimatedListModel({
    required this.color,
    required this.space,
  });
}

List<AnimatedListModel> animedtListCardModel = [
  AnimatedListModel(color: Colors.orange, space: 0.2),
  AnimatedListModel(color: Colors.brown, space: 0.4),
  AnimatedListModel(color: Colors.purple.shade200, space: 0.6),
  AnimatedListModel(color: Colors.blue.shade50, space: 0.8),
];
