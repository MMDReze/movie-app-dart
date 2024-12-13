import 'package:flutter/material.dart';
import 'movie_detail_page.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl; // لینک عکس
  final String title; // عنوان فیلم
  final String description; // توضیحات فیلم

  const MovieCard({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // هنگام کلیک، به صفحه جزئیات فیلم برویم
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(
              imageUrl: imageUrl,
              title: title,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        width: 150, // عرض کارت
        margin: const EdgeInsets.only(right: 10), // فاصله بین کارت‌ها
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // گرد کردن گوشه‌ها
              child: Image.network(
                imageUrl,
                height: 200,
                width: 150,
                fit: BoxFit.cover, // اندازه کامل عکس
              ),
            ),
            const SizedBox(height: 8), // فاصله بین عکس و متن
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // متن طولانی را قطع کن
            ),
          ],
        ),
      ),
    );
  }
}
