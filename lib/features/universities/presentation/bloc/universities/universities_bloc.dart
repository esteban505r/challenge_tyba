import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:challenge_tyba/features/universities/data/model/university_model.dart';
import 'package:challenge_tyba/features/universities/domain/usecases/get_university_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'universities_event.dart';

part 'universities_state.dart';

class UniversityBloc extends Bloc<UniversitiesEvent, UniversitiesState> {
  GetUniversitiesUseCase getUniversitiesUseCase;

  UniversityBloc(this.getUniversitiesUseCase)
      : super(UniversitiesInitialState([])) {
    on<GetUniversitiesEvent>((event, emit) async {
      emit(UniversitiesLoading());

      var connectivity = await (Connectivity().checkConnectivity());
      if (connectivity == ConnectivityResult.none) {
        emit(UniversitiesNoConnection());
      } else {
        var result = await getUniversitiesUseCase.call(
            page: event.page, limit: event.limit);
        result.fold((l) {
          emit(UniversitiesErrorState(message: l.message));
        }, (r) => {emit(UniversitiesSuccessfulState(r))});
      }
    });
  }
}
