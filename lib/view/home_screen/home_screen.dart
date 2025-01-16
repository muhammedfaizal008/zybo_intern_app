import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zybo_intern_app/controller/home_screen_controller.dart';
import 'package:zybo_intern_app/utils/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeScreenController>().getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeController = context.watch<HomeScreenController>();

    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.only(top: 68, right: 16.5, left: 16.5, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstants.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstants.white,
                    hintText: "Search",
                    hintStyle: TextStyle(color: ColorConstants.grey),
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 138,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  _pageController.jumpToPage(index);
                },
              ),
              items: List.generate(
                3,
                (index) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 138,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/image/Special Offer Content.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            // Smooth Page Indicator
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(),
              ),
            ),

            const SizedBox(height: 25),

            // Popular Products Header
            Padding(
              padding: const EdgeInsets.only(left: 16.5),
              child: Text(
                "Popular Products",
                style: GoogleFonts.oxygen(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Grid View for Popular Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: homeController.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 16,
                        childAspectRatio: 163 / 232,
                      ),
                      itemCount: homeController.products.length,
                      itemBuilder: (context, index) {
                        final product = homeController.products[index];
                        return SizedBox(
                          width: 163,
                          height: 232,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 165,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(product.featuredImage ?? ""),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: IconButton(
                                          onPressed: () {
                                            // Toggle the favorite status
                                            context.read<HomeScreenController>().toggleFavourite(index, context);
                                          },
                                          icon: Icon(
                                            product.inWishlist == true
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: product.inWishlist == true
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                        )

                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "₹${product.mrp}",
                                            style: GoogleFonts.oxygen(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.grey,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            "₹${product.salePrice}",
                                            style: GoogleFonts.oxygen(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        product.name ?? "Unnamed Product",
                                        style: GoogleFonts.heebo(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            product.avgRating?.toString() ?? "0.0",
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
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
