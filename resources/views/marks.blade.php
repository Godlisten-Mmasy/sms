@extends('layouts.app')

@section('title','Marks | SMS')

@section('content')
	<div class="panel panel-default">
		<div class="panel-heading" id="panel_heading">
			<samp class="glyphicon glyphicon-scale"></samp> Marks
		</div>
		<div class="panel-body">
		<form class="inner-form" method="post" action="{{route('marks_students')}}">
		@csrf
		<div>
			<label>Class: </label>
			
			<select name="class" class="form-control" id="">
				<option value="">Choose Class/Form</option>
				@foreach($classes as $class)
				<option value="{{$class->class_id}}">{{$class->name}}</option>
				@endforeach
			</select>
		</div>
		<div>
			<label>Subject: </label>
			
			<select name="subject" class="form-control" id="">
				<option value="">Choose Subject</option>
				@foreach($subjects as $subject)
				<option value="{{$subject->subject_id}}">{{$subject->name}}</option>
				@endforeach
			</select>
		</div>
		<div>
			<input class="btn btn-primary" name="submit_marks" type="submit" value="Next">
		</div>
		</form>
		</div>
	</div>
@endsection			
