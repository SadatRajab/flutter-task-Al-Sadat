import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_taske/Widget/custom_filter_chip.dart';
import 'package:shope_taske/Widget/custom_header_row.dart';
import 'package:shope_taske/Widget/custom_text_field.dart';
import 'package:shope_taske/core/cubit/change-color.dart';
import 'package:shope_taske/core/cubit/fliter_cubit.dart';
import 'package:shope_taske/model/filter_model.dart';
import 'package:shope_taske/style/lable_content.dart';

class FilterView extends StatelessWidget {
  static const String routeName = '/filter';
  FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController minPriceController = TextEditingController();
    TextEditingController maxPriceController = TextEditingController();
    TextEditingController minMonthController = TextEditingController();
    TextEditingController maxMonthController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: TextButton(
          onPressed: () {
            context.read<RoomChipCubit>().reset();
            context.read<TypeChipCubit>().reset();
            context.read<PaymentChipCubit>().reset();
            context.read<StatusChipCubit>().reset();
            minPriceController.clear();
            maxPriceController.clear();
            minMonthController.clear();
            maxMonthController.clear();
          },
          child: Text(
            'رجوع للأفتراضي',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontFamily: 'Tajawal-bold',
            ),
          ),
        ),
        actions: [
          Text(
            'فلترة',
            style: TextStyle(
              fontFamily: 'Tajawal-bold',
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.black, size: 18),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),

      //------------body----------------
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LableContent(text: 'الفئة'),
              SizedBox(height: 6),
              CustomHeaderRow(
                mainText: 'تغيير',
                mainTextColor: Color(0xff3b4cf2),
                rightTitle: 'عقارات',
                rightSubtitle: "فلل للبيع",
                imagePath: 'assets/image/icon2.png',
              ),
              Divider(color: Colors.grey.shade300, thickness: 1, height: 24),
              SizedBox(height: 5),
              //------- Loction -------
              CustomHeaderRow(
                mainIcon: Icon(Icons.arrow_back_ios_rounded, size: 16),
                mainTextColor: Color(0xff3b4cf2),
                rightTitle: 'الموقع',
                rightSubtitle: 'مصر',
                icon: Icon(Icons.location_on_outlined),
              ),
              //------------------
              Divider(color: Colors.grey.shade300, thickness: 1, height: 24),
              LableContent(text: 'الأقساط الشهرية'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextField(
                    controller: minMonthController,
                    hintText: '',
                    onChanged: (val) {
                      context.read<Changecolor>().changeIndex(9);
                    },
                  ),
                  CustomTextField(
                    controller: maxMonthController,
                    hintText: '',
                    onChanged: (val) {
                      context.read<Changecolor>().changeIndex(1);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),

              SizedBox(height: 16),
              LableContent(text: 'عدد الغرف'),
              SizedBox(height: 8),
              BlocBuilder<RoomChipCubit, int>(
                builder: (context, selectedRoomIndex) {
                  return Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 6,
                    children: List.generate(
                      rooms.length,
                      (index) => CustomFilterChip(
                        label: rooms[index],
                        selected: selectedRoomIndex == index,
                        onTap: () {
                          context.read<RoomChipCubit>().selectRoom(index);
                        },
                      ),
                    ),
                  );
                },
              ),
              LableContent(text: 'النوع'),
              SizedBox(height: 8),
              BlocBuilder<TypeChipCubit, int>(
                builder: (context, selectedIndex) {
                  return Wrap(
                    alignment: WrapAlignment.end,

                    spacing: 8,
                    children: List.generate(
                      types.length,
                      (index) => CustomFilterChip(
                        label: types[index],
                        selected: selectedIndex == index,
                        onTap: () =>
                            context.read<TypeChipCubit>().select(index),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              LableContent(text: 'السعر'),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextField(
                    controller: maxPriceController,
                    hintText: 'اقصى سعر',
                    onChanged: (val) {
                      context.read<Changecolor>().changeIndex(9);
                    },
                  ),
                  CustomTextField(
                    controller: minPriceController,
                    hintText: 'اقل سعر',
                    onChanged: (val) {
                      context.read<Changecolor>().changeIndex(1);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              LableContent(text: 'طريقة الدفع'),
              SizedBox(height: 8),
              BlocBuilder<PaymentChipCubit, int>(
                builder: (context, selectedIndex) {
                  return Wrap(
                    alignment: WrapAlignment.end,

                    spacing: 8,
                    children: List.generate(
                      payments.length,
                      (index) => CustomFilterChip(
                        label: payments[index],
                        selected: selectedIndex == index,
                        onTap: () =>
                            context.read<PaymentChipCubit>().select(index),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              LableContent(text: 'حالة العقار'),
              SizedBox(height: 8),
              BlocBuilder<StatusChipCubit, int>(
                builder: (context, selectedIndex) {
                  return Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 8,
                    children: List.generate(
                      statuses.length,
                      (index) => CustomFilterChip(
                        label: statuses[index],
                        selected: selectedIndex == index,
                        onTap: () =>
                            context.read<StatusChipCubit>().select(index),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0079FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    context.read<Changecolor>().changeIndex(14);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'شاهد 10,000 نتيجة',
                    style: TextStyle(
                      fontFamily: 'Tajawal-bold',
                      fontSize: 16,
                      color: Colors.white,
                    ),
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
