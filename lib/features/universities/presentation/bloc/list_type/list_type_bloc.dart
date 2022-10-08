import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_type_event.dart';

part 'list_type_state.dart';

class ListTypeBloc extends Bloc<ListTypeEvent, ListTypeState> {

  ListTypeBloc()
      : super(ListTypeInitialState(0)) {
    on<ChangeListTypeEvent>((event, emit) async {
      emit(ListTypeSuccessfulState(event.type));
    });
  }
}
