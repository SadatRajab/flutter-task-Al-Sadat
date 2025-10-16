import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_taske/Widget/category_button.dart';
import 'package:shope_taske/Widget/category_item.dart';
import 'package:shope_taske/Widget/product_card.dart';
import 'package:shope_taske/core/cubit/change-color.dart';
import 'package:shope_taske/core/cubit/bottom_nav_cubit.dart';
import 'package:shope_taske/core/database/db_helper.dart';
import 'package:shope_taske/model/category_model.dart';
import 'package:shope_taske/model/product_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<String> categories = ['كل العروض'];
  List<CategoryModel> categoriesList = [];
  List<Product> products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    try {
      // Load categories
      final categoriesData = await _dbHelper.getAllCategories();

      // If no data, insert dummy data
      if (categoriesData.isEmpty) {
        await _insertDummyData();
        final newCategoriesData = await _dbHelper.getAllCategories();
        final newProductsData = await _dbHelper.getAllProducts();

        setState(() {
          categoriesList = newCategoriesData
              .map((c) => CategoryModel.fromMap(c))
              .toList();
          products = newProductsData.map((p) => Product.fromMap(p)).toList();
          categories = ['كل العروض', ...categoriesList.map((c) => c.title)];
        });
      } else {
        final productsData = await _dbHelper.getAllProducts();
        setState(() {
          categoriesList = categoriesData
              .map((c) => CategoryModel.fromMap(c))
              .toList();
          products = productsData.map((p) => Product.fromMap(p)).toList();
          categories = ['كل العروض', ...categoriesList.map((c) => c.title)];
        });
      }
    } catch (e) {
      print('Error loading data: $e');
    }

    setState(() => _isLoading = false);
  }

  Future<void> _insertDummyData() async {
    // Insert categories
    final cat1Id = await _dbHelper.insertCategory(
      CategoryModel(
        title: 'ملابس',
        image: 'assets/image/Photo Container.png',
      ).toMap(),
    );

    final cat2Id = await _dbHelper.insertCategory(
      CategoryModel(
        title: 'اكسسوارات',
        image: 'assets/image/Photo Container (4).png',
      ).toMap(),
    );

    final cat3Id = await _dbHelper.insertCategory(
      CategoryModel(
        title: 'إلكترونيات',
        image: 'assets/image/Photo Container (1).png',
      ).toMap(),
    );

    // Insert products
    await _dbHelper.insertProduct(
      Product(
        name: 'جاكيت من الصوف مناسب',
        price: 32000000,
        oldPrice: 60000000,
        imagePath: 'assets/image/Picture (1).png',
        categoryId: cat1Id,
        salesCount: 3300,
      ).toMap(),
    );

    await _dbHelper.insertProduct(
      Product(
        name: 'جاكيت من الصوف مناسب',
        price: 32000000,
        oldPrice: 60000000,
        imagePath: 'assets/image/Picture (2).png',
        categoryId: cat1Id,
        salesCount: 3300,
      ).toMap(),
    );

    await _dbHelper.insertProduct(
      Product(
        name: 'جاكيت من الصوف مناسب',
        price: 32000000,
        oldPrice: 60000000,
        imagePath: 'assets/image/Picture.png',
        categoryId: cat2Id,
        salesCount: 3300,
      ).toMap(),
    );

    await _dbHelper.insertProduct(
      Product(
        name: 'جاكيت من الصوف مناسب',
        price: 32000000,
        oldPrice: 60000000,
        imagePath: 'assets/image/Picture (1).png',
        categoryId: cat3Id,
        salesCount: 3300,
      ).toMap(),
    );
  }

  Future<void> _toggleFavorite(Product product) async {
    final updatedProduct = product.copyWith(isFavorite: !product.isFavorite);
    await _dbHelper.updateProduct(product.id!, updatedProduct.toMap());
    await _loadData();
  }

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
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
              const Text(
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
          actions: const [
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
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // Category Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
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
                                  context.read<Changecolor>().changeIndex(
                                    index,
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  // Category Items
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: SizedBox(
                      height: 120,
                      child: categoriesList.isEmpty
                          ? const Center(child: Text('لا توجد فئات'))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              itemCount: categoriesList.length,
                              itemBuilder: (context, index) {
                                return CategoryItem(
                                  imagePath: categoriesList[index].image ?? '',
                                  title: categoriesList[index].title,
                                );
                              },
                            ),
                    ),
                  ),

                  // Free Shipping Banner
                  Container(
                    height: 50,
                    width: 380,
                    color: const Color(0xfffef7f3),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'لأى عرض تطلبه دلوقتى !',
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
                  ),

                  const SizedBox(height: 20),

                  // Products Grid
                  Expanded(
                    child: products.isEmpty
                        ? const Center(
                            child: Text(
                              'لا توجد منتجات',
                              style: TextStyle(
                                fontFamily: 'Tajawal-bold',
                                fontSize: 18,
                              ),
                            ),
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.49,
                                ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return ProductCard(
                                imagePath: product.imagePath,
                                productName: product.name,
                                currentPrice: product.price,
                                oldPrice: product.oldPrice,
                                salesCount: product.formattedSalesCount,
                                isFavorite: product.isFavorite,
                                onFavoritePressed: () =>
                                    _toggleFavorite(product),
                              );
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
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Tajawal-bold',
                fontSize: 15,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Tajawal-medium',
                fontSize: 14,
              ),
              items: const [
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
