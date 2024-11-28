import 'package:ankitsayz/generated/assets.dart';
import 'package:ankitsayz/utils/const.dart';
import 'package:flutter/material.dart';

class ReadmeProvider extends ChangeNotifier {
  List<dynamic> getContactMeList = [
    {"icon": Assets.iconsLinkedin, "link": Constant.linkedInUrl},
    {"icon": Assets.iconsInstagram, "link": Constant.instagramUrl},
    {"icon": Assets.iconsMail, "link": Constant.emailUrl},
    {"icon": Assets.iconsTwitter, "link": Constant.twitterUrl},
    {"icon": Assets.iconsGithub, "link": Constant.githubUrl},
  ];

}
