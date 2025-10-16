import 'package:flutter/material.dart';
import 'package:shope_taske/Widget/plan_card.dart';
import 'package:shope_taske/model/features_data_model.dart';

class ProfilVeiw extends StatelessWidget {
  static const String routeName = '/profil';
  const ProfilVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'أختر الباقات اللى تناسبك',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'Tajawal-bold',
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: 'Tajawal-medium',
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  PlanCard(
                    title: 'أساسية',
                    price: 3000,
                    features: featrureBasic,
                  ),
                  PlanCard(
                    title: "أكسترا",
                    price: 3000,
                    features: featureExtra,
                  ),
                  PlanCard(title: "بلس", price: 3000, features: featurePlus),
                  PlanCard(title: "سوبر", price: 3000, features: featureSuper),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15),
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffF7F7F7),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'باقات مخصصة للك',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Tajawal-medium',
                              ),
                            ),
                            Text(
                              'تواصل معنا لأختيار الباقة المناسبة لك',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                            Text(
                              'فريق المبيعات',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Color(0xff0079FE),
                                fontSize: 20,
                                fontFamily: 'Tajawal-bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0079FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: 23,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'التالي',
                        style: TextStyle(
                          fontFamily: 'Tajawal-bold',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
