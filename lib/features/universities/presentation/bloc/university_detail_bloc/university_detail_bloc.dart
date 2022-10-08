import 'package:flutter_bloc/flutter_bloc.dart';

part 'university_detail_event.dart';

part 'university_detail_state.dart';

class UniversityDetailBloc
    extends Bloc<UniversityDetailEvent, UniversityDetailState> {
  UniversityDetailBloc() : super(UniversityDetailInitialState(null)) {
    on<ChangeUniversityImageEvent>((event, emit) async {
      emit(UniversityDetailSuccessfulState(event.path));
    });
  }
}
