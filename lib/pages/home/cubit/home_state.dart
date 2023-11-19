part of 'home_cubit.dart';

class HomeState extends Equatable
    with WithSideEffects<HomeState, HomeSideEffect> {
  @override
  final List<HomeSideEffect> sideEffects;

  final HomeTab selectedTab;

  const HomeState({
    this.sideEffects = const [],
    required this.selectedTab,
  });

  @override
  List<Object?> get props => [sideEffects, selectedTab];

  @override
  HomeState withSideEffects(List<HomeSideEffect> sideEffects) =>
      copyWith(sideEffects: sideEffects);

  HomeState copyWith({
    List<HomeSideEffect>? sideEffects,
    HomeTab? selectedTab,
  }) =>
      HomeState(
        sideEffects: sideEffects ?? this.sideEffects,
        selectedTab: selectedTab ?? this.selectedTab,
      );
}
