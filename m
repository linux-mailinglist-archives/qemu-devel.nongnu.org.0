Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ACD18D2F2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 16:32:27 +0100 (CET)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFJdK-0000S9-7f
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 11:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jFJVl-0005fl-Sn
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 11:24:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jFJVj-0007fl-RM
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 11:24:37 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:59255)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jFJVj-0007eD-H5
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 11:24:35 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MowOm-1jcp5N2AJC-00qRsa; Fri, 20 Mar 2020 16:24:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v4 05/32] linux-user: Protect more syscalls
Date: Fri, 20 Mar 2020 16:23:41 +0100
Message-Id: <20200320152408.182899-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320152408.182899-1-laurent@vivier.eu>
References: <20200320152408.182899-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:86siHKsm+DBbopSxREAXuMz3mHQDbS/sG2nkNJgFGJhzhSBfphW
 v4ooTFmTUxLCKz9rwZKKT/GLwv4lntbHfUThFh4KalLBXAkDbzTFCPbxduKG1eX/7KPOZE9
 cYtPvMxmsdYqb57QyYlOALjtrhpPjn9gIWKvp2HJAepAmFipu7YDpfErqoKQDauTcomBD3o
 kjUuhLelTceJG/KrHx16Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1tRGaTSYN6E=:jV820a/LKiTwMXPghXhCgN
 ApxcIMhMvi9cGPdPCJuXcsCw7XKNOWxqhSDn7GrEpBibbc2POA6CxMxE63Y4wgwsWbdajU0VN
 colj8fGbFwQp3FPPH6I8WWu1eJSbOeLzT7Mqq1zt3/cPMBpnAZ9Q+8Ni6i+WB/MNlbHSrplw3
 ZFPW9Qy2I32bgzhJnYbA8bEUX6gUFM5j8R/Dk5njtB3nA5IL4Jjv9daqmwsoRir7hEC60bPAs
 d3Hkp5NkKUj+wXgHXIMMs68iAB2UWxgjuIzkLMpqfarQIS+XUlenfQHtfUK5hxInXXntNwiEA
 J2Hxgf2ibL6syIthigw+59C13AJ9RbZH9XAZZxlevNbhs0DiLw2B8ukgXDQSEfqjpSw+jaqc/
 O/UV43Y6RWCyTzmHtlyKEipaPKbUJKIe61GTeXdYVpEuSxz9r3UOm468BHuoD0QES0XU2RXnU
 K2BPosb9Z3vHd+wmKGjRw7l5i/63qtmb2aZsftv4hOt+OzAJZaM+MIA4b9ql2ZZEYRKli6JpB
 7hs49qotbb2JhzhYs3ohZuWG8syHlrxHeT5KwA0hTeRJGt21wNjx1+YYfxGw4c8P/Bll4fmxB
 UAZ/yRZp/Gp7Jl7TI2mr8QflYdXIjLu+Rl/rj7PJW3ITg1l4W83+ET16aCc29FX1ijcqPwuAe
 447e8kT/+L1vRExw/uMan72ntMuGvu3olFQgEaEhWXriYTK2+ueMgFRvc2Z5HMv9ZARYuhrfv
 gd0myC7KzS/cElXNHsWeoV1TBivzFIA4mJmUrL1I7GjIxHk2GZFB4CffKzRhNSR2ACwXYXz5q
 d68TUO+XrLWlBux5dw380lq/Y6FFcJwvmH13evghOQ4PU4e95QGMWmYPTWgSI6q/DG1eZen
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

New y2038 safe 32-bit architectures (like RISC-V) don't support old
syscalls with a 32-bit time_t. The kernel defines new *_time64 versions
of these syscalls. Add some more #ifdefs to syscall.c in linux-user to
allow us to compile without these old syscalls.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <9ffc3cc6226756895157f16622be5f6edfa2aee6.1584051142.git.alistair.francis@wdc.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c  |  2 ++
 linux-user/syscall.c | 68 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 69232f7e27b8..0d9095c674f4 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -781,6 +781,7 @@ print_syscall_ret_newselect(const struct syscallname *name, abi_long ret)
 #define TARGET_TIME_OOP      3   /* leap second in progress */
 #define TARGET_TIME_WAIT     4   /* leap second has occurred */
 #define TARGET_TIME_ERROR    5   /* clock not synchronized */
+#ifdef TARGET_NR_adjtimex
 static void
 print_syscall_ret_adjtimex(const struct syscallname *name, abi_long ret)
 {
@@ -819,6 +820,7 @@ print_syscall_ret_adjtimex(const struct syscallname *name, abi_long ret)
 
     qemu_log("\n");
 }
