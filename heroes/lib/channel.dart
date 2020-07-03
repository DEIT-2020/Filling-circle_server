import 'heroes.dart';
import 'model/user.dart';
import 'controller/register_controller.dart';
import 'controller/login_controller.dart';
import 'controller/appuser_controller.dart';
import 'controller/postcon_controller.dart';
import 'controller/getcon_controller.dart';
import 'controller/heroes_controller.dart';

class HeroesChannel extends ApplicationChannel {
  ManagedContext context;

  AuthServer authServer;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = HeroConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, persistentStore);
  }

  @override
  Controller get entryPoint {
    final router = Router();
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });


    router.route("/login/[:username]").link(() => UserController(context));
    router.route("/login/[:username]").link(() => LoginController(context));

    router
        .route("/register/[:username]")
        .link(() => RegisterController(context, authServer));

    router.route("/collection/[:username]").link(() => GetconController(context));

    router.route("/homepage").link(() => PostconController(context));

   
    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path) : super.fromFile(File(path));
  DatabaseConfiguration database;
}
