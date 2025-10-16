import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_taske/core/cubit/selection_cubit.dart';
import 'package:shope_taske/model/sub_model.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final double price;
  final List<PlanFeature> features;
  final Color color;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
    this.color = const Color(0xff3B4CF2),
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlanSelectionCubit(),
      child: BlocBuilder<PlanSelectionCubit, bool>(
        builder: (context, isChecked) {
          return Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: isChecked ? color : Colors.grey.shade300,
                width: isChecked ? 2.5 : 1,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: color,
                            onChanged: (_) =>
                                context.read<PlanSelectionCubit>().toggle(),
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Tajawal-bold',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isChecked ? color : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${price.toStringAsFixed(0)} ج.م",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          fontFamily: 'Tajawal',
                          decoration: TextDecoration.underline,
                          decorationThickness: 3,
                          decorationColor: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  const Divider(),

                  ...features.map(
                    (f) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(f.icon, size: 30),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      f.text,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal-bold',
                                        fontWeight: f.highlight
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    if (f.badge != null) ...[
                                      const SizedBox(width: 6),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.green,
                                        child: Text(
                                          f.badge!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                if (f.note != null)
                                  Text(
                                    f.note!,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal-bold',
                                      fontSize: 15,
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
