import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zybo_intern_app/utils/color_constants.dart';
import 'package:zybo_intern_app/view/otp_screen/otp_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: EdgeInsets.only(top: 25, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 68),
              child: Text(
                'Login',
                style: GoogleFonts.oxygen(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.black),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                "Let's Connect with Lorem Ipsum..!",
                style: GoogleFonts.manrope(
                    fontSize: 14,
                    color: ColorConstants.lightBlack,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 12),
                    child: Text(
                      '+91',
                      style: GoogleFonts.oxygen(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone',
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    style: GoogleFonts.oxygen(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: ColorConstants.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        String phoneNumber = phoneNumberController.text.trim();
                        // Your logic to verify the user and navigate to OTP screen
                        setState(() {
                          isLoading = true;
                        });

                        // Navigate to OTP screen (replace this with actual navigation)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(),
                          ),
                        );
                      },
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        'Continue',
                        style: GoogleFonts.oxygen(
                            color: Colors.white, fontSize: 16),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'By Continuing you accepting the ',
                  style: GoogleFonts.oxygen(
                      color: ColorConstants.lightBlack,
                      fontSize: 10,
                      fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: 'Terms of Use &\nPrivacy Policy',
                      style: GoogleFonts.oxygen(
                          color: ColorConstants.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
