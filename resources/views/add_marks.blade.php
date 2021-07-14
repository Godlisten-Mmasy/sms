@extends('layouts.app')

@section('title','Marks | SMS')

@section('content')
	<div class="panel panel-default">
		<div class="panel-heading" id="panel_heading">
			<samp class="glyphicon glyphicon-scale"></samp> Marks
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
			@if (count($alerts))
				<div class="alert alert-success">
					{{ $alerts[0] }}
				</div>
			@endif
		<?php 
		$sn = 0; 
		foreach($classes as $class){
			$class->name = $class->name;
			$class->class_id = $class->class_id;
		}

		foreach($subjects as $subject){
			$subject->name = $subject->name;
			$subject->subject_id = $subject->subject_id;
		}
		?>

		<div style="padding:10px;">
			<font size="3">
				<a href="{{route('marks')}}">Marks</a>
			/ <samp>{{$class->name}}</samp>
			/ <samp>{{$subject->name}}</samp>
			</font>
		</div>

		<div>
			<form method="post" action="{{route('marks_students_submit')}}">

			<input type="" value="{{$class->class_id}}" name="class" hidden>
			<input type="" value="{{$subject->subject_id}}" name="subject" hidden>
			@csrf
			<table width="100%" class="table-striped" border="1">
				<tr>
					<th colspan="5"><center>{{$class->name}} | {{$subject->name}}</center></th>
				</tr>
				<tr>
					<td colspan="6">

					<input style="float:right;" class="btn btn-primary" type="submit" value="submit">
					 </td>
				</tr>
				<tr>
					<th>SN.</th>
					<th colspan="3">Student Name</th>
					<th>Score</th>
				</tr>
				
				<?php
				$result_array = array();
				if (count($results)>0) {
					foreach ($results as $result) {
						$result_array[$result->student_id] = $result->score;
					}
				}
				?>
				@foreach($students as $student)
				<tr>
					<td><?php echo $sn+=1; ?></td>
					<td>{{$student->fname}}</td>
					<td>{{$student->sname}}</td>
					<td>{{$student->tname}}</td>
					<td>

						<input class="form-control" type="number" min="0" max="100" value="<?php echo @$result_array[$student->student_id]; ?>" name="score_{{$sn}}" placeholder="Score" required>
						<input type="" value="{{$student->student_id}}" name="student_id_{{$sn}}" hidden>
					</td>
				</tr>
				@endforeach
				<tr>
					<td colspan="6">

					<input name="student_num" type="text" value="{{$sn}}" hidden>
					<input style="float:right;" class="btn btn-primary" type="submit" value="submit">
					 </td>
				</tr>
			</table>
			</form>
		</div>
		</div>
	</div>
@endsection			
