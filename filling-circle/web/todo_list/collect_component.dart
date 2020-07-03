import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/angular_components.dart';
import 'dart:html';
import'dart:convert' as convert;
import 'routes.dart';
import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
import 'package:http/http.dart' as http;
// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-collect',
  styleUrls: ['collect_component.css'],
  templateUrl: 'collect_component.html',
  directives: [
              materialInputDirectives,
              MaterialButtonComponent,
              routerDirectives,
              ],
  exports: [RoutePaths, Routes],
)
class LoginComponent {
  String name=''; 
  var test='';

void isuser() {
  var path = 'http://localhost:8888/collect/$name';
  var httpRequest = HttpRequest();
  //var failure=document.getElementById('failure');
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e){
    if (httpRequest.status == 200) {
    final jsonResponse =convert.jsonDecode(httpRequest.response);
    //test=jsonResponse.toString();
    if(name==jsonResponse[0]['username']){
     window.alert('获取成功');
     window.location.href='../#/heroes';}
    }
    })
    ..send('');
  }
 
}
