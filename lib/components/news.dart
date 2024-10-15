import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for popular news
    final List<Map<String, String>> popularNews = [
      {
        'title': 'Berita 1',
        'imageUrl': 'https://picsum.photos/200/500',
      },
      {
        'title': 'Berita 2',
        'imageUrl': 'https://picsum.photos/200/500',
      },
      {
        'title': 'Berita 3',
        'imageUrl': 'https://picsum.photos/200/500',
      },
      {
        'title': 'Berita 4',
        'imageUrl': 'https://picsum.photos/200/500',
      },
    ];

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        children: [
          Text(
            'Temukan Berita Terbaru seputar Tanggerang Selatan',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 10), // Add some spacing
          // Carousel for popular news
          Container(
            height: 200, // Set a height for the carousel
            child: FlutterCarousel(
              options: FlutterCarouselOptions(
                  height: 400,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  aspectRatio: 16 / 9,
                  floatingIndicator: false),
              items: popularNews.map((news) {
                return Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: news['imageUrl']!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10), // Add some spacing
          // Other content can go here
        ],
      ),
    );
  }
}
