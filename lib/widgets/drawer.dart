import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Made with ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LikeButton(
            isLiked: true,
          ),
          Text(
            'by Chandrakant Sahu',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
