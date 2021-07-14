@extends('layouts.app')

@section('title','Students | SMS')

@section('content')
<div class="panel panel-default">
		<div class="panel-heading" id="panel_heading">
			<samp class="glyphicon glyphicon-education"></samp> Students</samp>
		</div>
		<div class="panel-body">
			<div>
				<a href="{{route('management')}}">Management</a> /
				<a href="{{route('timetable')}}">Timetables</a>
			</div>
			<div>
			
		
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


				@foreach($timetables as $timetable)
					<?php 
					if (!empty($_REQUEST["id"])) {
					$id = $timetable->timetable_id; 
					$class = $timetable->class_id; 
					$teacher_id = $timetable->teacher_id; 
					$subject_id = $timetable->subject_id; 
					$day = $timetable->day; 
					$time = $timetable->time; 
					$time_hours = $time[0].$time[1]; 
					$time_minutes = $time[3].$time[4]; 
					}else{
						$class = ''; 
						$teacher_id = ''; 
						$subject_id = ''; 
						$day = ''; 
						$time_hours = ''; 
						$time_minutes = ''; 
					}
					?>
				@endforeach
				<form class="inner-form" action="{{route('edit_timetable_submit')}}" method="post">
					@csrf
					<input type="hidden" name="id" value="{{$id}}" id="">
				
				<div>
					<label>Teachers: </label>
					<select class="form-control" name="teacher_id" required>
						<option value="">Choose Teacher</option>
						@foreach($teachers as $teacher)
						@if($teacher_id==$teacher->teacher_id)
						<option value="{{$teacher->teacher_id}}" selected>{{$teacher->fname}} {{$teacher->sname}} {{$teacher->tname}}</option>
						@else
						<option value="{{$teacher->teacher_id}}">{{$teacher->fname}} {{$teacher->sname}} {{$teacher->tname}}</option>
						@endif
						@endforeach
					</select>
				</div>
				<div>
				
					<label>Subject: </label>
					<select class="form-control" name="subject_id" required>
						<option value="">Choose Subject</option>
						@foreach($subjects as $subject)
						@if($subject_id==$subject->subject_id)
						<option value="{{$subject->subject_id}}" selected>{{$subject->name}}</option>
						@else
						<option value="{{$subject->subject_id}}">{{$subject->name}}</option>
						@endif
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
						@if($day==$days[$x])
							<option value="<?php echo $days[$x]; ?>" selected><?php echo $days[$x]; ?></option>
						@else
							<option value="<?php echo $days[$x]; ?>"><?php echo $days[$x]; ?></option>
						@endif
						<?php } ?>
					</select>
				</div>
					<div>
						<label for="">Class: </label>
						<select name="class_id" class="form-control" id="" required>
							<option value="">Choose Class/Form</option>
							@foreach($classes as $classx)
							@if($class==$classx->class_id)
							<option value="{{$classx->class_id}}" selected>{{$classx->name}}</option>
							@else
							<option value="{{$classx->class_id}}">{{$classx->name}}</option>
							@endif
							@endforeach
						</select>
					</div>
				<div id="time">
					<select class="form-control" name="time_hours" required>
						<option value="">Hour</option>
						<?php for($x=8;$x<=18;$x++){ 
							if(($time_hours+0)==$x){
							if(strlen($x)==1){?>
							<option value="<?php echo "0".$x; ?>" selected><?php echo "0".$x; ?></option>
							<?php }else{ ?>
							<option value="<?php echo $x; ?>" selected><?php echo $x; ?></option>
						<?php  }
						}else{
							if(strlen($x)==1){?>
								<option value="<?php echo "0".$x; ?>"><?php echo "0".$x; ?></option>
								<?php }else{ ?>
								<option value="<?php echo $x; ?>"><?php echo $x; ?></option>
							<?php  }
						}
					} ?>
					</select>
					<select class="form-control" name="time_minutes" required>
						<option value="">Minutes</option>
						<?php for($x=0;$x<=59;$x++){ 
							if(($time_minutes+0)==$x){
							if(strlen($x)==1){?>
							<option value="<?php echo "0".$x; ?>" selected><?php echo "0".$x; ?></option>
							<?php }else{ ?>
							<option value="<?php echo $x; ?>" selected><?php echo $x; ?></option>
						<?php  }
					}else{
						if(strlen($x)==1){?>
							<option value="<?php echo "0".$x; ?>"><?php echo "0".$x; ?></option>
							<?php }else{ ?>
							<option value="<?php echo $x; ?>"><?php echo $x; ?></option>
						<?php  }
					}
					} ?>
					</select>
				</div>
				<style type="text/css">
					#time select{
						display: inline-block;
						width:49.0%;
					}
				</style>
					<div>
						<input class="btn btn-primary" type="submit" name="submit" value="Submit">
					</div>
				</form>
			</div>
		</div>
	</div>
@endsection
