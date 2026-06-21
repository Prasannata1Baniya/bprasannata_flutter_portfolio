import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/constant/google_icons.dart';
import 'package:flutter_portfolio/constant/size.dart';
import 'package:flutter_portfolio/constant/text_font.dart';
import 'package:flutter_portfolio/widgets/portfolio_widgets.dart';
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

class _PortfolioPageState extends State<PortfolioPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final ScrollController _scrollController;

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactsKey = GlobalKey();

  // Profile Links
  final Uri _githubUrl = Uri.parse('https://github.com/Prasannata1Baniya');
  final Uri _instaUrl = Uri.parse('');
  final Uri _linkedInUrl = Uri.parse('https://www.linkedin.com/in/prasannata-baniya-060b792bb');



  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(Uri url) async {
    if (url.toString().isEmpty) return;
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
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
        final bool isDesktop = constraints.maxWidth >= minSize;

        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: AppColors.scaffoldBg,
            endDrawer: isDesktop
                ? null
                : DrawerPage(
              onNavTap: (int index) {
                if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
                  Navigator.of(context).pop();
                }
                switch (index) {
                  case 0: _scrollToSection(_homeKey); break;
                  case 1: _scrollToSection(_skillsKey); break;
                  case 2: _scrollToSection(_projectsKey); break;
                  case 3: _scrollToSection(_contactsKey); break;
                }
              },
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Navigation Header
                  if (isDesktop)
                    HeaderDesktop(
                      onNavTap: (int index) {
                        switch (index) {
                          case 0: _scrollToSection(_homeKey); break;
                          case 1: _scrollToSection(_skillsKey); break;
                          case 2: _scrollToSection(_projectsKey); break;
                          case 3: _scrollToSection(_contactsKey); break;
                        }
                      },
                    )
                  else
                    HeaderMobile(
                      onLogoTab: () => _scrollToSection(_homeKey),
                      menuTab: () => _scaffoldKey.currentState?.openEndDrawer(),
                    ),

                  // Hero Section (Home)
                  if (isDesktop)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: mainColumn(_homeKey, () => _launchUrl(_githubUrl)),
                          ),
                          const Flexible(
                            child: SizedBox(width: 140),
                          ),
                          deviceFrame(),
                        ],
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        children: [
                          deviceFrame(),
                          const SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: mainColumn(_homeKey, () => _launchUrl(_githubUrl)),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 40.0),

                  // Skills Section
                  isDesktop
                      ? skillsContainerForDesktop(_skillsKey, 540, 420, 1000, 30)
                      : skillsContainerForMobile(_skillsKey, 20),

                  const SizedBox(height: 40.0),

                  if (isDesktop)
                    projectContainer(
                      key: _projectsKey,
                      projects: ProjectData.myProjects,
                      onProjectTap: (url) => _launchUrl(url),
                    )
                  else
                    projectContainer(
                      key: _projectsKey,
                      projects: ProjectData.myProjects,
                      onProjectTap: (url) => _launchUrl(url),
                    ),

                  const SizedBox(height: 60.0),

                  // Footer / Contacts Section
                  Container(
                    key: _contactsKey,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 48.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff09090B),
                      border: Border(
                        top: BorderSide(
                          color: Colors.white.withValues(alpha: 0.03),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "GET IN TOUCH",
                          style: Poppins.googleFontPoppin.copyWith(
                            color: AppColors.accentNeon,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (GoogleIcon.icons['Github'] != null)
                              containerForContacts(GoogleIcon.icons['Github']!, () => _launchUrl(_githubUrl)),
                            if (GoogleIcon.icons['Instagram'] != null)
                              containerForContacts(GoogleIcon.icons['Instagram']!, () => _launchUrl(_instaUrl)),
                            if (GoogleIcon.icons['LinkedIn'] != null)
                              containerForContacts(GoogleIcon.icons['LinkedIn']!, () => _launchUrl(_linkedInUrl)),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          "© 2026 Prasannata Baniya. Built with Flutter.",
                          style: TextStyle(
                            color: AppColors.textMuted.withValues(alpha: 0.4),
                            fontSize: 12,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
