Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F31165218
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 23:06:57 +0100 (CET)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4XUe-00072R-Nc
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 17:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4XSa-0004vm-Qx
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 17:04:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4XSY-0001iG-9x
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 17:04:48 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:33309)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4XSQ-0001fE-Tw; Wed, 19 Feb 2020 17:04:39 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MbC5g-1jbPHz49AO-00bZa7; Wed, 19 Feb 2020 23:04:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/20] linux-user,
 s390x: remove syscall definitions for !TARGET_S390X
Date: Wed, 19 Feb 2020 23:03:23 +0100
Message-Id: <20200219220333.1411905-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219220333.1411905-1-laurent@vivier.eu>
References: <20200219220333.1411905-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wYt7OV4M8BI2DabGMnxFXETBb4s3J5b8Nzk1/zvOn+pzUmK+ukJ
 w+GXdScOBSsnlZv0gHhchP8pHQcek0tjpvnShgddL0o0Q42AEajnswkS1IjldXcL+iTIc36
 Yhvg8jvsylsaPLcqbVYFqOtJCBaUF8g7pWFZiQzxvzqcFQpNdgeqU6HPdxj/hpjMrfq3Dpp
 que2INJibNzrHj9ObCk0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3aL7yhtMIy8=:PxluJvi6vTi1Jgkv14Cqcb
 ZDzEZiKAKAWxBFVgejxjt6uRRI360JaiNxVFDbPlAmounYhn6vi5aiyOa6zPb7fRri4wWpgm8
 RKgSaRLkEuNafk14Pf4bITjtrj8F0sVGtVmyNj80qbFQWii0QsFlDQXV5Jw9RqKLdZXxjJAhR
 iIZo/jriEVAdWChwddW5O/HA27ROUfkbDpQXcchSKGxxydqg2m7hxR2pDN6Ri7e3gL6vlWUA0
 XCkVQUUGZjBg37PgkjNlI7StXhs9sgYMr39neJBLTGZjEWyFyHSP1/NhxP3l6tf57dig2BApM
 zHjAaCx3nhGYPbsW3yzfOyHI0A+jsRPVFxoxa4wmY9GMHPe7KpbCsHi78DBKxyLvey+a34k+0
 or57N074NAv8572H3hGxEin03PjsTDAVBxfMbCY3SgM4XT3DEhq3FjAuh4A3QDI/CdOlFVwLy
 Yqg1zbPRUibndwkCAqR2FUlaOn3ocGVlPeUgl3H2tRh/VbzHdLXkR0RPP1zOJoPe20GYFkvIS
 ztFBShINm14hxhvOOUk8Tr2eeB42fNLrcRiI92r/scGHL6a5Cqt9KLbke7hIsiSTDQmPxfF8J
 d+FrP0yUd232hgbzFo4PXvATxW6tFLzUqQMPrB/bC1tCTLxAk8f8m+WgQb2Ib6i/EZdYCqKjf
 Ty+SKojgAiAbwR6lKjRmsOhlPkwaiGUODHMH0idpmRe18UVpKZTKX1U47EB7xMfso/n0V9fww
 R/NbSbbRdBY7Irhdv0FPDO9/E97gV6WWbrfOVY5P4VoVftofPhTHNh/IWVlf8hqBKgxOhmmKd
 skjHaguD3UEbem6P842Hn5rd2Ta8Y6/zZIltnPQiOQGoyMLYqXM4CuMStIl3Kt8wBo3zZ7L
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
Cc: Cornelia Huck <cohuck@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't support other 32bit architecture.
Update file to comply with coding style (TAB).

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/syscall_nr.h | 313 +++++++++++++---------------------
 1 file changed, 123 insertions(+), 190 deletions(-)

diff --git a/linux-user/s390x/syscall_nr.h b/linux-user/s390x/syscall_nr.h
index b1553a0810c8..261da1b0c30e 100644
--- a/linux-user/s390x/syscall_nr.h
+++ b/linux-user/s390x/syscall_nr.h
@@ -11,7 +11,7 @@
 #define TARGET_NR_write                4
 #define TARGET_NR_open                 5
 #define TARGET_NR_close                6
