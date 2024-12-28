import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteir_assig/screens/detail_screen.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/product_card.dart';
import 'audio_player_screen.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = ""; // Search query state
  int _currentIndex = 0; // Bottom navigation bar index

  final List<Widget> _screens = []; // Screens for the bottom navigation bar

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      _buildHomeScreen(), // Home Screen Content
      AudioPlayerScreen(), // Audio Player Screen
      FormScreen(), // Form Screen
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(
          "Explore Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: _currentIndex == 0
            ? PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value.toLowerCase();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search products...",
                        prefixIcon: Icon(Icons.search, color: Colors.teal),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: Container(
        color: Colors.grey[100],
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 5.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: "Audio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: "Form",
          ),
        ],
      ),
    );
  }

  // Method to build the Home screen content
  Widget _buildHomeScreen() {
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state is HomeLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        );
      } else if (state is HomeLoaded) {
        final filteredProducts = state.products.where((product) {
          return product.title.toLowerCase().contains(_searchQuery);
        }).toList();

        // Replace GridView.builder with ListView.builder
        return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(product: product),
                  ),
                );
              },
              child: ProductCard(product: product),
            );
          },
        );
      } else if (state is HomeError) {
        return Center(
          child: Text(
            state.message,
            style: TextStyle(color: Colors.redAccent, fontSize: 16),
          ),
        );
      }
      return Center(
        child: Text(
          "Start Fetching!",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    },
  );
}

}
