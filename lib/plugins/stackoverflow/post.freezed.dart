// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StackOverflowPost {

 StackOverflowPostOwner get owner; int get score; int get lastActivityDate; int get creationDate; int get questionId; String get bodyMarkdown; String get link; String get title;
/// Create a copy of StackOverflowPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StackOverflowPostCopyWith<StackOverflowPost> get copyWith => _$StackOverflowPostCopyWithImpl<StackOverflowPost>(this as StackOverflowPost, _$identity);

  /// Serializes this StackOverflowPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StackOverflowPost&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.score, score) || other.score == score)&&(identical(other.lastActivityDate, lastActivityDate) || other.lastActivityDate == lastActivityDate)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.bodyMarkdown, bodyMarkdown) || other.bodyMarkdown == bodyMarkdown)&&(identical(other.link, link) || other.link == link)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,owner,score,lastActivityDate,creationDate,questionId,bodyMarkdown,link,title);

@override
String toString() {
  return 'StackOverflowPost(owner: $owner, score: $score, lastActivityDate: $lastActivityDate, creationDate: $creationDate, questionId: $questionId, bodyMarkdown: $bodyMarkdown, link: $link, title: $title)';
}


}

/// @nodoc
abstract mixin class $StackOverflowPostCopyWith<$Res>  {
  factory $StackOverflowPostCopyWith(StackOverflowPost value, $Res Function(StackOverflowPost) _then) = _$StackOverflowPostCopyWithImpl;
@useResult
$Res call({
 StackOverflowPostOwner owner, int score, int lastActivityDate, int creationDate, int questionId, String bodyMarkdown, String link, String title
});


$StackOverflowPostOwnerCopyWith<$Res> get owner;

}
/// @nodoc
class _$StackOverflowPostCopyWithImpl<$Res>
    implements $StackOverflowPostCopyWith<$Res> {
  _$StackOverflowPostCopyWithImpl(this._self, this._then);

  final StackOverflowPost _self;
  final $Res Function(StackOverflowPost) _then;

/// Create a copy of StackOverflowPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? owner = null,Object? score = null,Object? lastActivityDate = null,Object? creationDate = null,Object? questionId = null,Object? bodyMarkdown = null,Object? link = null,Object? title = null,}) {
  return _then(_self.copyWith(
owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as StackOverflowPostOwner,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,lastActivityDate: null == lastActivityDate ? _self.lastActivityDate : lastActivityDate // ignore: cast_nullable_to_non_nullable
as int,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as int,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,bodyMarkdown: null == bodyMarkdown ? _self.bodyMarkdown : bodyMarkdown // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of StackOverflowPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StackOverflowPostOwnerCopyWith<$Res> get owner {
  
  return $StackOverflowPostOwnerCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [StackOverflowPost].
extension StackOverflowPostPatterns on StackOverflowPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StackOverflowPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StackOverflowPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StackOverflowPost value)  $default,){
final _that = this;
switch (_that) {
case _StackOverflowPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StackOverflowPost value)?  $default,){
final _that = this;
switch (_that) {
case _StackOverflowPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StackOverflowPostOwner owner,  int score,  int lastActivityDate,  int creationDate,  int questionId,  String bodyMarkdown,  String link,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StackOverflowPost() when $default != null:
return $default(_that.owner,_that.score,_that.lastActivityDate,_that.creationDate,_that.questionId,_that.bodyMarkdown,_that.link,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StackOverflowPostOwner owner,  int score,  int lastActivityDate,  int creationDate,  int questionId,  String bodyMarkdown,  String link,  String title)  $default,) {final _that = this;
switch (_that) {
case _StackOverflowPost():
return $default(_that.owner,_that.score,_that.lastActivityDate,_that.creationDate,_that.questionId,_that.bodyMarkdown,_that.link,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StackOverflowPostOwner owner,  int score,  int lastActivityDate,  int creationDate,  int questionId,  String bodyMarkdown,  String link,  String title)?  $default,) {final _that = this;
switch (_that) {
case _StackOverflowPost() when $default != null:
return $default(_that.owner,_that.score,_that.lastActivityDate,_that.creationDate,_that.questionId,_that.bodyMarkdown,_that.link,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StackOverflowPost implements StackOverflowPost {
   _StackOverflowPost({required this.owner, required this.score, required this.lastActivityDate, required this.creationDate, required this.questionId, required this.bodyMarkdown, required this.link, required this.title});
  factory _StackOverflowPost.fromJson(Map<String, dynamic> json) => _$StackOverflowPostFromJson(json);

@override final  StackOverflowPostOwner owner;
@override final  int score;
@override final  int lastActivityDate;
@override final  int creationDate;
@override final  int questionId;
@override final  String bodyMarkdown;
@override final  String link;
@override final  String title;

/// Create a copy of StackOverflowPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StackOverflowPostCopyWith<_StackOverflowPost> get copyWith => __$StackOverflowPostCopyWithImpl<_StackOverflowPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StackOverflowPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StackOverflowPost&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.score, score) || other.score == score)&&(identical(other.lastActivityDate, lastActivityDate) || other.lastActivityDate == lastActivityDate)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.bodyMarkdown, bodyMarkdown) || other.bodyMarkdown == bodyMarkdown)&&(identical(other.link, link) || other.link == link)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,owner,score,lastActivityDate,creationDate,questionId,bodyMarkdown,link,title);

@override
String toString() {
  return 'StackOverflowPost(owner: $owner, score: $score, lastActivityDate: $lastActivityDate, creationDate: $creationDate, questionId: $questionId, bodyMarkdown: $bodyMarkdown, link: $link, title: $title)';
}


}

/// @nodoc
abstract mixin class _$StackOverflowPostCopyWith<$Res> implements $StackOverflowPostCopyWith<$Res> {
  factory _$StackOverflowPostCopyWith(_StackOverflowPost value, $Res Function(_StackOverflowPost) _then) = __$StackOverflowPostCopyWithImpl;
@override @useResult
$Res call({
 StackOverflowPostOwner owner, int score, int lastActivityDate, int creationDate, int questionId, String bodyMarkdown, String link, String title
});


@override $StackOverflowPostOwnerCopyWith<$Res> get owner;

}
/// @nodoc
class __$StackOverflowPostCopyWithImpl<$Res>
    implements _$StackOverflowPostCopyWith<$Res> {
  __$StackOverflowPostCopyWithImpl(this._self, this._then);

  final _StackOverflowPost _self;
  final $Res Function(_StackOverflowPost) _then;

/// Create a copy of StackOverflowPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? owner = null,Object? score = null,Object? lastActivityDate = null,Object? creationDate = null,Object? questionId = null,Object? bodyMarkdown = null,Object? link = null,Object? title = null,}) {
  return _then(_StackOverflowPost(
owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as StackOverflowPostOwner,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,lastActivityDate: null == lastActivityDate ? _self.lastActivityDate : lastActivityDate // ignore: cast_nullable_to_non_nullable
as int,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as int,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,bodyMarkdown: null == bodyMarkdown ? _self.bodyMarkdown : bodyMarkdown // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of StackOverflowPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StackOverflowPostOwnerCopyWith<$Res> get owner {
  
  return $StackOverflowPostOwnerCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// @nodoc
mixin _$StackOverflowPostOwner {

 String get displayName; String get link;
/// Create a copy of StackOverflowPostOwner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StackOverflowPostOwnerCopyWith<StackOverflowPostOwner> get copyWith => _$StackOverflowPostOwnerCopyWithImpl<StackOverflowPostOwner>(this as StackOverflowPostOwner, _$identity);

  /// Serializes this StackOverflowPostOwner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StackOverflowPostOwner&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,link);

@override
String toString() {
  return 'StackOverflowPostOwner(displayName: $displayName, link: $link)';
}


}

/// @nodoc
abstract mixin class $StackOverflowPostOwnerCopyWith<$Res>  {
  factory $StackOverflowPostOwnerCopyWith(StackOverflowPostOwner value, $Res Function(StackOverflowPostOwner) _then) = _$StackOverflowPostOwnerCopyWithImpl;
@useResult
$Res call({
 String displayName, String link
});




}
/// @nodoc
class _$StackOverflowPostOwnerCopyWithImpl<$Res>
    implements $StackOverflowPostOwnerCopyWith<$Res> {
  _$StackOverflowPostOwnerCopyWithImpl(this._self, this._then);

  final StackOverflowPostOwner _self;
  final $Res Function(StackOverflowPostOwner) _then;

/// Create a copy of StackOverflowPostOwner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? link = null,}) {
  return _then(_self.copyWith(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StackOverflowPostOwner].
extension StackOverflowPostOwnerPatterns on StackOverflowPostOwner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StackOverflowPostOwner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StackOverflowPostOwner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StackOverflowPostOwner value)  $default,){
final _that = this;
switch (_that) {
case _StackOverflowPostOwner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StackOverflowPostOwner value)?  $default,){
final _that = this;
switch (_that) {
case _StackOverflowPostOwner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String displayName,  String link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StackOverflowPostOwner() when $default != null:
return $default(_that.displayName,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String displayName,  String link)  $default,) {final _that = this;
switch (_that) {
case _StackOverflowPostOwner():
return $default(_that.displayName,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String displayName,  String link)?  $default,) {final _that = this;
switch (_that) {
case _StackOverflowPostOwner() when $default != null:
return $default(_that.displayName,_that.link);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StackOverflowPostOwner implements StackOverflowPostOwner {
   _StackOverflowPostOwner({required this.displayName, required this.link});
  factory _StackOverflowPostOwner.fromJson(Map<String, dynamic> json) => _$StackOverflowPostOwnerFromJson(json);

@override final  String displayName;
@override final  String link;

/// Create a copy of StackOverflowPostOwner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StackOverflowPostOwnerCopyWith<_StackOverflowPostOwner> get copyWith => __$StackOverflowPostOwnerCopyWithImpl<_StackOverflowPostOwner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StackOverflowPostOwnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StackOverflowPostOwner&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,link);

@override
String toString() {
  return 'StackOverflowPostOwner(displayName: $displayName, link: $link)';
}


}

/// @nodoc
abstract mixin class _$StackOverflowPostOwnerCopyWith<$Res> implements $StackOverflowPostOwnerCopyWith<$Res> {
  factory _$StackOverflowPostOwnerCopyWith(_StackOverflowPostOwner value, $Res Function(_StackOverflowPostOwner) _then) = __$StackOverflowPostOwnerCopyWithImpl;
@override @useResult
$Res call({
 String displayName, String link
});




}
/// @nodoc
class __$StackOverflowPostOwnerCopyWithImpl<$Res>
    implements _$StackOverflowPostOwnerCopyWith<$Res> {
  __$StackOverflowPostOwnerCopyWithImpl(this._self, this._then);

  final _StackOverflowPostOwner _self;
  final $Res Function(_StackOverflowPostOwner) _then;

/// Create a copy of StackOverflowPostOwner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? link = null,}) {
  return _then(_StackOverflowPostOwner(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
