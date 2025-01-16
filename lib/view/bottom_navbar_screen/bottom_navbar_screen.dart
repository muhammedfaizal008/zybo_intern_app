import 'package:flutter/material.dart';
import 'package:zybo_intern_app/utils/color_constants.dart';
import 'package:zybo_intern_app/view/favourite_screen/favourite_screen.dart';
import 'package:zybo_intern_app/view/home_screen/home_screen.dart';
import 'package:zybo_intern_app/view/profile_screen/profile_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0x74747426), // #74747426 shadow color
              offset: const Offset(0, 4),    // Offset for drop shadow
              blurRadius: 25,                // 25px blur for the shadow
              spreadRadius: 0,               // No spread for subtle effect
            ),
          ],
        ),
        child: Container(
          height: 80, 
          decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  unselectedItemColor: ColorConstants.lightBlack,
                  selectedItemColor: ColorConstants.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: currentIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: BottomNavbarTransition(
                        icon: const Icon(Icons.home, color: ColorConstants.white),
                        label: "Home",
                        isActive: true,
                      ),
                      icon: BottomNavbarTransition(
                        icon: const Icon(Icons.home_outlined, color: ColorConstants.lightBlack),
                        label: "Home",
                        isActive: false,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      activeIcon: BottomNavbarTransition(
                        icon: const Icon(Icons.favorite, color: ColorConstants.white),
                        label: "Favorites",
                        isActive: true,
                      ),
                      icon: BottomNavbarTransition(
                        icon: const Icon(Icons.favorite_outline, color: ColorConstants.lightBlack),
                        label: "Favorites",
                        isActive: false,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      activeIcon: BottomNavbarTransition(
                        icon: const Icon(Icons.person, color: ColorConstants.white),
                        label: "Profile",
                        isActive: true,
                      ),
                      icon: BottomNavbarTransition(
                        icon: const Icon(Icons.person_outline, color: ColorConstants.lightBlack),
                        label: "Profile",
                        isActive: false,
                      ),
                      label: "",
                    ),
                  ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavbarTransition extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isActive;

  const BottomNavbarTransition({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 45,
      padding: isActive
          ? const EdgeInsets.symmetric(horizontal: 16)
          : const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: isActive ? ColorConstants.deepPurple : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          if (isActive)
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                label,
                style: const TextStyle(
                  color: ColorConstants.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
