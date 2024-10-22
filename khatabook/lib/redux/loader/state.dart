


import 'dart:isolate';

class LoaderState{
  bool isLoading;
  bool isSaving;


  LoaderState({
    required this.isLoading,
    required this.isSaving
  });

  factory LoaderState.initialState()=>LoaderState( 
      isLoading: false,
      isSaving: false,
  );

  LoaderState copyWith({
    bool? isLoading,
    bool? isSaving
  })=>LoaderState( 
    isLoading: isLoading ?? this.isLoading,
    isSaving:  isSaving ?? this.isSaving
  );
}