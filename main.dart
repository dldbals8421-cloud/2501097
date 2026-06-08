// 코드 작성에 chatGPT를 참고함.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '전역까지',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const DdayScreen(),
    );
  }
}

class DdayScreen extends StatelessWidget {
  const DdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dischargeDate = DateTime(2027, 7, 25);
    int dday = dischargeDate.difference(DateTime.now()).inDays + 1;

    final messages = ['화이팅', '아자아자', '힘내'];

    String message = messages[DateTime.now().day % messages.length];

    DateTime enlistDate = DateTime(2026, 1, 26);

    int totalDays = dischargeDate.difference(enlistDate).inDays;
    int passedDays = DateTime.now().difference(enlistDate).inDays;

    double percent = (passedDays / totalDays) * 100;

    return Scaffold(
      appBar: AppBar(title: const Text(''), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/soldier.jpg', height: 180),

              const SizedBox(height: 20),

              Text(
                'D-$dday',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text('$dday일 남았습니다', style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 20),

              const Text('전역 예정일', style: TextStyle(fontSize: 18)),

              const Text(
                '2027.07.25',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Text(
                ' ${percent.toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              LinearProgressIndicator(value: percent / 100),

              const SizedBox(height: 30),

              Text(
                message,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              const Text(
                '오늘의 편지',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: '오늘의 편지를 작성해보세요...',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(onPressed: () {}, child: const Text('편지 저장')),
            ],
          ),
        ),
      ),
    );
  }
}
