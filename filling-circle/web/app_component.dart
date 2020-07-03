import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'todo_list/todo_list_service.dart';
import 'todo_list/hero_list_component.dart';
import 'todo_list/routes.dart';


@Component(
  selector: 'my-app',
  template: '''
   
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  directives: [HeroListComponent,routerDirectives,],
  providers: [ClassProvider(TodoListService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'Tour of Heroes';
}
