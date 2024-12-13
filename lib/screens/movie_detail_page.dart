import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const MovieDetailPage({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1f2a),
      appBar: AppBar(
        backgroundColor: const Color(0xff242938),
        centerTitle: true,
        title: const Text(
          "Movie Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        // استفاده از Center برای مرکز کردن کل محتویات
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // مرکز کردن عمودی
            crossAxisAlignment: CrossAxisAlignment.center, // مرکز کردن افقی
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 300,
                  height: 450,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // متن عنوان در وسط
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center, // متن توضیحات در وسط
              ),
            ],
          ),
        ),
      ),
    );
  }
}