-#define TARGET_NR_restart_syscall	  7
+#define TARGET_NR_restart_syscall         7
 #define TARGET_NR_creat                8
 #define TARGET_NR_link                 9
 #define TARGET_NR_unlink              10
@@ -108,6 +108,7 @@
 #define TARGET_NR_personality        136
 #define TARGET_NR_afs_syscall        137 /* Syscall for Andrew File System */
 #define TARGET_NR_getdents           141
+#define TARGET_NR_select                142
 #define TARGET_NR_flock              143
 #define TARGET_NR_msync              144
 #define TARGET_NR_readv              145
@@ -147,116 +148,137 @@
 #define TARGET_NR_capset             185
 #define TARGET_NR_sigaltstack        186
 #define TARGET_NR_sendfile           187
-#define TARGET_NR_getpmsg		188
-#define TARGET_NR_putpmsg		189
-#define TARGET_NR_vfork		190
+#define TARGET_NR_getpmsg               188
+#define TARGET_NR_putpmsg               189
+#define TARGET_NR_vfork         190
+#define TARGET_NR_getrlimit             191     /* SuS compliant getrlimit */
+#define TARGET_NR_lchown                198
+#define TARGET_NR_getuid                199
+#define TARGET_NR_getgid                200
+#define TARGET_NR_geteuid               201
+#define TARGET_NR_getegid               202
+#define TARGET_NR_setreuid              203
+#define TARGET_NR_setregid              204
+#define TARGET_NR_getgroups     205
+#define TARGET_NR_setgroups     206
+#define TARGET_NR_fchown                207
+#define TARGET_NR_setresuid     208
+#define TARGET_NR_getresuid     209
+#define TARGET_NR_setresgid     210
+#define TARGET_NR_getresgid     211
+#define TARGET_NR_chown                 212
+#define TARGET_NR_setuid                213
+#define TARGET_NR_setgid                214
+#define TARGET_NR_setfsuid              215
+#define TARGET_NR_setfsgid              216
 #define TARGET_NR_pivot_root         217
 #define TARGET_NR_mincore            218
 #define TARGET_NR_madvise            219
-#define TARGET_NR_getdents64		220
-#define TARGET_NR_readahead		222
-#define TARGET_NR_setxattr		224
-#define TARGET_NR_lsetxattr		225
-#define TARGET_NR_fsetxattr		226
-#define TARGET_NR_getxattr		227
-#define TARGET_NR_lgetxattr		228
-#define TARGET_NR_fgetxattr		229
-#define TARGET_NR_listxattr		230
-#define TARGET_NR_llistxattr		231
-#define TARGET_NR_flistxattr		232
-#define TARGET_NR_removexattr	233
-#define TARGET_NR_lremovexattr	234
-#define TARGET_NR_fremovexattr	235
-#define TARGET_NR_gettid		236
-#define TARGET_NR_tkill		237
-#define TARGET_NR_futex		238
-#define TARGET_NR_sched_setaffinity	239
-#define TARGET_NR_sched_getaffinity	240
-#define TARGET_NR_tgkill		241
+#define TARGET_NR_getdents64            220
+#define TARGET_NR_readahead             222
+#define TARGET_NR_setxattr              224
+#define TARGET_NR_lsetxattr             225
+#define TARGET_NR_fsetxattr             226
+#define TARGET_NR_getxattr              227
+#define TARGET_NR_lgetxattr             228
+#define TARGET_NR_fgetxattr             229
+#define TARGET_NR_listxattr             230
+#define TARGET_NR_llistxattr            231
+#define TARGET_NR_flistxattr            232
+#define TARGET_NR_removexattr   233
+#define TARGET_NR_lremovexattr  234
+#define TARGET_NR_fremovexattr  235
+#define TARGET_NR_gettid                236
+#define TARGET_NR_tkill         237
+#define TARGET_NR_futex         238
+#define TARGET_NR_sched_setaffinity     239
+#define TARGET_NR_sched_getaffinity     240
+#define TARGET_NR_tgkill                241
 /* Number 242 is reserved for tux */
