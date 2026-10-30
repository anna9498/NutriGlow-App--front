import 'package:flutter/material.dart';

// 1. 搜尋框元件
class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFF3E8E2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Center(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.search,
                color: Color(0xFFA89890),
                size: 22,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            hintText: '搜尋...',
            hintStyle: TextStyle(
              color: Color(0xFFA89890),
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}

// 2. Header 卡片元件
class HeaderCardWidget extends StatelessWidget {
  const HeaderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDFD9).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFFFDFD9), Color(0xFFFFF0EC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.eco,
              color: Color(0xFF3B2F2F),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NutriGlow',
                style: TextStyle(
                  color: Color(0xFF3B2F2F),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'TODAY GLOW',
                style: TextStyle(
                  color: Color(0xFF756365),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.notifications_none_rounded,
            color: Color(0xFF3B2F2F),
            size: 26,
          ),
          const SizedBox(width: 16),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFFB6C1),
                width: 2,
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 3. 快速操作雙子按鈕 (AI 拍照辨識 & 我的清單)
class QuickActionTrioWidget extends StatelessWidget {
  const QuickActionTrioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 84,
            decoration: BoxDecoration(
              color: const Color(0xFFFFCCD5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xFFE27386),
                    size: 20,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'AI 拍照辨識',
                  style: TextStyle(
                    color: Color(0xFF4A3B32),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 84,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEAA7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.star,
                    color: Color(0xFFB8860B),
                    size: 20,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  '我的清單',
                  style: TextStyle(
                    color: Color(0xFF4A3B32),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 4. 餐點類別切換膠囊列 (支援點擊切換)
class MealCategorySelectorWidget extends StatefulWidget {
  const MealCategorySelectorWidget({super.key});

  @override
  State<MealCategorySelectorWidget> createState() => _MealCategorySelectorWidgetState();
}

class _MealCategorySelectorWidgetState extends State<MealCategorySelectorWidget> {
  String selectedCategory = '早餐';
  final List<String> categories = ['早餐', '午餐', '晚餐', '加餐'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          bool isSelected = (selectedCategory == category);
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFFFCCD5) : const Color(0xFFFAF4F0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected) ...[
                      const Icon(
                        Icons.check,
                        size: 14,
                        color: Color(0xFFE27386),
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? const Color(0xFFE27386) : const Color(0xFF7D6B60),
                        fontSize: 16,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// 5. 推薦餐點清單卡片 (支援點擊藍色勾勾)
class FoodRecommendationCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String tagText;
  final Color tagBgColor;
  final Color tagTextColor;

  const FoodRecommendationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.tagText,
    required this.tagBgColor,
    required this.tagTextColor,
  });

  @override
  State<FoodRecommendationCard> createState() => _FoodRecommendationCardState();
}

class _FoodRecommendationCardState extends State<FoodRecommendationCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF1069A6).withValues(alpha: 0.4) : const Color(0xFFF3E8E2),
          width: isSelected ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              widget.imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Color(0xFF3B2F2F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        color: Color(0xFF756365),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: widget.tagBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.tagText,
                        style: TextStyle(
                          color: widget.tagTextColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFA9D6F5) : const Color(0xFFD4EDDA),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSelected ? Icons.check : Icons.add,
                color: isSelected ? const Color(0xFF1069A6) : const Color(0xFF28a745),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 6. 底部「添加至記錄」按鈕元件
class AddToLogButtonWidget extends StatelessWidget {
  const AddToLogButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('已成功添加至飲食記錄！')),
        );
      },
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          color: const Color(0xFFC7F9CC),
          borderRadius: BorderRadius.circular(27),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Color(0xFF2E7C57),
              size: 22,
            ),
            SizedBox(width: 8),
            Text(
              '添加至記錄',
              style: TextStyle(
                color: Color(0xFF2E7C57),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 7. 已記錄餐點的詳細資訊卡片 (包含茶葉蛋主卡片與 4 個營養素膠囊)
class ActiveLogDetailCard extends StatelessWidget {
  const ActiveLogDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFF3E8E2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=100',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC7F9CC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            '元氣早餐',
                            style: TextStyle(
                              color: Color(0xFF2E7C57),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '茶葉蛋',
                      style: TextStyle(
                        color: Color(0xFF3B2F2F),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.favorite,
                color: Color(0xFFE27386),
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9F8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF3E8E2), width: 1),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '份量',
                  style: TextStyle(
                    color: Color(0xFF7D6B60),
                    fontSize: 15,
                  ),
                ),
                Text(
                  '53 g / 1',
                  style: TextStyle(
                    color: Color(0xFFE27386),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '即時熱量估算',
                style: TextStyle(
                  color: Color(0xFF7D6B60),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '75',
                    style: TextStyle(
                      color: Color(0xFF3B2F2F),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'kcal',
                    style: TextStyle(
                      color: Color(0xFFE27386),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: NutrientCapsuleWidget(
                  title: '蛋白質',
                  value: '8.2g',
                  percentage: '9%',
                  bgColor: Color(0xFFFFCCD5),
                  textColor: Color(0xFF8C3A48),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: NutrientCapsuleWidget(
                  title: '脂肪',
                  value: '4.6g',
                  percentage: '14%',
                  bgColor: Color(0xFFE2D4F0),
                  textColor: Color(0xFF5B3E75),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: NutrientCapsuleWidget(
                  title: '碳水',
                  value: '0.8g',
                  percentage: '1%',
                  bgColor: Color(0xFFFFEAA7),
                  textColor: Color(0xFF805E06),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: NutrientCapsuleWidget(
                  title: '纖維',
                  value: '0g',
                  percentage: '無纖',
                  bgColor: Color(0xFFC7F9CC),
                  textColor: Color(0xFF1F593E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 8. 獨立的營養素膠囊元件
class NutrientCapsuleWidget extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final Color bgColor;
  final Color textColor;

  const NutrientCapsuleWidget({
    super.key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            percentage,
            style: TextStyle(
              color: textColor.withValues(alpha: 0.8),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}