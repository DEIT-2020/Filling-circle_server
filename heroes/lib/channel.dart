import 'heroes.dart';
import 'controller/heroes_controller.dart';
import 'package:aqueduct/managed_auth.dart';
import 'package:heroes/model/user.dart';
import 'package:heroes/controller/register_controller.dart';
import 'package:heroes/controller/login_controller.dart';
import 'package:heroes/controller/appuser_controller.dart';
import 'package:heroes/controller/postcon_controller.dart';
import 'package:heroes/controller/getcon_controller.dart';

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

    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    // router
    //   .route("/example")
    //   .linkFunction((request) async {
    //     return Response.ok({"key": "value"});
    //   });

    router.route('/auth/token').link(() => AuthController(authServer));

    router.route('/heroes/[:id]').link(() => HeroesController(context));

    router.route("/login").link(() => UserController(context));

    router
        .route('/login/register')
        .link(() => RegisterController(context, authServer));

    router.route("/online_user").linkFunction((request) async {
      return Response.ok({"key": "online_user"});
    });

    router.route("/collection/[:qid]").link(() => GetconController(context));

    router.route("/homepage").link(() => PostconController(context));

    router.route("/login/[:uphone]").link(() => LoginController(context));

    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path) : super.fromFile(File(path));
  DatabaseConfiguration database;
}
