<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Students;
use App\Models\Attendances;

class AttendanceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function show_attendance(Request $request){
        if(Auth::user()->role!="Head Master"){//checking role
            return redirect()->back()->with('','');
        }


        $GLOBALS['search'] = $request->search;
        $students = DB::table('students')->where('class',$request->class_id)->orderBy('updated_at','desc')->paginate(1200);
        $classes = DB::table('classes')->orderBy('name','asc')->paginate(25);
        
        // foreach ($students as $value) {
        //     for ($i=1; $i < 4; $i++) { 
        //         $attendance_val = "";
        //         if($request->get('attendance_'.$value->student_id.'_'.$i)=="on" && $i==1){
        //             $attendance_val = 'present';
        //             //echo $value->fname.' '.$request->get('attendance_'.$value->student_id.'_'.$i).'<br>';
        //         }else if($request->get('attendance_'.$value->student_id.'_'.$i)=="on" && $i==2){
        //             $attendance_val = 'absent';
        //             //echo $value->fname.' '.$request->get('attendance_'.$value->student_id.'_'.$i).'<br>';
        //         }else if($request->get('attendance_'.$value->student_id.'_'.$i)=="on" && $i==3){
        //             $attendance_val = 'permission';
        //             //echo $value->fname.' '.$request->get('attendance_'.$value->student_id.'_'.$i).'<br>';
        //         }

        //         echo $attendance_val;
        //         //add new attendance
        //         if(!empty($attendance_val)){
        //         $attendance = new Attendance();
        //         $attendance->attendance_id = uniqid();
        //         $attendance->student_id = $value->student_id;
        //         $attendance->attendance_status = $attendance_val;
        //         $attendance->save();
        //         }
        //     }
        // }
        if(!empty($request->attendance_date)){
            $date_today =  $request->attendance_date;
        }else{
            $date_today =  date("Y-m-d");
        }
        foreach ($students as $value) {
            $attendance_val = $request->get('attendance_'.$value->student_id);

            
            if(!empty($attendance_val)){
            $attend = DB::table('attendances')
            ->where('student_id','=',$value->student_id)
            ->where('updated_at','LIKE','%'.$date_today.'%')
            ->orderBy('updated_at','asc')->get();
            if(count($attend)<=0){
                //new attendance
                $attendance = new Attendances();
                $attendance->attendance_id = uniqid();
                $attendance->student_id = $value->student_id;
                $attendance->attendance_status = $attendance_val;
                $attendance->save();
            }else{
                //update attendance
                $attendance = attendances::
                where('student_id','=',$value->student_id)
                ->where('updated_at','LIKE','%'.$date_today.'%')->first();
                $attendance->attendance_status = $attendance_val;
                $attendance->save();
            }
            }
        }
        $attendances = DB::table('attendances')->where('attendance_date','=',$date_today)->orderBy('updated_at','asc')->paginate(25);
        $attendance_dates = DB::table('attendances')->select('attendance_date')->distinct()->orderBy('attendance_date','desc')->get();

        return view('attendance',['students'=>$students,'classes'=>$classes, 'attendances'=>$attendances, 'attendance_dates'=>$attendance_dates]);
    }
}
