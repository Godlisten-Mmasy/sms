@extends('layouts.app')

@section('title','Timetable | SMS')

@section('content')
	<div class="panel panel-default">
		<div class="panel-heading" id="panel_heading">
		<samp><samp class="glyphicon glyphicon-scale"></samp> Add Timetable</samp>
		</div>
		
		@if (session('error'))
				<div class="alert alert-danger">
					{{ session('error') }}
				</div>
			@endif
			@if (session('success'))
				<div class="alert alert-success">
					{{ session('success') }}
				</div>
			@endif
		<div class="panel-body">

		
		@if (!empty($alerts['error']))
				<div class="alert alert-danger">
					{{ $alerts['error'] }}
				</div>
			@endif
		
		@if (!empty($alerts['success']))
			<div class="alert alert-success">
				{{ $alerts['success'] }}
			</div>
		@endif
		<div>
			<form method="post" action="{{route('add_timetable_submit')}}" class="inner-form">
				@csrf

				
				<div>
					<label>Teachers: </label>
					<select class="form-control" name="teacher_id" required>
						<option value="">Choose Teacher</option>
						@foreach($teachers as $teacher)
						<option value="{{$teacher->teacher_id}}">{{$teacher->fname}} {{$teacher->sname}} {{$teacher->tname}}</option>
						@endforeach
					</select>
				</div>
				<div>
				
					<label>Subject: </label>
					<select class="form-control" name="subject_id" required>
						<option value="">Choose Subject</option>
						@foreach($subjects as $subject)
						<option value="{{$subject->subject_id}}">{{$subject->name}}</option>
						@endforeach
					</select>
				</div>
				<div>
					<label>Day: </label>
					<select class="form-control" name="day" required>
						<option value="">Choose Day</option>
						<?php 
						$days = array("Monday","Tuesday","Wednesday","Thursday","Friday");
						for($x=0;$x<count($days);$x++){ ?>
							<option value="<?php echo $days[$x]; ?>"><?php echo $days[$x]; ?></option>
						<?php } ?>
					</select>
				</div>
				<div>
					<label>Class: </label>
					<select class="form-control" name="class_id" required>
						<option value="">Choose Class</option>
						@foreach($classes as $class)
						<option value="{{$class->class_id}}">{{$class->name}}</option>
						@endforeach
						
					</select>
				</div>
				<div id="time">
					<select class="form-control" name="time_hours" required>
						<option value="">Hour</option>
						<?php for($x=8;$x<=18;$x++){ if(strlen($x)==1){?>
							<option value="<?php echo "0".$x; ?>"><?php echo "0".$x; ?></option>
							<?php }else{ ?>
							<option value="<?php echo $x; ?>"><?php echo $x; ?></option>
						<?php  }} ?>
					</select>
					<select class="form-control" name="time_minutes" required>
						<option value="">Minutes</option>
						<?php for($x=0;$x<=59;$x++){ if(strlen($x)==1){?>
							<option value="<?php echo "0".$x; ?>"><?php echo "0".$x; ?></option>
							<?php }else{ ?>
							<option value="<?php echo $x; ?>"><?php echo $x; ?></option>
						<?php  }} ?>
					</select>
				</div>
				<style type="text/css">
					#time select{
						display: inline-block;
						width:49.0%;
					}
				</style>
				<div>
					<input class="btn btn-primary" type="submit" value="Submit">
				</div>
				</form>
		</div>
		</div>
	</div>
@endsection			
