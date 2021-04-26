Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901836AAF7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:08:31 +0200 (CEST)
Received: from localhost ([::1]:33256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larbq-00072e-Ll
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNm-000814-Si
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:58 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNa-0007Zr-7m
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so4292784pjj.3
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VAa/DceA4jWRoC8aZModYQ61zc9N0GvkdWKoxgaTy+Q=;
 b=EGl9gAHoXNmUrH0lLhDONcwaiWKjOuSMfJMuAC3BDVFUp/qAsFT4UnK/vKuHE9Vwd/
 DmAl8DxVOBtQbfal/nfNrIdmOIapRqxf9di59CvbevD796S/rZ55wUPQAgTNtjAgbuGC
 HT9WAQFScEAUcop38sO5tygnzV8aumPfOiKkONJzqXJIa7Rz4uROhlj7HXgN+94XQ0Y5
 WnGsMFCLCGFwh3mr5zMuQAmJzndeZrPYsMKQgvoyCu4RiAJmIlAy3JKmCyl6ZQn/NH9s
 tlQ0/y6vdCJOOqDPLa0/iGjeB9lfD41t3UPbzVIrbbOiTel2KmyDeT+2PEyrsSs10Ywm
 RzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VAa/DceA4jWRoC8aZModYQ61zc9N0GvkdWKoxgaTy+Q=;
 b=fX1sOa7amls5bbKavdw/GSRnxJQJGr+sHNSy67JUUKrrF66MnNiTDDzPNkLJnhhmRl
 mg/tVg44+cfHnWeDn8lvObqOQI6GkceUA7FfYbcevU85O4DezdDYg/mY1cBMguhMBSJm
 yBnHKUaQxkxv/63FbygQRJb/2k/rCkH3YZvO8ZCoQ2vQoSYiQDnicdHTKkE99jlRmof1
 400jOTUv1pfyKXnF73TQIiWRJXWdHev6/p3wKW0bZrSihMQVwmOp/4WXCJarkIH6SZ47
 8LTxJd7Ba6MhguKTnR7/ata2uHyaNrPwuyd3cRmjVfgAL8NEzvq2kGCS3iOKQeFQXa6J
 lX4w==
X-Gm-Message-State: AOAM531O9v54/eezxachIMiqIPIR4+OPpm8anlHNDc1om9BhAVD+BBBX
 KX5v2zjpP3qZHX/1H4VbhTLuvXA5OAuu1w==
X-Google-Smtp-Source: ABdhPJx0oPjM0BrvQbQNj0sDlpzcv5y1ZNfRlWJASiPvH6YCGp3w0h7XDgXqTx67goO8oZpJ0CBp5A==
X-Received: by 2002:a17:90a:c788:: with SMTP id
 gn8mr17592419pjb.60.1619405623983; 
 Sun, 25 Apr 2021 19:53:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/25] linux-user/sparc: Merge sparc64/ into sparc/
Date: Sun, 25 Apr 2021 19:53:20 -0700
Message-Id: <20210426025334.1168495-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All of the source and header files already defer to sparc
via #include.  The syscall.tbl and syscallhdr.sh files
could not do the same, but are identical.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../targets/sparc64-linux-user.mak            |   1 +
 linux-user/sparc64/sockbits.h                 |   1 -
 linux-user/sparc64/target_cpu.h               |   1 -
 linux-user/sparc64/target_elf.h               |   1 -
 linux-user/sparc64/target_fcntl.h             |   1 -
 linux-user/sparc64/target_signal.h            |   1 -
 linux-user/sparc64/target_structs.h           |   1 -
 linux-user/sparc64/target_syscall.h           |   1 -
 linux-user/sparc64/termbits.h                 |   1 -
 linux-user/sparc64/cpu_loop.c                 |  20 -
 linux-user/sparc64/signal.c                   |  19 -
 linux-user/meson.build                        |   1 -
 linux-user/sparc64/meson.build                |   5 -
 linux-user/sparc64/syscall.tbl                | 487 ------------------
 linux-user/sparc64/syscallhdr.sh              |  32 --
 15 files changed, 1 insertion(+), 572 deletions(-)
 delete mode 100644 linux-user/sparc64/sockbits.h
 delete mode 100644 linux-user/sparc64/target_cpu.h
 delete mode 100644 linux-user/sparc64/target_elf.h
 delete mode 100644 linux-user/sparc64/target_fcntl.h
 delete mode 100644 linux-user/sparc64/target_signal.h
 delete mode 100644 linux-user/sparc64/target_structs.h
 delete mode 100644 linux-user/sparc64/target_syscall.h
 delete mode 100644 linux-user/sparc64/termbits.h
 delete mode 100644 linux-user/sparc64/cpu_loop.c
 delete mode 100644 linux-user/sparc64/signal.c
 delete mode 100644 linux-user/sparc64/meson.build
 delete mode 100644 linux-user/sparc64/syscall.tbl
 delete mode 100644 linux-user/sparc64/syscallhdr.sh

