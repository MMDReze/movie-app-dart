import 'package:flutter/material.dart';
import 'movie_card.dart';
import 'Add_page.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 2; // شاخص انتخاب‌شده برای ناوبری پایین

  // لیست فیلم‌ها
  final List<Map<String, String>> Discover = [
    {
      "imageUrl": "assets/Oppenheimer.jpg",
      "title": "Oppenheimer",
      "description": "A dramatization of the life story of J. Robert Oppenheimer, "
          "the physicist who had a large hand in the development of the atomic bombs "
          "that brought an end to World War II.",
    },
    {
      "imageUrl": "assets/Interstellar.jpg",
      "title": "Interstellar",
      "description": "When Earth becomes uninhabitable in the future, a farmer "
          "and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along "
          "with a team of researchers, to find a new planet for humans.",
    },
    {
      "imageUrl": "assets/Venum.jpg",
      "title": "Venum: Last Dance",
      "description": "Eddie Brock and Venom must make a devastating decision as "
          "they're pursued by a mysterious military man and alien monsters from "
          "Venom's home world.",
    },
    {
      "imageUrl": "assets/TheDarkKnight.jpg",
      "title": "The Dark Knight",
      "description": "When a menace known as the Joker wreaks havoc and chaos on "
          " the people of Gotham, Batman, James Gordon and Harvey Dent must work "
          " together to put an end to the madness.",
    },
  ];

  final List<Map<String, String>> actionMovies = [
    {
      "imageUrl": "assets/TheCrow.jpeg",
      "title": "The Crow",
      "description": "Soulmates Eric and Shelly are brutally murdered. Given a"
          "chance to save the love of his life, Eric must sacrifice himself and"
          "traverse the worlds of the living and the dead, seeking revenge."
    },
    {
      "imageUrl": "assets/JohnWick.jpg",
      "title": "John Wick",
      "description": "John Wick is a former hitman grieving the loss of his true"
          "love. When his home is broken into, robbed, and his dog killed, he is"
          "forced to return to action to exact revenge."
    },
    {
      "imageUrl": "assets/TheDarkKnight.jpg",
      "title": "The Dark Knight",
      "description": "When a menace known as the Joker wreaks havoc and chaos on"
          "the people of Gotham, Batman, James Gordon and Harvey Dent must work"
          "together to put an end to the madness."
    },
    {
      "imageUrl": "assets/Deadpool3.jpg",
      "title": "Deadpool 3",
      "description": "Deadpool is offered a place in the Marvel Cinematic Universe"
          "by the Time Variance Authority, but instead recruits a variant of Wolverine"
          "to save his universe from extinction."
    },
  ];

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    // تعریف صفحات در حالت اولیه
    _pages.addAll([
      Center(child: Text("Profile Page", style: TextStyle(fontSize: 20))),
      AddMoviePage(), // صفحه افزودن فیلم
      _buildHomePage(), // محتوای صفحه اصلی
    ]);
  }

  Widget buildActionSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان بخش "Action" به همراه دکمه "See All"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Action",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // اضافه کردن عملکرد برای "See All"
                  debugPrint("See All tapped");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xff0C38FB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // فاصله بین عنوان و لیست
          SizedBox(
            height: 250, // ارتفاع لیست افقی
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // اسکرول افقی
              itemCount: actionMovies.length, // تعداد فیلم‌ها
              itemBuilder: (context, index) {
                final movie = actionMovies[index];
                return MovieCard(
                  imageUrl: movie["imageUrl"]!,
                  title: movie["title"]!,
                  description: movie["description"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1f2a),
      appBar: AppBar(
        backgroundColor: const Color(0xff242938),
        centerTitle: true,
        title: const Text(
          "Movies",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Search tapped");
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: _pages[_selectedIndex], // نمایش صفحه مطابق شاخص
      bottomNavigationBar: _buildBottomNavigationBar(), // نوار ناوبری پایین
    );
  }

  // ویجت نوار ناوبری پایین
  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xff242938),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.person, "Profile", 0),
          _buildNavItem(Icons.add_circle_outline, "Add", 1),
          _buildNavItem(Icons.home_outlined, "Home", 2),
        ],
      ),
    );
  }

  // آیتم نوار ناوبری پایین
  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xff4A4458) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white70,
              size: 28,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // محتوای صفحه اصلی
  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discover",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Discover.length,
                itemBuilder: (context, index) {
                  final movie = Discover[index];
                  return MovieCard(
                    imageUrl: movie["imageUrl"]!,
                    title: movie["title"]!,
                    description: movie["description"]!,
                  );
                },
              ),
            ),
            buildActionSection(context)
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Homepage(),
    debugShowCheckedModeBanner: false,
  ));
}