-#define TARGET_NR_io_setup		243
-#define TARGET_NR_io_destroy		244
-#define TARGET_NR_io_getevents	245
-#define TARGET_NR_io_submit		246
-#define TARGET_NR_io_cancel		247
-#define TARGET_NR_exit_group		248
-#define TARGET_NR_epoll_create	249
-#define TARGET_NR_epoll_ctl		250
-#define TARGET_NR_epoll_wait		251
-#define TARGET_NR_set_tid_address	252
-#define TARGET_NR_fadvise64		253
-#define TARGET_NR_timer_create	254
-#define TARGET_NR_timer_settime	(TARGET_NR_timer_create+1)
-#define TARGET_NR_timer_gettime	(TARGET_NR_timer_create+2)
-#define TARGET_NR_timer_getoverrun	(TARGET_NR_timer_create+3)
-#define TARGET_NR_timer_delete	(TARGET_NR_timer_create+4)
-#define TARGET_NR_clock_settime	(TARGET_NR_timer_create+5)
-#define TARGET_NR_clock_gettime	(TARGET_NR_timer_create+6)
-#define TARGET_NR_clock_getres	(TARGET_NR_timer_create+7)
-#define TARGET_NR_clock_nanosleep	(TARGET_NR_timer_create+8)
+#define TARGET_NR_io_setup              243
+#define TARGET_NR_io_destroy            244
+#define TARGET_NR_io_getevents  245
+#define TARGET_NR_io_submit             246
+#define TARGET_NR_io_cancel             247
+#define TARGET_NR_exit_group            248
+#define TARGET_NR_epoll_create  249
+#define TARGET_NR_epoll_ctl             250
+#define TARGET_NR_epoll_wait            251
+#define TARGET_NR_set_tid_address       252
+#define TARGET_NR_fadvise64             253
+#define TARGET_NR_timer_create  254
+#define TARGET_NR_timer_settime (TARGET_NR_timer_create + 1)
+#define TARGET_NR_timer_gettime (TARGET_NR_timer_create + 2)
+#define TARGET_NR_timer_getoverrun      (TARGET_NR_timer_create + 3)
+#define TARGET_NR_timer_delete  (TARGET_NR_timer_create + 4)
+#define TARGET_NR_clock_settime (TARGET_NR_timer_create + 5)
+#define TARGET_NR_clock_gettime (TARGET_NR_timer_create + 6)
+#define TARGET_NR_clock_getres  (TARGET_NR_timer_create + 7)
+#define TARGET_NR_clock_nanosleep       (TARGET_NR_timer_create + 8)
 /* Number 263 is reserved for vserver */
-#define TARGET_NR_statfs64		265
-#define TARGET_NR_fstatfs64		266
-#define TARGET_NR_remap_file_pages	267
+#define TARGET_NR_statfs64              265
+#define TARGET_NR_fstatfs64             266
+#define TARGET_NR_remap_file_pages      267
 /* Number 268 is reserved for new sys_mbind */
 /* Number 269 is reserved for new sys_get_mempolicy */
 /* Number 270 is reserved for new sys_set_mempolicy */
-#define TARGET_NR_mq_open		271
-#define TARGET_NR_mq_unlink		272
-#define TARGET_NR_mq_timedsend	273
-#define TARGET_NR_mq_timedreceive	274
-#define TARGET_NR_mq_notify		275
-#define TARGET_NR_mq_getsetattr	276
-#define TARGET_NR_kexec_load		277
-#define TARGET_NR_add_key		278
-#define TARGET_NR_request_key	279
-#define TARGET_NR_keyctl		280
-#define TARGET_NR_waitid		281
-#define TARGET_NR_ioprio_set		282
-#define TARGET_NR_ioprio_get		283
-#define TARGET_NR_inotify_init	284
-#define TARGET_NR_inotify_add_watch	285
-#define TARGET_NR_inotify_rm_watch	286
+#define TARGET_NR_mq_open               271
+#define TARGET_NR_mq_unlink             272
+#define TARGET_NR_mq_timedsend  273
+#define TARGET_NR_mq_timedreceive       274
+#define TARGET_NR_mq_notify             275
+#define TARGET_NR_mq_getsetattr 276
+#define TARGET_NR_kexec_load            277
+#define TARGET_NR_add_key               278
+#define TARGET_NR_request_key   279
+#define TARGET_NR_keyctl                280
+#define TARGET_NR_waitid                281
+#define TARGET_NR_ioprio_set            282
+#define TARGET_NR_ioprio_get            283
+#define TARGET_NR_inotify_init  284
+#define TARGET_NR_inotify_add_watch     285
+#define TARGET_NR_inotify_rm_watch      286
 /* Number 287 is reserved for new sys_migrate_pages */
