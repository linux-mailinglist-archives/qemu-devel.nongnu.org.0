Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E76B1871A4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:55:27 +0100 (CET)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtxW-0001cW-BO
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jDsPk-0007wL-On
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jDsPh-0000Wx-3c
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:16:28 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:37119)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jDsPg-0000IT-Lj
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:16:25 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2BQM-1jIj3k2vGw-013hrd; Mon, 16 Mar 2020 17:16:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/38] linux-user/riscv: Update the syscall_nr's to the 5.5
 kernel
Date: Mon, 16 Mar 2020 17:15:25 +0100
Message-Id: <20200316161550.336150-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316161550.336150-1-laurent@vivier.eu>
References: <20200316161550.336150-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KL4PReMGV2RP7hVPcaSdZAwJ6DF1yB18sj7v+QIsGHbapN2cZ5n
 dSLmznqSw6wOXCpWMtXoBsBj9tqZJXopd2WAHIAqcGSfI9y1FEkGw2lx54+xU3D8Kn2E+MT
 2OPhfkJ7HIJL7FuY1y90tf/MiEGC8XOQKYmZ2ojBORhZi6eCkqgjmyUhQO0WWWg9bjKsOod
 Kp1lfqnL3CKuLxhn01vQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t3OB4IYzSR0=:HR0P5j1CWql9WgEjJew91z
 gpv6Tw6D4kvYbNtxwIKhyw7tRo/cxhFrkYJ5H071mB1/4UqwZ3hrzUnodJJrCSKbHcz+4Du6N
 e6VW1CF1T8lM5kO0Iqps2MW1YQ6lj9K5KzKRw6p72PvkQAMNtxFxoXw4Tr5O4IzMB6PY+ryHU
 63SBqWAUcgtBNB23IuUOEt54o1shPuA7+hQIDYE97WSgbCrF+VnZiixWo417ZyIF/Cqg9lRRE
 hykmHIaxzYg/mc/okVqwoWGYIuq0yFecKkI3XmPZZjYOKIvcLGCwoToU48m79liqnndTWtP98
 xQLSS9m5h9asgjHpH4j5x7sMd8J6tE7beheNV/N3vsFg3r/IeTVRv5mtQmU1RX3nU9FXN2jlD
 a0OQiN5Wuwb42U44x6pD9EGnl+iePNXMH9SFYx0JfEm7TVSWT5OPJL0sB1RqozbZ5qRAXBC0y
 1Z9LomcillHaSsxCNFT5bVTLpZTwNHGq9acW/BijbhPzyYHI1SF+DltqP377xy04QJmcdbDb/
 IbFYW8dgiJsDp/0HMEoWbrtb97YykwMZPaenUAlKbqu2zKtFUYtCbrP2kqrOCUCgdCjjJWnKi
 fTY3leMPfF4wYleB2LH/370Mlh8EfTLW2LpizwIKpOpEay254dD+Au10MDiPaUfHyl1ZFxUor
 QKKfF+xhPOW/eFBkrE59mJklkq1ktyYGo+q/uQLZgxCsHuZZlvS9yaACHB7CobBp/Wy2suG19
 dq1k6ajib05UEXyPcZuzuafsGNoGR/YfiXNAZm1QJCGA4F1IfawrsCE+Vo+PYVXFMzCdEQx1n
 bOn2HcPWjMSCODmO4BrE3wPMS8+qYhxHuuVQ9+lWTgmq7YO9+Im97vOGc4ti/sd8dlRTmiS
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <8e512fa2dc885aafc4d9c4013ee033442827a4a0.1584051142.git.alistair.francis@wdc.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/riscv/syscall32_nr.h | 295 +++++++++++++++++++++++++++++++
 linux-user/riscv/syscall64_nr.h | 301 ++++++++++++++++++++++++++++++++
 linux-user/riscv/syscall_nr.h   | 294 +------------------------------
 3 files changed, 598 insertions(+), 292 deletions(-)
 create mode 100644 linux-user/riscv/syscall32_nr.h
 create mode 100644 linux-user/riscv/syscall64_nr.h

diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall32_nr.h
new file mode 100644
index 000000000000..4fef73e954da
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
index 000000000000..cc82f3244f55
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
index 5c8728220994..0a5a2f2fb161 100644
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
2.24.1


