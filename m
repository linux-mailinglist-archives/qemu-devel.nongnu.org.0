Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA552166AEB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 00:26:37 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4vDI-0001Oe-Un
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 18:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=31236d5d8=alistair.francis@wdc.com>)
 id 1j4vCM-0000Pd-No
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 18:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=31236d5d8=alistair.francis@wdc.com>)
 id 1j4vCK-0000i8-PD
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 18:25:38 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25475)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=31236d5d8=alistair.francis@wdc.com>)
 id 1j4vCK-0000cC-Fv; Thu, 20 Feb 2020 18:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1582241136; x=1613777136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pphneEu+0XJ0W0mLSsU1iLuHvA72OElJOv+QZQ5usrU=;
 b=eSRjkd6zAXeEBP0UuFbqiuzISWOOmrBl5YtKmiJfHt4uDgS0CxoVg1mj
 LB05zxOvzNLIojt1ZBW2U6P2YacT0kZpQ/N9QJQ+m6jIUdK/96WJPzjFD
 xZY1Fm4XhA9sW1wYJ8A0sDzf3fsmPE+cVWRUZjqriWynzRDmEWysiJoJP
 MO8EHMy/sZa+75b/gI6XAl/7D5qnWHCLiCS9eyDxvOHfoyZIA0WDiin1y
 5nXDeNS0qe3KnduZ9Dx65PIezjtuI1S+Xk33feRPut6p0PZXGlQBlNsFH
 vNt7Qw1W5M7NopboWmGyTl1rgGxtfitiCdCKoBE+ps+PR+eRdzPZ2pWMa w==;
IronPort-SDR: 5QLIowRdNnoHjs4ErvH61XduoRf2FLqFJQ34jH6dEMiCvTvsDLdy0W+tRfGJhhP9GnQLxYU89k
 Tl75J4Z+i2edl44Ps9mk7eL5b/I2qJXDtaHfFlakIsH0j45l3hVgOSbCsWihAB9skONWyd+SsA
 3ReDKggSiRKMorolXX6NpmOVfDjibTrYXyAS1eh2/Nqdm0tjD/tYA45Uq0V1qQAFTKXP4ZnNhx
 ZA38OzOdAHwjbiMUslSEspKCr+VrU1YO2r5xD6AfD8cw1ftF54Yvj/bE75hu1peu+H3pkLbD+T
 mgA=
X-IronPort-AV: E=Sophos;i="5.70,466,1574092800"; d="scan'208";a="238445372"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2020 07:25:35 +0800
IronPort-SDR: XXM+ZwE+wmzFmTDl3ozFEiKR+mnQTeCSwVrpBxOuWuPMmgqldVu7QuTVWo0AZ7WFP0UmYQB21c
 CvxdoCw8e+nM2KEWpD3yOc8Lz0ZACT3WqGoVb+K9etIFphaA7MFl79FIqCnilk8uoPUQ6J1B/+
 XwDKeMTBdh7cM1ituL+IC7TeVr2PJ0+ITmGGubuWPOxc0y6kKwRCRfbwzeUJiGK8EMs5eHoDOM
 5sCB0a0mf14OVBlsWbewU8EX4BIgHhqO452SDPMenQkcGfpxlcGdPoA4QBFFXTlCJ9jwTFinHz
 2MRppKNDKsdfUbxZ0Knk/mT0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 15:18:10 -0800
IronPort-SDR: 62RLw+4Xp5swZT4eQdPg++cvt9e1q6alElAlNHohu2JuhX09U2OAAl7Ok4w4I2x4gQECOSXr6m
 jXA6zVuzQAb6++51yokzPx5dT4Pafhc9TeW73hUAjgXsJ7fBhllLWH84/NMupgGdyr2uAw1kn9
 ZdodLvaMkSjABFaS9CvfYKYDUcUodFXtWFBr9AIV/K+1QFGmvjnNJDRh/Wnyuk06P4myJd6E9q
 WWDCbLiJE2retPY5sQDlm3mEU4W2LvqaW77fNim0/EPCtkgE8ZiIcB9H8AMcC5D6PDcpZzqK9j
 E1Q=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Feb 2020 15:25:36 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v1 2/2] linux-user/riscv: Update the syscall_nr's to the 5.5
 kernel
