import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {});
  }

  _onGetAllData(MainInitEvent event, Emitter<MainState> emit) {
    emit(MainLoadingState());
  }
}