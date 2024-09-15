import "package:contact_form_app/View/add_contact_page.dart";
import "package:contact_form_app/View/home_Page.dart";
import "package:contact_form_app/View/splash_page.dart";
import "package:contact_form_app/utils/utils.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print('Firebase initialized successfully');
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contact App",
      theme: ThemeData(
        colorSchemeSeed: kAppColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kAppColor,
          centerTitle: true,
        ),
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      // home: const HomePage(),
      initialRoute: SplashPage.splashPage,
      routes: {
        "/HomePage": (context) => const HomePage(),
        "/splashPage": (context) => const SplashPage(),
        "/AddContactPage": (context) => AddContactPage(),
      },
    );
  }
}