+#endif
 
 UNUSED static struct flags access_flags[] = {
     FLAG_GENERIC(F_OK),
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4f2f9eb12b59..ae279702b2ee 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -742,21 +742,30 @@ safe_syscall3(ssize_t, read, int, fd, void *, buff, size_t, count)
 safe_syscall3(ssize_t, write, int, fd, const void *, buff, size_t, count)
 safe_syscall4(int, openat, int, dirfd, const char *, pathname, \
               int, flags, mode_t, mode)
+#if defined(TARGET_NR_wait4) || defined(TARGET_NR_waitpid)
 safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
               struct rusage *, rusage)
+#endif
 safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
               int, options, struct rusage *, rusage)
 safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
+#if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
+    defined(TARGET_NR_pselect6)
 safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
               fd_set *, exceptfds, struct timespec *, timeout, void *, sig)
+#endif
+#if defined(TARGET_NR_ppoll) || defined(TARGET_NR_poll)
 safe_syscall5(int, ppoll, struct pollfd *, ufds, unsigned int, nfds,
               struct timespec *, tsp, const sigset_t *, sigmask,
               size_t, sigsetsize)
+#endif
 safe_syscall6(int, epoll_pwait, int, epfd, struct epoll_event *, events,
               int, maxevents, int, timeout, const sigset_t *, sigmask,
               size_t, sigsetsize)
+#ifdef TARGET_NR_futex
 safe_syscall6(int,futex,int *,uaddr,int,op,int,val, \
               const struct timespec *,timeout,int *,uaddr2,int,val3)
+#endif
 safe_syscall2(int, rt_sigsuspend, sigset_t *, newset, size_t, sigsetsize)
 safe_syscall2(int, kill, pid_t, pid, int, sig)
 safe_syscall2(int, tkill, int, tid, int, sig)
