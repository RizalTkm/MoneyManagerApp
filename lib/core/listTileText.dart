import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialText extends StatelessWidget {
  SpecialText({super.key, required this.label});

  String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.acme(fontSize: 30),
    );
  }
}
