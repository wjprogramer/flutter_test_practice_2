import 'package:flutter/material.dart';
import 'package:flutter_test_practice_2/models/favorites.dart';
import 'package:flutter_test_practice_2/screens/favorites.dart';
import 'package:flutter_test_practice_2/screens/home.dart';
import 'package:provider/provider.dart';

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
