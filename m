Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAED188A37
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 17:27:37 +0100 (CET)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEF44-0004rO-VC
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 12:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jEEk8-0006WZ-7x
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 12:07:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jEEk5-0007DZ-Qm
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 12:07:00 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:46039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jEEk5-00078H-JW
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 12:06:57 -0400
Received: by mail-vs1-xe42.google.com with SMTP id x82so14225911vsc.12
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bTtvhYnqnvc5Nm2RqKFQLi+QkIFIl+ZIf/6XL/EGg80=;
 b=YAl4XnwKUlb213Hmjyr2DtEF/4ZK5BwQPtRNDchVf43UHbE7IrCqk8C3JBD4LxCg1k
 b4s7760bPL48tokbFgjNjyk9QHuVoGCWqx+Kl8Wp6fZxL3UDJpvxKZPUy8ZTilXbYE86
 7f/K/Hve6x4lNRrSC+G6Du+uzp3UuRwribvn6OtvMAMb04BNEA9PVp7Zm+mg7MsVGqdH
 D8OVHpkiSgQpAhEjvkK1cKCtE/kJkyru0F+KNYcfrAtTmSmRyIDCGbaXkBOb4bu1ol9y
 CKqd7jCYiwtmz3AGyCVhTdv3K7nxpXmkS8/MYbZPrgKbOVOrjCoec6blbBG87eohheFh
 /7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bTtvhYnqnvc5Nm2RqKFQLi+QkIFIl+ZIf/6XL/EGg80=;
 b=hGLThqWmm/z4xH1MCWdB/6uLEvxxztHzzLCK8BHk7FZxPbiwyBCaOLwA0jhkGQ0Htu
 vVhcnOG/I7W6OVYrPqebKflFlT6g6vF2B5Drh08Neh36p4xWPM0lcNDfqTTxpr6L3m1c
 3p3aMajj1C7vtLSlU3pzSsL/jCXPHGeFC4XOvZn8svWE+REVBzhhP61APLP7szIT4KaK
 X4LfiZogeJHAlY3nJKsz9kGGD0vp8ZgalUrJ9JdOqHFo7NLA8QNKvMKEUe7PpdQO8EF1
 yxN2fXGlOzPPajZxq4p3mDQVWu7ktMWQz4fR+Qv65KyOa/KypIByIKRu0VDjo7enEUgG
 Hftg==
X-Gm-Message-State: ANhLgQ2cQZsjDcMtNiw0PqB4EjrTu91f5sR+onVnZrXS2BF7Xiye7bY6
 xaof82xLb1xujU+C4kU/qyCvkSw4pRVUdSF8jI164XHg
X-Google-Smtp-Source: ADFU+vukM5VHwsxkYXbXsRl+njGUPybzmzL0p2FRpVvck6Yer7QAtCkuKSP3qAcemTdnQEotED82EnvmP0UVZVBLOA8=
X-Received: by 2002:a67:f358:: with SMTP id p24mr2339721vsm.180.1584461216627; 
 Tue, 17 Mar 2020 09:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200317155116.1227513-1-laurent@vivier.eu>
 <20200317155116.1227513-11-laurent@vivier.eu>
In-Reply-To: <20200317155116.1227513-11-laurent@vivier.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Mar 2020 08:59:02 -0700
Message-ID: <CAKmqyKMpo5SwETk89cYuGQss9uDEm_yn79t3zGPW3RU-QvOQOg@mail.gmail.com>
Subject: Re: [PULL v2 10/37] linux-user: Protect more syscalls
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e42
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 17, 2020 at 8:54 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> New y2038 safe 32-bit architectures (like RISC-V) don't support old
> syscalls with a 32-bit time_t. The kernel defines new *_time64 versions
> of these syscalls. Add some more #ifdefs to syscall.c in linux-user to
> allow us to compile without these old syscalls.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <9ffc3cc6226756895157f16622be5f6edfa2aee6.1584051142.git.alistair.francis@wdc.com>
> [lv: guard copy_to_user_timezone() with TARGET_NR_gettimeofday]
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Thanks for fixing this.

