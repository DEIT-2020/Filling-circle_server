import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/todo_list/todo_list_service.dart';
import 'lib/hero_list_component.dart';
import 'lib/todo_list/routes.dart';


@Component(
  selector: 'my-heroes',
  template: 'hero_list_compoent.html',
  styleUrls:['hero_list_component.css'],

   
  directives: [HeroListComponent,routerDirectives,],
  providers: [ClassProvider(TodoListService)],
  exports: [RoutePaths, Routes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  List<Hero> heroes;
  Hero selected;

  HeroListComponent(this._heroService, this._router);

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selected = hero;

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}
