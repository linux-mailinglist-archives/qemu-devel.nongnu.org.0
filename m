Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D917874D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 01:56:32 +0100 (CET)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9IKt-0006rC-Eu
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 19:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=3258e4f7a=alistair.francis@wdc.com>)
 id 1j9IGk-0002aE-Lc
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 19:52:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=3258e4f7a=alistair.francis@wdc.com>)
 id 1j9IGg-0003zT-RA
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 19:52:14 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:32349)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=3258e4f7a=alistair.francis@wdc.com>)
 id 1j9IGg-0003uO-AT; Tue, 03 Mar 2020 19:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1583283130; x=1614819130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3jLovsZJopHCsAdVqz78jW3Fb206vPqhRcut/OwegIs=;
 b=gS1mYq3hK5WzUQow60FAF3hdeeQ/6isJyk6oKskr3iOIvWJQ4dteWCHe
 cW4n6etsTAjtVMfT5rdY/DB9NW8u9ZobLLputhgRksEGMhZgOZX5z1YxF
 kKuCCz5LdbIAnR3Z6FFCRkbSIwiuD2S0c7ZRbX1WVFwv29cUGFrHfNuNU
 zUHDwG3TT4qqwD/j2m4b2L/24/+5IpQS5SlGEbu+4fAs7Zc8a5S6wh/bj
 elI+X45QIiynRCaG//+fG3ED5z6oPNkS1lbuxAJ/lh7AgtA8NdNUWE1C5
 PPd7DS4Cp1rJ9RmjXkEOX3lHmyd6/7eYynHBPjFrDkG1/HLn25r5WpVHH A==;
IronPort-SDR: WK/KXy6C+uj2V2XsbCrS4P1WiUi64OSGuEAdyZGMSQcQMgBQRK+LSayOx4lIzwFjqraNs3Ctjh
 fnpTRPEGkORulLv6B8/Wp1N14OxCjdEIjDZ/K5GlQpF97bBw96MYg1CArGIDZFu+LGo1wK5NK5
 i5HsCCw3yXBrUFwDbi6pFcwlnvrCF3K2i3jLkVpm1SziooekxA4kTnG7uOnfi6LbfuOTXvx19A
 B96nD3HxpWvmqcydGCp7ee479HGEZ5MGdk87TwW2K/3xzFIpedz18iygNEoCGj6OHXp9fjai0W
 n1M=
X-IronPort-AV: E=Sophos;i="5.70,511,1574092800"; d="scan'208";a="131861944"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2020 08:52:09 +0800
IronPort-SDR: +heU2lkk/hPRqu4BH4ltOaOJDRUbXDrzu+biFaw+Od+x8D7WsDP2ezdqOF7DwILPkqU44O8y8U
 jrmLCSIAjjGE3FXn3jumOEKgGVQpUE3aQZITDH1oq5rMd3d6fKJQ5u9kid0otFOY0XnaxDkCes
 91koTMWLt4jv+R8T0wYwJVBQJljq/xrIBN0MWAYtHKrsvc6DASLjdWxaQonIv0yLZe/KLbTeys
 S0F84KQZS8yEYTqFOe81uJByz7GsLPR4J5MnuJofKaQ6sJz6EPh3KGrl5lMHoLxZfUSN/Y5f24
 5lNH/njsa3f7/Sw0gZw2S0iu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 16:44:24 -0800
IronPort-SDR: wnNQ5IsC5sASSc8ZBgej65YJr/JEf4SpUk7vrDMpnt8ZZ/dEvTg8IBvXxSTos58vUS1/A9wiey
 zY5jym61/z+nlw1CBLwcc3O2Wdnv1G2nk34xu3fz0CBUewU6eg9I6sTJMxyS0pT2kpChljaWK+
 xhrU8Aazr2yXAj7IZTT5GDPiRxRZqODnCrnEqgqmb3emFnw1gw80IBhE6Qtd2fGa1CuoGR2GEd
 qJu9pqzmRFMmpYlQ+QMmV/hfc9UTIzEI905ssa+SzyAcElRfoqONrljmvTcs9/nEXvAGPgeogM
 feQ=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Mar 2020 16:52:10 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	laurent@vivier.eu
Subject: [PATCH v4 3/3] linux-user/riscv: Update the syscall_nr's to the 5.5
 kernel
Date: Tue,  3 Mar 2020 16:44:56 -0800
Message-Id: <2e27c7c2d8d9f823cf6d10e96652ae1b975a3278.1583282640.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1583282640.git.alistair.francis@wdc.com>
References: <cover.1583282640.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.153.144
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-user/riscv/syscall32_nr.h | 295 +++++++++++++++++++++++++++++++
 linux-user/riscv/syscall64_nr.h | 301 ++++++++++++++++++++++++++++++++
 linux-user/riscv/syscall_nr.h   | 294 +------------------------------
 3 files changed, 598 insertions(+), 292 deletions(-)
 create mode 100644 linux-user/riscv/syscall32_nr.h
 create mode 100644 linux-user/riscv/syscall64_nr.h

diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall32_nr.h
new file mode 100644
index 0000000000..4fef73e954
--- /dev/null
+++ b/linux-user/riscv/syscall32_nr.h
@@ -0,0 +1,295 @@
+/*
+ * This file contains the system call numbers.
+ */
+#ifndef LINUX_USER_RISCV_SYSCALL32_NR_H
+#define LINUX_USER_RISCV_SYSCALL32_NR_H
+
+#define TARGET_NR_io_setup 0
+#define TARGET_NR_io_destroy 1
+#define TARGET_NR_io_submit 2
+#define TARGET_NR_io_cancel 3
+#define TARGET_NR_setxattr 5
+#define TARGET_NR_lsetxattr 6
+#define TARGET_NR_fsetxattr 7
+#define TARGET_NR_getxattr 8
+#define TARGET_NR_lgetxattr 9
+#define TARGET_NR_fgetxattr 10
+#define TARGET_NR_listxattr 11
+#define TARGET_NR_llistxattr 12
+#define TARGET_NR_flistxattr 13
+#define TARGET_NR_removexattr 14
+#define TARGET_NR_lremovexattr 15
+#define TARGET_NR_fremovexattr 16
+#define TARGET_NR_getcwd 17
+#define TARGET_NR_lookup_dcookie 18
+#define TARGET_NR_eventfd2 19
+#define TARGET_NR_epoll_create1 20
+#define TARGET_NR_epoll_ctl 21
+#define TARGET_NR_epoll_pwait 22
+#define TARGET_NR_dup 23
+#define TARGET_NR_dup3 24
+#define TARGET_NR_fcntl64 25
+#define TARGET_NR_inotify_init1 26
+#define TARGET_NR_inotify_add_watch 27
+#define TARGET_NR_inotify_rm_watch 28
+#define TARGET_NR_ioctl 29
+#define TARGET_NR_ioprio_set 30
+#define TARGET_NR_ioprio_get 31
+#define TARGET_NR_flock 32
+#define TARGET_NR_mknodat 33
+#define TARGET_NR_mkdirat 34
+#define TARGET_NR_unlinkat 35
+#define TARGET_NR_symlinkat 36
+#define TARGET_NR_linkat 37
+#define TARGET_NR_umount2 39
+#define TARGET_NR_mount 40
+#define TARGET_NR_pivot_root 41
+#define TARGET_NR_nfsservctl 42
+#define TARGET_NR_statfs64 43
+#define TARGET_NR_fstatfs64 44
+#define TARGET_NR_truncate64 45
+#define TARGET_NR_ftruncate64 46
+#define TARGET_NR_fallocate 47
+#define TARGET_NR_faccessat 48
+#define TARGET_NR_chdir 49
+#define TARGET_NR_fchdir 50
+#define TARGET_NR_chroot 51
+#define TARGET_NR_fchmod 52
+#define TARGET_NR_fchmodat 53
+#define TARGET_NR_fchownat 54
+#define TARGET_NR_fchown 55
+#define TARGET_NR_openat 56
+#define TARGET_NR_close 57
+#define TARGET_NR_vhangup 58
+#define TARGET_NR_pipe2 59
+#define TARGET_NR_quotactl 60
+#define TARGET_NR_getdents64 61
+#define TARGET_NR_llseek 62
+#define TARGET_NR_read 63
+#define TARGET_NR_write 64
+#define TARGET_NR_readv 65
+#define TARGET_NR_writev 66
+#define TARGET_NR_pread64 67
+#define TARGET_NR_pwrite64 68
+#define TARGET_NR_preadv 69
+#define TARGET_NR_pwritev 70
+#define TARGET_NR_sendfile64 71
+#define TARGET_NR_signalfd4 74
+#define TARGET_NR_vmsplice 75
+#define TARGET_NR_splice 76
+#define TARGET_NR_tee 77
+#define TARGET_NR_readlinkat 78
+#define TARGET_NR_fstatat64 79
+#define TARGET_NR_fstat64 80
+#define TARGET_NR_sync 81
+#define TARGET_NR_fsync 82
+#define TARGET_NR_fdatasync 83
+#define TARGET_NR_sync_file_range 84
+#define TARGET_NR_timerfd_create 85
+#define TARGET_NR_acct 89
+#define TARGET_NR_capget 90
+#define TARGET_NR_capset 91
+#define TARGET_NR_personality 92
+#define TARGET_NR_exit 93
+#define TARGET_NR_exit_group 94
+#define TARGET_NR_waitid 95
+#define TARGET_NR_set_tid_address 96
+#define TARGET_NR_unshare 97
+#define TARGET_NR_set_robust_list 99
+#define TARGET_NR_get_robust_list 100
+#define TARGET_NR_getitimer 102
+#define TARGET_NR_setitimer 103
+#define TARGET_NR_kexec_load 104
+#define TARGET_NR_init_module 105
+#define TARGET_NR_delete_module 106
+#define TARGET_NR_timer_create 107
+#define TARGET_NR_timer_getoverrun 109
+#define TARGET_NR_timer_delete 111
+#define TARGET_NR_syslog 116
+#define TARGET_NR_ptrace 117
+#define TARGET_NR_sched_setparam 118
+#define TARGET_NR_sched_setscheduler 119
+#define TARGET_NR_sched_getscheduler 120
+#define TARGET_NR_sched_getparam 121
+#define TARGET_NR_sched_setaffinity 122
+#define TARGET_NR_sched_getaffinity 123
+#define TARGET_NR_sched_yield 124
+#define TARGET_NR_sched_get_priority_max 125
+#define TARGET_NR_sched_get_priority_min 126
+#define TARGET_NR_restart_syscall 128
+#define TARGET_NR_kill 129
+#define TARGET_NR_tkill 130
+#define TARGET_NR_tgkill 131
+#define TARGET_NR_sigaltstack 132
+#define TARGET_NR_rt_sigsuspend 133
+#define TARGET_NR_rt_sigaction 134
+#define TARGET_NR_rt_sigprocmask 135
+#define TARGET_NR_rt_sigpending 136
+#define TARGET_NR_rt_sigqueueinfo 138
+#define TARGET_NR_rt_sigreturn 139
+#define TARGET_NR_setpriority 140
+#define TARGET_NR_getpriority 141
+#define TARGET_NR_reboot 142
+#define TARGET_NR_setregid 143
+#define TARGET_NR_setgid 144
+#define TARGET_NR_setreuid 145
+#define TARGET_NR_setuid 146
+#define TARGET_NR_setresuid 147
+#define TARGET_NR_getresuid 148
+#define TARGET_NR_setresgid 149
+#define TARGET_NR_getresgid 150
+#define TARGET_NR_setfsuid 151
+#define TARGET_NR_setfsgid 152
+#define TARGET_NR_times 153
+#define TARGET_NR_setpgid 154
+#define TARGET_NR_getpgid 155
+#define TARGET_NR_getsid 156
+#define TARGET_NR_setsid 157
+#define TARGET_NR_getgroups 158
+#define TARGET_NR_setgroups 159
+#define TARGET_NR_uname 160
+#define TARGET_NR_sethostname 161
+#define TARGET_NR_setdomainname 162
+#define TARGET_NR_getrlimit 163
+#define TARGET_NR_setrlimit 164
+#define TARGET_NR_getrusage 165
+#define TARGET_NR_umask 166
+#define TARGET_NR_prctl 167
+#define TARGET_NR_getcpu 168
+#define TARGET_NR_getpid 172
+#define TARGET_NR_getppid 173
+#define TARGET_NR_getuid 174
+#define TARGET_NR_geteuid 175
+#define TARGET_NR_getgid 176
+#define TARGET_NR_getegid 177
+#define TARGET_NR_gettid 178
+#define TARGET_NR_sysinfo 179
+#define TARGET_NR_mq_open 180
+#define TARGET_NR_mq_unlink 181
+#define TARGET_NR_mq_notify 184
+#define TARGET_NR_mq_getsetattr 185
+#define TARGET_NR_msgget 186
+#define TARGET_NR_msgctl 187
+#define TARGET_NR_msgrcv 188
+#define TARGET_NR_msgsnd 189
+#define TARGET_NR_semget 190
+#define TARGET_NR_semctl 191
+#define TARGET_NR_semop 193
+#define TARGET_NR_shmget 194
+#define TARGET_NR_shmctl 195
+#define TARGET_NR_shmat 196
+#define TARGET_NR_shmdt 197
+#define TARGET_NR_socket 198
+#define TARGET_NR_socketpair 199
+#define TARGET_NR_bind 200
+#define TARGET_NR_listen 201
+#define TARGET_NR_accept 202
+#define TARGET_NR_connect 203
+#define TARGET_NR_getsockname 204
+#define TARGET_NR_getpeername 205
+#define TARGET_NR_sendto 206
+#define TARGET_NR_recvfrom 207
+#define TARGET_NR_setsockopt 208
+#define TARGET_NR_getsockopt 209
+#define TARGET_NR_shutdown 210
+#define TARGET_NR_sendmsg 211
+#define TARGET_NR_recvmsg 212
+#define TARGET_NR_readahead 213
+#define TARGET_NR_brk 214
+#define TARGET_NR_munmap 215
+#define TARGET_NR_mremap 216
+#define TARGET_NR_add_key 217
+#define TARGET_NR_request_key 218
+#define TARGET_NR_keyctl 219
+#define TARGET_NR_clone 220
+#define TARGET_NR_execve 221
+#define TARGET_NR_mmap2 222
+#define TARGET_NR_fadvise64_64 223
+#define TARGET_NR_swapon 224
+#define TARGET_NR_swapoff 225
+#define TARGET_NR_mprotect 226
+#define TARGET_NR_msync 227
+#define TARGET_NR_mlock 228
+#define TARGET_NR_munlock 229
+#define TARGET_NR_mlockall 230
+#define TARGET_NR_munlockall 231
+#define TARGET_NR_mincore 232
+#define TARGET_NR_madvise 233
+#define TARGET_NR_remap_file_pages 234
+#define TARGET_NR_mbind 235
+#define TARGET_NR_get_mempolicy 236
+#define TARGET_NR_set_mempolicy 237
+#define TARGET_NR_migrate_pages 238
+#define TARGET_NR_move_pages 239
+#define TARGET_NR_rt_tgsigqueueinfo 240
+#define TARGET_NR_perf_event_open 241
+#define TARGET_NR_accept4 242
+#define TARGET_NR_arch_specific_syscall 244
+#define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + 15)
+#define TARGET_NR_prlimit64 261
+#define TARGET_NR_fanotify_init 262
+#define TARGET_NR_fanotify_mark 263
+#define TARGET_NR_name_to_handle_at 264
+#define TARGET_NR_open_by_handle_at 265
+#define TARGET_NR_syncfs 267
+#define TARGET_NR_setns 268
+#define TARGET_NR_sendmmsg 269
+#define TARGET_NR_process_vm_readv 270
+#define TARGET_NR_process_vm_writev 271
+#define TARGET_NR_kcmp 272
+#define TARGET_NR_finit_module 273
+#define TARGET_NR_sched_setattr 274
+#define TARGET_NR_sched_getattr 275
+#define TARGET_NR_renameat2 276
+#define TARGET_NR_seccomp 277
+#define TARGET_NR_getrandom 278
+#define TARGET_NR_memfd_create 279
+#define TARGET_NR_bpf 280
+#define TARGET_NR_execveat 281
+#define TARGET_NR_userfaultfd 282
+#define TARGET_NR_membarrier 283
+#define TARGET_NR_mlock2 284
+#define TARGET_NR_copy_file_range 285
+#define TARGET_NR_preadv2 286
+#define TARGET_NR_pwritev2 287
+#define TARGET_NR_pkey_mprotect 288
+#define TARGET_NR_pkey_alloc 289
+#define TARGET_NR_pkey_free 290
+#define TARGET_NR_statx 291
+#define TARGET_NR_rseq 293
+#define TARGET_NR_kexec_file_load 294
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
+#define TARGET_NR_syscalls 436
+
+#endif /* LINUX_USER_RISCV_SYSCALL32_NR_H */
diff --git a/linux-user/riscv/syscall64_nr.h b/linux-user/riscv/syscall64_nr.h
new file mode 100644
index 0000000000..cc82f3244f
--- /dev/null
+++ b/linux-user/riscv/syscall64_nr.h
@@ -0,0 +1,301 @@
+/*
+ * This file contains the system call numbers.
+ */
+#ifndef LINUX_USER_RISCV_SYSCALL64_NR_H
+#define LINUX_USER_RISCV_SYSCALL64_NR_H
+
+#define TARGET_NR_io_setup 0
+#define TARGET_NR_io_destroy 1
+#define TARGET_NR_io_submit 2
+#define TARGET_NR_io_cancel 3
+#define TARGET_NR_io_getevents 4
+#define TARGET_NR_setxattr 5
+#define TARGET_NR_lsetxattr 6
+#define TARGET_NR_fsetxattr 7
+#define TARGET_NR_getxattr 8
+#define TARGET_NR_lgetxattr 9
+#define TARGET_NR_fgetxattr 10
+#define TARGET_NR_listxattr 11
+#define TARGET_NR_llistxattr 12
+#define TARGET_NR_flistxattr 13
+#define TARGET_NR_removexattr 14
+#define TARGET_NR_lremovexattr 15
+#define TARGET_NR_fremovexattr 16
+#define TARGET_NR_getcwd 17
+#define TARGET_NR_lookup_dcookie 18
+#define TARGET_NR_eventfd2 19
+#define TARGET_NR_epoll_create1 20
+#define TARGET_NR_epoll_ctl 21
+#define TARGET_NR_epoll_pwait 22
+#define TARGET_NR_dup 23
+#define TARGET_NR_dup3 24
+#define TARGET_NR_fcntl 25
+#define TARGET_NR_inotify_init1 26
+#define TARGET_NR_inotify_add_watch 27
+#define TARGET_NR_inotify_rm_watch 28
+#define TARGET_NR_ioctl 29
+#define TARGET_NR_ioprio_set 30
+#define TARGET_NR_ioprio_get 31
+#define TARGET_NR_flock 32
+#define TARGET_NR_mknodat 33
+#define TARGET_NR_mkdirat 34
+#define TARGET_NR_unlinkat 35
+#define TARGET_NR_symlinkat 36
+#define TARGET_NR_linkat 37
+#define TARGET_NR_umount2 39
+#define TARGET_NR_mount 40
+#define TARGET_NR_pivot_root 41
+#define TARGET_NR_nfsservctl 42
+#define TARGET_NR_statfs 43
+#define TARGET_NR_fstatfs 44
+#define TARGET_NR_truncate 45
+#define TARGET_NR_ftruncate 46
+#define TARGET_NR_fallocate 47
+#define TARGET_NR_faccessat 48
+#define TARGET_NR_chdir 49
+#define TARGET_NR_fchdir 50
+#define TARGET_NR_chroot 51
+#define TARGET_NR_fchmod 52
+#define TARGET_NR_fchmodat 53
+#define TARGET_NR_fchownat 54
+#define TARGET_NR_fchown 55
+#define TARGET_NR_openat 56
+#define TARGET_NR_close 57
+#define TARGET_NR_vhangup 58
+#define TARGET_NR_pipe2 59
+#define TARGET_NR_quotactl 60
+#define TARGET_NR_getdents64 61
+#define TARGET_NR_lseek 62
+#define TARGET_NR_read 63
+#define TARGET_NR_write 64
+#define TARGET_NR_readv 65
+#define TARGET_NR_writev 66
+#define TARGET_NR_pread64 67
+#define TARGET_NR_pwrite64 68
+#define TARGET_NR_preadv 69
+#define TARGET_NR_pwritev 70
+#define TARGET_NR_sendfile 71
+#define TARGET_NR_pselect6 72
+#define TARGET_NR_ppoll 73
+#define TARGET_NR_signalfd4 74
+#define TARGET_NR_vmsplice 75
+#define TARGET_NR_splice 76
+#define TARGET_NR_tee 77
+#define TARGET_NR_readlinkat 78
+#define TARGET_NR_newfstatat 79
+#define TARGET_NR_fstat 80
+#define TARGET_NR_sync 81
+#define TARGET_NR_fsync 82
+#define TARGET_NR_fdatasync 83
+#define TARGET_NR_sync_file_range 84
+#define TARGET_NR_timerfd_create 85
+#define TARGET_NR_timerfd_settime 86
+#define TARGET_NR_timerfd_gettime 87
+#define TARGET_NR_utimensat 88
+#define TARGET_NR_acct 89
+#define TARGET_NR_capget 90
+#define TARGET_NR_capset 91
+#define TARGET_NR_personality 92
+#define TARGET_NR_exit 93
+#define TARGET_NR_exit_group 94
+#define TARGET_NR_waitid 95
+#define TARGET_NR_set_tid_address 96
+#define TARGET_NR_unshare 97
+#define TARGET_NR_futex 98
+#define TARGET_NR_set_robust_list 99
+#define TARGET_NR_get_robust_list 100
+#define TARGET_NR_nanosleep 101
+#define TARGET_NR_getitimer 102
+#define TARGET_NR_setitimer 103
+#define TARGET_NR_kexec_load 104
+#define TARGET_NR_init_module 105
+#define TARGET_NR_delete_module 106
+#define TARGET_NR_timer_create 107
+#define TARGET_NR_timer_gettime 108
+#define TARGET_NR_timer_getoverrun 109
+#define TARGET_NR_timer_settime 110
+#define TARGET_NR_timer_delete 111
+#define TARGET_NR_clock_settime 112
+#define TARGET_NR_clock_gettime 113
+#define TARGET_NR_clock_getres 114
+#define TARGET_NR_clock_nanosleep 115
+#define TARGET_NR_syslog 116
+#define TARGET_NR_ptrace 117
+#define TARGET_NR_sched_setparam 118
+#define TARGET_NR_sched_setscheduler 119
+#define TARGET_NR_sched_getscheduler 120
+#define TARGET_NR_sched_getparam 121
+#define TARGET_NR_sched_setaffinity 122
+#define TARGET_NR_sched_getaffinity 123
+#define TARGET_NR_sched_yield 124
+#define TARGET_NR_sched_get_priority_max 125
+#define TARGET_NR_sched_get_priority_min 126
+#define TARGET_NR_sched_rr_get_interval 127
+#define TARGET_NR_restart_syscall 128
+#define TARGET_NR_kill 129
+#define TARGET_NR_tkill 130
+#define TARGET_NR_tgkill 131
+#define TARGET_NR_sigaltstack 132
+#define TARGET_NR_rt_sigsuspend 133
+#define TARGET_NR_rt_sigaction 134
+#define TARGET_NR_rt_sigprocmask 135
+#define TARGET_NR_rt_sigpending 136
+#define TARGET_NR_rt_sigtimedwait 137
+#define TARGET_NR_rt_sigqueueinfo 138
+#define TARGET_NR_rt_sigreturn 139
+#define TARGET_NR_setpriority 140
+#define TARGET_NR_getpriority 141
+#define TARGET_NR_reboot 142
+#define TARGET_NR_setregid 143
+#define TARGET_NR_setgid 144
+#define TARGET_NR_setreuid 145
+#define TARGET_NR_setuid 146
+#define TARGET_NR_setresuid 147
+#define TARGET_NR_getresuid 148
+#define TARGET_NR_setresgid 149
+#define TARGET_NR_getresgid 150
+#define TARGET_NR_setfsuid 151
+#define TARGET_NR_setfsgid 152
+#define TARGET_NR_times 153
+#define TARGET_NR_setpgid 154
+#define TARGET_NR_getpgid 155
+#define TARGET_NR_getsid 156
+#define TARGET_NR_setsid 157
+#define TARGET_NR_getgroups 158
+#define TARGET_NR_setgroups 159
+#define TARGET_NR_uname 160
+#define TARGET_NR_sethostname 161
+#define TARGET_NR_setdomainname 162
+#define TARGET_NR_getrlimit 163
+#define TARGET_NR_setrlimit 164
+#define TARGET_NR_getrusage 165
+#define TARGET_NR_umask 166
+#define TARGET_NR_prctl 167
+#define TARGET_NR_getcpu 168
+#define TARGET_NR_gettimeofday 169
+#define TARGET_NR_settimeofday 170
+#define TARGET_NR_adjtimex 171
+#define TARGET_NR_getpid 172
+#define TARGET_NR_getppid 173
+#define TARGET_NR_getuid 174
+#define TARGET_NR_geteuid 175
+#define TARGET_NR_getgid 176
+#define TARGET_NR_getegid 177
+#define TARGET_NR_gettid 178
+#define TARGET_NR_sysinfo 179
+#define TARGET_NR_mq_open 180
+#define TARGET_NR_mq_unlink 181
+#define TARGET_NR_mq_timedsend 182
+#define TARGET_NR_mq_timedreceive 183
+#define TARGET_NR_mq_notify 184
+#define TARGET_NR_mq_getsetattr 185
+#define TARGET_NR_msgget 186
+#define TARGET_NR_msgctl 187
+#define TARGET_NR_msgrcv 188
+#define TARGET_NR_msgsnd 189
+#define TARGET_NR_semget 190
+#define TARGET_NR_semctl 191
+#define TARGET_NR_semtimedop 192
+#define TARGET_NR_semop 193
+#define TARGET_NR_shmget 194
+#define TARGET_NR_shmctl 195
+#define TARGET_NR_shmat 196
+#define TARGET_NR_shmdt 197
+#define TARGET_NR_socket 198
+#define TARGET_NR_socketpair 199
+#define TARGET_NR_bind 200
+#define TARGET_NR_listen 201
+#define TARGET_NR_accept 202
+#define TARGET_NR_connect 203
+#define TARGET_NR_getsockname 204
+#define TARGET_NR_getpeername 205
+#define TARGET_NR_sendto 206
+#define TARGET_NR_recvfrom 207
+#define TARGET_NR_setsockopt 208
+#define TARGET_NR_getsockopt 209
+#define TARGET_NR_shutdown 210
+#define TARGET_NR_sendmsg 211
+#define TARGET_NR_recvmsg 212
+#define TARGET_NR_readahead 213
+#define TARGET_NR_brk 214
+#define TARGET_NR_munmap 215
+#define TARGET_NR_mremap 216
+#define TARGET_NR_add_key 217
+#define TARGET_NR_request_key 218
+#define TARGET_NR_keyctl 219
+#define TARGET_NR_clone 220
+#define TARGET_NR_execve 221
+#define TARGET_NR_mmap 222
+#define TARGET_NR_fadvise64 223
+#define TARGET_NR_swapon 224
+#define TARGET_NR_swapoff 225
+#define TARGET_NR_mprotect 226
+#define TARGET_NR_msync 227
+#define TARGET_NR_mlock 228
+#define TARGET_NR_munlock 229
+#define TARGET_NR_mlockall 230
+#define TARGET_NR_munlockall 231
+#define TARGET_NR_mincore 232
+#define TARGET_NR_madvise 233
+#define TARGET_NR_remap_file_pages 234
+#define TARGET_NR_mbind 235
+#define TARGET_NR_get_mempolicy 236
+#define TARGET_NR_set_mempolicy 237
+#define TARGET_NR_migrate_pages 238
+#define TARGET_NR_move_pages 239
+#define TARGET_NR_rt_tgsigqueueinfo 240
+#define TARGET_NR_perf_event_open 241
+#define TARGET_NR_accept4 242
+#define TARGET_NR_recvmmsg 243
+#define TARGET_NR_arch_specific_syscall 244
+#define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + 15)
+#define TARGET_NR_wait4 260
+#define TARGET_NR_prlimit64 261
+#define TARGET_NR_fanotify_init 262
+#define TARGET_NR_fanotify_mark 263
+#define TARGET_NR_name_to_handle_at 264
+#define TARGET_NR_open_by_handle_at 265
+#define TARGET_NR_clock_adjtime 266
+#define TARGET_NR_syncfs 267
+#define TARGET_NR_setns 268
+#define TARGET_NR_sendmmsg 269
+#define TARGET_NR_process_vm_readv 270
+#define TARGET_NR_process_vm_writev 271
+#define TARGET_NR_kcmp 272
+#define TARGET_NR_finit_module 273
+#define TARGET_NR_sched_setattr 274
+#define TARGET_NR_sched_getattr 275
+#define TARGET_NR_renameat2 276
+#define TARGET_NR_seccomp 277
+#define TARGET_NR_getrandom 278
+#define TARGET_NR_memfd_create 279
+#define TARGET_NR_bpf 280
+#define TARGET_NR_execveat 281
+#define TARGET_NR_userfaultfd 282
+#define TARGET_NR_membarrier 283
+#define TARGET_NR_mlock2 284
+#define TARGET_NR_copy_file_range 285
+#define TARGET_NR_preadv2 286
+#define TARGET_NR_pwritev2 287
+#define TARGET_NR_pkey_mprotect 288
+#define TARGET_NR_pkey_alloc 289
+#define TARGET_NR_pkey_free 290
+#define TARGET_NR_statx 291
+#define TARGET_NR_io_pgetevents 292
+#define TARGET_NR_rseq 293
+#define TARGET_NR_kexec_file_load 294
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
+#define TARGET_NR_syscalls 436
+
+#endif /* LINUX_USER_RISCV_SYSCALL64_NR_H */
diff --git a/linux-user/riscv/syscall_nr.h b/linux-user/riscv/syscall_nr.h
index 5c87282209..0a5a2f2fb1 100644
--- a/linux-user/riscv/syscall_nr.h
+++ b/linux-user/riscv/syscall_nr.h
@@ -6,300 +6,10 @@
 #ifndef LINUX_USER_RISCV_SYSCALL_NR_H
 #define LINUX_USER_RISCV_SYSCALL_NR_H
 
