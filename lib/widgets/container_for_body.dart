import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/text_font.dart';
import 'package:flutter_portfolio/utils/container.dart';
import '../constant/google_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_animate/flutter_animate.dart';

Container deviceFrame() {
  return Container(
    height: 400,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.shade700,
        offset: const Offset(0, 4),
        blurRadius: 20,
      ),
    ]),
    child: DeviceFrame(
        isFrameVisible: true,
        orientation: Orientation.portrait,
        device: Devices.ios.iPhone13,
        screen: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/photo.jpg"),
              minRadius: 50,
              maxRadius: 100,
            ),
            const SizedBox(height: 15),
            textWhite("Flutter Developer"),
          ],
        )),
  );
}

//for Skills
/*class SkillsForContainer extends StatefulWidget {

  final GlobalKey skillKey;
 final double width;
     final double fontSize;
  const SkillsForContainer({super.key, required this.skillKey,
    required this.width, required this.fontSize});

  @override
  State<SkillsForContainer> createState() => _SkillsForContainerState();
}

class _SkillsForContainerState extends State<SkillsForContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      key:widget.skillKey,
      width: double.maxFinite,
      height: 500,
      color: const Color(0xff141414),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Skills",style: Poppins.googleFontPoppin,),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(top: 30.0),
            height: 350,
            width: widget.width,
            //width: 900,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.deepOrange.shade400,
            ),
            child: Column(
              children: [
                CircularPercentIndicator(
                  radius: 50,
                  lineWidth: 5,
                  percent: 0.8,
                  center: const Text("80%", style: TextStyle(color: Colors.white)),
                  progressColor: Colors.green,
                ),
                const SizedBox(height: 15,),
                SingleChildScrollView(
                  scrollDirection:Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      containerForSkills("Dart", "assets/skills-image/dart.png",
                          widget.fontSize),
                      containerForSkills(
                          "Flutter", "assets/skills-image/flutter.png",widget.fontSize),
                      containerForSkills(
                          "Firebase", "assets/skills-image/firebase.png",widget.fontSize),
                      containerForSkills("Bloc", "assets/skills-image/bloc.png",widget.fontSize),
                      containerForSkills(
                          "Hive Storage", "assets/skills-image/hive.png",widget.fontSize),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

Container skillsContainer(GlobalKey key,double width,double fontSize) {
  return Container(
    key:key,
    width: double.maxFinite,
    height: 500,
    color: const Color(0xff141414),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Skills",style: Poppins.googleFontPoppin,),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.only(top: 30.0),
          height: 350,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.deepOrange,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                spreadRadius: 3,
                color: Colors.deepOrange.shade300,
              ),
            ],
          ),
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 50,
                lineWidth: 5,
                percent: 0.8,
                center: const Text("80%", style: TextStyle(color: Colors.white)),
                progressColor: Colors.green,
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection:Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    containerForSkills("Dart", "assets/skills-image/dart.png",fontSize),
                    containerForSkills(
                        "Flutter", "assets/skills-image/flutter.png",fontSize),
                    containerForSkills(
                        "Firebase", "assets/skills-image/firebase.png",fontSize),
                    containerForSkills("Bloc", "assets/skills-image/bloc.png",fontSize),
                    containerForSkills(
                        "Hive Storage", "assets/skills-image/hive.png",fontSize),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//for projects
Container projectContainer(GlobalKey key,double ht,double height) {
  return Container(
    key: key,
    width: double.maxFinite,
    height: ht,
    //height: MediaQuery.of(context).size.height,
    color: const Color(0xff282828),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Projects",style: Poppins.googleFontPoppin,),
          const SizedBox(height: 12),
          containerForProjects(
              "Basics Projects",
              "Basics Project to enhance my dart and flutter knowledge.\n Simple games, simple demo apps, other small projects are included.",
              "assets/projects-image/basics_project.png",height),
          containerForProjects(
              "E-Learning app",
              "E-Learning app with various features...",
              "assets/projects-image/e-learning.png",height),
          containerForProjects(
              "Advanced Projects",
              "Advanced projects using flutter hive_storage, State Management System-Bloc, REST APIs, Firebase etc.",
              "assets/projects-image/advanced_project.png",height),
        ]),
  );
}

//for main page
Column mainColumn(GlobalKey key) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    key:key,
    children: [
       const  Text(
        ' Hi, I am Prasannata Baniya',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.normal, color: Colors.yellow),
        ).animate(onPlay: (controller) => controller.repeat(reverse: true))
           .fadeOut(curve: Curves.easeInOut),
           ///.scale(duration:const Duration(seconds: 2))
           ///.fadeIn(),
      Text(
        "Flutter App Developer ",
        style: Abeezee.googleFont,
      ).animate(onPlay: (controller) => controller.repeat(reverse: true))
          .fadeOut(curve: Curves.easeInOut),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo.shade900,
            minimumSize: const Size(120, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        child: const Text(
          "Get in Touch",
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          PlatformIcon.icons['Android'],
          size: 30,
        ),
        Icon(
          PlatformIcon.icons['IOS'],
          size: 30,
        ),
        Icon(
          PlatformIcon.icons['Windows'],
          size: 30,
        ),
        Icon(
          PlatformIcon.icons['Desktop'],
          size: 30,
        ),
      ]),
    ],
  );
}
