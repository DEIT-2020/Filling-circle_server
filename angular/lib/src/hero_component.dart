import 'package:angular_router/angular_router.dart';
// ···
import 'hero_service.dart';
import 'route_paths.dart';

final HeroService _heroService;
final Location _location;

HeroComponent(this._heroService, this._location);

@Component(
  selector: 'my-hero',
  template: '''
    <div *ngIf="hero != null">
      <h2>{{hero.name}}</h2>
      <div><label>id: </label>{{hero.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="hero.name" placeholder="name"/>
      </div>
    </div>
  ''',
  directives: [coreDirectives, formDirectives],
)


class HeroComponent implements OnActivate {
  // ···
  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }
  // ···
}