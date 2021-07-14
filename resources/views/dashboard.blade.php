@extends('layouts.app')

@section('title','Dashboard | SMS')

@section('content')
<div class="panel panel-default">
		<div class="panel-heading" id="panel_heading">
			<samp class="glyphicon glyphicon-dashboard"></samp> Dashboard</samp>
		</div>
		<div class="panel-body">
			<div class="row">
			@if(Auth::user()->role!="Head Master")
				<div class="col-sm-6">
					<table class="table striped well">

					<tr>
					<th colspan="4"><samp class="text-primary">Timetables</samp></th>
					</tr>
					@foreach($timetables as $timetable)
					<tr>
					<td>{{$timetable->name}}</td>
					@foreach($subjects as $subject)
						@if($subject->subject_id==$timetable->subject_id)
						<td>{{$subject->name}}</td>
						@endif
					@endforeach
					<td>{{$timetable->day}}</td>
					<td>{{$timetable->time}}</td>
					</tr>
					@endforeach
					</table>
				</div>
				<div class="col-sm-6">
					<table class="table striped well">
					<tr>
					<th colspan="4"><samp class="text-primary">Your Subjects</samp></th>
					</tr>
					@foreach($timetables as $timetable)
					<tr>
					<td>{{$timetable->name}}</td>
					@foreach($subjects as $subject)
						@if($subject->subject_id==$timetable->subject_id)
						<td>{{$subject->name}}</td>
						@endif
					@endforeach
					<!-- <td>{{$timetable->day}}</td>
					<td>{{$timetable->time}}</td> -->
					</tr>
					@endforeach
					</table>
				</div>
			@endif
			</div>
			<style>
			.mypan{
				margin:1px;
			}
			</style>

		</div>
	</div>
@endsection
