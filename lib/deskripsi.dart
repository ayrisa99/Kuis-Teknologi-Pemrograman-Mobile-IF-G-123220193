import 'package:flutter/material.dart';

class Deskripsi extends StatefulWidget {
  final String title; // Judul berita
  final String image; // Gambar berita
  final String description; // Deskripsi berita
  final int like; // Jumlah like (seharusnya int, bukan double)

  const Deskripsi({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.like,
  });

  @override
  State<Deskripsi> createState() => _DeskripsiState();
}

class _DeskripsiState extends State<Deskripsi> {
  int likeCount = 0;

  @override
  void initState() {
    super.initState();
    likeCount = widget.like; // Inisialisasi jumlah like dari Home
  }

  void addLike() {
    setState(() {
      likeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Detail'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(widget.title, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text(widget.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up, color: Colors.green),
                      onPressed: addLike,
                    ),
                    Text(
                      '$likeCount Likes',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.green,
                //   ),
                //   onPressed: () => Navigator.pop(context),
                //   child: const Text(
                //     'Kembali',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
