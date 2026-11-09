import 'package:flutter/material.dart';
import 'new_page.dart'; // استدعاء الملف الي سويته

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // عشان اخفي كلمة Debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // متغير عشان اذا الخلفية حمراء ولا لا
  bool isRed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isRed ? Colors.red : Colors.white, // اغير الخلفية عشان المتغير
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'This is the title',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: const [
          Icon(Icons.wifi, color: Colors.white),
        ],
      ),
      body: SingleChildScrollView( // عشان الشاشة تقدر تمررها
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              //سحب صورة من النت
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShUZh24QYWSMISZ9eukfWws_9409uNH14mVn14XtAEtg&s=10', 
                height: 150,
              ),
              const SizedBox(height: 20),
              
              // اغير لون الخلفية 
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isRed = !isRed; // عكس من احمر و ابيض
                  });
                },
                child: const Text('Click me if you dare'),
              ),
              
              const SizedBox(height: 20),
              
              // زي الصفحة الجديدة 
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // عشان الصفحة الجديدة تكون نفس اللون
                      builder: (context) => NewPage(isRed: isRed), 
                    ),
                  );
                },
                child: const Text('Go to the next page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}