diff --git a/default-configs/targets/sparc64-linux-user.mak b/default-configs/targets/sparc64-linux-user.mak
index 846924201a..9d23ab4a26 100644
--- a/default-configs/targets/sparc64-linux-user.mak
+++ b/default-configs/targets/sparc64-linux-user.mak
@@ -1,5 +1,6 @@
 TARGET_ARCH=sparc64
 TARGET_BASE_ARCH=sparc
+TARGET_ABI_DIR=sparc
 TARGET_SYSTBL_ABI=common,64
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
diff --git a/linux-user/sparc64/sockbits.h b/linux-user/sparc64/sockbits.h
deleted file mode 100644
index 658899e4d3..0000000000
--- a/linux-user/sparc64/sockbits.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../sparc/sockbits.h"
diff --git a/linux-user/sparc64/target_cpu.h b/linux-user/sparc64/target_cpu.h
deleted file mode 100644
index b22263d2db..0000000000
--- a/linux-user/sparc64/target_cpu.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../sparc/target_cpu.h"
diff --git a/linux-user/sparc64/target_elf.h b/linux-user/sparc64/target_elf.h
deleted file mode 100644
index 023b49b743..0000000000
--- a/linux-user/sparc64/target_elf.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../sparc/target_elf.h"
diff --git a/linux-user/sparc64/target_fcntl.h b/linux-user/sparc64/target_fcntl.h
deleted file mode 100644
index 053c774257..0000000000
--- a/linux-user/sparc64/target_fcntl.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../sparc/target_fcntl.h"
diff --git a/linux-user/sparc64/target_signal.h b/linux-user/sparc64/target_signal.h
deleted file mode 100644
index 6a7d57d024..0000000000
--- a/linux-user/sparc64/target_signal.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../sparc/target_signal.h"
diff --git a/linux-user/sparc64/target_structs.h b/linux-user/sparc64/target_structs.h
deleted file mode 100644
index cbcbc4602a..0000000000
--- a/linux-user/sparc64/target_structs.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../sparc/target_structs.h"
diff --git a/linux-user/sparc64/target_syscall.h b/linux-user/sparc64/target_syscall.h
deleted file mode 100644
index 164a5fc632..0000000000
--- a/linux-user/sparc64/target_syscall.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../sparc/target_syscall.h"
diff --git a/linux-user/sparc64/termbits.h b/linux-user/sparc64/termbits.h
deleted file mode 100644
index 54ddfee3ba..0000000000
--- a/linux-user/sparc64/termbits.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../sparc/termbits.h"
diff --git a/linux-user/sparc64/cpu_loop.c b/linux-user/sparc64/cpu_loop.c
deleted file mode 100644
index 4fd44e1b1e..0000000000
--- a/linux-user/sparc64/cpu_loop.c
+++ /dev/null
@@ -1,20 +0,0 @@
-/*
- *  qemu user cpu loop
- *
- *  Copyright (c) 2003-2008 Fabrice Bellard
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "../sparc/cpu_loop.c"
diff --git a/linux-user/sparc64/signal.c b/linux-user/sparc64/signal.c
deleted file mode 100644
index 170ebac232..0000000000
--- a/linux-user/sparc64/signal.c
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- *  Emulation of Linux signals
- *
- *  Copyright (c) 2003 Fabrice Bellard
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#include "../sparc/signal.c"
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 7fe28d659e..9549f81682 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -32,7 +32,6 @@ subdir('mips')
 subdir('ppc')
 subdir('s390x')
 subdir('sh4')
-subdir('sparc64')
 subdir('sparc')
 subdir('x86_64')
 subdir('xtensa')
diff --git a/linux-user/sparc64/meson.build b/linux-user/sparc64/meson.build
deleted file mode 100644
index 9527a40ed4..0000000000
--- a/linux-user/sparc64/meson.build
+++ /dev/null
@@ -1,5 +0,0 @@
-syscall_nr_generators += {
-  'sparc64': generator(sh,
-                       arguments: [ meson.current_source_dir() / 'syscallhdr.sh', '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@' ],
-                       output: '@BASENAME@_nr.h')
-}
diff --git a/linux-user/sparc64/syscall.tbl b/linux-user/sparc64/syscall.tbl
deleted file mode 100644
index 4af114e84f..0000000000
--- a/linux-user/sparc64/syscall.tbl
+++ /dev/null
@@ -1,487 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
-#
-# system call numbers and entry vectors for sparc
-#
-# The format is:
-# <number> <abi> <name> <entry point> <compat entry point>
-#
-# The <abi> can be common, 64, or 32 for this file.
-#
-0	common	restart_syscall		sys_restart_syscall
-1	32	exit			sys_exit			sparc_exit
-1	64	exit			sparc_exit
-2	common	fork			sys_fork
-3	common	read			sys_read
-4	common	write			sys_write
-5	common	open			sys_open			compat_sys_open
-6	common	close			sys_close
-7	common	wait4			sys_wait4			compat_sys_wait4
-8	common	creat			sys_creat
-9	common	link			sys_link
-10	common	unlink			sys_unlink
-11	32	execv			sunos_execv
-11	64	execv			sys_nis_syscall
-12	common	chdir			sys_chdir
-13	32    	chown			sys_chown16
-13	64	chown			sys_chown
-14	common	mknod			sys_mknod
-15	common	chmod			sys_chmod
-16	32	lchown			sys_lchown16
-16	64	lchown			sys_lchown
-17	common	brk			sys_brk
-18	common	perfctr			sys_nis_syscall
-19	common	lseek			sys_lseek			compat_sys_lseek
-20	common	getpid			sys_getpid
-21	common	capget			sys_capget
-22	common	capset			sys_capset
-23	32    	setuid			sys_setuid16
-23	64    	setuid			sys_setuid
-24	32	getuid			sys_getuid16
-24	64   	getuid			sys_getuid
-25	common	vmsplice		sys_vmsplice			compat_sys_vmsplice
-26	common	ptrace			sys_ptrace			compat_sys_ptrace
-27	common	alarm			sys_alarm
-28	common	sigaltstack		sys_sigaltstack			compat_sys_sigaltstack
-29	32    	pause			sys_pause
-29	64    	pause			sys_nis_syscall
-30	32	utime			sys_utime32
-30	64	utime			sys_utime
-31	32    	lchown32		sys_lchown
-32	32    	fchown32		sys_fchown
-33	common	access			sys_access
-34	common	nice			sys_nice
-35	32    	chown32			sys_chown
-36	common	sync			sys_sync
-37	common	kill			sys_kill
-38	common	stat			sys_newstat			compat_sys_newstat
-39	32	sendfile		sys_sendfile			compat_sys_sendfile
-39	64	sendfile		sys_sendfile64
-40	common	lstat			sys_newlstat			compat_sys_newlstat
-41	common	dup			sys_dup
-42	common	pipe			sys_sparc_pipe
-43	common	times			sys_times			compat_sys_times
-44	32    	getuid32		sys_getuid
-45	common	umount2			sys_umount
-46	32	setgid			sys_setgid16
-46	64	setgid			sys_setgid
-47	32	getgid			sys_getgid16
-47	64	getgid			sys_getgid
-48	common	signal			sys_signal
-49	32	geteuid			sys_geteuid16
-49	64	geteuid			sys_geteuid
-50	32	getegid			sys_getegid16
-50	64	getegid			sys_getegid
-51	common	acct			sys_acct
-52	64	memory_ordering		sys_memory_ordering
-53	32	getgid32		sys_getgid
-54	common	ioctl			sys_ioctl			compat_sys_ioctl
-55	common	reboot			sys_reboot
-56	32    	mmap2			sys_mmap2			sys32_mmap2
-57	common	symlink			sys_symlink
-58	common	readlink		sys_readlink
-59	32	execve			sys_execve			sys32_execve
-59	64	execve			sys64_execve
-60	common	umask			sys_umask
-61	common	chroot			sys_chroot
-62	common	fstat			sys_newfstat			compat_sys_newfstat
-63	common	fstat64			sys_fstat64			compat_sys_fstat64
-64	common	getpagesize		sys_getpagesize
-65	common	msync			sys_msync
-66	common	vfork			sys_vfork
-67	common	pread64			sys_pread64			compat_sys_pread64
-68	common	pwrite64		sys_pwrite64			compat_sys_pwrite64
-69	32    	geteuid32		sys_geteuid
-70	32	getegid32		sys_getegid
-71	common	mmap			sys_mmap
-72	32	setreuid32		sys_setreuid
-73	32	munmap			sys_munmap
-73	64	munmap			sys_64_munmap
-74	common	mprotect		sys_mprotect
-75	common	madvise			sys_madvise
-76	common	vhangup			sys_vhangup
-77	32	truncate64		sys_truncate64			compat_sys_truncate64
-78	common	mincore			sys_mincore
-79	32	getgroups		sys_getgroups16
-79	64	getgroups		sys_getgroups
-80	32	setgroups		sys_setgroups16
-80	64	setgroups		sys_setgroups
-81	common	getpgrp			sys_getpgrp
-82	32	setgroups32		sys_setgroups
-83	common	setitimer		sys_setitimer			compat_sys_setitimer
-84	32	ftruncate64		sys_ftruncate64			compat_sys_ftruncate64
-85	common	swapon			sys_swapon
-86	common	getitimer		sys_getitimer			compat_sys_getitimer
-87	32	setuid32		sys_setuid
-88	common	sethostname		sys_sethostname
-89	32	setgid32		sys_setgid
-90	common	dup2			sys_dup2
-91	32	setfsuid32		sys_setfsuid
-92	common	fcntl			sys_fcntl			compat_sys_fcntl
-93	common	select			sys_select
-94	32	setfsgid32		sys_setfsgid
-95	common	fsync			sys_fsync
-96	common	setpriority		sys_setpriority
-97	common	socket			sys_socket
-98	common	connect			sys_connect
-99	common	accept			sys_accept
-100	common	getpriority		sys_getpriority
-101	common	rt_sigreturn		sys_rt_sigreturn		sys32_rt_sigreturn
-102	common	rt_sigaction		sys_rt_sigaction		compat_sys_rt_sigaction
-103	common	rt_sigprocmask		sys_rt_sigprocmask		compat_sys_rt_sigprocmask
-104	common	rt_sigpending		sys_rt_sigpending		compat_sys_rt_sigpending
-105	32	rt_sigtimedwait		sys_rt_sigtimedwait_time32	compat_sys_rt_sigtimedwait_time32
-105	64	rt_sigtimedwait		sys_rt_sigtimedwait
-106	common	rt_sigqueueinfo		sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
-107	common	rt_sigsuspend		sys_rt_sigsuspend		compat_sys_rt_sigsuspend
-108	32	setresuid32		sys_setresuid
-108	64	setresuid		sys_setresuid
-109	32	getresuid32		sys_getresuid
-109	64	getresuid		sys_getresuid
-110	32	setresgid32		sys_setresgid
-110	64	setresgid		sys_setresgid
-111	32	getresgid32		sys_getresgid
-111	64	getresgid		sys_getresgid
-112	32	setregid32		sys_setregid
-113	common	recvmsg			sys_recvmsg			compat_sys_recvmsg
-114	common	sendmsg			sys_sendmsg			compat_sys_sendmsg
-115	32	getgroups32		sys_getgroups
-116	common	gettimeofday		sys_gettimeofday		compat_sys_gettimeofday
-117	common	getrusage		sys_getrusage			compat_sys_getrusage
-118	common	getsockopt		sys_getsockopt			sys_getsockopt
-119	common	getcwd			sys_getcwd
-120	common	readv			sys_readv			compat_sys_readv
-121	common	writev			sys_writev			compat_sys_writev
-122	common	settimeofday		sys_settimeofday		compat_sys_settimeofday
-123	32	fchown			sys_fchown16
-123	64	fchown			sys_fchown
-124	common	fchmod			sys_fchmod
-125	common	recvfrom		sys_recvfrom
-126	32	setreuid		sys_setreuid16
-126	64	setreuid		sys_setreuid
-127	32	setregid		sys_setregid16
-127	64	setregid		sys_setregid
-128	common	rename			sys_rename
-129	common	truncate		sys_truncate			compat_sys_truncate
-130	common	ftruncate		sys_ftruncate			compat_sys_ftruncate
-131	common	flock			sys_flock
-132	common	lstat64			sys_lstat64			compat_sys_lstat64
-133	common	sendto			sys_sendto
-134	common	shutdown		sys_shutdown
-135	common	socketpair		sys_socketpair
-136	common	mkdir			sys_mkdir
-137	common	rmdir			sys_rmdir
-138	32	utimes			sys_utimes_time32
-138	64	utimes			sys_utimes
-139	common	stat64			sys_stat64			compat_sys_stat64
-140	common	sendfile64		sys_sendfile64
-141	common	getpeername		sys_getpeername
-142	32	futex			sys_futex_time32
-142	64	futex			sys_futex
-143	common	gettid			sys_gettid
-144	common	getrlimit		sys_getrlimit			compat_sys_getrlimit
-145	common	setrlimit		sys_setrlimit			compat_sys_setrlimit
-146	common	pivot_root		sys_pivot_root
-147	common	prctl			sys_prctl
-148	common	pciconfig_read		sys_pciconfig_read
-149	common	pciconfig_write		sys_pciconfig_write
-150	common	getsockname		sys_getsockname
-151	common	inotify_init		sys_inotify_init
-152	common	inotify_add_watch	sys_inotify_add_watch
-153	common	poll			sys_poll
-154	common	getdents64		sys_getdents64
-155	32	fcntl64			sys_fcntl64			compat_sys_fcntl64
-156	common	inotify_rm_watch	sys_inotify_rm_watch
-157	common	statfs			sys_statfs			compat_sys_statfs
-158	common	fstatfs			sys_fstatfs			compat_sys_fstatfs
-159	common	umount			sys_oldumount
-160	common	sched_set_affinity	sys_sched_setaffinity		compat_sys_sched_setaffinity
-161	common	sched_get_affinity	sys_sched_getaffinity		compat_sys_sched_getaffinity
-162	common	getdomainname		sys_getdomainname
-163	common	setdomainname		sys_setdomainname
-164	64	utrap_install		sys_utrap_install
-165	common	quotactl		sys_quotactl
-166	common	set_tid_address		sys_set_tid_address
-167	common	mount			sys_mount			compat_sys_mount
-168	common	ustat			sys_ustat			compat_sys_ustat
-169	common	setxattr		sys_setxattr
-170	common	lsetxattr		sys_lsetxattr
-171	common	fsetxattr		sys_fsetxattr
-172	common	getxattr		sys_getxattr
-173	common	lgetxattr		sys_lgetxattr
-174	common	getdents		sys_getdents			compat_sys_getdents
-175	common	setsid			sys_setsid
-176	common	fchdir			sys_fchdir
-177	common	fgetxattr		sys_fgetxattr
-178	common	listxattr		sys_listxattr
-179	common	llistxattr		sys_llistxattr
-180	common	flistxattr		sys_flistxattr
-181	common	removexattr		sys_removexattr
-182	common	lremovexattr		sys_lremovexattr
-183	32	sigpending		sys_sigpending			compat_sys_sigpending
-183	64	sigpending		sys_nis_syscall
-184	common	query_module		sys_ni_syscall
-185	common	setpgid			sys_setpgid
-186	common	fremovexattr		sys_fremovexattr
-187	common	tkill			sys_tkill
-188	32	exit_group		sys_exit_group			sparc_exit_group
-188	64	exit_group		sparc_exit_group
-189	common	uname			sys_newuname
-190	common	init_module		sys_init_module
-191	32	personality		sys_personality			sys_sparc64_personality
-191	64	personality		sys_sparc64_personality
-192	32	remap_file_pages	sys_sparc_remap_file_pages	sys_remap_file_pages
-192	64	remap_file_pages	sys_remap_file_pages
-193	common	epoll_create		sys_epoll_create
-194	common	epoll_ctl		sys_epoll_ctl
-195	common	epoll_wait		sys_epoll_wait
-196	common	ioprio_set		sys_ioprio_set
-197	common	getppid			sys_getppid
-198	32	sigaction		sys_sparc_sigaction		compat_sys_sparc_sigaction
-198	64	sigaction		sys_nis_syscall
-199	common	sgetmask		sys_sgetmask
-200	common	ssetmask		sys_ssetmask
-201	32	sigsuspend		sys_sigsuspend
-201	64	sigsuspend		sys_nis_syscall
-202	common	oldlstat		sys_newlstat			compat_sys_newlstat
-203	common	uselib			sys_uselib
-204	32	readdir			sys_old_readdir			compat_sys_old_readdir
-204	64	readdir			sys_nis_syscall
-205	common	readahead		sys_readahead			compat_sys_readahead
-206	common	socketcall		sys_socketcall			sys32_socketcall
-207	common	syslog			sys_syslog
-208	common	lookup_dcookie		sys_lookup_dcookie		compat_sys_lookup_dcookie
-209	common	fadvise64		sys_fadvise64			compat_sys_fadvise64
-210	common	fadvise64_64		sys_fadvise64_64		compat_sys_fadvise64_64
-211	common	tgkill			sys_tgkill
-212	common	waitpid			sys_waitpid
-213	common	swapoff			sys_swapoff
-214	common	sysinfo			sys_sysinfo			compat_sys_sysinfo
-215	32	ipc			sys_ipc				compat_sys_ipc
-215	64	ipc			sys_sparc_ipc
-216	32	sigreturn		sys_sigreturn			sys32_sigreturn
-216	64	sigreturn		sys_nis_syscall
-217	common	clone			sys_clone
-218	common	ioprio_get		sys_ioprio_get
-219	32	adjtimex		sys_adjtimex_time32
-219	64	adjtimex		sys_sparc_adjtimex
-220	32	sigprocmask		sys_sigprocmask			compat_sys_sigprocmask
-220	64	sigprocmask		sys_nis_syscall
-221	common	create_module		sys_ni_syscall
-222	common	delete_module		sys_delete_module
-223	common	get_kernel_syms		sys_ni_syscall
-224	common	getpgid			sys_getpgid
-225	common	bdflush			sys_bdflush
-226	common	sysfs			sys_sysfs
-227	common	afs_syscall		sys_nis_syscall
-228	common	setfsuid		sys_setfsuid16
-229	common	setfsgid		sys_setfsgid16
-230	common	_newselect		sys_select			compat_sys_select
-231	32	time			sys_time32
-232	common	splice			sys_splice
-233	32	stime			sys_stime32
-233	64	stime			sys_stime
-234	common	statfs64		sys_statfs64			compat_sys_statfs64
-235	common	fstatfs64		sys_fstatfs64			compat_sys_fstatfs64
-236	common	_llseek			sys_llseek
-237	common	mlock			sys_mlock
-238	common	munlock			sys_munlock
-239	common	mlockall		sys_mlockall
-240	common	munlockall		sys_munlockall
-241	common	sched_setparam		sys_sched_setparam
-242	common	sched_getparam		sys_sched_getparam
-243	common	sched_setscheduler	sys_sched_setscheduler
-244	common	sched_getscheduler	sys_sched_getscheduler
-245	common	sched_yield		sys_sched_yield
-246	common	sched_get_priority_max	sys_sched_get_priority_max
-247	common	sched_get_priority_min	sys_sched_get_priority_min
-248	32	sched_rr_get_interval	sys_sched_rr_get_interval_time32
-248	64	sched_rr_get_interval	sys_sched_rr_get_interval
-249	32	nanosleep		sys_nanosleep_time32
-249	64	nanosleep		sys_nanosleep
-250	32	mremap			sys_mremap
-250	64	mremap			sys_64_mremap
-251	common	_sysctl			sys_ni_syscall
-252	common	getsid			sys_getsid
-253	common	fdatasync		sys_fdatasync
-254	32	nfsservctl		sys_ni_syscall			sys_nis_syscall
-254	64	nfsservctl		sys_nis_syscall
-255	common	sync_file_range		sys_sync_file_range		compat_sys_sync_file_range
-256	32	clock_settime		sys_clock_settime32
-256	64	clock_settime		sys_clock_settime
-257	32	clock_gettime		sys_clock_gettime32
-257	64	clock_gettime		sys_clock_gettime
-258	32	clock_getres		sys_clock_getres_time32
-258	64	clock_getres		sys_clock_getres
-259	32	clock_nanosleep		sys_clock_nanosleep_time32
-259	64	clock_nanosleep		sys_clock_nanosleep
-260	common	sched_getaffinity	sys_sched_getaffinity		compat_sys_sched_getaffinity
-261	common	sched_setaffinity	sys_sched_setaffinity		compat_sys_sched_setaffinity
-262	32	timer_settime		sys_timer_settime32
-262	64	timer_settime		sys_timer_settime
-263	32	timer_gettime		sys_timer_gettime32
-263	64	timer_gettime		sys_timer_gettime
-264	common	timer_getoverrun	sys_timer_getoverrun
-265	common	timer_delete		sys_timer_delete
-266	common	timer_create		sys_timer_create		compat_sys_timer_create
-# 267 was vserver
-267	common	vserver			sys_nis_syscall
-268	common	io_setup		sys_io_setup			compat_sys_io_setup
-269	common	io_destroy		sys_io_destroy
-270	common	io_submit		sys_io_submit			compat_sys_io_submit
-271	common	io_cancel		sys_io_cancel
-272	32	io_getevents		sys_io_getevents_time32
-272	64	io_getevents		sys_io_getevents
-273	common	mq_open			sys_mq_open			compat_sys_mq_open
-274	common	mq_unlink		sys_mq_unlink
-275	32	mq_timedsend		sys_mq_timedsend_time32
-275	64	mq_timedsend		sys_mq_timedsend
-276	32	mq_timedreceive		sys_mq_timedreceive_time32
-276	64	mq_timedreceive		sys_mq_timedreceive
-277	common	mq_notify		sys_mq_notify			compat_sys_mq_notify
-278	common	mq_getsetattr		sys_mq_getsetattr		compat_sys_mq_getsetattr
-279	common	waitid			sys_waitid			compat_sys_waitid
-280	common	tee			sys_tee
-281	common	add_key			sys_add_key
-282	common	request_key		sys_request_key
-283	common	keyctl			sys_keyctl			compat_sys_keyctl
-284	common	openat			sys_openat			compat_sys_openat
-285	common	mkdirat			sys_mkdirat
-286	common	mknodat			sys_mknodat
-287	common	fchownat		sys_fchownat
-288	32	futimesat		sys_futimesat_time32
-288	64	futimesat		sys_futimesat
-289	common	fstatat64		sys_fstatat64			compat_sys_fstatat64
-290	common	unlinkat		sys_unlinkat
-291	common	renameat		sys_renameat
-292	common	linkat			sys_linkat
-293	common	symlinkat		sys_symlinkat
-294	common	readlinkat		sys_readlinkat
-295	common	fchmodat		sys_fchmodat
-296	common	faccessat		sys_faccessat
-297	32	pselect6		sys_pselect6_time32		compat_sys_pselect6_time32
-297	64	pselect6		sys_pselect6
-298	32	ppoll			sys_ppoll_time32		compat_sys_ppoll_time32
-298	64	ppoll			sys_ppoll
-299	common	unshare			sys_unshare
-300	common	set_robust_list		sys_set_robust_list		compat_sys_set_robust_list
-301	common	get_robust_list		sys_get_robust_list		compat_sys_get_robust_list
-302	common	migrate_pages		sys_migrate_pages		compat_sys_migrate_pages
-303	common	mbind			sys_mbind			compat_sys_mbind
-304	common	get_mempolicy		sys_get_mempolicy		compat_sys_get_mempolicy
-305	common	set_mempolicy		sys_set_mempolicy		compat_sys_set_mempolicy
-306	common	kexec_load		sys_kexec_load			compat_sys_kexec_load
-307	common	move_pages		sys_move_pages			compat_sys_move_pages
-308	common	getcpu			sys_getcpu
-309	common	epoll_pwait		sys_epoll_pwait			compat_sys_epoll_pwait
-310	32	utimensat		sys_utimensat_time32
-310	64	utimensat		sys_utimensat
-311	common	signalfd		sys_signalfd			compat_sys_signalfd
-312	common	timerfd_create		sys_timerfd_create
-313	common	eventfd			sys_eventfd
-314	common	fallocate		sys_fallocate			compat_sys_fallocate
-315	32	timerfd_settime		sys_timerfd_settime32
-315	64	timerfd_settime		sys_timerfd_settime
-316	32	timerfd_gettime		sys_timerfd_gettime32
-316	64	timerfd_gettime		sys_timerfd_gettime
-317	common	signalfd4		sys_signalfd4			compat_sys_signalfd4
-318	common	eventfd2		sys_eventfd2
-319	common	epoll_create1		sys_epoll_create1
-320	common	dup3			sys_dup3
-321	common	pipe2			sys_pipe2
-322	common	inotify_init1		sys_inotify_init1
-323	common	accept4			sys_accept4
-324	common	preadv			sys_preadv			compat_sys_preadv
-325	common	pwritev			sys_pwritev			compat_sys_pwritev
-326	common	rt_tgsigqueueinfo	sys_rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
-327	common	perf_event_open		sys_perf_event_open
-328	32	recvmmsg		sys_recvmmsg_time32		compat_sys_recvmmsg_time32
-328	64	recvmmsg		sys_recvmmsg
-329	common	fanotify_init		sys_fanotify_init
-330	common	fanotify_mark		sys_fanotify_mark		compat_sys_fanotify_mark
-331	common	prlimit64		sys_prlimit64
-332	common	name_to_handle_at	sys_name_to_handle_at
-333	common	open_by_handle_at	sys_open_by_handle_at		compat_sys_open_by_handle_at
-334	32	clock_adjtime		sys_clock_adjtime32
-334	64	clock_adjtime		sys_sparc_clock_adjtime
-335	common	syncfs			sys_syncfs
-336	common	sendmmsg		sys_sendmmsg			compat_sys_sendmmsg
-337	common	setns			sys_setns
-338	common	process_vm_readv	sys_process_vm_readv		compat_sys_process_vm_readv
-339	common	process_vm_writev	sys_process_vm_writev		compat_sys_process_vm_writev
-340	32	kern_features		sys_ni_syscall			sys_kern_features
-340	64	kern_features		sys_kern_features
-341	common	kcmp			sys_kcmp
-342	common	finit_module		sys_finit_module
-343	common	sched_setattr		sys_sched_setattr
-344	common	sched_getattr		sys_sched_getattr
-345	common	renameat2		sys_renameat2
-346	common	seccomp			sys_seccomp
-347	common	getrandom		sys_getrandom
-348	common	memfd_create		sys_memfd_create
-349	common	bpf			sys_bpf
-350	32	execveat		sys_execveat			sys32_execveat
-350	64	execveat		sys64_execveat
-351	common	membarrier		sys_membarrier
-352	common	userfaultfd		sys_userfaultfd
-353	common	bind			sys_bind
-354	common	listen			sys_listen
-355	common	setsockopt		sys_setsockopt			sys_setsockopt
-356	common	mlock2			sys_mlock2
-357	common	copy_file_range		sys_copy_file_range
-358	common	preadv2			sys_preadv2			compat_sys_preadv2
-359	common	pwritev2		sys_pwritev2			compat_sys_pwritev2
-360	common	statx			sys_statx
-361	32	io_pgetevents		sys_io_pgetevents_time32	compat_sys_io_pgetevents
-361	64	io_pgetevents		sys_io_pgetevents
-362	common	pkey_mprotect		sys_pkey_mprotect
-363	common	pkey_alloc		sys_pkey_alloc
-364	common	pkey_free		sys_pkey_free
-365	common	rseq			sys_rseq
-# room for arch specific syscalls
-392	64	semtimedop			sys_semtimedop
-393	common	semget			sys_semget
-394	common	semctl			sys_semctl			compat_sys_semctl
-395	common	shmget			sys_shmget
-396	common	shmctl			sys_shmctl			compat_sys_shmctl
-397	common	shmat			sys_shmat			compat_sys_shmat
-398	common	shmdt			sys_shmdt
-399	common	msgget			sys_msgget
-400	common	msgsnd			sys_msgsnd			compat_sys_msgsnd
-401	common	msgrcv			sys_msgrcv			compat_sys_msgrcv
-402	common	msgctl			sys_msgctl			compat_sys_msgctl
-403	32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
-404	32	clock_settime64			sys_clock_settime		sys_clock_settime
-405	32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
-406	32	clock_getres_time64		sys_clock_getres		sys_clock_getres
-407	32	clock_nanosleep_time64		sys_clock_nanosleep		sys_clock_nanosleep
-408	32	timer_gettime64			sys_timer_gettime		sys_timer_gettime
-409	32	timer_settime64			sys_timer_settime		sys_timer_settime
-410	32	timerfd_gettime64		sys_timerfd_gettime		sys_timerfd_gettime
-411	32	timerfd_settime64		sys_timerfd_settime		sys_timerfd_settime
-412	32	utimensat_time64		sys_utimensat			sys_utimensat
-413	32	pselect6_time64			sys_pselect6			compat_sys_pselect6_time64
-414	32	ppoll_time64			sys_ppoll			compat_sys_ppoll_time64
-416	32	io_pgetevents_time64		sys_io_pgetevents		sys_io_pgetevents
-417	32	recvmmsg_time64			sys_recvmmsg			compat_sys_recvmmsg_time64
-418	32	mq_timedsend_time64		sys_mq_timedsend		sys_mq_timedsend
-419	32	mq_timedreceive_time64		sys_mq_timedreceive		sys_mq_timedreceive
-420	32	semtimedop_time64		sys_semtimedop			sys_semtimedop
-421	32	rt_sigtimedwait_time64		sys_rt_sigtimedwait		compat_sys_rt_sigtimedwait_time64
-422	32	futex_time64			sys_futex			sys_futex
-423	32	sched_rr_get_interval_time64	sys_sched_rr_get_interval	sys_sched_rr_get_interval
-424	common	pidfd_send_signal		sys_pidfd_send_signal
-425	common	io_uring_setup			sys_io_uring_setup
-426	common	io_uring_enter			sys_io_uring_enter
-427	common	io_uring_register		sys_io_uring_register
-428	common	open_tree			sys_open_tree
-429	common	move_mount			sys_move_mount
-430	common	fsopen				sys_fsopen
-431	common	fsconfig			sys_fsconfig
-432	common	fsmount				sys_fsmount
-433	common	fspick				sys_fspick
-434	common	pidfd_open			sys_pidfd_open
-# 435 reserved for clone3
-436	common	close_range			sys_close_range
-437	common	openat2			sys_openat2
-438	common	pidfd_getfd			sys_pidfd_getfd
-439	common	faccessat2			sys_faccessat2
diff --git a/linux-user/sparc64/syscallhdr.sh b/linux-user/sparc64/syscallhdr.sh
deleted file mode 100644
index 08c7e39bb3..0000000000
--- a/linux-user/sparc64/syscallhdr.sh
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-prefix="$4"
-offset="$5"
-
-fileguard=LINUX_USER_SPARC64_`basename "$out" | sed \
-    -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
-    -e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g'`
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-    printf "#ifndef %s\n" "${fileguard}"
-    printf "#define %s\n" "${fileguard}"
-    printf "\n"
-
-    nxt=0
-    while read nr abi name entry compat ; do
-        if [ -z "$offset" ]; then
-            printf "#define TARGET_NR_%s%s\t%s\n" \
-                "${prefix}" "${name}" "${nr}"
-        else
-            printf "#define TARGET_NR_%s%s\t(%s + %s)\n" \
-                "${prefix}" "${name}" "${offset}" "${nr}"
-        fi
-        nxt=$((nr+1))
-    done
-
-    printf "\n"
-    printf "#endif /* %s */" "${fileguard}"
-) > "$out"
-- 
2.25.1


