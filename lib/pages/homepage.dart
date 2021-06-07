import 'package:easyapp/pages/login_page.dart';
import '../commons/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../commons/data.dart';
import '../commons/PageView.dart';
import 'detail_screen.dart';
import 'package:easyapp/menu_button.dart';
import 'Contatti.dart';
import 'ProblemPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
} 
class _HomeScreenState extends State<HomeScreen> { 
  final List<String> professionistiCategories = StubData().ProfessionistiCategories;
  final List<ProfessionistaCard> professionisti = StubData().Professionisti;
  final List<PromozioneCard> promozioni = StubData().Promozioni;
Future<void> initializeFlutterFire() async {    try {
  await Firebase.initializeApp();      
  setState(() {        
  var  initialized = true;     
  });    
    } catch(e) {
              
    setState(() {        
  var error = true;      
      });    }  }

//FirebaseFirestore firestore = FirebaseFirestore.instance;
  int articoliCorrelati = 0;
//CollectionReference prof = FirebaseFirestore.instance.collection('professionisti');
 @override
  Widget build(BuildContext context) {
    final themeData = EasyProThemeProvider.get(); 
     return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF151026),
        title: Text('EasyPro'),
        /*title: Image.asset('../web/prova.png', fit: BoxFit.fitHeight),*/
      ),
  drawer: Drawer(
     child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                "Menu Principale",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
         MenuButton(
              primary: Colors.lightBlue,
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),);
              },
              text: "Accedi",
            ),
            MenuButton(
              primary: Colors.blueGrey,
              onPressed: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),);
              },
              text: "Impostazioni",
            ),
              MenuButton(
              primary: Colors.blueGrey,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProblemPage()),);
              },
              text: "Segnalaci un problema",
            ),
            MenuButton(
              primary: Colors.grey,
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => ContattiPage()),);
              },
              text: "Contatti",
            ),
      ],
    ),
  ),
  //body: FutureBuilder(
    //    future: prof.doc().get(),
      //  builder: (context, snapshot) {
        //  return snapshot.hasData
          //    ? Center(
            //      child: CircularProgressIndicator(),
              //  )
              body: ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 4.0),
                      color: themeData.highlightColor,
                      blurRadius: 24.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Cerca",
                        hintStyle:
                            TextStyle(color: themeData.hintColor, fontSize: 14),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 12),
                    Text("Ciao Andrea,",
                        style: themeData.textTheme.headline1),
                    const SizedBox(height: 16),
                    Text("Troviamo il professionista perfetto per te",
                        style: TextStyle(
                            fontSize: 10, color: themeData.primaryColorLight)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Professionisti",
                            style: TextStyle(
                                fontSize: 18,
                                color: themeData.primaryColorLight,
                                fontWeight: FontWeight.w600)),
                        Text("View all",
                            style: TextStyle(
                                fontSize: 12,
                                color: themeData.accentColor,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 32,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          articoliCorrelati = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        height: double.infinity,
                        margin: EdgeInsets.only(
                            left: index == 0 ? 20 : 5, right: 5),
                        decoration: BoxDecoration(
                          color: index == articoliCorrelati
                              ? themeData.accentColor
                              : themeData.unselectedWidgetColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              professionistiCategories[index],
                              style: TextStyle(
                                  color: index ==  articoliCorrelati
                                      ? Colors.white
                                      : themeData.accentColor),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: professionistiCategories.length,
                ),
              ),
              const SizedBox(height: 10),
              ParallaxPageView(
                viewportFraction: 0.6,
                height: 360,
                data: professionisti,
                onCardTap: (professionisti) {
                  Navigator.of(context).push(
                    PageRouteBuilder<void>(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return AnimatedBuilder(
                            animation: animation,
                            builder: (BuildContext context, Widget child) {
                              return DetailScreen(
                                heroTag: "${professionisti.cardTitle()}",
                              //  imageAsset: Professionisti.cardImageAsset(),
                              );
                            });
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Promozioni",
                        style: TextStyle(
                            fontSize: 24,
                            color: themeData.primaryColorLight,
                            fontWeight: FontWeight.w600)),
                    Text("View all",
                        style: TextStyle(
                            fontSize: 12,
                            color: themeData.accentColor,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              ParallaxPageView(
                viewportFraction: 0.8,
                height: 180,
                data: promozioni,
                onCardTap: (professionisti) {
                  Navigator.of(context).push(
                    PageRouteBuilder<void>(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return AnimatedBuilder(
                            animation: animation,
                            builder: (BuildContext context, Widget child) {
                              return DetailScreen(
                                heroTag: "${professionisti.cardTitle()}",
                               imageAsset: professionisti.cardImageAsset(),
                              );
                            });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
             // );

               //},
  ),
     );
}
}

class _initialized {
}