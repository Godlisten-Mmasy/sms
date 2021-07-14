@extends('layouts.app')

@section('title','Reports | SMS')

@section('content')
	<div class="panel panel-default">
		<div class="panel-heading" id="panel_heading">
			<samp class="glyphicon glyphicon-envelope"></samp> Reports
		</div>
		<div class="panel-body">
		<?php if(empty($_REQUEST["class_name"])): ?>
		<ulididid class="list-group">
			@foreach($classes as $class)
			@if(strtolower($class->name))
			<li class="list-group-item"><a href="<?php echo $_SERVER["PHP_SELF"]; ?>?class_name={{strtoupper($class->name)}}&class_id={{strtolower($class->class_id)}}">{{strtoupper($class->name)}}</a></li>
			@endif
			@endforeach
		</ul>
		<?php else: ?>
		<div style="padding:10px;">
			<font size="3">
				<a href="?#">Reports</a>
			> <samp><?php echo $_REQUEST["class_name"]; ?></samp>
			</font>
		</div>

			<table width="100%" class="table-striped" border="1">
				<tr>
					<th>SN</th>
					<th>Name</th>
					@foreach($subjects as $subject)
					<td>{{$subject->name}}</td>
					@endforeach
				</tr>

				<?php $sn = 0; ?>
				@foreach($students as $student)
				<?php $sn++; ?>
				<tr>
					<td>{{$sn}}</td>
					<td>{{$student->fname}} {{$student->sname}} {{$student->tname}}</td>

					@foreach($subjects as $subject)
					<td>

					@foreach($results as $result)
					@if($subject->subject_id==$result->subject_id && $result->student_id==$student->student_id)
					@if($result->result_status!="null")
					{{$result->score}}
					@endif
					@endif
					@endforeach

					</td>
					@endforeach
				</tr>
				@endforeach
			</table>
		<?php endif ?>
		</div>
	</div>
@endsection