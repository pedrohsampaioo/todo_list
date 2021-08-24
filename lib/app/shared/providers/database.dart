import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';

import 'package:todo_list/app/config/database/database_config.dart';

final databaseProvider = Provider<Database>((_) => DatabaseConfig.database!);
final storeProvider = Provider<StoreRef<String, Map<String, dynamic>>>(
    (_) => StoreRef<String, Map<String, dynamic>>.main());
