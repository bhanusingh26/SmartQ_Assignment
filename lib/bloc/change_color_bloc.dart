import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'change_color_event.dart';
part 'change_color_state.dart';

class ChangeColorBloc extends Bloc<ChangeColorEvent, ChangeColorState> {
  ChangeColorBloc() : super(ChangeColorInitial()) {
    on<UpdateNewColor>((event, emit) {
      emit(ShowUpdatedColor(color: event.color));
    });
  }
}