-#define TARGET_NR_openat		288
-#define TARGET_NR_mkdirat		289
-#define TARGET_NR_mknodat		290
-#define TARGET_NR_fchownat		291
-#define TARGET_NR_futimesat		292
-#define TARGET_NR_unlinkat		294
-#define TARGET_NR_renameat		295
-#define TARGET_NR_linkat		296
-#define TARGET_NR_symlinkat		297
-#define TARGET_NR_readlinkat		298
-#define TARGET_NR_fchmodat		299
-#define TARGET_NR_faccessat		300
-#define TARGET_NR_pselect6		301
-#define TARGET_NR_ppoll		302
-#define TARGET_NR_unshare		303
-#define TARGET_NR_set_robust_list	304
-#define TARGET_NR_get_robust_list	305
-#define TARGET_NR_splice		306
-#define TARGET_NR_sync_file_range	307
-#define TARGET_NR_tee		308
-#define TARGET_NR_vmsplice		309
+#define TARGET_NR_openat                288
+#define TARGET_NR_mkdirat               289
+#define TARGET_NR_mknodat               290
+#define TARGET_NR_fchownat              291
+#define TARGET_NR_futimesat             292
+#define TARGET_NR_newfstatat            293
+#define TARGET_NR_unlinkat              294
+#define TARGET_NR_renameat              295
+#define TARGET_NR_linkat                296
+#define TARGET_NR_symlinkat             297
+#define TARGET_NR_readlinkat            298
+#define TARGET_NR_fchmodat              299
+#define TARGET_NR_faccessat             300
+#define TARGET_NR_pselect6              301
+#define TARGET_NR_ppoll         302
+#define TARGET_NR_unshare               303
+#define TARGET_NR_set_robust_list       304
+#define TARGET_NR_get_robust_list       305
+#define TARGET_NR_splice                306
+#define TARGET_NR_sync_file_range       307
+#define TARGET_NR_tee           308
+#define TARGET_NR_vmsplice              309
 /* Number 310 is reserved for new sys_move_pages */
-#define TARGET_NR_getcpu		311
-#define TARGET_NR_epoll_pwait	312
-#define TARGET_NR_utimes		313
-#define TARGET_NR_fallocate		314
-#define TARGET_NR_utimensat		315
-#define TARGET_NR_signalfd		316
-#define TARGET_NR_timerfd		317
-#define TARGET_NR_eventfd		318
-#define TARGET_NR_timerfd_create	319
-#define TARGET_NR_timerfd_settime	320
-#define TARGET_NR_timerfd_gettime	321
-#define TARGET_NR_signalfd4		322
-#define TARGET_NR_eventfd2		323
-#define TARGET_NR_inotify_init1	324
-#define TARGET_NR_pipe2		325
-#define TARGET_NR_dup3		326
-#define TARGET_NR_epoll_create1	327
+#define TARGET_NR_getcpu                311
+#define TARGET_NR_epoll_pwait   312
+#define TARGET_NR_utimes                313
+#define TARGET_NR_fallocate             314
+#define TARGET_NR_utimensat             315
+#define TARGET_NR_signalfd              316
+#define TARGET_NR_timerfd               317
+#define TARGET_NR_eventfd               318
+#define TARGET_NR_timerfd_create        319
+#define TARGET_NR_timerfd_settime       320
+#define TARGET_NR_timerfd_gettime       321
+#define TARGET_NR_signalfd4             322
+#define TARGET_NR_eventfd2              323
+#define TARGET_NR_inotify_init1 324
+#define TARGET_NR_pipe2         325
+#define TARGET_NR_dup3          326
+#define TARGET_NR_epoll_create1 327
 #define TARGET_NR_preadv                328
 #define TARGET_NR_pwritev               329
 #define TARGET_NR_rt_tgsigqueueinfo     330