Date: Thu, 20 Feb 2020 15:18:33 -0800
Message-Id: <8f6625e62bd766eacdae40e9a74186f247fe16b0.1582240656.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1582240656.git.alistair.francis@wdc.com>
References: <cover.1582240656.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.141.245
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, laurent@vivier.eu,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-user/riscv/syscall_nr.h | 160 +++++++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 2 deletions(-)

diff --git a/linux-user/riscv/syscall_nr.h b/linux-user/riscv/syscall_nr.h
index 5c87282209..b2b071969b 100644
--- a/linux-user/riscv/syscall_nr.h
+++ b/linux-user/riscv/syscall_nr.h
@@ -10,7 +10,10 @@
 #define TARGET_NR_io_destroy 1
 #define TARGET_NR_io_submit 2
 #define TARGET_NR_io_cancel 3
+#ifndef TARGET_RISCV32
 #define TARGET_NR_io_getevents 4
+#endif
+
 #define TARGET_NR_setxattr 5
 #define TARGET_NR_lsetxattr 6
 #define TARGET_NR_fsetxattr 7
@@ -23,12 +26,17 @@
 #define TARGET_NR_removexattr 14
 #define TARGET_NR_lremovexattr 15
 #define TARGET_NR_fremovexattr 16
+
 #define TARGET_NR_getcwd 17
+
 #define TARGET_NR_lookup_dcookie 18
+
 #define TARGET_NR_eventfd2 19
+
 #define TARGET_NR_epoll_create1 20
 #define TARGET_NR_epoll_ctl 21
 #define TARGET_NR_epoll_pwait 22
+
 #define TARGET_NR_dup 23
 #define TARGET_NR_dup3 24
 #ifdef TARGET_RISCV32
@@ -36,27 +44,35 @@
 #else
 #define TARGET_NR_fcntl 25
 #endif
+
 #define TARGET_NR_inotify_init1 26
 #define TARGET_NR_inotify_add_watch 27
 #define TARGET_NR_inotify_rm_watch 28
+
 #define TARGET_NR_ioctl 29
+
 #define TARGET_NR_ioprio_set 30
 #define TARGET_NR_ioprio_get 31
+
 #define TARGET_NR_flock 32
+
 #define TARGET_NR_mknodat 33
 #define TARGET_NR_mkdirat 34
 #define TARGET_NR_unlinkat 35
 #define TARGET_NR_symlinkat 36
 #define TARGET_NR_linkat 37
-#define TARGET_NR_renameat 38
+
 #define TARGET_NR_umount2 39
 #define TARGET_NR_mount 40
 #define TARGET_NR_pivot_root 41
+
 #define TARGET_NR_nfsservctl 42
+
 #define TARGET_NR_statfs 43
 #define TARGET_NR_fstatfs 44
 #define TARGET_NR_truncate 45
 #define TARGET_NR_ftruncate 46
+
 #define TARGET_NR_fallocate 47
 #define TARGET_NR_faccessat 48
 #define TARGET_NR_chdir 49
@@ -69,9 +85,13 @@
 #define TARGET_NR_openat 56
 #define TARGET_NR_close 57
 #define TARGET_NR_vhangup 58
+
 #define TARGET_NR_pipe2 59
+
 #define TARGET_NR_quotactl 60
+
 #define TARGET_NR_getdents64 61
+
 #ifdef TARGET_RISCV32
 #define TARGET_NR__llseek 62
 #else
@@ -85,53 +105,91 @@
 #define TARGET_NR_pwrite64 68
 #define TARGET_NR_preadv 69
 #define TARGET_NR_pwritev 70
+
 #define TARGET_NR_sendfile 71
+
+#ifndef TARGET_RISCV32
 #define TARGET_NR_pselect6 72
 #define TARGET_NR_ppoll 73
