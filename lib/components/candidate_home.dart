import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paslon_apps/pages/detail_campaign.dart';
import 'package:paslon_apps/pages/detail_candidate.dart';

class CandidateHome extends StatelessWidget {
  const CandidateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemBuilder: (context, index) => _buildCandidateCard(context),
        itemCount: 20,
      ),
    );
  }

  Widget _buildCandidateCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailCandidate());
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Candidate Profile Image and Name
              Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                      width: 80,
                      height: 80,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: SizedBox(
                          width: 40, // Adjust width and height as needed
                          height: 40,
                          child: const CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    'Dr. Handers, SPD',
                    style:
                        TextStyle(fontFamily: GoogleFonts.poppins.toString()),
                  )),
                  IconButton(
                      onPressed: () {
                        Get.to(() => DetailCandidate());
                      },
                      icon: Icon(Icons.info))
                ],
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 200, // Height of the horizontal list
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCampaignCard(
                        'Kampanye 1',
                        'Deskripsi untuk Kampanye 1',
                        'https://picsum.photos/200/300'),
                    _buildCampaignCard(
                        'Kampanye 2',
                        'Deskripsi untuk Kampanye 2',
                        'https://picsum.photos/200/300'),
                    _buildCampaignCard(
                        'Kampanye 3',
                        'Deskripsi untuk Kampanye 3',
                        'https://picsum.photos/200/300'),
                    _buildCampaignCard(
                        'Kampanye 4',
                        'Deskripsi untuk Kampanye 4',
                        'https://picsum.photos/200/300'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCampaignCard(String title, String description, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const DetailCampaingn());
      },
      child: Card(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: 150, // Width of each campaign card
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campaign Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      width: 40, // Adjust width and height as needed
                      height: 40,
                      child: const CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: 80, // Fixed height for the image
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style:
                    GoogleFonts.poppins(color: Colors.grey[700], fontSize: 10),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
