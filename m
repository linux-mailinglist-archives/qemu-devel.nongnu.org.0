Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA4533B08
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:56:25 +0200 (CEST)
Received: from localhost ([::1]:46694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntogj-0001xA-1o
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoS3-0005v4-En
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:15 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoS1-0002GZ-79
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:15 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJEpp-1o90kQ3sEd-00Keil; Wed, 25
 May 2022 12:41:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 5/8] linux-user: Remove pointless CPU{ARCH}State casts
Date: Wed, 25 May 2022 12:40:54 +0200
Message-Id: <20220525104057.543354-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
References: <20220525104057.543354-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qezJhPFbYxjdEvtAE43RPKHQquSuwHXBDNPdbUvGAlbuENG4ZoA
 f3Fj7fItQ3cvuo8AWUrw2gDLVjYPzwpRKWLTiXYFwr9i4XsdnZHBUmlW3lnb7vJ5kvp10He
 XHxfplZESQXdVgnlW72hPxDBzix25M5jFYQQA5rdpPLZyU8BmmVegKxTA/cdGHEA/il/Ywz
 aQeP/xs2CID2o4l06y6kQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:opHdLaSMFIg=:qIPs0ywGTpHV7UUDfXg507
 F0PTwrzAVPjpJQ8dPTqZ3WvDogFwFD7h+yGd8zwy5TiHHVsV+3gxdYdMhK9we0e5hVQif+yqd
 yEL03kRzA1sgoQAzrc6qBOofbcxXhc4bWGQfhJCEQh3l6HrrEMN6AtDqZUrGcziUNZAbFhg4t
 nwMQSgynm1jMdqfhnfKmFG9IhccunHGTc9p3y0Ow6I6fFp6Pt4wDkgh5mCof6jWuEK4FZ12/X
 4xWgjkKKQ+HGkcHo+vUSq1MkwgmxkFbAGel+tx4fH7ocFeVQh3uiEduekmxq0vEMA89bggL6g
 hJ1hCodA7PJJgBSTGCsSW80GOwbomWmp4PeBtE0WbPHnSUbIzdtSHeCrTSeVIVS9+gp4rGFx7
 Ypmphw6c+NxNILsCVeLUzELdbHoxjlRIQcKqB5MakfRWq9oNH0YB5VQVgLsnXikS1bjCgXnwu
 r5k+oMHvOvFZZyEQSRAUt82WOZDNvn2dW6n9NmDrHAe9+4IZvTywFuRAZcof8lOqBzZWuA45T
 /oChngiu9br0XTcAcz/sTIRl2iai2wi11oFEwVJw8ViWXw1zVTx6Tt8VXLCEtupfgt6EAX9k4
 N8/yRncbfXECZCJJFnOfK5+I3RXY9DXhm6iF8LpBl/iwoLysy0UsBfd8ucxcA/YSeccwGuTZY
 XJIgpiwUSaZ1GPDHjr/MPhiiNpEU4zOfh+GYAk0nQUvCN8WrdcgYZAE8f27RjL4u0D8QNeVDq
 POB3wN2L8FNCTIy0PqfgsXgvcUHhsaTAyugtsw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220509205728.51912-4-philippe.mathieu.daude@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c        | 49 +++++++++++++++++--------------------
 linux-user/uname.c          |  2 +-
 linux-user/user-internals.h |  2 +-
 3 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2395988e66cb..f55cdebee5ab 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1612,16 +1612,16 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
        pipe syscall, but didn't replicate this into the pipe2 syscall.  */
     if (!is_pipe2) {
 #if defined(TARGET_ALPHA)
-        ((CPUAlphaState *)cpu_env)->ir[IR_A4] = host_pipe[1];
+        cpu_env->ir[IR_A4] = host_pipe[1];
         return host_pipe[0];
 #elif defined(TARGET_MIPS)
-        ((CPUMIPSState*)cpu_env)->active_tc.gpr[3] = host_pipe[1];
+        cpu_env->active_tc.gpr[3] = host_pipe[1];
         return host_pipe[0];
 #elif defined(TARGET_SH4)
-        ((CPUSH4State*)cpu_env)->gregs[1] = host_pipe[1];
+        cpu_env->gregs[1] = host_pipe[1];
         return host_pipe[0];
 #elif defined(TARGET_SPARC)
-        ((CPUSPARCState*)cpu_env)->regwptr[1] = host_pipe[1];
+        cpu_env->regwptr[1] = host_pipe[1];
         return host_pipe[0];
 #endif
     }
