import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsNewsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;

  const DetailsNewsScreen(
      {super.key,
      required this.title,
      required this.desc,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details News",
          style: TextStyle(color: Colors.deepPurple, fontSize: 24),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            // height: 100,
            // width: 100,
          ),
          Text(
            title,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            desc,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
