import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_taske/Widget/category_button.dart';
import 'package:shope_taske/Widget/category_item.dart';
import 'package:shope_taske/Widget/product_card.dart';
import 'package:shope_taske/core/cubit/change-color.dart';
import 'package:shope_taske/core/cubit/bottom_nav_cubit.dart';
import 'package:shope_taske/model/home_model.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/filter');
                },
                icon: Icon(Icons.arrow_back, color: Colors.grey, size: 35),
              ),
              Text(
                'الكل',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal-bold',
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'أستكشف العروض',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Tajawal-medium',
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: BlocBuilder<Changecolor, int>(
                builder: (context, selectedIndex) {
                  return SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryButton(
                          title: categories[index],
                          isSelected: selectedIndex == index,
                          onTap: () {
                            context.read<Changecolor>().changeIndex(index);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: categories_list.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      imagePath: categories_list[index].image,
                      title: categories_list[index].title,
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 50,
              width: 380,
              color: Color(0xfffef7f3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '! لأى عرض تطلبه دلوقتى ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Tajawal-medium',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          'شحن مجاني',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tajawal-medium',
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.check, color: Colors.green, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
              // Prodecut Carde
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.49,
                ),
                itemCount: produectImg.length,
                itemBuilder: (context, index) {
                  return ProductCard(imagePath: produectImg[index]);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, currentIndex) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(
                fontFamily: 'Tajawal-bold',
                fontSize: 15,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Tajawal-medium',
                fontSize: 14,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_outlined),
                  activeIcon: Icon(Icons.chat, color: Colors.blue),
                  label: 'محادثة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_outlined),
                  activeIcon: Icon(Icons.add_box, color: Colors.blue),
                  label: 'أضف إعلان',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dataset_outlined),
                  activeIcon: Icon(Icons.dataset_rounded, color: Colors.blue),
                  label: 'إعلاناتي',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  activeIcon: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.blue,
                  ),
                  label: 'حسابي',
                ),
              ],
              onTap: (index) {
                context.read<BottomNavCubit>().changeIndex(index);
                if (index == 4) {
                  Navigator.pushNamed(context, '/profil');
                }
              },
            );
          },
        ),
      ),
    );
  }
}
