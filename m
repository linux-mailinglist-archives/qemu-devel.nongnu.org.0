Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C10168E7D
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 12:31:00 +0100 (CET)
Received: from localhost ([::1]:41588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Szr-0001on-Ai
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 06:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j5Syj-0001EG-Cd
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 06:29:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j5Syg-0002MO-Ds
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 06:29:49 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:43885)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j5Syg-0002Lq-4q; Sat, 22 Feb 2020 06:29:46 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MLzSD-1inf8t3FL7-00HxPH; Sat, 22 Feb 2020 12:29:39 +0100
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1582240656.git.alistair.francis@wdc.com>
 <8f6625e62bd766eacdae40e9a74186f247fe16b0.1582240656.git.alistair.francis@wdc.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Subject: Re: [PATCH v1 2/2] linux-user/riscv: Update the syscall_nr's to the
 5.5 kernel
Message-ID: <2a44aa3a-dd98-3691-6cb0-94ca9b78c87f@vivier.eu>
Date: Sat, 22 Feb 2020 12:29:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8f6625e62bd766eacdae40e9a74186f247fe16b0.1582240656.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NF+n2L0fkgIM5ki49US0tTbaQHi9RJ6mmG1mPEdQ5CkiivtpA7g
 TTRLFF585N663XM5vifYJgnMej5YRCkIx+1Eht1oawgj/sy/TW6q289+XjnZ/0h/fphn4ZD
 iTeUJBuPx5jEHmDP6mlF8nS7WOrnpMLDsJBlLQZlsZsmpyGgyrd2hwZTTySLGEW9hY/9JAN
 T46A3jIwaVMIe6ijPyQvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0/+FQN2BAWY=:pycoNcQujHRDYgfU2WmpG9
 R33dBvuliroemag/ohzZ42gEXhrM+FT3dM2DIKf39HJb6skkXz3fbi4bs76ggQmmA3GMdc1jK
 8yl3svAI+F5YC/hEV7GKWi3Xe6ubhjXI7CnZgFXClpX19SC1xBoCxgQGuIgWLwWjLua5qxi5f
 bmmkRXVPEy8mPLgScIJ1dIxWmw+kM2ZrotkQlZaEyYdKdCOgHpxDtuIGSco0uvIkmxHOoUvYV
 XQDAdyuUXSlPhNwm6k2scfcot1u3qVlPvhRMuslJyl+zRtghkNLYChWeoPdOE8qgzoINauhNu
 AvfGZwxTDMC5eWfOxvNKAVDin7BhUtUivEglKW9CZWmqjHpU8tsqCQodQbtjmuRBtkjC7cFja
 RhU6nm2u4mEd3maeGObwRT/U5hlVw7Jlhsxd2TBRoRR/0BoKFEQdbSU+F3lWphltmst1YMC24
 XCkkPAnszrEYPgfr4lVgaxcmvsDuJAhspU2LZDaMf9NvUKAb0LRZDcRr4+74f0mBnyyhv5Twq
 TVj/cjvtyOh5cKxYEcppLgBlUW8nSMgOmNxodkGyK4l75LLh3SBYMuU4vDpHN1R/jaB/B3RsG
 8urxfIbraCNBdzQO5ezYFcMVDAmOjc5c6KDBsLpZ3snZJr8zSuI+hw2cK+Erf/6BOvPEejCVx
 UvVl/4KpuCL1r1g43XAPN7l5c+BKfUGNPVH735fLG+D/5XX7p1FZaxB6zBqSLJTXKj96rACG/
 7xOohI/M4iaIHCwCj409ltFoPLFNAj1oos+3Z48PERDz0PaofhVDZ8+meLd/kpUn0kSlAgNJL
 PhEgq47542bvdVMBjlmLyE0MroBapvO3KP8nUdis9L29Hxm3vwrqGL3cZbPDtmSU+DBBo1w
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
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
Cc: alistair23@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/02/2020 à 00:18, Alistair Francis a écrit :
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  linux-user/riscv/syscall_nr.h | 160 +++++++++++++++++++++++++++++++++-
>  1 file changed, 158 insertions(+), 2 deletions(-)