@@ -305,94 +327,5 @@
 #define TARGET_NR_shutdown              373
 #define TARGET_NR_mlock2                374
 
-/*
- * There are some system calls that are not present on 64 bit, some
- * have a different name although they do the same (e.g. TARGET_NR_chown32
- * is TARGET_NR_chown on 64 bit).
- */
-#ifndef TARGET_S390X
-
-#define TARGET_NR_time		 13
-#define TARGET_NR_lchown		 16
-#define TARGET_NR_setuid		 23
-#define TARGET_NR_getuid		 24
-#define TARGET_NR_stime		 25
-#define TARGET_NR_setgid		 46
-#define TARGET_NR_getgid		 47
-#define TARGET_NR_geteuid		 49
-#define TARGET_NR_getegid		 50
-#define TARGET_NR_setreuid		 70
-#define TARGET_NR_setregid		 71
-#define TARGET_NR_getrlimit		 76
-#define TARGET_NR_getgroups		 80
-#define TARGET_NR_setgroups		 81
-#define TARGET_NR_fchown		 95
-#define TARGET_NR_ioperm		101
-#define TARGET_NR_setfsuid		138
-#define TARGET_NR_setfsgid		139
-#define TARGET_NR__llseek		140
-#define TARGET_NR__newselect 	142
-#define TARGET_NR_setresuid		164
-#define TARGET_NR_getresuid		165
-#define TARGET_NR_setresgid		170
-#define TARGET_NR_getresgid		171
-#define TARGET_NR_chown		182
-#define TARGET_NR_ugetrlimit		191	/* SuS compliant getrlimit */
-#define TARGET_NR_mmap2		192
-#define TARGET_NR_truncate64		193
-#define TARGET_NR_ftruncate64	194
-#define TARGET_NR_stat64		195
-#define TARGET_NR_lstat64		196
-#define TARGET_NR_fstat64		197
-#define TARGET_NR_lchown32		198
-#define TARGET_NR_getuid32		199
-#define TARGET_NR_getgid32		200
-#define TARGET_NR_geteuid32		201
-#define TARGET_NR_getegid32		202
-#define TARGET_NR_setreuid32		203
-#define TARGET_NR_setregid32		204
-#define TARGET_NR_getgroups32	205
-#define TARGET_NR_setgroups32	206
-#define TARGET_NR_fchown32		207
-#define TARGET_NR_setresuid32	208
-#define TARGET_NR_getresuid32	209
-#define TARGET_NR_setresgid32	210
-#define TARGET_NR_getresgid32	211
-#define TARGET_NR_chown32		212
-#define TARGET_NR_setuid32		213
-#define TARGET_NR_setgid32		214
-#define TARGET_NR_setfsuid32		215
-#define TARGET_NR_setfsgid32		216
-#define TARGET_NR_fcntl64		221
-#define TARGET_NR_sendfile64		223
-#define TARGET_NR_fadvise64_64	264
-#define TARGET_NR_fstatat64		293
-
-#else
-
-#define TARGET_NR_select		142
-#define TARGET_NR_getrlimit		191	/* SuS compliant getrlimit */
-#define TARGET_NR_lchown  		198
-#define TARGET_NR_getuid  		199
-#define TARGET_NR_getgid  		200
-#define TARGET_NR_geteuid  		201
-#define TARGET_NR_getegid  		202
-#define TARGET_NR_setreuid  		203
-#define TARGET_NR_setregid  		204
-#define TARGET_NR_getgroups  	205
-#define TARGET_NR_setgroups  	206
-#define TARGET_NR_fchown  		207
-#define TARGET_NR_setresuid  	208
-#define TARGET_NR_getresuid  	209
-#define TARGET_NR_setresgid  	210
-#define TARGET_NR_getresgid  	211
-#define TARGET_NR_chown  		212
-#define TARGET_NR_setuid  		213
-#define TARGET_NR_setgid  		214
-#define TARGET_NR_setfsuid  		215
-#define TARGET_NR_setfsgid  		216
-#define TARGET_NR_newfstatat		293
-
-#endif
 
 #endif
-- 
2.24.1


