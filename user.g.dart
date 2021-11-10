// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyEat _$UserFromJson(Map<String, dynamic> json) {
  return MyEat(
    name: json['name'] as String,
    phone: json['phone'] as String,
    password: json['password'] as String,
    comment: json['comment'] as String,
      account: json['account'] as String,
      forgot: json['forgot'] as String
  );
}

Map<String, dynamic> _$UserToJson(MyEat instance) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'password': instance.password,
  'comment': instance.comment,
  'account': instance.account,
  'forgot': instance.forgot,
};
