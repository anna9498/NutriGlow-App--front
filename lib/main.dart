import 'package:flutter/material.dart';
import 'my_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriGlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header 卡片
              const HeaderCardWidget(),
              const SizedBox(height: 16),
              
              // 2. 搜尋框
              const SearchInputWidget(),
              const SizedBox(height: 20),

              // 3. 快速雙子按鈕 (AI 拍照辨識 & 我的清單)
              const QuickActionTrioWidget(),
              const SizedBox(height: 20),

              // 4. 餐點類別切換列
              const MealCategorySelectorWidget(),
              const SizedBox(height: 20),

              // 5. 已記錄的詳細資訊卡片 (茶葉蛋與營養素分解)
              const ActiveLogDetailCard(),
              const SizedBox(height: 20),

              // 6. 推薦標題
              const Text(
                '推薦',
                style: TextStyle(
                  color: Color(0xFF3B2F2F),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // 7. 推薦餐點清單項目
              const FoodRecommendationCard(
                imageUrl: 'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=100',
                title: '水煮蛋',
                subtitle: '1顆 · 72 kcal',
                tagText: '蛋白 6.3g',
                tagBgColor: Color(0xFFFFDDE3),
                tagTextColor: Color(0xFFD36B7E),
              ),
              const SizedBox(height: 12),
              const FoodRecommendationCard(
                imageUrl: 'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=100',
                title: '蒸地瓜',
                subtitle: '150g · 130 kcal',
                tagText: '碳水 30g',
                tagBgColor: Color(0xFFFFE8A4),
                tagTextColor: Color(0xFFB38F00),
              ),
              const SizedBox(height: 24),

              // 8. 底部「添加至記錄」按鈕
              const AddToLogButtonWidget(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}