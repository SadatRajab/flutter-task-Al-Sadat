import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double currentPrice;
  final double? oldPrice;
  final String salesCount;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onAddToCartPressed;
  final bool isVerified;

  const ProductCard({
    super.key,
    required this.imagePath,
    this.productName = 'جاكيت من الصوف مناسب',
    this.currentPrice = 32000000,
    this.oldPrice = 60000000,
    this.salesCount = '+3.3k تم بيع',
    this.isFavorite = false,
    this.onFavoritePressed,
    this.onAddToCartPressed,
    this.isVerified = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Product Image
            Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            // Product Name Row
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icon/Vector.svg',
                    width: 25,
                    height: 22,
                  ),
                  SizedBox(
                    width: 129,
                    child: Text(
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      productName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Tajawal-bold',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Price Row
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: onFavoritePressed,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 129,
                    child: RichText(
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${_formatPrice(currentPrice)}جم',
                            style: const TextStyle(
                              color: Color(0xffFF4144),
                              fontSize: 15,
                              fontFamily: 'Tajawal-bold',
                            ),
                          ),
                          if (oldPrice != null) ...[
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: _formatPrice(oldPrice!),
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey.shade700,
                                decorationThickness: 2,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Sales Count Row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  salesCount,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                    fontFamily: 'Tajawal-medium',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.local_fire_department_outlined,
                    size: 19,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            // Bottom Action Row
            Padding(
              padding: const EdgeInsets.only(right: 7.0, left: 7.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/image/logo.png',
                        width: 30,
                        height: 32,
                      ),
                      GestureDetector(
                        onTap: onAddToCartPressed,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          width: 50,
                          height: 30,
                          child: const Icon(
                            Icons.add_shopping_cart,
                            size: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isVerified)
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xffeaf3fe),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.corporate_fare_sharp,
                            color: Colors.blue,
                            size: 22,
                          ),
                        ),
                        const Positioned(
                          right: 0,
                          top: 0,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}م';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(0)}ك';
    }
    return price.toStringAsFixed(0);
  }
}