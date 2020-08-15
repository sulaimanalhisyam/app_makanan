import 'package:aplikasi_makanan/DetailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Makanan'),
      ),
      body: _PageList(),
    );
  }
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');

final bigHeaderTextStyle =
    baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);

final descTextStyle =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);

final footerTextStyle =
    baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);

class _PageList extends StatefulWidget {
  @override
  __PageListState createState() => __PageListState();
}

class __PageListState extends State<_PageList> {
  List<String> judul = ['Ikan Goreng', 'Kue Es Skirm', 'Nasi Bakar'];
  List<String> subjudul = [
    'makanan enak yang di goreng',
    'makanan enak saat cuaca sedang panas',
    'makanan enak yang di bakar'
  ];
  List<String> gambar = [
    'assets/image/kangoreng.jpg',
    'assets/image/kueeskrim.jpg',
    'assets/image/nasibakar.jpg'
  ];
  List<String> jumlah = [
    '∞ (unlimitid) pcs',
    '∞ (unlimitid) pcs',
    '∞ (unlimitid) pcs'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: judul.length,
          itemBuilder: (BuildContext contex, int index) {
            final title = judul[index].toString();
            final subtitle = subjudul[index].toString();
            final julah = jumlah[index].toString();
            final img = gambar[index].toString();
            return Container(
              height: 200.0,
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      backgroundImage(img),
                      Container(
                        child: topContent(title, subtitle, julah),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                itemJudul: title,
                                itemSub: subtitle,
                                qty: julah,
                                itemImage: img)));
                  }),
            );
          }),
    );
  }

  backgroundImage(String Gambar) {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.luminosity),
              image: AssetImage(Gambar))),
    );
  }

  topContent(String Nama, String Dekripsi, String Stock) {
    return new Container(
      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            Nama,
            style: bigHeaderTextStyle,
          ),
          Text(
            Dekripsi,
            style: descTextStyle,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.redAccent,
          ),
          Text(
            Stock,
            style: footerTextStyle,
          )
        ],
      ),
    );
  }
}
