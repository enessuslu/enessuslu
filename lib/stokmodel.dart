// To parse this JSON data, do
//
//     final stok = stokFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Stok> stokFromJson(String str) => List<Stok>.from(json.decode(str).map((x) => Stok.fromJson(x)));

String stokToJson(List<Stok> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stok {
  Stok({
    required this.stokKodu,
    required this.stokAdi,
    required this.grupKodu,
    required this.grupIsim,
    required this.kod1,
    required this.olcuBirimi,
    required this.bakiye,
    required this.adBakiye,
    required this.topCevrim,
    required this.cevrim,
    required this.bekleyenSiparis,
    required this.bekSipAdet,
    required this.satisaHazir,
    required this.satHzrAdet,
    required this.toptanFiyat,
    required this.parakendeFiyat,
    required this.sonFiat,
    required this.toptanIsk,
    required this.perakendeIsk,
    required this.beklIeMiktar,
    required this.beklIeAd,
    required this.fabStokMik,
    required this.fabStokAd,
  });

  String stokKodu;
  String stokAdi;
  String grupKodu;
  String grupIsim;
  dynamic kod1;
  double olcuBirimi;
  double bakiye;
  double adBakiye;
  double topCevrim;
  double cevrim;
  double bekleyenSiparis;
  int bekSipAdet;
  double satisaHazir;
  double satHzrAdet;
  String toptanFiyat;
  String parakendeFiyat;
  double sonFiat;
  dynamic toptanIsk;
  dynamic perakendeIsk;
  int beklIeMiktar;
  int beklIeAd;
  double fabStokMik;
  double fabStokAd;

  factory Stok.fromJson(Map<String, dynamic> json) => Stok(
    stokKodu: json["STOK_KODU"],
    stokAdi: json["STOK_ADI"],
    grupKodu: json["GRUP_KODU"] == null ? null : json["GRUP_KODU"],
    grupIsim: json["GRUP_ISIM"] == null ? null : json["GRUP_ISIM"],
    kod1: json["KOD_1"],
    olcuBirimi:json["OLCU_BIRIMI"],
    bakiye: json["BAKIYE"].toDouble(),
    adBakiye: json["AD_BAKIYE"] == null ? null : json["AD_BAKIYE"].toDouble(),
    topCevrim: json["TOP_CEVRIM"].toDouble(),
    cevrim: json["CEVRIM"].toDouble(),
    bekleyenSiparis: json["BEKLEYEN_SIPARIS"].toDouble(),
    bekSipAdet: json["BEK_SIP_ADET"],
    satisaHazir: json["SATISA_HAZIR"].toDouble(),
    satHzrAdet: json["SAT_HZR_ADET"] == null ? null : json["SAT_HZR_ADET"].toDouble(),
    toptanFiyat: json["TOPTAN_FIYAT"],
    parakendeFiyat: json["PARAKENDE_FIYAT"],
    sonFiat: json["SON_FIAT"] == null ? null : json["SON_FIAT"].toDouble(),
    toptanIsk: json["TOPTAN_ISK"],
    perakendeIsk: json["PERAKENDE_ISK"],
    beklIeMiktar: json["BEKL_IE_MIKTAR"],
    beklIeAd: json["BEKL_IE_AD"],
    fabStokMik: json["FAB_STOK_MIK"].toDouble(),
    fabStokAd: json["FAB_STOK_AD"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "STOK_KODU": stokKodu,
    "STOK_ADI": stokAdi,
    "GRUP_KODU": grupKodu == null ? null : grupKodu,
    "GRUP_ISIM": grupIsim == null ? null : grupIsim,
    "KOD_1": kod1,
    "OLCU_BIRIMI":olcuBirimi == null ? null : olcuBirimi,
    "BAKIYE": bakiye,
    "AD_BAKIYE": adBakiye == null ? null : adBakiye,
    "TOP_CEVRIM": topCevrim,
    "CEVRIM": cevrim,
    "BEKLEYEN_SIPARIS": bekleyenSiparis,
    "BEK_SIP_ADET": bekSipAdet,
    "SATISA_HAZIR": satisaHazir,
    "SAT_HZR_ADET": satHzrAdet == null ? null : satHzrAdet,
    "TOPTAN_FIYAT": toptanFiyat,
    "PARAKENDE_FIYAT": parakendeFiyat,
    "SON_FIAT": sonFiat == null ? null : sonFiat,
    "TOPTAN_ISK": toptanIsk,
    "PERAKENDE_ISK": perakendeIsk,
    "BEKL_IE_MIKTAR": beklIeMiktar,
    "BEKL_IE_AD": beklIeAd,
    "FAB_STOK_MIK": fabStokMik,
    "FAB_STOK_AD": fabStokAd,
  };
}


