part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoadingState extends MainState {}

class MainLoadedState extends MainState {}
