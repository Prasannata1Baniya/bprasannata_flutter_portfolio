import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/text_font.dart';
import 'package:flutter_portfolio/utils/container.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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

Container skillsContainerForMobile(GlobalKey key,double h,fontSize,){
  return Container(
    key:key,
    width: double.maxFinite,
    height: h,
    color: const Color(0xff141414),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Skills",style: Poppins.googleFontPoppin,),
        const SizedBox(height: 20),
        Column(
          children: [
            CircularPercentIndicator(
              radius: 50,
              lineWidth: 5,
              percent: 0.8,
              center: const Text("80%", style: TextStyle(color: Colors.white)),
              progressColor: Colors.green,
            ),
            const SizedBox(height: 15,),
            Wrap(
              //spacing:8,
              //runSpacing: 3,
              children: [
                const SizedBox(width:8),
                skillsContainer("Dart", "assets/skills-image/dart.png",fontSize),
                const SizedBox(width:8),
                skillsContainer(
                    "Flutter", "assets/skills-image/flutter.png",fontSize),
                const SizedBox(width:8),
                skillsContainer(
                    "Firebase", "assets/skills-image/firebase.png",fontSize),
                const SizedBox(width:8),
                skillsContainer("Bloc", "assets/skills-image/bloc.png",fontSize),
                const SizedBox(width:8),
                skillsContainer(
                    "Hive Storage", "assets/skills-image/hive.png",fontSize),
                const SizedBox(width:8),
                skillsContainer(
                    "React Js", "assets/skills-image/react_js.png",fontSize),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Padding skillsContainer(String text, String imageData, fontSize){
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: DecoratedBox(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(2, 2),
            blurRadius: 3,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-2, -2),
          ),
        ]
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,style: TextStyle(fontSize: fontSize),),
          Image.asset(imageData,height:100),
        ],
      ),
    ),
  );
}

Container skillsContainerForDesktop(GlobalKey key,double h,double height,double width,double fontSize) {
  return Container(
    key:key,
    width: double.maxFinite,
    height: h,
    color: const Color(0xff141414),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Skills",style: Poppins.googleFontPoppin,),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.only(top: 30.0),
          height: height,
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
              Padding(
                padding: const EdgeInsets.all(10),
              child: Wrap(
                spacing: 8,
                runSpacing: 5,
                children: [
                  const SizedBox(width:8),
                  containerForSkills("Dart", "assets/skills-image/dart.png",fontSize),
                  const SizedBox(width:8),
                  containerForSkills(
                      "Flutter", "assets/skills-image/flutter.png",fontSize),
                  const SizedBox(width:8),
                  containerForSkills(
                      "Firebase", "assets/skills-image/firebase.png",fontSize),
                  const SizedBox(width:8),
                  containerForSkills("Bloc", "assets/skills-image/bloc.png",fontSize),
                  const SizedBox(width:8),
                  containerForSkills(
                      "Hive Storage", "assets/skills-image/hive.png",fontSize),
                  const SizedBox(width:8),
                  containerForSkills(
                      "React Js", "assets/skills-image/react_js.png",fontSize),
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
              "Advanced projects using flutter hive_storage,\n State Management System-Bloc,REST APIs, Firebase etc.",
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
      Center(
        child: Text(
          "Flutter App Developer ",
          style: Abeezee.googleFont,
        ).animate(onPlay: (controller) => controller.repeat(reverse: true))
            .fadeOut(curve: Curves.easeInOut),
      ),
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
          size: 50,
        ),
        Icon(
          PlatformIcon.icons['IOS'],
          size: 50,
        ),
        Icon(
          PlatformIcon.icons['Windows'],
          size: 50,
        ),
        Icon(
          PlatformIcon.icons['Desktop'],
          size: 50,
        ),
      ]),
      const SizedBox(height: 10,),
      OutlinedButton(
          onPressed:onTap,
          style:const ButtonStyle() ,
          child:Row(
            children: [
              Icon(MdiIcons.github),
              const Text('github',style: TextStyle(),),
            ],
          )),
    ],
  );
}

