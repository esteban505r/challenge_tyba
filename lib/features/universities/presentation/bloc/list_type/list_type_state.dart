part of 'list_type_bloc.dart';

abstract class ListTypeState{
  int listType;
  ListTypeState([this.listType = 0]);
}

class ListTypeInitialState extends ListTypeState{
  ListTypeInitialState(int listType):super(listType);
}

class ListTypeSuccessfulState extends ListTypeState{
  int listType;
  ListTypeSuccessfulState (this.listType):super(listType);
}
