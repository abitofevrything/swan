// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dartdoc_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DartdocEntry {

 String get name;@JsonKey(name: 'qualifiedName') String get qualifiedName; String get href;@JsonKey(fromJson: _typeFromJson, name: 'kind') String get type;@JsonKey(name: 'desc') String get description;@JsonKey(required: false, name: 'enclosedBy') DartdocEnclosedBy? get enclosedBy;
/// Create a copy of DartdocEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartdocEntryCopyWith<DartdocEntry> get copyWith => _$DartdocEntryCopyWithImpl<DartdocEntry>(this as DartdocEntry, _$identity);

  /// Serializes this DartdocEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartdocEntry&&(identical(other.name, name) || other.name == name)&&(identical(other.qualifiedName, qualifiedName) || other.qualifiedName == qualifiedName)&&(identical(other.href, href) || other.href == href)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.enclosedBy, enclosedBy) || other.enclosedBy == enclosedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,qualifiedName,href,type,description,enclosedBy);

@override
String toString() {
  return 'DartdocEntry(name: $name, qualifiedName: $qualifiedName, href: $href, type: $type, description: $description, enclosedBy: $enclosedBy)';
}


}

/// @nodoc
abstract mixin class $DartdocEntryCopyWith<$Res>  {
  factory $DartdocEntryCopyWith(DartdocEntry value, $Res Function(DartdocEntry) _then) = _$DartdocEntryCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'qualifiedName') String qualifiedName, String href,@JsonKey(fromJson: _typeFromJson, name: 'kind') String type,@JsonKey(name: 'desc') String description,@JsonKey(required: false, name: 'enclosedBy') DartdocEnclosedBy? enclosedBy
});


$DartdocEnclosedByCopyWith<$Res>? get enclosedBy;

}
/// @nodoc
class _$DartdocEntryCopyWithImpl<$Res>
    implements $DartdocEntryCopyWith<$Res> {
  _$DartdocEntryCopyWithImpl(this._self, this._then);

  final DartdocEntry _self;
  final $Res Function(DartdocEntry) _then;

/// Create a copy of DartdocEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? qualifiedName = null,Object? href = null,Object? type = null,Object? description = null,Object? enclosedBy = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qualifiedName: null == qualifiedName ? _self.qualifiedName : qualifiedName // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enclosedBy: freezed == enclosedBy ? _self.enclosedBy : enclosedBy // ignore: cast_nullable_to_non_nullable
as DartdocEnclosedBy?,
  ));
}
/// Create a copy of DartdocEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DartdocEnclosedByCopyWith<$Res>? get enclosedBy {
    if (_self.enclosedBy == null) {
    return null;
  }

  return $DartdocEnclosedByCopyWith<$Res>(_self.enclosedBy!, (value) {
    return _then(_self.copyWith(enclosedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [DartdocEntry].
extension DartdocEntryPatterns on DartdocEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DartdocEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DartdocEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DartdocEntry value)  $default,){
final _that = this;
switch (_that) {
case _DartdocEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DartdocEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DartdocEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'qualifiedName')  String qualifiedName,  String href, @JsonKey(fromJson: _typeFromJson, name: 'kind')  String type, @JsonKey(name: 'desc')  String description, @JsonKey(required: false, name: 'enclosedBy')  DartdocEnclosedBy? enclosedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DartdocEntry() when $default != null:
return $default(_that.name,_that.qualifiedName,_that.href,_that.type,_that.description,_that.enclosedBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'qualifiedName')  String qualifiedName,  String href, @JsonKey(fromJson: _typeFromJson, name: 'kind')  String type, @JsonKey(name: 'desc')  String description, @JsonKey(required: false, name: 'enclosedBy')  DartdocEnclosedBy? enclosedBy)  $default,) {final _that = this;
switch (_that) {
case _DartdocEntry():
return $default(_that.name,_that.qualifiedName,_that.href,_that.type,_that.description,_that.enclosedBy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'qualifiedName')  String qualifiedName,  String href, @JsonKey(fromJson: _typeFromJson, name: 'kind')  String type, @JsonKey(name: 'desc')  String description, @JsonKey(required: false, name: 'enclosedBy')  DartdocEnclosedBy? enclosedBy)?  $default,) {final _that = this;
switch (_that) {
case _DartdocEntry() when $default != null:
return $default(_that.name,_that.qualifiedName,_that.href,_that.type,_that.description,_that.enclosedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DartdocEntry implements DartdocEntry {
   _DartdocEntry({required this.name, @JsonKey(name: 'qualifiedName') required this.qualifiedName, required this.href, @JsonKey(fromJson: _typeFromJson, name: 'kind') required this.type, @JsonKey(name: 'desc') required this.description, @JsonKey(required: false, name: 'enclosedBy') required this.enclosedBy});
  factory _DartdocEntry.fromJson(Map<String, dynamic> json) => _$DartdocEntryFromJson(json);

@override final  String name;
@override@JsonKey(name: 'qualifiedName') final  String qualifiedName;
@override final  String href;
@override@JsonKey(fromJson: _typeFromJson, name: 'kind') final  String type;
@override@JsonKey(name: 'desc') final  String description;
@override@JsonKey(required: false, name: 'enclosedBy') final  DartdocEnclosedBy? enclosedBy;

/// Create a copy of DartdocEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartdocEntryCopyWith<_DartdocEntry> get copyWith => __$DartdocEntryCopyWithImpl<_DartdocEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartdocEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartdocEntry&&(identical(other.name, name) || other.name == name)&&(identical(other.qualifiedName, qualifiedName) || other.qualifiedName == qualifiedName)&&(identical(other.href, href) || other.href == href)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.enclosedBy, enclosedBy) || other.enclosedBy == enclosedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,qualifiedName,href,type,description,enclosedBy);

@override
String toString() {
  return 'DartdocEntry(name: $name, qualifiedName: $qualifiedName, href: $href, type: $type, description: $description, enclosedBy: $enclosedBy)';
}


}

/// @nodoc
abstract mixin class _$DartdocEntryCopyWith<$Res> implements $DartdocEntryCopyWith<$Res> {
  factory _$DartdocEntryCopyWith(_DartdocEntry value, $Res Function(_DartdocEntry) _then) = __$DartdocEntryCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'qualifiedName') String qualifiedName, String href,@JsonKey(fromJson: _typeFromJson, name: 'kind') String type,@JsonKey(name: 'desc') String description,@JsonKey(required: false, name: 'enclosedBy') DartdocEnclosedBy? enclosedBy
});


@override $DartdocEnclosedByCopyWith<$Res>? get enclosedBy;

}
/// @nodoc
class __$DartdocEntryCopyWithImpl<$Res>
    implements _$DartdocEntryCopyWith<$Res> {
  __$DartdocEntryCopyWithImpl(this._self, this._then);

  final _DartdocEntry _self;
  final $Res Function(_DartdocEntry) _then;

/// Create a copy of DartdocEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? qualifiedName = null,Object? href = null,Object? type = null,Object? description = null,Object? enclosedBy = freezed,}) {
  return _then(_DartdocEntry(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qualifiedName: null == qualifiedName ? _self.qualifiedName : qualifiedName // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enclosedBy: freezed == enclosedBy ? _self.enclosedBy : enclosedBy // ignore: cast_nullable_to_non_nullable
as DartdocEnclosedBy?,
  ));
}

/// Create a copy of DartdocEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DartdocEnclosedByCopyWith<$Res>? get enclosedBy {
    if (_self.enclosedBy == null) {
    return null;
  }

  return $DartdocEnclosedByCopyWith<$Res>(_self.enclosedBy!, (value) {
    return _then(_self.copyWith(enclosedBy: value));
  });
}
}


