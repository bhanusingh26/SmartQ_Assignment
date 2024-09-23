part of 'change_color_bloc.dart';

sealed class ChangeColorEvent extends Equatable {
  const ChangeColorEvent();

  @override
  List<Object> get props => [];
}

class UpdateNewColor extends ChangeColorEvent {
  final Color color;

  const UpdateNewColor({required this.color});

  @override
  List<Object> get props => [color];
}
