import 'package:flutter/material.dart';

class Compteurcafe extends ChangeNotifier {

     int cmpt=0;

     void add(){
      cmpt++;
      notifyListeners();
    
     }
     void decrease(){
      cmpt--;
      notifyListeners();
     }


  }
