import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'commons/theme.dart';
import 'pages/homepage.dart';

void main() => runApp(EasyProConceptApp());

class EasyProConceptApp extends StatefulWidget {
  @override
  _EasyProAppState createState() => _EasyProAppState();
}

class _EasyProAppState extends State<EasyProConceptApp>
    with TickerProviderStateMixin {
  TabController _controller;
  final List<Widget> tabBarScreens = [
    HomeScreen(),
    Container(color: Colors.lightBlueAccent),
    Container(color: Colors.lightBlue),
    Container(color: Colors.blue),
    Container(color: Colors.blueAccent),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        initialIndex: 0, length: tabBarScreens.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withAlpha(50),
        statusBarIconBrightness: Brightness.light));
    final themeData = EasyProThemeProvider.get();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyPro',
      theme: themeData,
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        body: TabBarView(
          controller: _controller,
          children: tabBarScreens,
          physics: NeverScrollableScrollPhysics(),
        ),
      /*  bottomNavigationBar: TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.transparent,
          isScrollable: false,
          /*tabs: [
            _buildTabIcon("img/tab_bar_home.svg", 0, themeData),
            _buildTabIcon("img/tab_bar_messages.svg", 1, themeData),
            _buildTabIcon("img/tab_bar_search.svg", 2, themeData),
            _buildTabIcon("img/tab_bar_notifications.svg", 3, themeData),
            _buildTabIcon("img/tab_bar_profile.svg", 4, themeData),
          ],*/
          onTap: (index) {
            setState(() {});
          },
        ),*/
      ),
    );
  }

  //Widget _buildTabIcon(String assetName, int index, ThemeData themeData) {
    //return Tab(
      /*icon: SvgPicture.asset(
        assetName,
        color: index == _controller.index
            ? themeData.accentColor
            : themeData.primaryColorLight,
      ),*/
//    );
//  }
}
