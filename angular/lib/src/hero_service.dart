Future<Hero> get(int id) async =>
    (await getAll()).firstWhere((hero) => hero.id == id);
