@extends('layouts.app')

@section('title','HOME | SMS')

@section('content')
	<div class="panel panel-default">
		<div class="panel-heading" id="panel_heading">
		<samp class="glyphicon glyphicon-file"></samp> Attendance
		</div>
		<div class="panel panel-body">
			<?php if(empty(@$_REQUEST["class_name"])): ?>
			<ul class="list-group">
				@foreach($classes as $class)
				@if(strtolower($class->name))
				<li class="list-group-item"><a href="<?php echo $_SERVER["PHP_SELF"]; ?>?class_name={{strtoupper($class->name)}}&class_id={{strtoupper($class->class_id)}}">{{strtoupper($class->name)}}</a></li>
				@endif
				@endforeach
			</ul>
			<?php else: ?>
			<!-- <div class="btn btn-group" style="margin-left:;">
				<button class="btn btn-primary">Today</button>
				<button class="btn btn-warning">All</button>
			</div> -->
			<form action="" name="myForm">
			<select class="form-control"  name="attendance_date" id="" onchange="redirectFunc()">
				@if(count($attendance_dates)==0)
				<option value="{{date('Y-m-d')}}">{{date('Y-m-d')}}</option>
				@endif
				@foreach($attendance_dates as $attendance_date)
				@if(date('Y-m-d')!=$attendance_date->attendance_date)
				<option value="{{date('Y-m-d')}}">{{date('Y-m-d')}}</option>
				@endif
				@if($attendance_date->attendance_date==@$_REQUEST["attendance_date"])
				<option value="{{$attendance_date->attendance_date}}" selected >{{$attendance_date->attendance_date}}</option>
				@else
				<option value="{{$attendance_date->attendance_date}}">{{$attendance_date->attendance_date}}</option>
				@endif
				@endforeach
			</select>
			<script>
			function redirectFunc(){
				window.location.replace("<?php echo $_SERVER["PHP_SELF"]; ?>?class_name={{$_REQUEST['class_name']}}&class_id={{$_REQUEST['class_id']}}&attendance_date="+document.forms["myForm"]["attendance_date"].value);
			}
			</script>
			</form>
			<br>
			<center>
			<form action="{{$_SERVER['PHP_SELF']}}?class_name={{$_REQUEST['class_name']}}&class_id={{$_REQUEST['class_id']}}">
			<input type="hidden" name="class_name" value="{{$_REQUEST['class_name']}}">
			<input type="hidden" name="class_id" value="{{$_REQUEST['class_id']}}">
			<table width="100%" class="table-striped" border="1">
			<tr>
				<th scope="col" colspan="5">
					<font size="5"><center>Student Attendance<br>
					@foreach($classes as $class)
					@if(@$_REQUEST["class_id"]==$class->class_id)
						{{strtoupper($class->name)}}
					@endif
					@endforeach
					</center></font>
				</th>
			</tr>
			<tr>
				<th scope="col" colspan="2">
					<?php 
					if (!empty(@$_REQUEST["attendance_date"])) {
						echo $_REQUEST["attendance_date"];
					} else {
						echo date("Y-m-d");
					}
					
					?>
				</th>
				<th scope="col" colspan="2">
				{{$_REQUEST["class_name"]}}
				</th>
			</tr>
			<tr>
				<th scope="col">Name of Student</th>
				<th scope="col">Present</th>
				<th scope="col">Absent</th>
				<th scope="col">Permission</th>
			</tr>
			<?php
			$num = 0;
			foreach ($students as $key => $student) {
				$num++;
			?>
			<tr>
				<td scope="row">{{$student->fname}} {{$student->sname}} {{$student->tname}}</td>
				
				<?php $attendance_val = ""; ?>
				<td>
					@foreach($attendances as $attendance)
						@if($attendance->student_id==$student->student_id && $attendance->attendance_status=="present")
						<?php $attendance_val = $attendance->attendance_status; ?>
						{{$attendance->attendance_status}}
						@endif
					@endforeach
					<input type="radio" name="attendance_{{$student->student_id}}" value="present"
					<?php if($attendance_val=="present"){
					echo "checked";
					}?> 
					>
				</td>
				<td>
					@foreach($attendances as $attendance)
						@if($attendance->student_id==$student->student_id && $attendance->attendance_status=="absent")
						<?php $attendance_val = $attendance->attendance_status; ?>
						{{$attendance->attendance_status}}
						@endif
					@endforeach
					<input type="radio" name="attendance_{{$student->student_id}}" value="absent"
					<?php if($attendance_val=="absent"){
					echo "checked";
					}?>
					>
				</td>
				<td>
					@foreach($attendances as $attendance)
						@if($attendance->student_id==$student->student_id && $attendance->attendance_status=="permission")
						<?php $attendance_val = $attendance->attendance_status; ?>
						{{$attendance->attendance_status}}
						@endif
					@endforeach
					<input type="radio" name="attendance_{{$student->student_id}}" value="permission"
					<?php if($attendance_val=="permission"){
					echo "checked";
					}?>
					>
				</td>
			</tr>
			<?php
			}
			?>
			<tr>
				<td colspan="2"><input class="btn btn-primary" type="submit" value="Submit"></td>
			</tr>
			</table>
			{{$students->links()}}
			</form>
			</center>
			<?php endif ?>
		</div>
	</div>
@endsection			
