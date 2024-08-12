import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class normal_text extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const normal_text({super.key,required this.text, required this.size, required this.color});
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(color:color,fontSize: size),
    );
  }
}

class boldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const boldText({super.key, required this.text, required this.size, required this.color});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: GoogleFonts.poppins(color: color,fontSize: size,fontWeight: FontWeight.bold),
    );
  }
}
