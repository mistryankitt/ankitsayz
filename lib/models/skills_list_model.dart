// To parse this JSON data, do
//
//     final skillListModel = skillListModelFromJson(jsonString);

import 'dart:convert';

List<SkillListModel> skillListModelFromJson(String str) => List<SkillListModel>.from(json.decode(str).map((x) => SkillListModel.fromJson(x)));

String skillListModelToJson(List<SkillListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SkillListModel {
  final String? skillName;
  final String? skillLevel;
  final String? skillDescription;
  final String? skillImage;

  SkillListModel({
    this.skillName,
    this.skillLevel,
    this.skillDescription,
    this.skillImage,
  });

  factory SkillListModel.fromJson(Map<String, dynamic> json) => SkillListModel(
    skillName: json["skill_name"],
    skillLevel: json["skill_level"],
    skillDescription: json["skill_description"],
    skillImage: json["skill_image"],
  );

  Map<String, dynamic> toJson() => {
    "skill_name": skillName,
    "skill_level": skillLevel,
    "skill_description": skillDescription,
    "skill_image": skillImage,
  };
}