Alistair

> ---
>  linux-user/strace.c  |  2 ++
>  linux-user/syscall.c | 70 ++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 69232f7e27b8..0d9095c674f4 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -781,6 +781,7 @@ print_syscall_ret_newselect(const struct syscallname *name, abi_long ret)
>  #define TARGET_TIME_OOP      3   /* leap second in progress */
>  #define TARGET_TIME_WAIT     4   /* leap second has occurred */
>  #define TARGET_TIME_ERROR    5   /* clock not synchronized */
> +#ifdef TARGET_NR_adjtimex
>  static void
>  print_syscall_ret_adjtimex(const struct syscallname *name, abi_long ret)
>  {
> @@ -819,6 +820,7 @@ print_syscall_ret_adjtimex(const struct syscallname *name, abi_long ret)
>
>      qemu_log("\n");
>  }
> +#endif
>
>  UNUSED static struct flags access_flags[] = {
>      FLAG_GENERIC(F_OK),
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index be676c3a4fb4..ea1c84dc5de5 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -742,21 +742,30 @@ safe_syscall3(ssize_t, read, int, fd, void *, buff, size_t, count)
>  safe_syscall3(ssize_t, write, int, fd, const void *, buff, size_t, count)
>  safe_syscall4(int, openat, int, dirfd, const char *, pathname, \
>                int, flags, mode_t, mode)
> +#if defined(TARGET_NR_wait4) || defined(TARGET_NR_waitpid)
>  safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
>                struct rusage *, rusage)
> +#endif
>  safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
>                int, options, struct rusage *, rusage)
>  safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
> +#if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
> +    defined(TARGET_NR_pselect6)
>  safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
>                fd_set *, exceptfds, struct timespec *, timeout, void *, sig)
> +#endif
> +#if defined(TARGET_NR_ppoll) || defined(TARGET_NR_poll)
>  safe_syscall5(int, ppoll, struct pollfd *, ufds, unsigned int, nfds,
>                struct timespec *, tsp, const sigset_t *, sigmask,
>                size_t, sigsetsize)
> +#endif
>  safe_syscall6(int, epoll_pwait, int, epfd, struct epoll_event *, events,
>                int, maxevents, int, timeout, const sigset_t *, sigmask,
>                size_t, sigsetsize)
> +#ifdef TARGET_NR_futex
>  safe_syscall6(int,futex,int *,uaddr,int,op,int,val, \
>                const struct timespec *,timeout,int *,uaddr2,int,val3)
> +#endif
>  safe_syscall2(int, rt_sigsuspend, sigset_t *, newset, size_t, sigsetsize)
>  safe_syscall2(int, kill, pid_t, pid, int, sig)
>  safe_syscall2(int, tkill, int, tid, int, sig)
> @@ -776,12 +785,16 @@ safe_syscall6(ssize_t, recvfrom, int, fd, void *, buf, size_t, len,
>  safe_syscall3(ssize_t, sendmsg, int, fd, const struct msghdr *, msg, int, flags)
>  safe_syscall3(ssize_t, recvmsg, int, fd, struct msghdr *, msg, int, flags)
>  safe_syscall2(int, flock, int, fd, int, operation)
> +#ifdef TARGET_NR_rt_sigtimedwait
>  safe_syscall4(int, rt_sigtimedwait, const sigset_t *, these, siginfo_t *, uinfo,
>                const struct timespec *, uts, size_t, sigsetsize)
> +#endif
>  safe_syscall4(int, accept4, int, fd, struct sockaddr *, addr, socklen_t *, len,
>                int, flags)
> +#if defined(TARGET_NR_nanosleep)
>  safe_syscall2(int, nanosleep, const struct timespec *, req,
>                struct timespec *, rem)
> +#endif
>  #ifdef TARGET_NR_clock_nanosleep
>  safe_syscall4(int, clock_nanosleep, const clockid_t, clock, int, flags,
>                const struct timespec *, req, struct timespec *, rem)
> @@ -802,9 +815,11 @@ safe_syscall5(int, msgrcv, int, msgid, void *, msgp, size_t, sz,
>  safe_syscall4(int, semtimedop, int, semid, struct sembuf *, tsops,
>                unsigned, nsops, const struct timespec *, timeout)
>  #endif
> -#if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)
> +#ifdef TARGET_NR_mq_timedsend
>  safe_syscall5(int, mq_timedsend, int, mqdes, const char *, msg_ptr,
>                size_t, len, unsigned, prio, const struct timespec *, timeout)
> +#endif
> +#ifdef TARGET_NR_mq_timedreceive
>  safe_syscall5(int, mq_timedreceive, int, mqdes, char *, msg_ptr,
>                size_t, len, unsigned *, prio, const struct timespec *, timeout)
>  #endif
> @@ -946,6 +961,8 @@ abi_long do_brk(abi_ulong new_brk)
>      return target_brk;
>  }
>
> +#if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
> +    defined(TARGET_NR_pselect6)
>  static inline abi_long copy_from_user_fdset(fd_set *fds,
>                                              abi_ulong target_fds_addr,
>                                              int n)
> @@ -1021,6 +1038,7 @@ static inline abi_long copy_to_user_fdset(abi_ulong target_fds_addr,
>
>      return 0;
>  }
> +#endif
>
>  #if defined(__alpha__)
>  #define HOST_HZ 1024
> @@ -1067,6 +1085,7 @@ static inline abi_long host_to_target_rusage(abi_ulong target_addr,
>      return 0;
>  }
>
> +#ifdef TARGET_NR_setrlimit
>  static inline rlim_t target_to_host_rlim(abi_ulong target_rlim)
>  {
>      abi_ulong target_rlim_swap;
> @@ -1082,7 +1101,9 @@ static inline rlim_t target_to_host_rlim(abi_ulong target_rlim)
>
>      return result;
>  }
> +#endif
>
> +#if defined(TARGET_NR_getrlimit) || defined(TARGET_NR_ugetrlimit)
>  static inline abi_ulong host_to_target_rlim(rlim_t rlim)
>  {
>      abi_ulong target_rlim_swap;
> @@ -1096,6 +1117,7 @@ static inline abi_ulong host_to_target_rlim(rlim_t rlim)
>
>      return result;
>  }
> +#endif
>
>  static inline int target_to_host_resource(int code)
>  {
> @@ -1186,6 +1208,12 @@ static inline abi_long copy_to_user_timeval64(abi_ulong target_tv_addr,
>      return 0;
>  }
>
> +#if defined(TARGET_NR_futex) || \
> +    defined(TARGET_NR_rt_sigtimedwait) || \
> +    defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6) || \
> +    defined(TARGET_NR_nanosleep) || defined(TARGET_NR_clock_settime) || \
> +    defined(TARGET_NR_utimensat) || defined(TARGET_NR_mq_timedsend) || \
> +    defined(TARGET_NR_mq_timedreceive)
>  static inline abi_long target_to_host_timespec(struct timespec *host_ts,
>                                                 abi_ulong target_addr)
>  {
> @@ -1199,6 +1227,7 @@ static inline abi_long target_to_host_timespec(struct timespec *host_ts,
>      unlock_user_struct(target_ts, target_addr, 0);
>      return 0;
>  }
> +#endif
>
>  static inline abi_long host_to_target_timespec(abi_ulong target_addr,
>                                                 struct timespec *host_ts)
> @@ -1228,6 +1257,7 @@ static inline abi_long host_to_target_timespec64(abi_ulong target_addr,
>      return 0;
>  }
>
> +#if defined(TARGET_NR_gettimeofday)
>  static inline abi_long copy_to_user_timezone(abi_ulong target_tz_addr,
>                                               struct timezone *tz)
>  {
> @@ -1244,7 +1274,9 @@ static inline abi_long copy_to_user_timezone(abi_ulong target_tz_addr,
>
>      return 0;
>  }
> +#endif
>
> +#if defined(TARGET_NR_settimeofday)
>  static inline abi_long copy_from_user_timezone(struct timezone *tz,
>                                                 abi_ulong target_tz_addr)
>  {
> @@ -1261,6 +1293,7 @@ static inline abi_long copy_from_user_timezone(struct timezone *tz,
>
>      return 0;
>  }
> +#endif
>
>  #if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)
>  #include <mqueue.h>
> @@ -6582,6 +6615,8 @@ static inline abi_long target_ftruncate64(void *cpu_env, abi_long arg1,
>  }
>  #endif
>
> +#if defined(TARGET_NR_timer_settime) || \
> +    (defined(TARGET_NR_timerfd_settime) && defined(CONFIG_TIMERFD))
>  static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
>                                                   abi_ulong target_addr)
>  {
> @@ -6601,7 +6636,11 @@ static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
>      unlock_user_struct(target_itspec, target_addr, 1);
>      return 0;
>  }
> +#endif
>
> +#if ((defined(TARGET_NR_timerfd_gettime) || \
> +      defined(TARGET_NR_timerfd_settime)) && defined(CONFIG_TIMERFD)) || \
> +    defined(TARGET_NR_timer_gettime) || defined(TARGET_NR_timer_settime)
>  static inline abi_long host_to_target_itimerspec(abi_ulong target_addr,
>                                                 struct itimerspec *host_its)
>  {
> @@ -6620,7 +6659,10 @@ static inline abi_long host_to_target_itimerspec(abi_ulong target_addr,
>      unlock_user_struct(target_itspec, target_addr, 0);
>      return 0;
>  }
> +#endif
>
> +#if defined(TARGET_NR_adjtimex) || \
> +    (defined(TARGET_NR_clock_adjtime) && defined(CONFIG_CLOCK_ADJTIME))
>  static inline abi_long target_to_host_timex(struct timex *host_tx,
>                                              abi_long target_addr)
>  {
> @@ -6690,7 +6732,7 @@ static inline abi_long host_to_target_timex(abi_long target_addr,
>      unlock_user_struct(target_tx, target_addr, 1);
>      return 0;
>  }
> -
> +#endif
>
>  static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
>                                                 abi_ulong target_addr)
> @@ -6857,6 +6899,7 @@ static inline abi_long host_to_target_statx(struct target_statx *host_stx,
>     futexes locally would make futexes shared between multiple processes
>     tricky.  However they're probably useless because guest atomic
>     operations won't work either.  */
> +#if defined(TARGET_NR_futex)
>  static int do_futex(target_ulong uaddr, int op, int val, target_ulong timeout,
>                      target_ulong uaddr2, int val3)
>  {
> @@ -6903,6 +6946,7 @@ static int do_futex(target_ulong uaddr, int op, int val, target_ulong timeout,
>          return -TARGET_ENOSYS;
>      }
>  }
> +#endif
>  #if defined(TARGET_NR_name_to_handle_at) && defined(CONFIG_OPEN_BY_HANDLE)
>  static abi_long do_name_to_handle_at(abi_long dirfd, abi_long pathname,
>                                       abi_long handle, abi_long mount_id,
> @@ -8521,6 +8565,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              }
>          }
>          return ret;
> +#ifdef TARGET_NR_rt_sigtimedwait
>      case TARGET_NR_rt_sigtimedwait:
>          {
>              sigset_t set;
> @@ -8557,6 +8602,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              }
>          }
>          return ret;
> +#endif
>      case TARGET_NR_rt_sigqueueinfo:
>          {
>              siginfo_t uinfo;
> @@ -8656,6 +8702,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              }
>          }
>          return ret;
> +#if defined(TARGET_NR_gettimeofday)
>      case TARGET_NR_gettimeofday:
>          {
>              struct timeval tv;
> @@ -8672,6 +8719,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              }
>          }
>          return ret;
> +#endif
> +#if defined(TARGET_NR_settimeofday)
>      case TARGET_NR_settimeofday:
>          {
>              struct timeval tv, *ptv = NULL;
> @@ -8693,6 +8742,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>
>              return get_errno(settimeofday(ptv, ptz));
>          }
> +#endif
>  #if defined(TARGET_NR_select)
>      case TARGET_NR_select:
>  #if defined(TARGET_WANT_NI_OLD_SELECT)
> @@ -9164,6 +9214,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>  #ifdef TARGET_NR_sendmmsg
>      case TARGET_NR_sendmmsg:
>          return do_sendrecvmmsg(arg1, arg2, arg3, arg4, 1);
> +#endif
> +#ifdef TARGET_NR_recvmmsg
>      case TARGET_NR_recvmmsg:
>          return do_sendrecvmmsg(arg1, arg2, arg3, arg4, 0);
>  #endif
> @@ -9338,6 +9390,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return do_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5,
>                            arg6, arg7, arg8, 0);
>  #endif
> +#if defined(TARGET_NR_wait4)
>      case TARGET_NR_wait4:
>          {
>              int status;
> @@ -9365,6 +9418,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              }
>          }
>          return ret;
> +#endif
>  #ifdef TARGET_NR_swapoff
>      case TARGET_NR_swapoff:
>          if (!(p = lock_user_string(arg1)))
> @@ -9509,6 +9563,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return do_vm86(cpu_env, arg1, arg2);
>  #endif
>  #endif
> +#if defined(TARGET_NR_adjtimex)
>      case TARGET_NR_adjtimex:
>          {
>              struct timex host_buf;
> @@ -9524,6 +9579,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              }
>          }
>          return ret;
> +#endif
>  #if defined(TARGET_NR_clock_adjtime) && defined(CONFIG_CLOCK_ADJTIME)
>      case TARGET_NR_clock_adjtime:
>          {
> @@ -10040,6 +10096,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return get_errno(sched_get_priority_max(arg1));
>      case TARGET_NR_sched_get_priority_min:
>          return get_errno(sched_get_priority_min(arg1));
> +#ifdef TARGET_NR_sched_rr_get_interval
>      case TARGET_NR_sched_rr_get_interval:
>          {
>              struct timespec ts;
> @@ -10049,6 +10106,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              }
>          }
>          return ret;
> +#endif
> +#if defined(TARGET_NR_nanosleep)
>      case TARGET_NR_nanosleep:
>          {
>              struct timespec req, rem;
> @@ -10059,6 +10118,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              }
>          }
>          return ret;
> +#endif
>      case TARGET_NR_prctl:
>          switch (arg1) {
>          case PR_GET_PDEATHSIG:
> @@ -11529,8 +11589,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          }
>          return ret;
>  #endif
> +#ifdef TARGET_NR_futex
>      case TARGET_NR_futex:
>          return do_futex(arg1, arg2, arg3, arg4, arg5, arg6);
> +#endif
>  #if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
>      case TARGET_NR_inotify_init:
>          ret = get_errno(sys_inotify_init());
> @@ -11595,6 +11657,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          unlock_user (p, arg1, 0);
>          return ret;
>
> +#ifdef TARGET_NR_mq_timedsend
>      case TARGET_NR_mq_timedsend:
>          {
>              struct timespec ts;
> @@ -11610,7 +11673,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              unlock_user (p, arg2, arg3);
>          }
>          return ret;
> +#endif
>
> +#ifdef TARGET_NR_mq_timedreceive
>      case TARGET_NR_mq_timedreceive:
>          {
>              struct timespec ts;
> @@ -11631,6 +11696,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                  put_user_u32(prio, arg4);
>          }
>          return ret;
> +#endif
>
>      /* Not implemented for now... */
>  /*     case TARGET_NR_mq_notify: */
> --
> 2.24.1
>
>

