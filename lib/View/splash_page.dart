import 'package:contact_form_app/View/home_page.dart';
import 'package:contact_form_app/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const splashPage = "/splashPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.perm_contact_cal_rounded,
              color: Colors.white,
              size: 150,
            ),
            const Text(
              "Contact Book",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomePage.homePage);
                },
                child: const Text(
                  "Lets get Started",
                ))
          ],
        ),
      ),
    );
  }
}