/// @nodoc
mixin _$DartdocEnclosedBy {

 String get name;@JsonKey(fromJson: _typeFromJson, name: 'kind') String get type;
/// Create a copy of DartdocEnclosedBy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartdocEnclosedByCopyWith<DartdocEnclosedBy> get copyWith => _$DartdocEnclosedByCopyWithImpl<DartdocEnclosedBy>(this as DartdocEnclosedBy, _$identity);

  /// Serializes this DartdocEnclosedBy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartdocEnclosedBy&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString() {
  return 'DartdocEnclosedBy(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $DartdocEnclosedByCopyWith<$Res>  {
  factory $DartdocEnclosedByCopyWith(DartdocEnclosedBy value, $Res Function(DartdocEnclosedBy) _then) = _$DartdocEnclosedByCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(fromJson: _typeFromJson, name: 'kind') String type
});




}
/// @nodoc
class _$DartdocEnclosedByCopyWithImpl<$Res>
    implements $DartdocEnclosedByCopyWith<$Res> {
  _$DartdocEnclosedByCopyWithImpl(this._self, this._then);

  final DartdocEnclosedBy _self;
  final $Res Function(DartdocEnclosedBy) _then;

/// Create a copy of DartdocEnclosedBy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DartdocEnclosedBy].
extension DartdocEnclosedByPatterns on DartdocEnclosedBy {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DartdocEnclosedBy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DartdocEnclosedBy() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DartdocEnclosedBy value)  $default,){
final _that = this;
switch (_that) {
case _DartdocEnclosedBy():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DartdocEnclosedBy value)?  $default,){
final _that = this;
switch (_that) {
case _DartdocEnclosedBy() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(fromJson: _typeFromJson, name: 'kind')  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DartdocEnclosedBy() when $default != null:
return $default(_that.name,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(fromJson: _typeFromJson, name: 'kind')  String type)  $default,) {final _that = this;
switch (_that) {
case _DartdocEnclosedBy():
return $default(_that.name,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(fromJson: _typeFromJson, name: 'kind')  String type)?  $default,) {final _that = this;
switch (_that) {
case _DartdocEnclosedBy() when $default != null:
return $default(_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DartdocEnclosedBy implements DartdocEnclosedBy {
   _DartdocEnclosedBy({required this.name, @JsonKey(fromJson: _typeFromJson, name: 'kind') required this.type});
  factory _DartdocEnclosedBy.fromJson(Map<String, dynamic> json) => _$DartdocEnclosedByFromJson(json);

@override final  String name;
@override@JsonKey(fromJson: _typeFromJson, name: 'kind') final  String type;

/// Create a copy of DartdocEnclosedBy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartdocEnclosedByCopyWith<_DartdocEnclosedBy> get copyWith => __$DartdocEnclosedByCopyWithImpl<_DartdocEnclosedBy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartdocEnclosedByToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartdocEnclosedBy&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString() {
  return 'DartdocEnclosedBy(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$DartdocEnclosedByCopyWith<$Res> implements $DartdocEnclosedByCopyWith<$Res> {
  factory _$DartdocEnclosedByCopyWith(_DartdocEnclosedBy value, $Res Function(_DartdocEnclosedBy) _then) = __$DartdocEnclosedByCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(fromJson: _typeFromJson, name: 'kind') String type
});




}
/// @nodoc
class __$DartdocEnclosedByCopyWithImpl<$Res>
    implements _$DartdocEnclosedByCopyWith<$Res> {
  __$DartdocEnclosedByCopyWithImpl(this._self, this._then);

  final _DartdocEnclosedBy _self;
  final $Res Function(_DartdocEnclosedBy) _then;

/// Create a copy of DartdocEnclosedBy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,}) {
  return _then(_DartdocEnclosedBy(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
