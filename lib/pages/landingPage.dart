import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget navItem(String title, int idx) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex = idx;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Color(0xff1D1E3C),
                    fontWeight: idx == selectedIndex
                        ? FontWeight.w500
                        : FontWeight.w300)),
            Container(
              width: 66,
              height: 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: idx == selectedIndex
                      ? Color(0xffFE998D)
                      : Colors.transparent),
            ),
          ],
        ),
      );
    }

    Widget imgSelect(String img, int idx) {
      return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = idx;
            });
          },
          child: Image.asset('img', height: 550));
    }

    return Scaffold(
        body: Stack(
      children: [
        Image.asset('bg.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
          child: Column(
            children: [
              // Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('logo.png', width: 72, height: 40),
                  Row(children: [
                    navItem('Guides', 0),
                    SizedBox(width: 25),
                    navItem('Pricing', 1),
                    SizedBox(width: 25),
                    navItem('Team', 2),
                    SizedBox(width: 25),
                    navItem('Stories', 3),
                  ]),
                  Image.asset('btn_acc.png', width: 163, height: 53),
                ],
              ),

              // Content
              SizedBox(height: 76),
              selectedIndex == 0
                  ? Image.asset('ill1.png', width: 500, height: 500)
                  : (selectedIndex == 1
                      ? Image.asset('ill2.png', width: 500, height: 500)
                      : (selectedIndex == 2
                          ? Image.asset('ill3.png', width: 500, height: 500)
                          : (selectedIndex == 3
                              ? Image.asset('ill4.png', width: 500, height: 500)
                              : Image.asset('blank.png')))),

              // footer
              SizedBox(height: 84),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('btn_down.png', width: 24),
                  SizedBox(width: 13),
                  Text('Scroll to Learn More',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black))
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
