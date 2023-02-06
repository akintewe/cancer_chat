import 'package:cancer_chat/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Doctor Q',
          style: GoogleFonts.actor(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 60,
                width: 61,
                decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Icon(
                  Icons.notifications,
                  size: 30,
                  color: AppColors.primary800,
                )),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Image.asset(
                    'assets/images/heart.png',
                    width: 28,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