@@ -776,12 +785,16 @@ safe_syscall6(ssize_t, recvfrom, int, fd, void *, buf, size_t, len,
 safe_syscall3(ssize_t, sendmsg, int, fd, const struct msghdr *, msg, int, flags)
 safe_syscall3(ssize_t, recvmsg, int, fd, struct msghdr *, msg, int, flags)
 safe_syscall2(int, flock, int, fd, int, operation)
+#ifdef TARGET_NR_rt_sigtimedwait
 safe_syscall4(int, rt_sigtimedwait, const sigset_t *, these, siginfo_t *, uinfo,
               const struct timespec *, uts, size_t, sigsetsize)
+#endif
 safe_syscall4(int, accept4, int, fd, struct sockaddr *, addr, socklen_t *, len,
               int, flags)
+#if defined(TARGET_NR_nanosleep)
 safe_syscall2(int, nanosleep, const struct timespec *, req,
               struct timespec *, rem)
+#endif
 #ifdef TARGET_NR_clock_nanosleep
 safe_syscall4(int, clock_nanosleep, const clockid_t, clock, int, flags,
               const struct timespec *, req, struct timespec *, rem)
@@ -802,9 +815,11 @@ safe_syscall5(int, msgrcv, int, msgid, void *, msgp, size_t, sz,
 safe_syscall4(int, semtimedop, int, semid, struct sembuf *, tsops,
               unsigned, nsops, const struct timespec *, timeout)
 #endif
-#if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)
+#ifdef TARGET_NR_mq_timedsend
 safe_syscall5(int, mq_timedsend, int, mqdes, const char *, msg_ptr,
               size_t, len, unsigned, prio, const struct timespec *, timeout)
+#endif
+#ifdef TARGET_NR_mq_timedreceive
 safe_syscall5(int, mq_timedreceive, int, mqdes, char *, msg_ptr,
               size_t, len, unsigned *, prio, const struct timespec *, timeout)
 #endif
@@ -946,6 +961,8 @@ abi_long do_brk(abi_ulong new_brk)
     return target_brk;
 }
 
+#if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
+    defined(TARGET_NR_pselect6)
 static inline abi_long copy_from_user_fdset(fd_set *fds,
                                             abi_ulong target_fds_addr,
                                             int n)
@@ -1021,6 +1038,7 @@ static inline abi_long copy_to_user_fdset(abi_ulong target_fds_addr,
 
     return 0;
 }
+#endif
 
 #if defined(__alpha__)
 #define HOST_HZ 1024
@@ -1067,6 +1085,7 @@ static inline abi_long host_to_target_rusage(abi_ulong target_addr,
     return 0;
 }
 
+#ifdef TARGET_NR_setrlimit
 static inline rlim_t target_to_host_rlim(abi_ulong target_rlim)
 {
     abi_ulong target_rlim_swap;
@@ -1082,7 +1101,9 @@ static inline rlim_t target_to_host_rlim(abi_ulong target_rlim)
     
     return result;
 }
+#endif
 
+#if defined(TARGET_NR_getrlimit) || defined(TARGET_NR_ugetrlimit)
 static inline abi_ulong host_to_target_rlim(rlim_t rlim)
 {
     abi_ulong target_rlim_swap;
@@ -1096,6 +1117,7 @@ static inline abi_ulong host_to_target_rlim(rlim_t rlim)
     
     return result;
 }
+#endif
 
 static inline int target_to_host_resource(int code)
 {
@@ -1186,6 +1208,12 @@ static inline abi_long copy_to_user_timeval64(abi_ulong target_tv_addr,
     return 0;
 }
 
+#if defined(TARGET_NR_futex) || \
+    defined(TARGET_NR_rt_sigtimedwait) || \
+    defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6) || \
+    defined(TARGET_NR_nanosleep) || defined(TARGET_NR_clock_settime) || \
+    defined(TARGET_NR_utimensat) || defined(TARGET_NR_mq_timedsend) || \
+    defined(TARGET_NR_mq_timedreceive)
 static inline abi_long target_to_host_timespec(struct timespec *host_ts,
                                                abi_ulong target_addr)
 {
@@ -1199,6 +1227,7 @@ static inline abi_long target_to_host_timespec(struct timespec *host_ts,
     unlock_user_struct(target_ts, target_addr, 0);
     return 0;
 }
+#endif
 
 static inline abi_long host_to_target_timespec(abi_ulong target_addr,
                                                struct timespec *host_ts)
@@ -1228,6 +1257,7 @@ static inline abi_long host_to_target_timespec64(abi_ulong target_addr,
     return 0;
 }
 
+#if defined(TARGET_NR_settimeofday)
 static inline abi_long copy_from_user_timezone(struct timezone *tz,
                                                abi_ulong target_tz_addr)
 {
@@ -1244,6 +1274,7 @@ static inline abi_long copy_from_user_timezone(struct timezone *tz,
 
     return 0;
 }
+#endif
 
 #if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)
 #include <mqueue.h>
@@ -6565,6 +6596,8 @@ static inline abi_long target_ftruncate64(void *cpu_env, abi_long arg1,
 }
 #endif
 
+#if defined(TARGET_NR_timer_settime) || \
+    (defined(TARGET_NR_timerfd_settime) && defined(CONFIG_TIMERFD))
 static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
                                                  abi_ulong target_addr)
 {
@@ -6584,7 +6617,11 @@ static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
     unlock_user_struct(target_itspec, target_addr, 1);
     return 0;
 }
+#endif
 
+#if ((defined(TARGET_NR_timerfd_gettime) || \
+      defined(TARGET_NR_timerfd_settime)) && defined(CONFIG_TIMERFD)) || \
+    defined(TARGET_NR_timer_gettime) || defined(TARGET_NR_timer_settime)
 static inline abi_long host_to_target_itimerspec(abi_ulong target_addr,
                                                struct itimerspec *host_its)
 {
@@ -6603,7 +6640,10 @@ static inline abi_long host_to_target_itimerspec(abi_ulong target_addr,
     unlock_user_struct(target_itspec, target_addr, 0);
     return 0;
 }
+#endif
 
+#if defined(TARGET_NR_adjtimex) || \
+    (defined(TARGET_NR_clock_adjtime) && defined(CONFIG_CLOCK_ADJTIME))
 static inline abi_long target_to_host_timex(struct timex *host_tx,
                                             abi_long target_addr)
 {
@@ -6673,7 +6713,7 @@ static inline abi_long host_to_target_timex(abi_long target_addr,
     unlock_user_struct(target_tx, target_addr, 1);
     return 0;
 }
-
+#endif
 
 static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
                                                abi_ulong target_addr)
@@ -6840,6 +6880,7 @@ static inline abi_long host_to_target_statx(struct target_statx *host_stx,
    futexes locally would make futexes shared between multiple processes
    tricky.  However they're probably useless because guest atomic
    operations won't work either.  */
+#if defined(TARGET_NR_futex)
 static int do_futex(target_ulong uaddr, int op, int val, target_ulong timeout,
                     target_ulong uaddr2, int val3)
 {
@@ -6886,6 +6927,7 @@ static int do_futex(target_ulong uaddr, int op, int val, target_ulong timeout,
         return -TARGET_ENOSYS;
     }
 }
+#endif
 #if defined(TARGET_NR_name_to_handle_at) && defined(CONFIG_OPEN_BY_HANDLE)
 static abi_long do_name_to_handle_at(abi_long dirfd, abi_long pathname,
                                      abi_long handle, abi_long mount_id,
@@ -8494,6 +8536,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
+#ifdef TARGET_NR_rt_sigtimedwait
     case TARGET_NR_rt_sigtimedwait:
         {
             sigset_t set;
@@ -8530,6 +8573,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
+#endif
     case TARGET_NR_rt_sigqueueinfo:
         {
             siginfo_t uinfo;
@@ -8629,6 +8673,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
+#if defined(TARGET_NR_gettimeofday)
     case TARGET_NR_gettimeofday:
         {
             struct timeval tv;
@@ -8639,6 +8684,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
+#endif
+#if defined(TARGET_NR_settimeofday)
     case TARGET_NR_settimeofday:
         {
             struct timeval tv, *ptv = NULL;
@@ -8660,6 +8707,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 
             return get_errno(settimeofday(ptv, ptz));
         }
+#endif
 #if defined(TARGET_NR_select)
     case TARGET_NR_select:
 #if defined(TARGET_WANT_NI_OLD_SELECT)
@@ -9131,6 +9179,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_sendmmsg
     case TARGET_NR_sendmmsg:
         return do_sendrecvmmsg(arg1, arg2, arg3, arg4, 1);
+#endif
+#ifdef TARGET_NR_recvmmsg
     case TARGET_NR_recvmmsg:
         return do_sendrecvmmsg(arg1, arg2, arg3, arg4, 0);
 #endif
@@ -9305,6 +9355,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return do_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5,
                           arg6, arg7, arg8, 0);
 #endif
+#if defined(TARGET_NR_wait4)
     case TARGET_NR_wait4:
         {
             int status;
@@ -9332,6 +9383,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
+#endif
 #ifdef TARGET_NR_swapoff
     case TARGET_NR_swapoff:
         if (!(p = lock_user_string(arg1)))
@@ -9476,6 +9528,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return do_vm86(cpu_env, arg1, arg2);
 #endif
 #endif
+#if defined(TARGET_NR_adjtimex)
     case TARGET_NR_adjtimex:
         {
             struct timex host_buf;
@@ -9491,6 +9544,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
+#endif
 #if defined(TARGET_NR_clock_adjtime) && defined(CONFIG_CLOCK_ADJTIME)
     case TARGET_NR_clock_adjtime:
         {
@@ -10007,6 +10061,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return get_errno(sched_get_priority_max(arg1));
     case TARGET_NR_sched_get_priority_min:
         return get_errno(sched_get_priority_min(arg1));
+#ifdef TARGET_NR_sched_rr_get_interval
     case TARGET_NR_sched_rr_get_interval:
         {
             struct timespec ts;
@@ -10016,6 +10071,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
+#endif
+#if defined(TARGET_NR_nanosleep)
     case TARGET_NR_nanosleep:
         {
             struct timespec req, rem;
@@ -10026,6 +10083,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
+#endif
     case TARGET_NR_prctl:
         switch (arg1) {
         case PR_GET_PDEATHSIG:
@@ -11496,8 +11554,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         }
         return ret;
 #endif
+#ifdef TARGET_NR_futex
     case TARGET_NR_futex:
         return do_futex(arg1, arg2, arg3, arg4, arg5, arg6);
+#endif
 #if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
     case TARGET_NR_inotify_init:
         ret = get_errno(sys_inotify_init());
@@ -11562,6 +11622,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         unlock_user (p, arg1, 0);
         return ret;
 
+#ifdef TARGET_NR_mq_timedsend
     case TARGET_NR_mq_timedsend:
         {
             struct timespec ts;
@@ -11577,7 +11638,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             unlock_user (p, arg2, arg3);
         }
         return ret;
+#endif
 
+#ifdef TARGET_NR_mq_timedreceive
     case TARGET_NR_mq_timedreceive:
         {
             struct timespec ts;
@@ -11598,6 +11661,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 put_user_u32(prio, arg4);
         }
         return ret;
+#endif
 
     /* Not implemented for now... */
 /*     case TARGET_NR_mq_notify: */
-- 
2.25.1


