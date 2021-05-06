import 'package:flutter/material.dart';
import '../commons/data.dart';
import '../commons/theme.dart';
import '../commons/PageView.dart';

class BottomSheetContent extends StatelessWidget {
  final AnimationController controller;

  BottomSheetContent({this.controller});

  @override
  Widget build(BuildContext context) {
    final themeData = EasyProThemeProvider.get();
    final double topPaddingMax = 44;
    final double topPaddingMin = MediaQuery.of(context).padding.top;
    double topMarginAnimatedValue = (1 - controller.value) * topPaddingMax * 2;
    double topMarginUpdatedValue = topMarginAnimatedValue <= topPaddingMin ? topPaddingMin : topMarginAnimatedValue;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      child: Padding(
        padding:  EdgeInsets.only(top: topMarginUpdatedValue),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "The Curtain Hotel",
                                style: TextStyle(
                                    color: themeData.primaryColorLight, fontSize: 24),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.desktop_mac,
                                      size: 15,
                                      color: themeData.disabledColor,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      "5.0",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: themeData.disabledColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                size: 20,
                                color: themeData.textTheme.headline3.color,
                              ),
                              const SizedBox(width: 5),
                              Text("Andrea Rossi"),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Text(
                            "DETAILS",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Dott.re in Architettura Università della Campania",
                            style: TextStyle(height: 1.4),
                          ),
                         /* const SizedBox(height: 20),
                          Text(
                            "FACILITIES",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: StubData().facilities,
                          ),
                       */
                          const SizedBox(height: 68),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
