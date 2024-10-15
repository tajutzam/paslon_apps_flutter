import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paslon_apps/components/candidate_home.dart';
import 'package:paslon_apps/components/news.dart';
import '../controller/search_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final SearchGetController _searchController = Get.put(SearchGetController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            _searchController.searchQuery.value = value;
          },
          decoration: InputDecoration(
            hintText: _tabController.index == 0
                ? 'Cari Berita...'
                : 'Cari Kandidat...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon: const Icon(Icons.search, color: Colors.blue),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/images/logo.svg',
            height: 50,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(50.0), // Increased height for search bar
          child: Column(
            children: [
              TabBar(
                controller: _tabController, // Use the TabController here
                tabs: [
                  Tab(text: 'Berita'), // First tab
                  Tab(text: 'Kandidat'), // Second tab
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Use the TabController here
        children: [
          NewsHome(), // Content for the first tab
          Center(child: CandidateHome()),
        ],
      ),
    );
  }
}
