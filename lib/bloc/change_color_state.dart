part of 'change_color_bloc.dart';

sealed class ChangeColorState extends Equatable {
  const ChangeColorState();

  @override
  List<Object> get props => [];
}

final class ChangeColorInitial extends ChangeColorState {}

class ShowUpdatedColor extends ChangeColorState {
  final Color color;

  const ShowUpdatedColor({required this.color});

  @override
  List<Object> get props => [color];
}
