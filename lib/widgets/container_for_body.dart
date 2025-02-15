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
            color: Colors.black,
           boxShadow:[
              BoxShadow(
                offset:const Offset(0, 3),
                spreadRadius: 3,
                color: Colors.grey.shade600,
              ),
             BoxShadow(
               offset:const Offset(0,-3),
               spreadRadius: 3,
               color: Colors.grey.shade600,
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
                    const SizedBox(width:7),
                    containerForSkills(
                        "Flutter", "assets/skills-image/flutter.png",fontSize),
                    const SizedBox(width:7),
                    containerForSkills(
                        "Firebase", "assets/skills-image/firebase.png",fontSize),
                    const SizedBox(width:7),
                    containerForSkills("Bloc", "assets/skills-image/bloc.png",fontSize),
                    const SizedBox(width:7),
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
Container projectContainer(void Function() onTap,GlobalKey key,double ht,double height) {
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
            onTap,
              "Basics Projects",
              "Basics Project to enhance my dart and flutter knowledge.\n Simple games, simple demo apps, other small projects are included.",
              "assets/projects-image/basics_project.png",height),
          containerForProjects(
              onTap,
              "E-Learning app",
              "E-Learning app with various features...",
              "assets/projects-image/e-learning.png",height),
          containerForProjects(
              onTap,
              "Advanced Projects",
              "Advanced projects using flutter hive_storage, State Management System-Bloc, REST APIs, Firebase etc.",
              "assets/projects-image/advanced_project.png",height),
        ]),
  );
}

//for main page
Column mainColumn(GlobalKey key,void Function() onTap) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    key:key,
    children: [
      const Text(
        ' Hello!',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.normal, color: Colors.yellow),
         ),
       const  Text(
        'I am Prasannata Baniya',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.normal, color: Colors.yellow),
        ),
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
      OutlinedButton(
          onPressed:onTap,
          style:ButtonStyle() ,
          child:const  Text('github')),
    ],
  );
}
