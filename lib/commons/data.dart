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
          title: "Mario Rossi",
          subTitle: "Architetto",
          imageAsset: "../img/architetto.jpg",
        ),
        ProfessionistaCard(
          title: "Giuseppe Orlando",
          subTitle: "Avvocato",
          imageAsset: "../img/avvocato.jpg",
        ),
        ProfessionistaCard(
          title: "Francesco Mondadori",
          subTitle: "Piastrellista",
          imageAsset: "../img/piastrellista.jpg",
        ),
        ProfessionistaCard(
          title: "Andrea Rossi",
          subTitle: "Video Maker",
          imageAsset: "../img/Videomaker.jpg",
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
          title: "Giuseppe Orlando",
          subTitle: "Sconto del 30% sulla prima consulenza",
          imageAsset: "../img/avvocato.jpg",
        ),
        PromozioneCard(
          title: "Giudo Piano",
          subTitle: "Piastrelle 20€ al metro",
          imageAsset: "../img/piastrellista_2.jpg",
        ),
        PromozioneCard(
          title: "Dario Lampa",
          subTitle: "Piano Energetico in sconto",
          imageAsset: "../img/elettricista.jpg",
        ),
        PromozioneCard(
          title: "Francesco Papa",
          subTitle: "Preghiere su misura",
          imageAsset: "../img/papa.jpg",
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