+#endif
+
 #define TARGET_NR_signalfd4 74
+
 #define TARGET_NR_vmsplice 75
 #define TARGET_NR_splice 76
 #define TARGET_NR_tee 77
+
 #define TARGET_NR_readlinkat 78
 #define TARGET_NR_newfstatat 79
 #define TARGET_NR_fstat 80
+
 #define TARGET_NR_sync 81
 #define TARGET_NR_fsync 82
 #define TARGET_NR_fdatasync 83
 #define TARGET_NR_sync_file_range 84
+
 #define TARGET_NR_timerfd_create 85
+#ifndef TARGET_RISCV32
 #define TARGET_NR_timerfd_settime 86
 #define TARGET_NR_timerfd_gettime 87
+#endif
+
+#ifndef TARGET_RISCV32
 #define TARGET_NR_utimensat 88
+#endif
+
 #define TARGET_NR_acct 89
+
 #define TARGET_NR_capget 90
 #define TARGET_NR_capset 91
+
 #define TARGET_NR_personality 92
+
 #define TARGET_NR_exit 93
 #define TARGET_NR_exit_group 94
 #define TARGET_NR_waitid 95
+
 #define TARGET_NR_set_tid_address 96
 #define TARGET_NR_unshare 97
+
+#ifndef TARGET_RISCV32
 #define TARGET_NR_futex 98
+#endif
 #define TARGET_NR_set_robust_list 99
 #define TARGET_NR_get_robust_list 100
+
+#ifndef TARGET_RISCV32
 #define TARGET_NR_nanosleep 101
+#endif
+
 #define TARGET_NR_getitimer 102
 #define TARGET_NR_setitimer 103
+
 #define TARGET_NR_kexec_load 104
+
 #define TARGET_NR_init_module 105
 #define TARGET_NR_delete_module 106
+
 #define TARGET_NR_timer_create 107
+#ifndef TARGET_RISCV32
 #define TARGET_NR_timer_gettime 108
+#endif
 #define TARGET_NR_timer_getoverrun 109
+#ifndef TARGET_RISCV32
 #define TARGET_NR_timer_settime 110
+#endif
 #define TARGET_NR_timer_delete 111
+#ifndef TARGET_RISCV32
 #define TARGET_NR_clock_settime 112
 #define TARGET_NR_clock_gettime 113
 #define TARGET_NR_clock_getres 114
 #define TARGET_NR_clock_nanosleep 115
+#endif
+
 #define TARGET_NR_syslog 116
+
 #define TARGET_NR_ptrace 117
+
 #define TARGET_NR_sched_setparam 118
 #define TARGET_NR_sched_setscheduler 119
 #define TARGET_NR_sched_getscheduler 120
@@ -141,7 +199,10 @@
 #define TARGET_NR_sched_yield 124
 #define TARGET_NR_sched_get_priority_max 125
 #define TARGET_NR_sched_get_priority_min 126
+#ifndef TARGET_RISCV32
 #define TARGET_NR_sched_rr_get_interval 127
+#endif
+
 #define TARGET_NR_restart_syscall 128
 #define TARGET_NR_kill 129
 #define TARGET_NR_tkill 130
@@ -151,9 +212,12 @@
 #define TARGET_NR_rt_sigaction 134
 #define TARGET_NR_rt_sigprocmask 135
 #define TARGET_NR_rt_sigpending 136
+#ifndef TARGET_RISCV32
 #define TARGET_NR_rt_sigtimedwait 137
+#endif
 #define TARGET_NR_rt_sigqueueinfo 138
 #define TARGET_NR_rt_sigreturn 139
+
 #define TARGET_NR_setpriority 140
 #define TARGET_NR_getpriority 141
 #define TARGET_NR_reboot 142
@@ -177,15 +241,23 @@
 #define TARGET_NR_uname 160
 #define TARGET_NR_sethostname 161
 #define TARGET_NR_setdomainname 162
