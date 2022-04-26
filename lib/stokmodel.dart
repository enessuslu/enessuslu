// To parse this JSON data, do
//
//     final stok = stokFromJson(jsonString);


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

  final String stokKodu;
  final String stokAdi;
  final String grupKodu;
  final String grupIsim;
  final String kod1;
  final String olcuBirimi;
  final String bakiye;
  final String adBakiye;
  final String topCevrim;
  final String cevrim;
  final String bekleyenSiparis;
  final String bekSipAdet;
  final String satisaHazir;
  final String satHzrAdet;
  final String toptanFiyat;
  final String parakendeFiyat;
  final String sonFiat;
  final String toptanIsk;
  final String perakendeIsk;
  final String beklIeMiktar;
  final String beklIeAd;
  final String fabStokMik;
  final String fabStokAd;

  factory Stok.fromJson(Map<String, dynamic> json) => Stok(
    stokKodu: json["STOK_KODU"].toString(),
    stokAdi: json["STOK_ADI"].toString() ,
    grupKodu: json["GRUP_KODU"].toString() ,
    grupIsim: json["GRUP_ISIM"].toString() ,
    kod1: json["KOD_1"].toString(),
    olcuBirimi: json["OLCU_BIRIMI"].toString(),
    bakiye: json["BAKIYE"].toString(),
    adBakiye: json["AD_BAKIYE"].toString() ,
    topCevrim: json["TOP_CEVRIM"].toString(),
    cevrim: json["CEVRIM"].toString(),
    bekleyenSiparis: json["BEKLEYEN_SIPARIS"].toString(),
    bekSipAdet: json["BEK_SIP_ADET"].toString(),
    satisaHazir: json["SATISA_HAZIR"].toString(),
    satHzrAdet: json["SAT_HZR_ADET"].toString() ,
    toptanFiyat: json["TOPTAN_FIYAT"].toString(),
    parakendeFiyat: json["PARAKENDE_FIYAT"].toString(),
    sonFiat: json["SON_FIAT"].toString() ,
    toptanIsk: json["TOPTAN_ISK"].toString(),
    perakendeIsk: json["PERAKENDE_ISK"].toString(),
    beklIeMiktar: json["BEKL_IE_MIKTAR"].toString(),
    beklIeAd: json["BEKL_IE_AD"].toString(),
    fabStokMik: json["FAB_STOK_MIK"].toString(),
    fabStokAd: json["FAB_STOK_AD"].toString(),
  );


  Map<String, dynamic> toJson() => {
    "STOK_KODU": stokKodu,
    "STOK_ADI": stokAdi,
    "GRUP_KODU": grupKodu == null ? null : grupKodu,
    "GRUP_ISIM": grupIsim == null ? null : grupIsim,
    "KOD_1": kod1,
    "OLCU_BIRIMI":olcuBirimi,
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







