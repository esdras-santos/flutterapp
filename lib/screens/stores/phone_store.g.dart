// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhoneStore on _PhoneStore, Store {
  final _$buttonEnabledAtom = Atom(name: '_PhoneStore.buttonEnabled');

  @override
  bool get buttonEnabled {
    _$buttonEnabledAtom.context.enforceReadPolicy(_$buttonEnabledAtom);
    _$buttonEnabledAtom.reportObserved();
    return super.buttonEnabled;
  }

  @override
  set buttonEnabled(bool value) {
    _$buttonEnabledAtom.context.conditionallyRunInAction(() {
      super.buttonEnabled = value;
      _$buttonEnabledAtom.reportChanged();
    }, _$buttonEnabledAtom, name: '${_$buttonEnabledAtom.name}_set');
  }

  final _$_PhoneStoreActionController = ActionController(name: '_PhoneStore');

  @override
  void changePhone(dynamic value) {
    final _$actionInfo = _$_PhoneStoreActionController.startAction();
    try {
      return super.changePhone(value);
    } finally {
      _$_PhoneStoreActionController.endAction(_$actionInfo);
    }
  }
}
