import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/auth/unique_user.dart';
import '../../domain/auth/value_objects.dart';

extension FirebaseUserDomainX on User {
  UniqueUser toDomain() =>
      UniqueUser(id: UniqueId.formUniqueString(uniqueId: uid));
}
