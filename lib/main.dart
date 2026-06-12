import 'package:easy_vet/core/di/dependency_injection.dart';
import 'package:easy_vet/features/auth/presentation/login_page.dart';
import 'package:easy_vet/features/auth/presentation/login_view_model.dart';
import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:easy_vet/features/main/presentation/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<HomeViewModel>()),
        BlocProvider(create: (context) => getIt<LoginViewModel>()),
        ChangeNotifierProvider(create: (context) => getIt<CartViewModel>()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage());
  }
}
