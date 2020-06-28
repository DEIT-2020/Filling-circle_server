import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;

InputElement inputcontent;
OutputElement outputcontent;

void main() {
  runApp(ng.AppComponentNgFactory);}

void getstring(){
  inputcontent = querySelector('#inputcontent');
  outputcontent=querySelector('#outputcontent');
}

void transferpp(){
  
}
  
