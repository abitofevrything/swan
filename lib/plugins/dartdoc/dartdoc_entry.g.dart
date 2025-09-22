// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dartdoc_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DartdocEntry _$DartdocEntryFromJson(Map<String, dynamic> json) =>
    _DartdocEntry(
      name: json['name'] as String,
      qualifiedName: json['qualifiedName'] as String,
      href: json['href'] as String,
      type: _typeFromJson((json['kind'] as num).toInt()),
      description: json['desc'] as String,
      enclosedBy: json['enclosedBy'] == null
          ? null
          : DartdocEnclosedBy.fromJson(
              json['enclosedBy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DartdocEntryToJson(_DartdocEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'qualifiedName': instance.qualifiedName,
      'href': instance.href,
      'kind': instance.type,
      'desc': instance.description,
      'enclosedBy': instance.enclosedBy,
    };

_DartdocEnclosedBy _$DartdocEnclosedByFromJson(Map<String, dynamic> json) =>
    _DartdocEnclosedBy(
      name: json['name'] as String,
      type: _typeFromJson((json['kind'] as num).toInt()),
    );

Map<String, dynamic> _$DartdocEnclosedByToJson(_DartdocEnclosedBy instance) =>
    <String, dynamic>{'name': instance.name, 'kind': instance.type};
