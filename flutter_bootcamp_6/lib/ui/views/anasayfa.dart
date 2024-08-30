import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_6/data/entity/liste_amazon.dart';
import 'package:flutter_bootcamp_6/data/entity/liste_diziler.dart';
import 'package:flutter_bootcamp_6/data/entity/liste_filmler.dart';
import 'package:flutter_bootcamp_6/data/entity/liste_seslendirme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bootcamp_6/renkler.dart';

import '../../data/entity/liste_1.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<List<Liste1>> liste1Yukle() async {
    var resimlerListesi = <Liste1>[];
    var r1 = Liste1(resim: "friends.jpg");
    var r2 = Liste1(resim: "those_about.jpg");
    var r3 = Liste1(resim: "euphoria.jpg");
    var r4 = Liste1(resim: "fallout.png");
    var r5 = Liste1(resim: "celine_dion.jpg");
    var r6 = Liste1(resim: "aclik_oyunlari.jpg");

    resimlerListesi.add(r1);
    resimlerListesi.add(r2);
    resimlerListesi.add(r3);
    resimlerListesi.add(r4);
    resimlerListesi.add(r5);
    resimlerListesi.add(r6);
    return resimlerListesi;
  }

  Future<List<ListeSeslendirme>> listeSeslendirmeYukle() async {
    var resimlerListesi = <ListeSeslendirme>[];
    var r1 = ListeSeslendirme(resim: "the_boys.jpg");
    var r2 = ListeSeslendirme(resim: "those_2.jpg");
    var r3 = ListeSeslendirme(resim: "game_of.jpg");
    var r4 = ListeSeslendirme(resim: "guc_yuzukleri.jpg");

    resimlerListesi.add(r1);
    resimlerListesi.add(r2);
    resimlerListesi.add(r3);
    resimlerListesi.add(r4);
    return resimlerListesi;
  }

  Future<List<ListeFilmler>> listeFilmlerYukle() async {
    var resimlerListesi = <ListeFilmler>[];
    var r1 = ListeFilmler(resim: "after.jpeg");
    var r2 = ListeFilmler(resim: "savas_dairesi.jpg");
    var r3 = ListeFilmler(resim: "hizli_ofkeli.jpg");
    var r4 = ListeFilmler(resim: "sen_ihtimali.jpg");

    resimlerListesi.add(r1);
    resimlerListesi.add(r2);
    resimlerListesi.add(r3);
    resimlerListesi.add(r4);
    return resimlerListesi;
  }

  Future<List<ListeDiziler>> listeDizilerYukle() async {
    var resimlerListesi = <ListeDiziler>[];
    var r1 = ListeDiziler(resim: "gen_v.png");
    var r2 = ListeDiziler(resim: "the_mentalist.jpg");
    var r3 = ListeDiziler(resim: "scherlock.jpg");
    var r4 = ListeDiziler(resim: "reacher.jpeg");
    var r5 = ListeDiziler(resim: "batman.jpg");

    resimlerListesi.add(r1);
    resimlerListesi.add(r2);
    resimlerListesi.add(r3);
    resimlerListesi.add(r4);
    resimlerListesi.add(r5);
    return resimlerListesi;
  }

  Future<List<ListeAmazon>> listeAmazonYukle() async {
    var resimlerListesi = <ListeAmazon>[];
    var r1 = ListeAmazon(resim: "mirzapur.jpg");
    var r2 = ListeAmazon(resim: "kilometre.jpg");
    var r3 = ListeAmazon(resim: "beekeeper.jpg");
    var r4 = ListeAmazon(resim: "celine_dion.jpg");
    var r5 = ListeAmazon(resim: "rovesata.jpg");
    var r6 = ListeAmazon(resim: "casusum.jpg");

    resimlerListesi.add(r1);
    resimlerListesi.add(r2);
    resimlerListesi.add(r3);
    resimlerListesi.add(r4);
    resimlerListesi.add(r5);
    resimlerListesi.add(r6);
    return resimlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: logo,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Image.asset("resimler/prime_logo_1.png"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.connected_tv),
            ),
          ),
        ],
        backgroundColor: logo,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Filmler"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: butonRenk,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("TV dizileri"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: butonRenk,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 240,
                      child: FutureBuilder<List<Liste1>>(
                        future: liste1Yukle(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var resimlerListesi = snapshot.data!;
                            return PageView.builder(
                              controller: _pageController,
                              itemCount: resimlerListesi.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, indeks) {
                                var resim = resimlerListesi[indeks];
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset(
                                    "resimler/${resim.resim}",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: FutureBuilder<List<Liste1>>(
                          future: liste1Yukle(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SmoothPageIndicator(
                                controller: _pageController,
                                count: snapshot.data!.length,
                                effect: const WormEffect(
                                  activeDotColor: Colors.white,
                                  dotColor: Colors.grey,
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  spacing: 4,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0,left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Seslendirmeli TV dizileri ve filmler >",
                    style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 115,
                  child: FutureBuilder<List<ListeSeslendirme>>(
                    future: listeSeslendirmeYukle(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var resimlerListesi = snapshot.data!;
                        return ListView.builder(
                          itemCount: resimlerListesi.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,indeks){
                            var resim = resimlerListesi[indeks];
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                  child: Image.asset("resimler/${resim.resim}")),
                            );
                          },
                        );
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 23.0,left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Çok İzlenen Filmler >",
                    style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 115,
                  child: FutureBuilder<List<ListeFilmler>>(
                    future: listeFilmlerYukle(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var resimlerListesi = snapshot.data!;
                        return ListView.builder(
                          itemCount: resimlerListesi.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,indeks){
                            var resim = resimlerListesi[indeks];
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset("resimler/${resim.resim}")),
                            );
                          },
                        );
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 23.0,left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Çok İzlenen Diziler >",
                    style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 115,
                  child: FutureBuilder<List<ListeDiziler>>(
                    future: listeDizilerYukle(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var resimlerListesi = snapshot.data!;
                        return ListView.builder(
                          itemCount: resimlerListesi.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,indeks){
                            var resim = resimlerListesi[indeks];
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset("resimler/${resim.resim}")),
                            );
                          },
                        );
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 23.0,left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Amazon Orijinal ve Özel İçerikler >",
                    style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: FutureBuilder<List<ListeAmazon>>(
                    future: listeAmazonYukle(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var resimlerListesi = snapshot.data!;
                        return ListView.builder(
                          itemCount: resimlerListesi.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,indeks){
                            var resim = resimlerListesi[indeks];
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset("resimler/${resim.resim}")),
                            );
                          },
                        );
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomColor,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.file_download_outlined),label: "İndirilenler"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Bana Özel"),
        ],
      ),
    );
  }
}
