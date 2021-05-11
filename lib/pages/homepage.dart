import '../commons/theme.dart';
import 'package:flutter/material.dart';
import '../commons/data.dart';
import '../commons/PageView.dart';
import 'detail_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> { 
  final List<String> ProfessionistiCategories = StubData().ProfessionistiCategories;
  final List<ProfessionistaCard> Professionisti = StubData().Professionisti;
  final List<PromozioneCard> Promozioni = StubData().Promozioni;

  int ArticoliCorrelati = 0;

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
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            'Menu principale',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messaggi'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profilo'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Impostazioni'),
        ),
      ],
    ),
  ),
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
                          ArticoliCorrelati = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        height: double.infinity,
                        margin: EdgeInsets.only(
                            left: index == 0 ? 20 : 5, right: 5),
                        decoration: BoxDecoration(
                          color: index == ArticoliCorrelati
                              ? themeData.accentColor
                              : themeData.unselectedWidgetColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              ProfessionistiCategories[index],
                              style: TextStyle(
                                  color: index == ArticoliCorrelati
                                      ? Colors.white
                                      : themeData.accentColor),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: ProfessionistiCategories.length,
                ),
              ),
              const SizedBox(height: 10),
              ParallaxPageView(
                viewportFraction: 0.6,
                height: 360,
                data: Professionisti,
                onCardTap: (Professionisti) {
                  Navigator.of(context).push(
                    PageRouteBuilder<void>(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return AnimatedBuilder(
                            animation: animation,
                            builder: (BuildContext context, Widget child) {
                              return DetailScreen(
                                heroTag: "${Professionisti.cardTitle()}",
                                imageAsset: Professionisti.cardImageAsset(),
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
                data: Promozioni,
                onCardTap: (Professionisti) {
                  Navigator.of(context).push(
                    PageRouteBuilder<void>(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return AnimatedBuilder(
                            animation: animation,
                            builder: (BuildContext context, Widget child) {
                              return DetailScreen(
                                heroTag: "${Professionisti.cardTitle()}",
                                imageAsset: Professionisti.cardImageAsset(),
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
    ),
     );
}
}