import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zybo_intern_app/model/product_res_model.dart';
import 'package:zybo_intern_app/controller/favourite_screen_controller.dart';
import 'package:provider/provider.dart';

class HomeScreenController with ChangeNotifier {
  List<ProductResModel> products = [];
  bool isLoading = false;

  Future<void> getProducts() async {
    final url = Uri.parse("https://admin.kushinirestaurant.com/api/products/");
    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        products = productResModelFromJson(response.body);
        await _loadFavorites();  // Load the favorite state from SharedPreferences
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Toggle favorite and persist it using SQLite in FavouriteScreenController
  Future<void> toggleFavourite(int index, BuildContext context) async {
  final product = products[index];
  final previousState = product.inWishlist; // Store previous state

  // Toggle favorite
  product.inWishlist = !(product.inWishlist ?? false);

  // Notify listeners so the UI rebuilds
  notifyListeners();

  final favController = context.read<FavouriteScreenController>();

  if (product.inWishlist == true) {
    // Add to favourites
    await favController.addToFavourites({
      'id': product.id,
      'name': product.name,
      'imageUrl': product.featuredImage,
      'price': product.salePrice,
    });
  } else {
    // Remove from favourites
    await favController.removeFromFavourites(product.id!);
  }

  // If the previous state was different, notifyListeners
  if (previousState != product.inWishlist) {
    notifyListeners();
  }
}


  // Load the favorite state from SharedPreferences (optional)
  Future<void> _loadFavorites() async {
    // You can choose to load favorites from SharedPreferences as well, if needed.
    notifyListeners();
  }
}
