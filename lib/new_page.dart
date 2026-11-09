import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final bool isRed; // متغير عشان استقبل اللون من الصفحة السابقة
  
  const NewPage({super.key, required this.isRed});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  // تحكم في النص المكتوب من المستخدم 
  TextEditingController textEditingController = TextEditingController();
  
  // النص الضاهر ف الشاشة
  String displayText = "cool for now";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // اللون المرسل من الصفحة الي قبل 
      backgroundColor: widget.isRed ? Colors.red : Colors.white, 
      
      appBar: AppBar(
        title: const Text('New Page'),
        automaticallyImplyLeading: false, // سهم العودة
        actions: [
          // زر عودة مثل الموجود في الفديو
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // رجوع للصفحة السابقة
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // مسافة بين العناصر
        child: Column(
          children: [
            // ادخال النص 
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: "اكتب شيئاً هنا...",
              ),
            ),
            const SizedBox(height: 20),
            
            // تحديث النص من المستخدم 
            Text(
              displayText,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // زرار التحديث
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // اضافة النص في متغير لعرضه
                  displayText = textEditingController.text; 
                });
              },
              child: const Text('تحديث النص'),
            ),
          ],
        ),
      ),
    );
  }
}