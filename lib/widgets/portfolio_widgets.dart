import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/animation/hover_animate.dart';
import 'package:flutter_portfolio/constant/text_font.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/utils/container.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/google_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectModel {
  final String title;
  final String subTitle;
  final String image;
  final Uri projectUrl;

  ProjectModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.projectUrl,
  });
}

class ProjectData {
  static final List<ProjectModel> myProjects = [
    ProjectModel(
      title: "Meeting app",
      subTitle: "This Meeting app supports real-time collaborative workspace"
          " tools (synchronized notes, action-item tasks, and live group chat backed by Hive caching)"
          " alongside a peer-to-peer WebRTC video/audio streaming pipeline."
          "\nNode JS, Express, Socket, MongoDB",
      image: "assets/projects-image/meeting_app.png",
      projectUrl: Uri.parse('https://github.com/Prasannata1Baniya/meeting_app'),
    ),
    ProjectModel(
      title: "Flutter RealTime Chat App",
      subTitle: "Flutter chat app to enhance my frontend and backend knowledge."
          "\nFlutter, Firebase, firestore,Real time messaging ",
      image: "assets/projects-image/flutter_chat_app.png",
      projectUrl: Uri.parse('https://github.com/Prasannata1Baniya/flutter_chat_app'),
    ),
    ProjectModel(
      title: "Cab Booking app",
      subTitle: "Developed a Cab Booking Mobile App using Firebase and Cloudinary for Cloud Storage."
          "\nFlutter_Map, Firebase, firestore, Cloudinary ",
      image: "assets/projects-image/cab_booking_project.png",
      projectUrl: Uri.parse('https://github.com/Prasannata1Baniya/Sajilo-Ride'),
    ),
    ProjectModel(
      title: "Car Rental Web and Mobile app",
      subTitle: "Developed a Car Rental Web and Mobile App using Firebase."
          "\nFlutterMap, Firebase, firestore",
      image: "assets/projects-image/car_rental_project.png",
      projectUrl: Uri.parse('https://github.com/Prasannata1Baniya/CarRentalApp'),
    ),
    ProjectModel(
      title: "Basics Projects",
      subTitle: "Basics Project to enhance my dart and flutter knowledge."
          "\nSimple games, simple demo apps, other small projects are included.",
      image: "assets/projects-image/basics_project.png",
      projectUrl: Uri.parse('https://github.com/Prasannata1Baniya/flutter_projects'),
    ),
    ProjectModel(
      title: "E-Learning app",
      subTitle: "E-Learning app with various premium features...",
      image: "assets/projects-image/e-learning.png",
      projectUrl: Uri.parse('https://github.com/Prasannata1Baniya'),
    ),
    ProjectModel(
      title: "Advanced Projects",
      subTitle: "Advanced projects using flutter hive_storage,\nState Management System-Bloc, REST APIs, Firebase etc.",
      image: "assets/projects-image/advanced_project.png",
      projectUrl: Uri.parse('https://github.com/Prasannata1Baniya'),
    ),
  ];
}

// DEVICE FRAME

