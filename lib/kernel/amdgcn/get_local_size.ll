; ModuleID = 'kernel-amdgcn--amdhsa.bc'
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-p24:64:64-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn--amdhsa"

; Borrowed from libclc.

declare i32 @llvm.r600.read.local.size.x() nounwind readnone
declare i32 @llvm.r600.read.local.size.y() nounwind readnone
declare i32 @llvm.r600.read.local.size.z() nounwind readnone

define i32 @_Z14get_local_sizej(i32 %dim) nounwind readnone alwaysinline {
  switch i32 %dim, label %default [i32 0, label %x_dim i32 1, label %y_dim i32 2, label %z_dim]
x_dim:
  %x = call i32 @llvm.r600.read.local.size.x() nounwind readnone
  ret i32 %x
y_dim:
  %y = call i32 @llvm.r600.read.local.size.y() nounwind readnone
  ret i32 %y
z_dim:
  %z = call i32 @llvm.r600.read.local.size.z() nounwind readnone
  ret i32 %z
default:
  ret i32 0
}
