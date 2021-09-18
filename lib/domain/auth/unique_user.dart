import 'package:freezed_annotation/freezed_annotation.dart';

import 'value_objects.dart';

part 'unique_user.freezed.dart';

@freezed
abstract class UniqueUser with _$UniqueUser{
  const factory UniqueUser({required UniqueId id}) = _UniqueUser;
}