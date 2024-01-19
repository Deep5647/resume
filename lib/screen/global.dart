import 'dart:io';

import 'package:flutter/material.dart';

class Global {
  static String name = '';
  static String email = '';
  static String phone = '';
  static String add1 = '';
  static String add2 = '';
  static String add3 = '';
  static File? imgPic;
  static String careerObj = '';
  static String currentDesignation = '';
  static String dob = '';
  static String maritalStatus = '';
  static List<String> langKnown = [];
  static String nationality = '';
  static String courseDegree = '';
  static String cgpa = '';
  static String sCI = '';
  static String passingYear = '';

  static String comName = '';
  static String schoolColIns = '';
  static String roles = '';
  static bool EmployedStatus = false;
  static String joinDate = '';
  static String exitDate = '';
  static List<TextEditingController> Skills = [TextEditingController()];
  static String proTitle = '';
  static List<String> technologiesList = [];
  static String proRoles = '';
  static String technologiesEx = '';
  static String proDesc = '';
  static String refName = '';
  static String designation = '';
  static String orgInstName = '';
  static String DeclarationDesc = '';
  static String date_decl = '';
  static String placeIntCity = '';
  static List<TextEditingController> Achivements = [TextEditingController()];
  static List<Map<String, dynamic>> lang = [
    {
      'isSelect': false,
      'langName': 'English',
    },
    {
      'isSelect': false,
      'langName': 'Hindi',
    },
    {
      'isSelect': false,
      'langName': 'Gujarati',
    },
  ];
  static List<Map<String, dynamic>> tech = [
    {
      'isSelect': false,
      'langName': 'Flutter',
    },
    {
      'isSelect': false,
      'langName': 'Java',
    },
    {
      'isSelect': false,
      'langName': 'Python',
    },
  ];

}
