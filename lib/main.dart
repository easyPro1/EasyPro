import 'error_page.dart';
import 'package:flutter/services.dart';
import 'commons/theme.dart';
import 'pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyProConceptApp());
}


class EasyProConceptApp extends StatefulWidget {
  @override
  _EasyProAppState createState() => _EasyProAppState();
}
class _EasyProAppState extends State<EasyProConceptApp>
    with TickerProviderStateMixin {
  TabController _controller;
  final List<Widget> tabBarScreens = [
    HomeScreen(),
  ];
  /*
  var storage = FirebaseStorage.instance;
  late List<AssetImage> listOfImage;
  bool clicked = false;
  List<String?> listOfStr = [];
  String? images;
  bool isLoading = false;
  */
  
  @override
  void initState() {
    super.initState();
    // getImages();
    _controller = TabController(
        initialIndex: 0, length: tabBarScreens.length, vsync: this);
  }

  /*
void getImages() {
  listOfImage = [];
  for (int i = 0; i < 6; i++) {
    listOfImage.add(
        AssetImage('assets/images/travelimage' + i.toString() + '.jpeg'));
  }
*/
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorPage();
        }

        if (snapshot.connectionState == ConnectionState.done) {
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

        return CircularProgressIndicator();
      },
    );
  }

}