+
+#ifndef TARGET_RISCV32
 #define TARGET_NR_getrlimit 163
 #define TARGET_NR_setrlimit 164
+#endif
+
 #define TARGET_NR_getrusage 165
 #define TARGET_NR_umask 166
 #define TARGET_NR_prctl 167
 #define TARGET_NR_getcpu 168
+
+#ifndef TARGET_RISCV32
 #define TARGET_NR_gettimeofday 169
 #define TARGET_NR_settimeofday 170
 #define TARGET_NR_adjtimex 171
+#endif
+
 #define TARGET_NR_getpid 172
 #define TARGET_NR_getppid 173
 #define TARGET_NR_getuid 174
@@ -194,24 +266,34 @@
 #define TARGET_NR_getegid 177
 #define TARGET_NR_gettid 178
 #define TARGET_NR_sysinfo 179
+
 #define TARGET_NR_mq_open 180
 #define TARGET_NR_mq_unlink 181
+#ifndef TARGET_RISCV32
 #define TARGET_NR_mq_timedsend 182
 #define TARGET_NR_mq_timedreceive 183
+#endif
 #define TARGET_NR_mq_notify 184
 #define TARGET_NR_mq_getsetattr 185
+
 #define TARGET_NR_msgget 186
 #define TARGET_NR_msgctl 187
 #define TARGET_NR_msgrcv 188
 #define TARGET_NR_msgsnd 189
+
 #define TARGET_NR_semget 190
 #define TARGET_NR_semctl 191
+
+#ifndef TARGET_RISCV32
 #define TARGET_NR_semtimedop 192
+#endif
 #define TARGET_NR_semop 193
+
 #define TARGET_NR_shmget 194
 #define TARGET_NR_shmctl 195
 #define TARGET_NR_shmat 196
 #define TARGET_NR_shmdt 197
+
 #define TARGET_NR_socket 198
 #define TARGET_NR_socketpair 199
 #define TARGET_NR_bind 200
@@ -227,15 +309,20 @@
 #define TARGET_NR_shutdown 210
 #define TARGET_NR_sendmsg 211
 #define TARGET_NR_recvmsg 212
+
 #define TARGET_NR_readahead 213
+
 #define TARGET_NR_brk 214
 #define TARGET_NR_munmap 215
 #define TARGET_NR_mremap 216
+
 #define TARGET_NR_add_key 217
 #define TARGET_NR_request_key 218
 #define TARGET_NR_keyctl 219
+
 #define TARGET_NR_clone 220
 #define TARGET_NR_execve 221
+
 #ifdef TARGET_RISCV32
 #define TARGET_NR_mmap2 222
 #define TARGET_NR_fadvise64_64 223
@@ -243,6 +330,7 @@
 #define TARGET_NR_mmap 222
 #define TARGET_NR_fadvise64 223
 #endif
+
 #define TARGET_NR_swapon 224
 #define TARGET_NR_swapoff 225
 #define TARGET_NR_mprotect 226
@@ -259,18 +347,29 @@
 #define TARGET_NR_set_mempolicy 237
 #define TARGET_NR_migrate_pages 238
 #define TARGET_NR_move_pages 239
+
 #define TARGET_NR_rt_tgsigqueueinfo 240
 #define TARGET_NR_perf_event_open 241
 #define TARGET_NR_accept4 242
+#ifndef TARGET_RISCV32
 #define TARGET_NR_recvmmsg 243
+#endif
+
 #define TARGET_NR_arch_specific_syscall 244
+
+#define TARGET_NR_riscv_flush_icache TARGET_NR_arch_specific_syscall + 15
+
+#ifndef TARGET_RISCV32
 #define TARGET_NR_wait4 260
+#endif
 #define TARGET_NR_prlimit64 261
 #define TARGET_NR_fanotify_init 262
 #define TARGET_NR_fanotify_mark 263
 #define TARGET_NR_name_to_handle_at 264
 #define TARGET_NR_open_by_handle_at 265
+#ifndef TARGET_RISCV32
 #define TARGET_NR_clock_adjtime 266
