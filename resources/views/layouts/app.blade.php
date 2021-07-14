<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>@yield('title')</title>

        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}" defer></script>
        
	    @include('layouts.links')
	</head>
    <body class="font-sans antialiased">
	<div class="">
		<div class="row-1">
			<center>
				<font size="45">
					<samp class="glyphicon glyphicon-user main-icon"></samp>
				</font> 
				<br><samp>{{ strtoupper(Auth::user()->name) }}</samp> |
				@if(!empty(Auth::user()->role))
				<samp class="text-default" style="color:rgba(255,255,255,0.5);">{{ strtoupper(Auth::user()->role) }}</samp>
				@else
				<samp class="text-default" style="color:rgba(255,255,255,0.5);">Teacher</samp>
				@endif
			</center>
			<div class="main-top">
				<a href="/settings/passwordchange"><samp class="glyphicon glyphicon-cog"></samp> Settings</a>
			</div>
		</div>
		<div class="row-2">
		<div class="row-2 menu">
			<nav>
				<ul>
					<a href="/dashboard"><li><samp class="glyphicon glyphicon-home"></samp> Home</li></a>

					<a href="/attendance/"><li><samp class="glyphicon glyphicon-file"></samp> Attendance</li></a>

					<a href="/marks/"><li><samp class="glyphicon glyphicon-scale"></samp> Marks/Score</li></a>
					@if(!empty(Auth::user()->role))
					<a href="/management"><li><samp class="glyphicon glyphicon-sunglasses"></samp> Management</li></a>
					@endif
					<a href="/results/"><li><samp class="glyphicon glyphicon-education"></samp> Result</li></a>

					<a href="/reports/"><li><samp class="glyphicon glyphicon-envelope"></samp> Report</li></a>

					<a href="/timetable/"><li><samp class="glyphicon glyphicon-time"></samp> Timetable</li></a>

					<a href="/profile/"><li><samp class="glyphicon glyphicon-user"></samp> Profile</li></a>
					
					<a href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        <li><samp class="glyphicon glyphicon-user"></samp></samp>
										{{ __('Log Out')}}</li></a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
				</ul>
			</nav>
		</div>
		<div class="row-2 main">

        <div class="min-h-screen bg-gray-100">
            
            <!-- Page Heading -->


            <!-- Page Content -->
            <main>
                @yield('content')
            </main>
        </div>
    </body>
</html>
