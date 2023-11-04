import 'package:flutter/material.dart';
import 'package:task1_app/constants/colors.dart';
import 'package:task1_app/screens/postsScreen.dart';
import 'package:task1_app/screens/profileScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            leading: _showIconButton(const Icon(Icons.menu_rounded), () {}),
            title: Text(
              "Lorem Ipsum",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [_showIconButton(const Icon(Icons.search_rounded), () {})],
            bottom: const TabBar(
              tabs: [Tab(text: "ALL POSTS"), Tab(text: "PROFILE")],
            )),
        body: const TabBarView(
          children: [PostPage(), ProfilePage()],
        ),
      ),
    );
  }

  Widget _showIconButton(Icon icon, void Function()? onpresed) {
    return IconButton(
      splashColor: transparent,
      highlightColor: transparent,
      onPressed: onpresed,
      icon: icon,
      iconSize: 24,
      color: white,
    );
  }
}
