import 'package:flutter/material.dart';
import '../commons/theme.dart';
import '../commons/blur_icon.dart';
import 'BookScreen.dart'; 
import 'Fade_route.dart'; 
import '../commons/PageView.dart';
import 'Button_Slide.dart'; 
import 'package:page_indicator/page_indicator.dart'; 
import 'package:rect_getter/rect_getter.dart';

class DetailScreen extends StatefulWidget {
  final String heroTag;
  final String imageAsset;

  DetailScreen({
  this.heroTag,
  this.imageAsset,
  });

  @override
  _DetailScreenState createState() =>
      _DetailScreenState(heroTag: heroTag, imageAsset: imageAsset);
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  final String heroTag;
  final String imageAsset;
  final double bottomSheetCornerRadius = 50;

  final Duration animationDuration = Duration(milliseconds: 600);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;

 _DetailScreenState({
   this.heroTag,
    this.imageAsset,
  });

  static double bookButtonBottomOffset = -60;
  double bookButtonBottom = bookButtonBottomOffset;
 AnimationController _bottomSheetController;

  void _onTap() {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
     WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  Future <void> _goToNextPage() async {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: BookScreen()))
        .then((_) => setState(() {
         // var _rect;
        }));
  }

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    Future.delayed(Duration(milliseconds: 700)).then((v) {
      setState(() {
        bookButtonBottom = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = EasyProThemeProvider.get();
    final coverImageHeightCalc =
        MediaQuery.of(context).size.height / 2 + bottomSheetCornerRadius;
    var rectGetterKey2 = rectGetterKey;
    return WillPopScope(
      onWillPop: () async {
        if (_bottomSheetController.value <= 0.5) {
          setState(() {
            bookButtonBottom = bookButtonBottomOffset;
          });
        }
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(),
            Hero(
              createRectTween: ParallaxPageView.createRectTween,
              tag: heroTag,
              child: Container(
                height: coverImageHeightCalc,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: PageIndicatorContainer(
                      align: IndicatorAlign.bottom,
                      length: 3,
                      indicatorSpace: 12.0,
                      padding: EdgeInsets.only(bottom: 60),
                      indicatorColor: themeData.indicatorColor,
                      indicatorSelectorColor: Colors.white,
                      shape: IndicatorShape.circle(size: 8),
                      child: PageView(
                        children: <Widget>[
                          /*Image.asset(
                            imageAsset,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "../img/architetto_2.jpg", // <- stubbed data
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "../img/architetto_3.jpg", // <- stubbed data
                            fit: BoxFit.cover,
                          ),
*/                        ],
                      ),
                    )),
              ),
            ),
            Positioned(
              top: 46,
              right: 24,
              child: Hero(
                tag: "${heroTag}mail",
                child: BlurIcon(
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                    size: 15.2,
                  ), padding: EdgeInsets.all(0),
                ),
              ),
            ),
              Positioned(
              top: 46,
              left: 64,
              child: Hero(
                tag: "${heroTag}name",
                child: Text(
                  "$heroTag",
                 style: const TextStyle(
          fontSize: 30.0,
          
        ),
        textAlign: TextAlign.center,
      ),
                ),
                ),
              
            Positioned(
              top: 46,
              left: 24,
              child: Hero(
                tag: "${heroTag}homepage",
                child: GestureDetector(
                  onTap: () async {
                    await _bottomSheetController.animateTo(0,
                        duration: Duration(milliseconds: 150));
                    setState(() {
                      bookButtonBottom = bookButtonBottomOffset;
                    });
                    Navigator.pop(context);
                  },
                  child: BlurIcon(
                    icon: Icon(
                     Icons.home,
                      color: Colors.white,
                      size: 24,
                    ), padding: EdgeInsets.all(0),
                  ),
                ),
              ),
            ),
            SlidingBottomSheet(
              controller: _bottomSheetController,
              cornerRadius: bottomSheetCornerRadius,
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              curve: Interval(
                0,
                0.5,
                curve: Curves.easeInOut,
              ),
              bottom: bookButtonBottom,
              right: 0,
              child: RectGetter(
                key: rectGetterKey2,
                child: GestureDetector(
                  onTap: _onTap,
                  child: Container(
                    height: 60,
                    width: 172,
                    decoration: BoxDecoration(
                        color: themeData.accentColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50))),
                    child: Center(
                      child: Text(
                        "Prenota",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _ripple(themeData),
          ],
        ),
      ),
    );
  }

  Widget _ripple(ThemeData themeData) {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: themeData.accentColor,
        ),
      ),
    );
  }
}
