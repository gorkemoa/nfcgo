import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/welcome_viewmodel.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeViewModel(),
      child: Consumer<WelcomeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Group 8698.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Beyaz container
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(left: 50, right: 150, top: 15, bottom: 15),
                            child: const Text(
                              'Farklı bir deneyime\nhazırmısınız ?',
                              style: TextStyle(
                                color: Color(0xFF78BE20),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        
                        // Yeşil ok buton (sağ üst çaprazda)
                        Positioned(
                          right: 25,
                          top: -15,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Login ekranına yönlendirme işlemi burada yapılacak
                                viewModel.navigateToLogin();
                                viewModel.navigateToLoginScreen(context);
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Ink(
                                width: 75,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF78BE20),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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