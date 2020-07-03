import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'hero_list_component.template.dart' as hero_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
import 'login_component.template.dart' as login_template;
import  'register_component.template.dart' as register_template;
import  'homepage_component.template.dart' as homepage_template;
import  'collect_component.template.dart' as collect_template;


export 'route_paths.dart';

class Routes {
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
  routePath: RoutePaths.dashboard,
  component: dashboard_template.DashboardComponentNgFactory,
  );
  static final login = RouteDefinition(
  routePath: RoutePaths.login,
  component: login_template.LoginComponentNgFactory,
  );

   static final register = RouteDefinition(
  routePath: RoutePaths.register,
  component: register_template.RegisterComponentNgFactory,
  );


 static final homepage = RouteDefinition(
  routePath: RoutePaths.homepage,
  component: homepage_template.HomepageComponentNgFactory,
  );

   static final collect = RouteDefinition(
  routePath: RoutePaths.collect,
  component:collect_template.CollectComponentNgFactory,
  );
  static final all = <RouteDefinition>[
    heroes,
    dashboard,
    login,
     RouteDefinition.redirect(
    path: '',
    redirectTo: RoutePaths.login.toUrl(),
  ),
  ];
}