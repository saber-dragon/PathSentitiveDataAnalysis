; ModuleID = 'nonssa_cprop.ll'
source_filename = "cprop.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @_Z3fooii(i32 %a, i32 %b) #0 {
entry:
  %cmp = icmp sgt i32 %a, 10
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end8

if.else:                                          ; preds = %entry
  %cmp1 = icmp sgt i32 %a, 5
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  br label %if.end7

if.else3:                                         ; preds = %if.else
  %cmp4 = icmp sgt i32 %a, 0
  br i1 %cmp4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else3
  br label %if.end

if.else6:                                         ; preds = %if.else3
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then5
  %x.0 = phi i32 [ 100, %if.then5 ], [ %a, %if.else6 ]
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then2
  %x.1 = phi i32 [ 3, %if.then2 ], [ %x.0, %if.end ]
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then
  %x.2 = phi i32 [ 1, %if.then ], [ %x.1, %if.end7 ]
  br label %D

D:                                                ; preds = %if.end8
  %cmp9 = icmp eq i32 %x.2, 8
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %D
  br label %if.end16

if.else11:                                        ; preds = %D
  %cmp12 = icmp eq i32 %x.2, 9
  br i1 %cmp12, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.else11
  br label %if.end15

if.else14:                                        ; preds = %if.else11
  %add = add nsw i32 %a, %b
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %if.then13
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then10
  %cmp17 = icmp sgt i32 %x.2, %a
  br i1 %cmp17, label %if.then18, label %if.else19

if.then18:                                        ; preds = %if.end16
  br label %if.end20

if.else19:                                        ; preds = %if.end16
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then18
  %y.0 = phi i32 [ %b, %if.then18 ], [ %a, %if.else19 ]
  %add21 = add nsw i32 %x.2, %y.0
  ret i32 %add21
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.1 (tags/RELEASE_401/final)"}