-#define TARGET_NR_io_setup 0
-#define TARGET_NR_io_destroy 1
-#define TARGET_NR_io_submit 2
-#define TARGET_NR_io_cancel 3
-#define TARGET_NR_io_getevents 4
-#define TARGET_NR_setxattr 5
-#define TARGET_NR_lsetxattr 6
-#define TARGET_NR_fsetxattr 7
-#define TARGET_NR_getxattr 8
-#define TARGET_NR_lgetxattr 9
-#define TARGET_NR_fgetxattr 10
-#define TARGET_NR_listxattr 11
-#define TARGET_NR_llistxattr 12
-#define TARGET_NR_flistxattr 13
-#define TARGET_NR_removexattr 14
-#define TARGET_NR_lremovexattr 15
-#define TARGET_NR_fremovexattr 16
-#define TARGET_NR_getcwd 17
-#define TARGET_NR_lookup_dcookie 18
-#define TARGET_NR_eventfd2 19
-#define TARGET_NR_epoll_create1 20
-#define TARGET_NR_epoll_ctl 21
-#define TARGET_NR_epoll_pwait 22
-#define TARGET_NR_dup 23
-#define TARGET_NR_dup3 24
 #ifdef TARGET_RISCV32
-#define TARGET_NR_fcntl64 25
+# include "syscall32_nr.h"
 #else
