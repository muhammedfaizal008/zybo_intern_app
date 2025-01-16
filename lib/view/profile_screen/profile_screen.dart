import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zybo_intern_app/utils/color_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body:Padding(
        padding: const EdgeInsets.only(top: 68,right: 16.5,left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Profile",style: GoogleFonts.heebo(fontWeight: FontWeight.w500,fontSize: 18),),
            SizedBox(height: 40,),
            Text("Name",style: GoogleFonts.oxygen(fontWeight: FontWeight.w700,fontSize: 14,color: ColorConstants.grey),),
            SizedBox(height: 17,),
            Text("John Mathew",style: GoogleFonts.oxygen(fontWeight: FontWeight.w700,fontSize: 18)),
            SizedBox(height: 24,),
            Text("Phone",style: GoogleFonts.oxygen(fontWeight: FontWeight.w700,fontSize: 14,color: ColorConstants.grey)),
            SizedBox(height: 17,),
            Text("+91 9477575738",style: GoogleFonts.oxygen(fontWeight: FontWeight.w700,fontSize: 18))
          ],
        ),
      ),
    );
  }
}