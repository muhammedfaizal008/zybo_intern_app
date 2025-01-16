import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zybo_intern_app/controller/favourite_screen_controller.dart';
import 'package:zybo_intern_app/controller/home_screen_controller.dart';
import 'package:zybo_intern_app/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final favouriteController = FavouriteScreenController();
  await favouriteController.initializeDatabase();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
 MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => HomeScreenController(),),
    ChangeNotifierProvider(create: (context) => FavouriteScreenController(),)
  ],
   child: MaterialApp(
          home: SplashScreen(),
        ),
 );
  }
}