Container deviceFrame() {
  return Container(
    height: 420,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.accentNeon.withValues(alpha: 0.08),
          offset: const Offset(0, 10),
          blurRadius: 40,
        ),
      ],
    ),
    child: DeviceFrame(
      isFrameVisible: true,
      orientation: Orientation.portrait,
      device: Devices.ios.iPhone13,
      screen: Container(
        color: AppColors.scaffoldBg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/photo.jpg"),
                minRadius: 55,
                maxRadius: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Flutter Developer",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Column mainColumn(GlobalKey key, void Function() onTap) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    key: key,
    children: [
      const Text(
        'Hello!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.textMuted),
      ),
      const SizedBox(height: 4),
      const Text(
        'I am Prasannata Baniya',
        style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -0.5),
      ),
      const SizedBox(height: 12),
      Text(
        "Flutter App Developer",
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.accentNeon,
            letterSpacing: 0.5,
            shadows: [
              Shadow(
                color: AppColors.accentNeon.withValues(alpha: 0.3),
                blurRadius: 12,
              )
            ]
        ),
      ).animate(onPlay: (controller) => controller.repeat(reverse: true))
          .fadeIn(duration: 1000.ms, curve: Curves.easeInOut)
          .then()
          .fadeOut(duration: 1000.ms, curve: Curves.easeInOut),
      const SizedBox(height: 28),

      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: AppColors.primaryGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.accentNeon.withValues(alpha: 0.2),
                blurRadius: 15,
                offset: const Offset(0, 5),
              )
            ]
        ),
        child: ElevatedButton(
          onPressed: () async {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'bprasannata55@gmail.com',
              query: encodeQueryParameters(<String, String>{
                'subject': 'Hello from your portfolio',
              }),
            );

            if (await canLaunchUrl(emailLaunchUri)) {
              await launchUrl(emailLaunchUri);
            } else {
              throw 'Could not launch $emailLaunchUri';
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: const Size(160, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Get in Touch",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
      const SizedBox(height: 32),

      Row(
        children: [
          Icon(PlatformIcon.icons['Android'], size: 30, color: AppColors.textMuted),
          const SizedBox(width: 18),
          Icon(PlatformIcon.icons['IOS'], size: 30, color: AppColors.textMuted),
          const SizedBox(width: 18),
          Icon(PlatformIcon.icons['Windows'], size: 30, color: AppColors.textMuted),
          const SizedBox(width: 18),
          Icon(PlatformIcon.icons['Desktop'], size: 30, color: AppColors.textMuted),
          const SizedBox(width: 24),
          Container(height: 24, width: 1, color: Colors.white12),
          const SizedBox(width: 24),
          IconButton(
            onPressed: onTap,
            icon: Icon(MdiIcons.github, color: Colors.white, size: 32),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        ],
      ),
    ],
  );
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

Container skillsContainerForMobile(GlobalKey key, double fontSize) {
  return Container(
    key: key,
    width: double.maxFinite,
    padding: const EdgeInsets.symmetric(vertical: 40.0),
    color: AppColors.scaffoldBg,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "SKILLS",
          style: Poppins.googleFontPoppin.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: AppColors.accentNeon,
          ),
        ),
        const SizedBox(height: 24),
        CircularPercentIndicator(
          radius: 45,
          lineWidth: 6,
          percent: 0.8,
          center: const Text("80%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          progressColor: AppColors.accentNeon,
          backgroundColor: Colors.white10,
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              skillsContainer("Dart", "assets/skills-image/dart.png", fontSize),
              skillsContainer("Flutter", "assets/skills-image/flutter.png", fontSize),
              skillsContainer("Firebase", "assets/skills-image/firebase.png", fontSize),
              skillsContainer("Bloc", "assets/skills-image/bloc.png", fontSize),
              skillsContainer("Hive Storage", "assets/skills-image/hive.png", fontSize),
              skillsContainer("React Js", "assets/skills-image/react_js.png", fontSize),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget skillsContainer(String text, String imageData, double fontSize) {
  return Container(
    width: 105,
    height: 135,
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: AppColors.cardBg,
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.05),
        width: 1,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize > 16 ? 13 : fontSize,
              color: Colors.white,
              fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Image.asset(
            imageData,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.code, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Container skillsContainerForDesktop(GlobalKey key, double h, double height, double width, double fontSize) {
  return Container(
    key: key,
    width: double.maxFinite,
    height: h,
    color: AppColors.scaffoldBg,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "SKILLS",
          style: Poppins.googleFontPoppin.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: AppColors.accentNeon,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: const Color(0xff0F0F12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.03)),
          ),
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 45,
                lineWidth: 6,
                percent: 0.8,
                center: const Text("80%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                progressColor: AppColors.accentNeon,
                backgroundColor: Colors.white10,
              ),
              const SizedBox(height: 28),
              Expanded(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    skillsForContainer("Dart", "assets/skills-image/dart.png", fontSize),
                    skillsForContainer("Flutter", "assets/skills-image/flutter.png", fontSize),
                    skillsForContainer("Firebase", "assets/skills-image/firebase.png", fontSize),
                    skillsForContainer("Bloc", "assets/skills-image/bloc.png", fontSize),
                    skillsForContainer("Hive Storage", "assets/skills-image/hive.png", fontSize),
                    skillsForContainer("React Js", "assets/skills-image/react_js.png", fontSize),
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

Container projectContainer({
  required GlobalKey key,
  required List<ProjectModel> projects,
  required Function(Uri) onProjectTap,
}) {
  return Container(
    key: key,
    width: double.maxFinite,
    padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
    color: AppColors.scaffoldBg,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "PROJECTS",
          style: Poppins.googleFontPoppin.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: AppColors.accentNeon,
          ),
        ),
        const SizedBox(height: 32),

        ...projects.map((project) => HoverProjectCard(
          child: containerForProjects(
            onTap: () => onProjectTap(project.projectUrl),
            title: project.title,
            subTitle: project.subTitle,
            image: project.image,
          ),
        )),
      ],
    ),
  );
}