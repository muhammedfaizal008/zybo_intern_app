import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zybo_intern_app/utils/color_constants.dart';
import 'package:zybo_intern_app/controller/favourite_screen_controller.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    final controller = context.read<FavouriteScreenController>();
    controller.initializeDatabase();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FavouriteScreenController>();

    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: GoogleFonts.oxygen(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: ColorConstants.darkBlue,
          ),
        ),
        backgroundColor: ColorConstants.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorConstants.darkBlue),
      ),
      body: controller.favourites.isEmpty
          ? Center(
              child: Text(
                "No items in your wishlist.",
                style: GoogleFonts.oxygen(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.grey,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 8, // Space between columns
                  mainAxisSpacing: 16, // Space between rows
                  childAspectRatio: 163 / 232, // Aspect ratio
                ),
                itemCount: controller.favourites.length,
                itemBuilder: (context, index) {
                  final product = controller.favourites[index];
                  return SizedBox(
                    width: 163,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product image with a favorite icon
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 176,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(product['imageUrl']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  onPressed: () {
                                    context.read<FavouriteScreenController>().toggleFavourite(product);
                                  },
                                  icon: Icon(
                                    context.read<FavouriteScreenController>().isFavourite(product['id'])
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: context.read<FavouriteScreenController>().isFavourite(product['id'])
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product price and rating
                                Row(
                                  children: [
                                    Text(
                                      "₹${product['mrp']}",
                                      style: GoogleFonts.oxygen(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "₹${product['price']}",
                                      style: GoogleFonts.oxygen(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: ColorConstants.deepPurple,
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          product['rating']?.toStringAsFixed(1) ?? "0.0",
                                          style: GoogleFonts.oxygen(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                // Product name
                                Text(
                                  product['name'],
                                  style: GoogleFonts.heebo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: ColorConstants.darkBlue,
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
            ),
    );
  }
}