+#endif
 #define TARGET_NR_syncfs 267
 #define TARGET_NR_setns 268
 #define TARGET_NR_sendmmsg 269
@@ -296,10 +395,67 @@
 #define TARGET_NR_pkey_alloc 289
 #define TARGET_NR_pkey_free 290
 #define TARGET_NR_statx 291
+#ifndef TARGET_RISCV32
 #define TARGET_NR_io_pgetevents 292
+#endif
 #define TARGET_NR_rseq 293
 #define TARGET_NR_kexec_file_load 294
 
-#define TARGET_NR_syscalls (TARGET_NR_kexec_file_load + 1)
+#ifdef TARGET_RISCV32
+#define TARGET_NR_clock_gettime64 403
+#define TARGET_NR_clock_settime64 404
+#define TARGET_NR_clock_adjtime64 405
+#define TARGET_NR_clock_getres_time64 406
+#define TARGET_NR_clock_nanosleep_time64 407
+#define TARGET_NR_timer_gettime64 408
+#define TARGET_NR_timer_settime64 409
+#define TARGET_NR_timerfd_gettime64 410
+#define TARGET_NR_timerfd_settime64 411
+#define TARGET_NR_utimensat_time64 412
+#define TARGET_NR_pselect6_time64 413
+#define TARGET_NR_ppoll_time64 414
+#define TARGET_NR_io_pgetevents_time64 416
+#define TARGET_NR_recvmmsg_time64 417
+#define TARGET_NR_mq_timedsend_time64 418
+#define TARGET_NR_mq_timedreceive_time64 419
+#define TARGET_NR_semtimedop_time64 420
+#define TARGET_NR_rt_sigtimedwait_time64 421
+#define TARGET_NR_futex_time64 422
+#define TARGET_NR_sched_rr_get_interval_time64 423
+#endif
+
+#define TARGET_NR_pidfd_send_signal 424
+#define TARGET_NR_io_uring_setup 425
+#define TARGET_NR_io_uring_enter 426
+#define TARGET_NR_io_uring_register 427
+#define TARGET_NR_open_tree 428
+#define TARGET_NR_move_mount 429
+#define TARGET_NR_fsopen 430
+#define TARGET_NR_fsconfig 431
+#define TARGET_NR_fsmount 432
+#define TARGET_NR_fspick 433
+#define TARGET_NR_pidfd_open 434
+#define TARGET_NR_clone3 435
+
+#define TARGET_NR_syscalls (TARGET_NR_clone3 + 1)
+
+/* Alias some of the older pre 64-bit time_t syscalls to the 64-bit
+ * ones for RV32. This is based on the list used by glibc. */
+#ifdef TARGET_RISCV32
+#define TARGET_NR_futex TARGET_NR_futex_time64
+#define TARGET_NR_rt_sigtimedwait TARGET_NR_rt_sigtimedwait_time64
+#define TARGET_NR_ppoll TARGET_NR_ppoll_time64
+#define TARGET_NR_utimensat TARGET_NR_utimensat_time64
+#define TARGET_NR_pselect6 TARGET_NR_pselect6_time64
+#define TARGET_NR_recvmmsg TARGET_NR_recvmmsg_time64
+#define TARGET_NR_semtimedop TARGET_NR_semtimedop_time64
+#define TARGET_NR_mq_timedreceive TARGET_NR_mq_timedreceive_time64
+#define TARGET_NR_mq_timedsend TARGET_NR_mq_timedsend_time64
+#define TARGET_NR_clock_getres TARGET_NR_clock_getres_time64
+#define TARGET_NR_timerfd_settime TARGET_NR_timerfd_settime64
+#define TARGET_NR_timerfd_gettime TARGET_NR_timerfd_gettime64
+#define TARGET_NR_sched_rr_get_interval TARGET_NR_sched_rr_get_interval_time64
+#define TARGET_NR_clock_adjtime TARGET_NR_clock_adjtime64
+#endif
 
 #endif
-- 
2.25.0


