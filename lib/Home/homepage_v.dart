import 'package:todo/widgets/fullWidthButton.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorsLight.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 300),
            Column (
              children: [
                FullWidthButton(
                  buttonText: 'CONNEXION',
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  }
                ),
                const SizedBox(height: 50),
                FullWidthButton(
                    buttonText: 'INSCRIPTION',
                    backgroundColor: CustomColorsLight.orange,
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    }
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}