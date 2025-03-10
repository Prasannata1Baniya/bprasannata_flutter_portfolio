import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/constant/google_icons.dart';
import 'package:flutter_portfolio/constant/size.dart';
import 'package:flutter_portfolio/constant/text_font.dart';
import 'package:flutter_portfolio/widgets/container_for_body.dart';
import 'package:flutter_portfolio/widgets/drawer.dart';
import 'package:flutter_portfolio/widgets/header_desktop.dart';
import 'package:flutter_portfolio/widgets/header_mobile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/container.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

final scaffoldKey = GlobalKey<ScaffoldState>();
final ScrollController scrollController=ScrollController();

final GlobalKey homeKey=GlobalKey();
final GlobalKey skillsKey=GlobalKey();
final GlobalKey projectsKey=GlobalKey();
final GlobalKey contactsKey=GlobalKey();

// Contacts link
final Uri githubUrl =Uri.parse('https://github.com/Prasannata1Baniya');
final Uri instaUrl=Uri.parse('');
final Uri linkedInUrl=Uri.parse('https://www.linkedin.com/in/prasannata-baniya-060b792bb');

//for projects
final Uri flutterProjects=Uri.parse('https://github.com/Prasannata1Baniya/flutter_projects');
final Uri projectsUrl =Uri.parse('https://github.com/Prasannata1Baniya');

class _PortfolioPageState extends State<PortfolioPage> {
  Future<void> projectUrl(Uri url) async{
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    else{
      throw 'Could not launch $url';
    }
  }
  Future<void> _launchUrl(Uri url) async{
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    else{
      throw 'Could not launch $url';
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final renderBox = context.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero).dy;
      scrollController.animateTo(
          offset, duration:const Duration(seconds: 1), curve: Curves.easeInOut);
    }
    else {
      debugPrint('Context not found for key: $key');
    }
  }


  void scrollToSectionMobile(GlobalKey key)  {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      debugPrint('Context not found for key: $key');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth >= minSize;
          return SafeArea(
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: CustomColor.scaffold,
              endDrawer: constraints.maxWidth >= minSize
                  ? null
                  : DrawerPage(onNavTap: (int index) {
                switch (index) {
                  case 0:
                    scrollToSectionMobile(homeKey);
                    break;
                  case 1:
                    scrollToSectionMobile(skillsKey);
                    break;
                  case 2:
                    scrollToSectionMobile(projectsKey);
                    break;
                  case 4:
                    scrollToSectionMobile(contactsKey);
                    break;
                }
              },),
              body: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    //Main Page Navigation
                    if(constraints.maxWidth >= minSize)
                      HeaderDesktop(onNavTap: (int index) {
                        switch (index) {
                          case 0:
                            scrollToSection(homeKey);
                            break;
                          case 1:
                            scrollToSection(skillsKey);
                            break;
                          case 2:
                            scrollToSection(projectsKey);
                            break;
                          case 3:
                            scrollToSection(contactsKey);
                            break;
                        }
                      },)
                    else
                      HeaderMobile(
                        onLogoTab: () {},
                        menuTab: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
            
                    //For desktop
                    if(constraints.maxWidth>=minSize)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          mainColumn(homeKey,()=>_launchUrl(githubUrl)),
                          const SizedBox(width:240),
                          deviceFrame(),
                        ],
                      )
            
                    //for mobile size
                    else
                      Column(
                        children: [
                          deviceFrame(),
                          mainColumn(homeKey,()=>_launchUrl(githubUrl)),
                        ],
                      ),
                    const SizedBox(height: 10.0),
            
                    //Skills
                    isDesktop ? skillsContainerForDesktop(skillsKey,
                        500, 350, 900, 30) :
                        skillsContainerForMobile(skillsKey, 900, 20
                        ),

                    /*skillsContainer(skillsKey,
                         isDesktop? 500:900,
                         isDesktop? 350:600,
                         isDesktop ? 900 : 350,
                      isDesktop ? 30 : 20,
                     // isDesktop?false:true,
                    ),*/

                    //projects
                    if(constraints.maxWidth>=minSize)
                      projectContainer(()=>projectUrl(flutterProjects),projectsKey,500,115)
                    else
                      projectContainer(()=>projectUrl(projectsUrl),projectsKey,600,160),
            
                    //Contacts
                    Container(
                      key: contactsKey,
                      width: double.maxFinite,
                      height: 200,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Contacts",style: Poppins.googleFontPoppin),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              containerForContacts(GoogleIcon.icons['Github']!,
                                      ()=>_launchUrl(githubUrl)),
                              containerForContacts(GoogleIcon.icons['Instagram']!,()=>_launchUrl(instaUrl)),
                              containerForContacts(GoogleIcon.icons['LinkedIn']!,()=>_launchUrl(linkedInUrl)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
