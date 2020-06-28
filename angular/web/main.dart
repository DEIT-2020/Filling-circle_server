import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;

// InputElement inputcontent;
// InputElement submit;
// OutputElement outputcontent;

<<<<<<< HEAD
// void main() {
//   runApp(ng.AppComponentNgFactory);}
=======

var response=await http.get('index.html');
Document outputcontent=parse(respose.body);

void main() {
  runApp(ng.AppComponentNgFactory);}
>>>>>>> wanningjing

// void getstring(){
//   inputcontent = querySelector('#inputcontent');
//   outputcontent=querySelector('#outputcontent');
// }

<<<<<<< HEAD
// void transferpp(){
  
// }

void main() {
  InputElement username = querySelector('#username');
  InputElement submit = querySelector('#save');
  Element output = querySelector('#username-output');
  Storage localStorage = window.localStorage;

  String savedUsername = localStorage['username'];
  if (savedUsername != null) {
    output.text = savedUsername;
  }

  submit.onClick.listen((Event e) {
    output.text = username.value;
    localStorage['username'] = username.value;
  });
}
  
=======
void transferpp(){
 

  
}
>>>>>>> wanningjing
