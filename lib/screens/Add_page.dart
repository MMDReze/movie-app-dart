import 'package:flutter/material.dart';
import 'dart:io';

class AddMoviePage extends StatefulWidget {
  @override
  _AddMoviePageState createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? _image; // متغیری برای ذخیره تصویر انتخابی

  final ImagePicker _picker = ImagePicker();

  // متد برای انتخاب تصویر

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Movie'),
        backgroundColor: Color(0xFF242938),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xFF1B1F2A), // رنگ پس‌زمینه کلی صفحه
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                style: TextStyle(
                  color: Colors.white, // رنگ متنی که کاربر تایپ می‌کند
                  fontSize: 16, // اندازه فونت متن
                ),
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'e.g. Inception',
                  labelStyle: TextStyle(color: Colors.grey), // رنگ لیبل
                  filled: true, // فعال کردن رنگ پس‌زمینه
                  fillColor:
                      const Color(0xFF242938), // رنگ پس‌زمینه داخل TextField
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                style: TextStyle(
                  color: Colors.white, // رنگ متنی که کاربر تایپ می‌کند
                  fontSize: 16, // اندازه فونت متن
                ),
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter movie description',
                  labelStyle: TextStyle(color: Colors.grey), // رنگ لیبل
                  filled: true, // فعال کردن رنگ پس‌زمینه
                  fillColor:
                      const Color(0xFF242938), // رنگ پس‌زمینه داخل TextField
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // GestureDetector(
              //   onTap: _pickImage, // فراخوانی متد بارگذاری تصویر
              //   child: Container(
              //     height: 150,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       border: Border.all(color: Colors.grey),
              //       borderRadius: BorderRadius.circular(8),
              //       color: Color(0xFF242938),
              //     ),
              //     child: Center(
              //       child: _image == null
              //           ? Text(
              //               'Click to Upload File',
              //               style: TextStyle(color: Colors.grey),
              //             )
              //           : Image.file(_image!,
              //               fit: BoxFit.cover), // نمایش تصویر بارگذاری شده
              //     ),
              //   ),
              // ),
              Spacer(),
              SizedBox(
                width: 75,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    // Action برای ذخیره یا ارسال داده‌ها
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagePicker {}
