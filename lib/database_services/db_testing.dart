import 'package:postgres/postgres.dart';

void main() async {
  final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      port: 5432,
      database: 'treasury',
      username: 'postgres',
      password: 'September123',
    ),
    settings: const ConnectionSettings(sslMode: SslMode.disable),
  );

  final result2 =
      await conn.execute(Sql.named("SELECT * FROM master_staking_period"));
  print(result2);
}
