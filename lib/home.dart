import 'package:flutter/material.dart';
import 'package:kuisif_g/deskripsi.dart';
import 'package:kuisif_g/login.dart';
import 'package:kuisif_g/profile.dart';

class NewsModel {
  final String id;
  final String title;
  final String image;
  final String description;
  int likes;

  NewsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    this.likes = 0,
  });
}

class Home extends StatefulWidget {
  final String username;
  const Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsModel> dummyNews = [
    NewsModel(
      id: '1',
      title: 'SpaceX Meluncurkan Roket Terbaru',
      image: 'https://picsum.photos/800/400',
      description:
          'SpaceX berhasil meluncurkan roket terbarunya dengan misi membawa satelit komunikasi ke orbit bumi. Peluncuran ini menandai pencapaian baru dalam eksplorasi ruang angkasa.',
      likes: 150,
    ),
    NewsModel(
      id: '2',
      title: 'Penemuan Teknologi AI Terbaru',
      image: 'https://picsum.photos/800/401',
      description:
          'Para peneliti mengembangkan sistem AI yang dapat memahami dan merespons emosi manusia dengan lebih akurat. Terobosan ini membuka peluang baru dalam interaksi manusia-komputer.',
      likes: 230,
    ),
    NewsModel(
      id: '3',
      title: 'Inovasi Energi Terbarukan',
      image: 'https://picsum.photos/800/402',
      description:
          'Sebuah perusahaan startup berhasil mengembangkan panel surya dengan efisiensi 50% lebih tinggi dari teknologi yang ada saat ini.',
      likes: 180,
    ),
    NewsModel(
      id: '4',
      title: 'Perkembangan Vaksin COVID-19',
      image: 'https://picsum.photos/800/403',
      description:
          'Tim peneliti internasional mengumumkan keberhasilan uji klinis tahap akhir vaksin COVID-19 generasi baru yang lebih efektif terhadap varian baru.',
      likes: 320,
    ),
    NewsModel(
      id: '5',
      title: 'Penemuan Spesies Baru',
      image: 'https://picsum.photos/800/404',
      description:
          'Para ilmuwan menemukan spesies katak baru di hutan Amazon yang memiliki kemampuan bioluminesensi unik.',
      likes: 90,
    ),
    NewsModel(
      id: '6',
      title: 'Terobosan dalam Pengobatan Kanker',
      image: 'https://picsum.photos/800/405',
      description:
          'Penelitian terbaru menunjukkan hasil menjanjikan dalam penggunaan terapi gen untuk mengobati berbagai jenis kanker.',
      likes: 275,
    ),
    NewsModel(
      id: '7',
      title: 'Perkembangan Mobil Listrik',
      image: 'https://picsum.photos/800/406',
      description:
          'Produsen mobil listrik mengumumkan teknologi baterai baru yang dapat diisi ulang dalam waktu 5 menit.',
      likes: 200,
    ),
    NewsModel(
      id: '8',
      title: 'Ekspedisi ke Mars',
      image: 'https://picsum.photos/800/407',
      description:
          'NASA mengungkapkan rencana detail untuk misi berawak pertama ke Mars yang dijadwalkan dalam dekade ini.',
      likes: 450,
    ),
    NewsModel(
      id: '9',
      title: 'Revolusi Quantum Computing',
      image: 'https://picsum.photos/800/408',
      description:
          'Perusahaan teknologi mengumumkan keberhasilan dalam mengembangkan komputer quantum dengan 1000 qubit.',
      likes: 180,
    ),
    NewsModel(
      id: '10',
      title: 'Penemuan Arkeologi Terbaru',
      image: 'https://picsum.photos/800/409',
      description:
          'Tim arkeolog menemukan kota kuno yang hilang di Amerika Selatan, memberikan wawasan baru tentang peradaban pra-Inka.',
      likes: 135,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('News App', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(username: widget.username),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dummyNews.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    dummyNews[index].image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    dummyNews[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    dummyNews[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Deskripsi(
                                description: dummyNews[index].description,
                                image: dummyNews[index].image,
                                like: dummyNews[index].likes,
                                title: '',
                              ),
                        ),
                      );
                    },
                    child: Text(
                      "Detail",
                      style: TextStyle(color: Colors.white),
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
