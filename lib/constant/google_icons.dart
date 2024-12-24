import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//For Cross Platforms
class PlatformIcon{
  static Map<String,IconData> icons={
    'Android':MdiIcons.android,
    'IOS':MdiIcons.appleIos,
    'Windows':MdiIcons.microsoftWindows,
    'Desktop':MdiIcons.remoteDesktop,
  };
  static IconData getIcon(String iconName){
    return icons[iconName] ??Icons.error;
  }
}

//For Contacts
class GoogleIcon{
  static Map<String,IconData> icons={
    'Github': MdiIcons.github, // GitHub icon from Material Design Icons
    'Instagram': MdiIcons.instagram, // Instagram icon
    'LinkedIn': MdiIcons.linkedin, // LinkedIn icon
  };
  static IconData getIcon(String iconName){
    return icons[iconName] ?? Icons.error;
  }
}
