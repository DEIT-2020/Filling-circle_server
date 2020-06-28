// import 'dart:html';

// import 'package:angular/angular.dart';
// import 'package:angular_dart/app_component.template.dart' as ng;

// void main() {
//   InputElement username = querySelector('#username');
//   InputElement submit = querySelector('#save');
//   Element output = querySelector('#username-output');
//   Storage localStorage = window.localStorage;

//   String savedUsername = localStorage['username'];
//   if (savedUsername != null) {
//     output.text = savedUsername;
//   }

//   submit.onClick.listen((Event e) {
//     output.text = username.value;
//     localStorage['username'] = username.value;
//   });
// }