import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
      child: Consumer<SplashViewModel>(
        builder: (context, viewModel, _) {
          // ViewModel'den bildirilen değişimleri dinle
          viewModel.addListener(() {
            // Bildirme geldiğinde ana ekrana yönlendir
            viewModel.navigateToHomeScreen(context);
          });
          
          return Scaffold(
            backgroundColor: const Color(0xFF649D0F),
            body: Center(
              child: Image.asset(
                'assets/Splash.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
} 