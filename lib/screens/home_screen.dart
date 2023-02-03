import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive/constants/color_palette.dart';
import 'package:flutter_facebook_responsive/constants/dimension.dart';
import 'package:flutter_facebook_responsive/data/data.dart';
import 'package:flutter_facebook_responsive/widgets/profile_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _trackingScrollController,
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Facebook',
              style: TextStyle(
                color: ColorPalette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              _Circle_Button(
                icon: Icons.search,
                onPressed: () => print('Search'),
                iconSize: 30.0,
              ),
              const SizedBox(width: kDefaultPadding),
              _Circle_Button(
                icon: Icons.message_rounded,
                onPressed: () => print('Message'),
                iconSize: 30.0,
              ),
            ]),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.fromLTRB(
                kDefaultPadding, 8.0, 12.0, kDefaultPadding),
            color: Colors.white,
            child: Row(
              children: [
                ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                  hasBorder: false,
                ),
                const SizedBox(width: 8.0),
                // const Expanded(
                //   child: TextField(
                //     decoration: InputDecoration.collapsed(
                //       hintText: 'What\'s on your mind?',
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Circle_Button extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;

  const _Circle_Button({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.grey[200]),
        child: IconButton(
          onPressed: onPressed(),
          icon: Icon(icon),
          iconSize: iconSize,
        ));

    // return const IconButton(onPressed: null, icon: Icon(Icons.search));
  }
}
