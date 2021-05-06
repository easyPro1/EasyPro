import 'package:flutter/material.dart';
import 'CardScorrevoli.dart';

class StubData {
  static final StubData _singleton = StubData._internal();

  factory StubData() {
    return _singleton;
  }

  StubData._internal();

  List<String> get ProfessionistiCategories =>
      ["All", "Popolari", "Top", "Promozioni", "30€-100€", "100€-200€"];

  List<ProfessionistaCard> get Professionisti => [
        ProfessionistaCard(
          title: "Hard Rock Hotel1",
          subTitle: "Central London",
          imageAsset: "../img/hotel_1.jpg",
        ),
        ProfessionistaCard(
          title: "Hard Rock Hotel2",
          subTitle: "Central London",
          imageAsset: "../img/hotel_2.jpg",
        ),
        ProfessionistaCard(
          title: "Hard Rock Hotel3",
          subTitle: "Central London",
          imageAsset: "../img/hotel_3.jpg",
        ),
        ProfessionistaCard(
          title: "Hard Rock Hotel4",
          subTitle: "Central London",
          imageAsset: "../img/hotel_4.jpg",
        ),
      ];

/*
      List<Widget> get facilities => [
        SvgPicture.asset(
          "img/ic_room_service_6.svg",
          fit: BoxFit.none,
        ),
        SvgPicture.asset(
          "img/ic_room_service_2.svg",
          fit: BoxFit.none,
        ),
        SvgPicture.asset(
          "img/ic_room_service_1.svg",
          fit: BoxFit.none,
        ),
        SvgPicture.asset(
          "img/ic_room_service_4.svg",
          fit: BoxFit.none,
        ),
        SvgPicture.asset(
          "img/ic_room_service_3.svg",
          fit: BoxFit.none,
        ),
        SvgPicture.asset(
          "img/ic_room_service_5.svg",
          fit: BoxFit.none,
        ),
      ];
}
*/

  List<PromozioneCard> get Promozioni => [
        PromozioneCard(
          title: "Ealing Blues Festival1",
          subTitle: "20 July",
          imageAsset: "../img/event_1.jpg",
        ),
        PromozioneCard(
          title: "Ealing Blues Festival2",
          subTitle: "21 July",
          imageAsset: "../img/event_2.jpg",
        ),
        PromozioneCard(
          title: "Ealing Blues Festival3",
          subTitle: "23 July",
          imageAsset: "../img/event_3.png",
        ),
        PromozioneCard(
          title: "Ealing Blues Festival4",
          subTitle: "24 July",
          imageAsset: "../img/event_4.png",
        ),
      ];

}

class ProfessionistaCard implements ISlidingCard {
  final String title;
  final String subTitle;
  final String imageAsset;

    ProfessionistaCard({
    this.title,
    this.subTitle,
    this.imageAsset,
  });

  @override
  String cardTitle() => title;

  @override
  String cardSubTitle() => subTitle;

  @override
  String cardImageAsset() => imageAsset;
}

class PromozioneCard implements ISlidingCard {
  final String title;
  final String subTitle;
  final String imageAsset;

  PromozioneCard({
    this.title,
    this.subTitle,
    this.imageAsset,
  });

  @override
  String cardTitle() => title;

  @override
  String cardSubTitle() => subTitle;

  @override
  String cardImageAsset() => imageAsset;
}
