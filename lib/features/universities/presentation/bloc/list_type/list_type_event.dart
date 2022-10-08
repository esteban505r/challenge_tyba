
part of 'list_type_bloc.dart';

abstract class ListTypeEvent {}

class ChangeListTypeEvent extends ListTypeEvent{
  final int type;
  ChangeListTypeEvent({this.type = 0});
}

