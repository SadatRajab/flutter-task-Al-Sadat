import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_taske/View/filter_view.dart';
import 'package:shope_taske/View/home_view.dart';
import 'package:shope_taske/View/profil_veiw.dart';
import 'package:shope_taske/core/cubit/change-color.dart';
import 'package:shope_taske/core/cubit/fliter_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Changecolor>(create: (_) => Changecolor()),
        BlocProvider<RoomChipCubit>(create: (_) => RoomChipCubit()),
        BlocProvider<TypeChipCubit>(create: (_) => TypeChipCubit()),
        BlocProvider<PaymentChipCubit>(create: (_) => PaymentChipCubit()),
        BlocProvider<StatusChipCubit>(create: (_) => StatusChipCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeView(),
          '/filter': (context) => FilterView(),
          '/profil': (context) => ProfilVeiw(),
        },
      ),
    );
  }
}