Could you avoid to add blanck lines: this makes review more difficult
and patch bigger for nothing.

Perhaps it would be easier too to have two files, one for 32bit and one
for 64 bit and a syscall_nr.h like this:

#ifdef TARGET_RISCV32
#include "syscall32_nr.h"
#else
#include "syscall64_nr.h"
#endif

Thanks,
Laurent

> diff --git a/linux-user/riscv/syscall_nr.h b/linux-user/riscv/syscall_nr.h
> index 5c87282209..b2b071969b 100644
> --- a/linux-user/riscv/syscall_nr.h
> +++ b/linux-user/riscv/syscall_nr.h
> @@ -10,7 +10,10 @@
>  #define TARGET_NR_io_destroy 1
>  #define TARGET_NR_io_submit 2
>  #define TARGET_NR_io_cancel 3
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_io_getevents 4
> +#endif
> +
>  #define TARGET_NR_setxattr 5
>  #define TARGET_NR_lsetxattr 6
>  #define TARGET_NR_fsetxattr 7
> @@ -23,12 +26,17 @@
>  #define TARGET_NR_removexattr 14
>  #define TARGET_NR_lremovexattr 15
>  #define TARGET_NR_fremovexattr 16
> +
>  #define TARGET_NR_getcwd 17
> +
>  #define TARGET_NR_lookup_dcookie 18
> +
>  #define TARGET_NR_eventfd2 19
> +
>  #define TARGET_NR_epoll_create1 20
>  #define TARGET_NR_epoll_ctl 21
>  #define TARGET_NR_epoll_pwait 22
> +
>  #define TARGET_NR_dup 23
>  #define TARGET_NR_dup3 24
>  #ifdef TARGET_RISCV32
> @@ -36,27 +44,35 @@
>  #else
>  #define TARGET_NR_fcntl 25
>  #endif
> +
>  #define TARGET_NR_inotify_init1 26
>  #define TARGET_NR_inotify_add_watch 27
>  #define TARGET_NR_inotify_rm_watch 28
> +
>  #define TARGET_NR_ioctl 29
> +
>  #define TARGET_NR_ioprio_set 30
>  #define TARGET_NR_ioprio_get 31
> +
>  #define TARGET_NR_flock 32
> +
>  #define TARGET_NR_mknodat 33
>  #define TARGET_NR_mkdirat 34
>  #define TARGET_NR_unlinkat 35
>  #define TARGET_NR_symlinkat 36
>  #define TARGET_NR_linkat 37
> -#define TARGET_NR_renameat 38
> +
>  #define TARGET_NR_umount2 39
>  #define TARGET_NR_mount 40
>  #define TARGET_NR_pivot_root 41
> +
>  #define TARGET_NR_nfsservctl 42
> +
>  #define TARGET_NR_statfs 43
>  #define TARGET_NR_fstatfs 44
>  #define TARGET_NR_truncate 45
>  #define TARGET_NR_ftruncate 46
> +
>  #define TARGET_NR_fallocate 47
>  #define TARGET_NR_faccessat 48
>  #define TARGET_NR_chdir 49
> @@ -69,9 +85,13 @@
>  #define TARGET_NR_openat 56
>  #define TARGET_NR_close 57
>  #define TARGET_NR_vhangup 58
> +
>  #define TARGET_NR_pipe2 59
> +
>  #define TARGET_NR_quotactl 60
> +
>  #define TARGET_NR_getdents64 61
> +
>  #ifdef TARGET_RISCV32
>  #define TARGET_NR__llseek 62
>  #else
> @@ -85,53 +105,91 @@
>  #define TARGET_NR_pwrite64 68
>  #define TARGET_NR_preadv 69
>  #define TARGET_NR_pwritev 70
> +
>  #define TARGET_NR_sendfile 71
> +
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_pselect6 72
>  #define TARGET_NR_ppoll 73
> +#endif
> +
>  #define TARGET_NR_signalfd4 74
> +
>  #define TARGET_NR_vmsplice 75
>  #define TARGET_NR_splice 76
>  #define TARGET_NR_tee 77
> +
>  #define TARGET_NR_readlinkat 78
>  #define TARGET_NR_newfstatat 79
>  #define TARGET_NR_fstat 80
> +
>  #define TARGET_NR_sync 81
>  #define TARGET_NR_fsync 82
>  #define TARGET_NR_fdatasync 83
>  #define TARGET_NR_sync_file_range 84
> +
>  #define TARGET_NR_timerfd_create 85
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_timerfd_settime 86
>  #define TARGET_NR_timerfd_gettime 87
> +#endif
> +
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_utimensat 88
> +#endif
> +
>  #define TARGET_NR_acct 89
> +
>  #define TARGET_NR_capget 90
>  #define TARGET_NR_capset 91
> +
>  #define TARGET_NR_personality 92
> +
>  #define TARGET_NR_exit 93
>  #define TARGET_NR_exit_group 94
>  #define TARGET_NR_waitid 95
> +
>  #define TARGET_NR_set_tid_address 96
>  #define TARGET_NR_unshare 97
> +
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_futex 98
> +#endif
>  #define TARGET_NR_set_robust_list 99
>  #define TARGET_NR_get_robust_list 100
> +
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_nanosleep 101
> +#endif
> +
>  #define TARGET_NR_getitimer 102
>  #define TARGET_NR_setitimer 103
> +
>  #define TARGET_NR_kexec_load 104
> +
>  #define TARGET_NR_init_module 105
>  #define TARGET_NR_delete_module 106
> +
>  #define TARGET_NR_timer_create 107
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_timer_gettime 108
> +#endif
>  #define TARGET_NR_timer_getoverrun 109
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_timer_settime 110
> +#endif
>  #define TARGET_NR_timer_delete 111
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_clock_settime 112
>  #define TARGET_NR_clock_gettime 113
>  #define TARGET_NR_clock_getres 114
>  #define TARGET_NR_clock_nanosleep 115
> +#endif
> +
>  #define TARGET_NR_syslog 116
> +
>  #define TARGET_NR_ptrace 117
> +
>  #define TARGET_NR_sched_setparam 118
>  #define TARGET_NR_sched_setscheduler 119
>  #define TARGET_NR_sched_getscheduler 120
> @@ -141,7 +199,10 @@
>  #define TARGET_NR_sched_yield 124
>  #define TARGET_NR_sched_get_priority_max 125
>  #define TARGET_NR_sched_get_priority_min 126
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_sched_rr_get_interval 127
> +#endif
> +
>  #define TARGET_NR_restart_syscall 128
>  #define TARGET_NR_kill 129
>  #define TARGET_NR_tkill 130
> @@ -151,9 +212,12 @@
>  #define TARGET_NR_rt_sigaction 134
>  #define TARGET_NR_rt_sigprocmask 135
>  #define TARGET_NR_rt_sigpending 136
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_rt_sigtimedwait 137
> +#endif
>  #define TARGET_NR_rt_sigqueueinfo 138
>  #define TARGET_NR_rt_sigreturn 139
> +
>  #define TARGET_NR_setpriority 140
>  #define TARGET_NR_getpriority 141
>  #define TARGET_NR_reboot 142
> @@ -177,15 +241,23 @@
>  #define TARGET_NR_uname 160
>  #define TARGET_NR_sethostname 161
>  #define TARGET_NR_setdomainname 162
> +
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_getrlimit 163
>  #define TARGET_NR_setrlimit 164
> +#endif
> +
>  #define TARGET_NR_getrusage 165
>  #define TARGET_NR_umask 166
>  #define TARGET_NR_prctl 167
>  #define TARGET_NR_getcpu 168
> +
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_gettimeofday 169
>  #define TARGET_NR_settimeofday 170
>  #define TARGET_NR_adjtimex 171
> +#endif
> +
>  #define TARGET_NR_getpid 172
>  #define TARGET_NR_getppid 173
>  #define TARGET_NR_getuid 174
> @@ -194,24 +266,34 @@
>  #define TARGET_NR_getegid 177
>  #define TARGET_NR_gettid 178
>  #define TARGET_NR_sysinfo 179
> +
>  #define TARGET_NR_mq_open 180
>  #define TARGET_NR_mq_unlink 181
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_mq_timedsend 182
>  #define TARGET_NR_mq_timedreceive 183
> +#endif
>  #define TARGET_NR_mq_notify 184
>  #define TARGET_NR_mq_getsetattr 185
> +
>  #define TARGET_NR_msgget 186
>  #define TARGET_NR_msgctl 187
>  #define TARGET_NR_msgrcv 188
>  #define TARGET_NR_msgsnd 189
> +
>  #define TARGET_NR_semget 190
>  #define TARGET_NR_semctl 191
> +
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_semtimedop 192
> +#endif
>  #define TARGET_NR_semop 193
> +
>  #define TARGET_NR_shmget 194
>  #define TARGET_NR_shmctl 195
>  #define TARGET_NR_shmat 196
>  #define TARGET_NR_shmdt 197
> +
>  #define TARGET_NR_socket 198
>  #define TARGET_NR_socketpair 199
>  #define TARGET_NR_bind 200
> @@ -227,15 +309,20 @@
>  #define TARGET_NR_shutdown 210
>  #define TARGET_NR_sendmsg 211
>  #define TARGET_NR_recvmsg 212
> +
>  #define TARGET_NR_readahead 213
> +
>  #define TARGET_NR_brk 214
>  #define TARGET_NR_munmap 215
>  #define TARGET_NR_mremap 216
> +
>  #define TARGET_NR_add_key 217
>  #define TARGET_NR_request_key 218
>  #define TARGET_NR_keyctl 219
> +
>  #define TARGET_NR_clone 220
>  #define TARGET_NR_execve 221
> +
>  #ifdef TARGET_RISCV32
>  #define TARGET_NR_mmap2 222
>  #define TARGET_NR_fadvise64_64 223
> @@ -243,6 +330,7 @@
>  #define TARGET_NR_mmap 222
>  #define TARGET_NR_fadvise64 223
>  #endif
> +
>  #define TARGET_NR_swapon 224
>  #define TARGET_NR_swapoff 225
>  #define TARGET_NR_mprotect 226
> @@ -259,18 +347,29 @@
>  #define TARGET_NR_set_mempolicy 237
>  #define TARGET_NR_migrate_pages 238
>  #define TARGET_NR_move_pages 239
> +
>  #define TARGET_NR_rt_tgsigqueueinfo 240
>  #define TARGET_NR_perf_event_open 241
>  #define TARGET_NR_accept4 242
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_recvmmsg 243
> +#endif
> +
>  #define TARGET_NR_arch_specific_syscall 244
> +
> +#define TARGET_NR_riscv_flush_icache TARGET_NR_arch_specific_syscall + 15
> +
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_wait4 260
> +#endif
>  #define TARGET_NR_prlimit64 261
>  #define TARGET_NR_fanotify_init 262
>  #define TARGET_NR_fanotify_mark 263
>  #define TARGET_NR_name_to_handle_at 264
>  #define TARGET_NR_open_by_handle_at 265
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_clock_adjtime 266
> +#endif
>  #define TARGET_NR_syncfs 267
>  #define TARGET_NR_setns 268
>  #define TARGET_NR_sendmmsg 269
> @@ -296,10 +395,67 @@
>  #define TARGET_NR_pkey_alloc 289
>  #define TARGET_NR_pkey_free 290
>  #define TARGET_NR_statx 291
> +#ifndef TARGET_RISCV32
>  #define TARGET_NR_io_pgetevents 292
> +#endif
>  #define TARGET_NR_rseq 293
>  #define TARGET_NR_kexec_file_load 294
>  
> -#define TARGET_NR_syscalls (TARGET_NR_kexec_file_load + 1)
> +#ifdef TARGET_RISCV32
> +#define TARGET_NR_clock_gettime64 403
> +#define TARGET_NR_clock_settime64 404
> +#define TARGET_NR_clock_adjtime64 405
> +#define TARGET_NR_clock_getres_time64 406
> +#define TARGET_NR_clock_nanosleep_time64 407
> +#define TARGET_NR_timer_gettime64 408
> +#define TARGET_NR_timer_settime64 409
> +#define TARGET_NR_timerfd_gettime64 410
> +#define TARGET_NR_timerfd_settime64 411
> +#define TARGET_NR_utimensat_time64 412
> +#define TARGET_NR_pselect6_time64 413
> +#define TARGET_NR_ppoll_time64 414
> +#define TARGET_NR_io_pgetevents_time64 416
> +#define TARGET_NR_recvmmsg_time64 417
> +#define TARGET_NR_mq_timedsend_time64 418
> +#define TARGET_NR_mq_timedreceive_time64 419
> +#define TARGET_NR_semtimedop_time64 420
> +#define TARGET_NR_rt_sigtimedwait_time64 421
> +#define TARGET_NR_futex_time64 422
> +#define TARGET_NR_sched_rr_get_interval_time64 423
> +#endif
> +
> +#define TARGET_NR_pidfd_send_signal 424
> +#define TARGET_NR_io_uring_setup 425
> +#define TARGET_NR_io_uring_enter 426
> +#define TARGET_NR_io_uring_register 427
> +#define TARGET_NR_open_tree 428
> +#define TARGET_NR_move_mount 429
> +#define TARGET_NR_fsopen 430
> +#define TARGET_NR_fsconfig 431
> +#define TARGET_NR_fsmount 432
> +#define TARGET_NR_fspick 433
> +#define TARGET_NR_pidfd_open 434
> +#define TARGET_NR_clone3 435
> +
> +#define TARGET_NR_syscalls (TARGET_NR_clone3 + 1)
> +
> +/* Alias some of the older pre 64-bit time_t syscalls to the 64-bit
> + * ones for RV32. This is based on the list used by glibc. */
> +#ifdef TARGET_RISCV32
> +#define TARGET_NR_futex TARGET_NR_futex_time64
> +#define TARGET_NR_rt_sigtimedwait TARGET_NR_rt_sigtimedwait_time64
> +#define TARGET_NR_ppoll TARGET_NR_ppoll_time64
> +#define TARGET_NR_utimensat TARGET_NR_utimensat_time64
> +#define TARGET_NR_pselect6 TARGET_NR_pselect6_time64
> +#define TARGET_NR_recvmmsg TARGET_NR_recvmmsg_time64
> +#define TARGET_NR_semtimedop TARGET_NR_semtimedop_time64
> +#define TARGET_NR_mq_timedreceive TARGET_NR_mq_timedreceive_time64
> +#define TARGET_NR_mq_timedsend TARGET_NR_mq_timedsend_time64
> +#define TARGET_NR_clock_getres TARGET_NR_clock_getres_time64
> +#define TARGET_NR_timerfd_settime TARGET_NR_timerfd_settime64
> +#define TARGET_NR_timerfd_gettime TARGET_NR_timerfd_gettime64
> +#define TARGET_NR_sched_rr_get_interval TARGET_NR_sched_rr_get_interval_time64
> +#define TARGET_NR_clock_adjtime TARGET_NR_clock_adjtime64
> +#endif
>  
>  #endif
> 


