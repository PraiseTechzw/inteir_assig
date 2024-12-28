import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NameChanged extends FormEvent {
  final String name;

  NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class EmailChanged extends FormEvent {
  final String email;

  EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PhoneChanged extends FormEvent {
  final String phone;

  PhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class GenderChanged extends FormEvent {
  final String gender;

  GenderChanged(this.gender);

  @override
  List<Object?> get props => [gender];
}

class CountryChanged extends FormEvent {
  final String country;

  CountryChanged(this.country);

  @override
  List<Object?> get props => [country];
}

class StateChanged extends FormEvent {
  final String state;

  StateChanged(this.state);

  @override
  List<Object?> get props => [state];
}

class CityChanged extends FormEvent {
  final String city;

  CityChanged(this.city);

  @override
  List<Object?> get props => [city];
}

class FormSubmitted extends FormEvent {}