-#define TARGET_NR_fcntl 25
+# include "syscall64_nr.h"
 #endif
-#define TARGET_NR_inotify_init1 26
-#define TARGET_NR_inotify_add_watch 27
-#define TARGET_NR_inotify_rm_watch 28
-#define TARGET_NR_ioctl 29
-#define TARGET_NR_ioprio_set 30
-#define TARGET_NR_ioprio_get 31
-#define TARGET_NR_flock 32
-#define TARGET_NR_mknodat 33
-#define TARGET_NR_mkdirat 34
-#define TARGET_NR_unlinkat 35
-#define TARGET_NR_symlinkat 36
-#define TARGET_NR_linkat 37
-#define TARGET_NR_renameat 38
-#define TARGET_NR_umount2 39
-#define TARGET_NR_mount 40
-#define TARGET_NR_pivot_root 41
-#define TARGET_NR_nfsservctl 42
-#define TARGET_NR_statfs 43
-#define TARGET_NR_fstatfs 44
-#define TARGET_NR_truncate 45
-#define TARGET_NR_ftruncate 46
-#define TARGET_NR_fallocate 47
-#define TARGET_NR_faccessat 48
-#define TARGET_NR_chdir 49
-#define TARGET_NR_fchdir 50
-#define TARGET_NR_chroot 51
-#define TARGET_NR_fchmod 52
-#define TARGET_NR_fchmodat 53
-#define TARGET_NR_fchownat 54
-#define TARGET_NR_fchown 55
-#define TARGET_NR_openat 56
-#define TARGET_NR_close 57
-#define TARGET_NR_vhangup 58
-#define TARGET_NR_pipe2 59
-#define TARGET_NR_quotactl 60
-#define TARGET_NR_getdents64 61
-#ifdef TARGET_RISCV32
-#define TARGET_NR__llseek 62
-#else
-#define TARGET_NR_lseek 62
-#endif
-#define TARGET_NR_read 63
-#define TARGET_NR_write 64
-#define TARGET_NR_readv 65
-#define TARGET_NR_writev 66
-#define TARGET_NR_pread64 67
-#define TARGET_NR_pwrite64 68
-#define TARGET_NR_preadv 69
-#define TARGET_NR_pwritev 70
-#define TARGET_NR_sendfile 71
-#define TARGET_NR_pselect6 72
-#define TARGET_NR_ppoll 73
-#define TARGET_NR_signalfd4 74
-#define TARGET_NR_vmsplice 75
-#define TARGET_NR_splice 76
-#define TARGET_NR_tee 77
-#define TARGET_NR_readlinkat 78
-#define TARGET_NR_newfstatat 79
-#define TARGET_NR_fstat 80
-#define TARGET_NR_sync 81
-#define TARGET_NR_fsync 82
-#define TARGET_NR_fdatasync 83
-#define TARGET_NR_sync_file_range 84
-#define TARGET_NR_timerfd_create 85
-#define TARGET_NR_timerfd_settime 86
-#define TARGET_NR_timerfd_gettime 87
-#define TARGET_NR_utimensat 88
-#define TARGET_NR_acct 89
-#define TARGET_NR_capget 90
-#define TARGET_NR_capset 91
-#define TARGET_NR_personality 92
-#define TARGET_NR_exit 93
-#define TARGET_NR_exit_group 94
-#define TARGET_NR_waitid 95
-#define TARGET_NR_set_tid_address 96
-#define TARGET_NR_unshare 97
-#define TARGET_NR_futex 98
-#define TARGET_NR_set_robust_list 99
-#define TARGET_NR_get_robust_list 100
-#define TARGET_NR_nanosleep 101
-#define TARGET_NR_getitimer 102
-#define TARGET_NR_setitimer 103
-#define TARGET_NR_kexec_load 104
-#define TARGET_NR_init_module 105
-#define TARGET_NR_delete_module 106
-#define TARGET_NR_timer_create 107
-#define TARGET_NR_timer_gettime 108
-#define TARGET_NR_timer_getoverrun 109
-#define TARGET_NR_timer_settime 110
-#define TARGET_NR_timer_delete 111
-#define TARGET_NR_clock_settime 112
-#define TARGET_NR_clock_gettime 113
-#define TARGET_NR_clock_getres 114
-#define TARGET_NR_clock_nanosleep 115
-#define TARGET_NR_syslog 116
-#define TARGET_NR_ptrace 117
-#define TARGET_NR_sched_setparam 118
-#define TARGET_NR_sched_setscheduler 119
-#define TARGET_NR_sched_getscheduler 120
-#define TARGET_NR_sched_getparam 121
-#define TARGET_NR_sched_setaffinity 122
-#define TARGET_NR_sched_getaffinity 123
-#define TARGET_NR_sched_yield 124
-#define TARGET_NR_sched_get_priority_max 125
-#define TARGET_NR_sched_get_priority_min 126
-#define TARGET_NR_sched_rr_get_interval 127
-#define TARGET_NR_restart_syscall 128
-#define TARGET_NR_kill 129
-#define TARGET_NR_tkill 130
-#define TARGET_NR_tgkill 131
-#define TARGET_NR_sigaltstack 132
-#define TARGET_NR_rt_sigsuspend 133
-#define TARGET_NR_rt_sigaction 134
-#define TARGET_NR_rt_sigprocmask 135
-#define TARGET_NR_rt_sigpending 136
-#define TARGET_NR_rt_sigtimedwait 137
-#define TARGET_NR_rt_sigqueueinfo 138
-#define TARGET_NR_rt_sigreturn 139
-#define TARGET_NR_setpriority 140
-#define TARGET_NR_getpriority 141
-#define TARGET_NR_reboot 142
-#define TARGET_NR_setregid 143
-#define TARGET_NR_setgid 144
-#define TARGET_NR_setreuid 145
-#define TARGET_NR_setuid 146
-#define TARGET_NR_setresuid 147
-#define TARGET_NR_getresuid 148
-#define TARGET_NR_setresgid 149
-#define TARGET_NR_getresgid 150
-#define TARGET_NR_setfsuid 151
-#define TARGET_NR_setfsgid 152
-#define TARGET_NR_times 153
-#define TARGET_NR_setpgid 154
-#define TARGET_NR_getpgid 155
-#define TARGET_NR_getsid 156
-#define TARGET_NR_setsid 157
-#define TARGET_NR_getgroups 158
-#define TARGET_NR_setgroups 159
-#define TARGET_NR_uname 160
-#define TARGET_NR_sethostname 161
-#define TARGET_NR_setdomainname 162
-#define TARGET_NR_getrlimit 163
-#define TARGET_NR_setrlimit 164
-#define TARGET_NR_getrusage 165
-#define TARGET_NR_umask 166
-#define TARGET_NR_prctl 167
-#define TARGET_NR_getcpu 168
-#define TARGET_NR_gettimeofday 169
-#define TARGET_NR_settimeofday 170
-#define TARGET_NR_adjtimex 171
-#define TARGET_NR_getpid 172
-#define TARGET_NR_getppid 173
-#define TARGET_NR_getuid 174
-#define TARGET_NR_geteuid 175
-#define TARGET_NR_getgid 176
-#define TARGET_NR_getegid 177
-#define TARGET_NR_gettid 178
-#define TARGET_NR_sysinfo 179
-#define TARGET_NR_mq_open 180
-#define TARGET_NR_mq_unlink 181
-#define TARGET_NR_mq_timedsend 182
-#define TARGET_NR_mq_timedreceive 183
-#define TARGET_NR_mq_notify 184
-#define TARGET_NR_mq_getsetattr 185
-#define TARGET_NR_msgget 186
-#define TARGET_NR_msgctl 187
-#define TARGET_NR_msgrcv 188
-#define TARGET_NR_msgsnd 189
-#define TARGET_NR_semget 190
-#define TARGET_NR_semctl 191
-#define TARGET_NR_semtimedop 192
-#define TARGET_NR_semop 193
-#define TARGET_NR_shmget 194
-#define TARGET_NR_shmctl 195
-#define TARGET_NR_shmat 196
-#define TARGET_NR_shmdt 197
-#define TARGET_NR_socket 198
-#define TARGET_NR_socketpair 199
-#define TARGET_NR_bind 200
-#define TARGET_NR_listen 201
-#define TARGET_NR_accept 202
-#define TARGET_NR_connect 203
-#define TARGET_NR_getsockname 204
-#define TARGET_NR_getpeername 205
-#define TARGET_NR_sendto 206
-#define TARGET_NR_recvfrom 207
-#define TARGET_NR_setsockopt 208
-#define TARGET_NR_getsockopt 209
-#define TARGET_NR_shutdown 210
-#define TARGET_NR_sendmsg 211
-#define TARGET_NR_recvmsg 212
-#define TARGET_NR_readahead 213
-#define TARGET_NR_brk 214
-#define TARGET_NR_munmap 215
-#define TARGET_NR_mremap 216
-#define TARGET_NR_add_key 217
-#define TARGET_NR_request_key 218
-#define TARGET_NR_keyctl 219
-#define TARGET_NR_clone 220
-#define TARGET_NR_execve 221
-#ifdef TARGET_RISCV32
-#define TARGET_NR_mmap2 222
-#define TARGET_NR_fadvise64_64 223
-#else
-#define TARGET_NR_mmap 222
-#define TARGET_NR_fadvise64 223
-#endif
-#define TARGET_NR_swapon 224
-#define TARGET_NR_swapoff 225
-#define TARGET_NR_mprotect 226
-#define TARGET_NR_msync 227
-#define TARGET_NR_mlock 228
-#define TARGET_NR_munlock 229
-#define TARGET_NR_mlockall 230
-#define TARGET_NR_munlockall 231
-#define TARGET_NR_mincore 232
-#define TARGET_NR_madvise 233
-#define TARGET_NR_remap_file_pages 234
-#define TARGET_NR_mbind 235
-#define TARGET_NR_get_mempolicy 236
-#define TARGET_NR_set_mempolicy 237
-#define TARGET_NR_migrate_pages 238
-#define TARGET_NR_move_pages 239
-#define TARGET_NR_rt_tgsigqueueinfo 240
-#define TARGET_NR_perf_event_open 241
-#define TARGET_NR_accept4 242
-#define TARGET_NR_recvmmsg 243
-#define TARGET_NR_arch_specific_syscall 244
-#define TARGET_NR_wait4 260
-#define TARGET_NR_prlimit64 261
-#define TARGET_NR_fanotify_init 262
-#define TARGET_NR_fanotify_mark 263
-#define TARGET_NR_name_to_handle_at 264
-#define TARGET_NR_open_by_handle_at 265
-#define TARGET_NR_clock_adjtime 266
-#define TARGET_NR_syncfs 267
-#define TARGET_NR_setns 268
-#define TARGET_NR_sendmmsg 269
-#define TARGET_NR_process_vm_readv 270
-#define TARGET_NR_process_vm_writev 271
-#define TARGET_NR_kcmp 272
-#define TARGET_NR_finit_module 273
-#define TARGET_NR_sched_setattr 274
-#define TARGET_NR_sched_getattr 275
-#define TARGET_NR_renameat2 276
-#define TARGET_NR_seccomp 277
-#define TARGET_NR_getrandom 278
-#define TARGET_NR_memfd_create 279
-#define TARGET_NR_bpf 280
-#define TARGET_NR_execveat 281
-#define TARGET_NR_userfaultfd 282
-#define TARGET_NR_membarrier 283
-#define TARGET_NR_mlock2 284
-#define TARGET_NR_copy_file_range 285
-#define TARGET_NR_preadv2 286
-#define TARGET_NR_pwritev2 287
-#define TARGET_NR_pkey_mprotect 288
-#define TARGET_NR_pkey_alloc 289
-#define TARGET_NR_pkey_free 290
-#define TARGET_NR_statx 291
-#define TARGET_NR_io_pgetevents 292
-#define TARGET_NR_rseq 293
-#define TARGET_NR_kexec_file_load 294
-
-#define TARGET_NR_syscalls (TARGET_NR_kexec_file_load + 1)
 
 #endif
-- 
2.25.1