@@ -7566,7 +7566,7 @@ static inline abi_long host_to_target_stat64(CPUArchState *cpu_env,
                                              struct stat *host_st)
 {
 #if defined(TARGET_ARM) && defined(TARGET_ABI32)
-    if (((CPUARMState *)cpu_env)->eabi) {
+    if (cpu_env->eabi) {
         struct target_eabi_stat64 *target_st;
 
         if (!lock_user_struct(VERIFY_WRITE, target_st, target_addr, 0))
@@ -7965,7 +7965,7 @@ int host_to_target_waitstatus(int status)
 
 static int open_self_cmdline(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     struct linux_binprm *bprm = ((TaskState *)cpu->opaque)->bprm;
     int i;
 
@@ -7982,7 +7982,7 @@ static int open_self_cmdline(CPUArchState *cpu_env, int fd)
 
 static int open_self_maps(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     GSList *map_info = read_self_maps();
     GSList *s;
@@ -8044,7 +8044,7 @@ static int open_self_maps(CPUArchState *cpu_env, int fd)
 
 static int open_self_stat(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     g_autoptr(GString) buf = g_string_new(NULL);
     int i;
@@ -8082,7 +8082,7 @@ static int open_self_stat(CPUArchState *cpu_env, int fd)
 
 static int open_self_auxv(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     abi_ulong auxv = ts->info->saved_auxv;
     abi_ulong len = ts->info->auxv_len;
@@ -8892,7 +8892,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_getxpid) && defined(TARGET_ALPHA)
     /* Alpha specific */
     case TARGET_NR_getxpid:
-        ((CPUAlphaState *)cpu_env)->ir[IR_A4] = getppid();
+        cpu_env->ir[IR_A4] = getppid();
         return get_errno(getpid());
 #endif
 #ifdef TARGET_NR_getpid
@@ -9415,7 +9415,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!is_error(ret)) {
                 host_to_target_old_sigset(&mask, &oldset);
                 ret = mask;
-                ((CPUAlphaState *)cpu_env)->ir[IR_V0] = 0; /* force no error */
+                cpu_env->ir[IR_V0] = 0; /* force no error */
             }
 #else
             sigset_t set, oldset, *set_ptr;
@@ -10035,7 +10035,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         }
 #ifdef TARGET_ALPHA
         /* Return value is the unbiased priority.  Signal no error.  */
-        ((CPUAlphaState *)cpu_env)->ir[IR_V0] = 0;
+        cpu_env->ir[IR_V0] = 0;
 #else
         /* Return value is a biased priority to avoid negative numbers.  */
         ret = 20 - ret;
@@ -11415,7 +11415,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          {
             uid_t euid;
             euid=geteuid();
-            ((CPUAlphaState *)cpu_env)->ir[IR_A4]=euid;
+            cpu_env->ir[IR_A4]=euid;
          }
         return get_errno(getuid());
 #endif
@@ -11425,7 +11425,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          {
             uid_t egid;
             egid=getegid();
-            ((CPUAlphaState *)cpu_env)->ir[IR_A4]=egid;
+            cpu_env->ir[IR_A4]=egid;
          }
         return get_errno(getgid());
 #endif
@@ -11437,7 +11437,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
           case TARGET_GSI_IEEE_FP_CONTROL:
             {
                 uint64_t fpcr = cpu_alpha_load_fpcr(cpu_env);
-                uint64_t swcr = ((CPUAlphaState *)cpu_env)->swcr;
+                uint64_t swcr = cpu_env->swcr;
 
                 swcr &= ~SWCR_STATUS_MASK;
                 swcr |= (fpcr >> 35) & SWCR_STATUS_MASK;
@@ -11479,8 +11479,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  * could be queried.  Therefore, we store the status
                  * bits only in FPCR.
                  */
-                ((CPUAlphaState *)cpu_env)->swcr
-                    = swcr & (SWCR_TRAP_ENABLE_MASK | SWCR_MAP_MASK);
+                cpu_env->swcr = swcr & (SWCR_TRAP_ENABLE_MASK | SWCR_MAP_MASK);
 
                 fpcr = cpu_alpha_load_fpcr(cpu_env);
                 fpcr &= ((uint64_t)FPCR_DYN_MASK << 32);
@@ -11504,7 +11503,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 fex = alpha_ieee_fpcr_to_swcr(fpcr);
                 fex = exc & ~fex;
                 fex >>= SWCR_STATUS_TO_EXCSUM_SHIFT;
-                fex &= ((CPUArchState *)cpu_env)->swcr;
+                fex &= (cpu_env)->swcr;
 
                 /* Update the hardware fpcr.  */
                 fpcr |= alpha_ieee_swcr_to_fpcr(exc);
@@ -11536,9 +11535,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                     info.si_signo = SIGFPE;
                     info.si_errno = 0;
                     info.si_code = si_code;
-                    info._sifields._sigfault._addr
-                        = ((CPUArchState *)cpu_env)->pc;
-                    queue_signal((CPUArchState *)cpu_env, info.si_signo,
+                    info._sifields._sigfault._addr = (cpu_env)->pc;
+                    queue_signal(cpu_env, info.si_signo,
                                  QEMU_SI_FAULT, &info);
                 }
                 ret = 0;
@@ -11824,7 +11822,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         to_flock64_fn *copyto = copy_to_user_flock64;
 
 #ifdef TARGET_ARM
-        if (!((CPUARMState *)cpu_env)->eabi) {
+        if (!cpu_env->eabi) {
             copyfrom = copy_from_user_oabi_flock64;
             copyto = copy_to_user_oabi_flock64;
         }
@@ -12052,13 +12050,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_set_thread_area
     case TARGET_NR_set_thread_area:
 #if defined(TARGET_MIPS)
-      ((CPUMIPSState *) cpu_env)->active_tc.CP0_UserLocal = arg1;
+      cpu_env->active_tc.CP0_UserLocal = arg1;
       return 0;
 #elif defined(TARGET_CRIS)
       if (arg1 & 0xff)
           ret = -TARGET_EINVAL;
       else {
-          ((CPUCRISState *) cpu_env)->pregs[PR_PID] = arg1;
+          cpu_env->pregs[PR_PID] = arg1;
           ret = 0;
       }
       return ret;
@@ -12785,8 +12783,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = arg6;
-            queue_signal((CPUArchState *)cpu_env, info.si_signo,
-                         QEMU_SI_FAULT, &info);
+            queue_signal(cpu_env, info.si_signo, QEMU_SI_FAULT, &info);
             ret = 0xdeadbeef;
 
         }
diff --git a/linux-user/uname.c b/linux-user/uname.c
index 1e3e98156da0..32f71f24920d 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -54,7 +54,7 @@ const char *cpu_to_uname_machine(CPUArchState *cpu_env)
     return "armv5te" utsname_suffix;
 #elif defined(TARGET_I386) && !defined(TARGET_X86_64)
     /* see arch/x86/kernel/cpu/bugs.c: check_bugs(), 386, 486, 586, 686 */
-    CPUState *cpu = env_cpu((CPUX86State *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     int family = object_property_get_int(OBJECT(cpu), "family", NULL);
     if (family == 4) {
         return "i486";
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 0bb26331c171..6175ce53dbd6 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -134,7 +134,7 @@ void print_termios(void *arg);
 #ifdef TARGET_ARM
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num)
 {
-    return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
+    return cpu_env->eabi == 1;
 }
 #elif defined(TARGET_MIPS) && defined(TARGET_ABI_MIPSO32)
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
-- 
2.36.1


