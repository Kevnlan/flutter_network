// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CustomerTearOff {
  const _$CustomerTearOff();

// ignore: unused_element
  _Customer call(
      {String firstname, String lastname, String phone, String email}) {
    return _Customer(
      firstname: firstname,
      lastname: lastname,
      phone: phone,
      email: email,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Customer = _$CustomerTearOff();

/// @nodoc
mixin _$Customer {
  String get firstname;
  String get lastname;
  String get phone;
  String get email;

  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res>;
  $Res call({String firstname, String lastname, String phone, String email});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res> implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  final Customer _value;
  // ignore: unused_field
  final $Res Function(Customer) _then;

  @override
  $Res call({
    Object firstname = freezed,
    Object lastname = freezed,
    Object phone = freezed,
    Object email = freezed,
  }) {
    return _then(_value.copyWith(
      firstname: firstname == freezed ? _value.firstname : firstname as String,
      lastname: lastname == freezed ? _value.lastname : lastname as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
abstract class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) then) =
      __$CustomerCopyWithImpl<$Res>;
  @override
  $Res call({String firstname, String lastname, String phone, String email});
}

/// @nodoc
class __$CustomerCopyWithImpl<$Res> extends _$CustomerCopyWithImpl<$Res>
    implements _$CustomerCopyWith<$Res> {
  __$CustomerCopyWithImpl(_Customer _value, $Res Function(_Customer) _then)
      : super(_value, (v) => _then(v as _Customer));

  @override
  _Customer get _value => super._value as _Customer;

  @override
  $Res call({
    Object firstname = freezed,
    Object lastname = freezed,
    Object phone = freezed,
    Object email = freezed,
  }) {
    return _then(_Customer(
      firstname: firstname == freezed ? _value.firstname : firstname as String,
      lastname: lastname == freezed ? _value.lastname : lastname as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
class _$_Customer extends _Customer {
  const _$_Customer({this.firstname, this.lastname, this.phone, this.email})
      : super._();

  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String phone;
  @override
  final String email;

  @override
  String toString() {
    return 'Customer(firstname: $firstname, lastname: $lastname, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Customer &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$CustomerCopyWith<_Customer> get copyWith =>
      __$CustomerCopyWithImpl<_Customer>(this, _$identity);
}

abstract class _Customer extends Customer {
  const _Customer._() : super._();
  const factory _Customer(
      {String firstname,
      String lastname,
      String phone,
      String email}) = _$_Customer;

  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get phone;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$CustomerCopyWith<_Customer> get copyWith;
}
