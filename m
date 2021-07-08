Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FF43C1B53
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 00:02:14 +0200 (CEST)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1c61-00032O-5X
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 18:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1c2O-00005u-JA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:58:28 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1c2K-00066G-NQ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:58:28 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mo6WJ-1lPUFn0JQZ-00pea4; Thu, 08
 Jul 2021 23:58:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-user: update syscall.tbl to Linux v5.13
Date: Thu,  8 Jul 2021 23:57:56 +0200
Message-Id: <20210708215756.268805-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708215756.268805-1-laurent@vivier.eu>
References: <20210708215756.268805-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f0X7/m6VROFk/U1xoHuACInG3S3xjNMqXvxGhouHV5Q/KkHCDLk
 LSO5lsiWZviQjDKSTGQFBiyeZJClrmrF6DK3kaOu8VvlzTxCmYzJRNJQSpgm43IY+oaNBs+
 ToIVivk2k0pR1bZCN466NnDS5uZbH/3AYXAAHEf3Sx6kFvnbXpXTzKidp+OTUv8Ahh9qBPg
 rKASkt9w9MZ5Zsqcyo9NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2m+VV9oAHi0=:7itjQVFhB6dyZIBtUXPfp3
 9w4Xr4BCt0J5ZZIKUDngxAHNEqpgtlTacOFCRyuWT4/uBo2OZwHNdDlw8qXKztAKbJ5fYcObl
 wjm47++WL0J27VJbKpPlykB+V+iKnpVlVYbGyMfpcgS0V2OhXB2Y6sWNnYBPBlCvr+0sw8KRX
 VmnevxhADwn4HMhn/5zZ1v83qAFGm7U1NjRyg480uFTO2OZSC3AjbewoYRyvgHPS/RnpHfykj
 JJPspxm465ouMpHGZ/HEbMI67q0t3y61VLtUsjWm/oZfv8YWDEfeUuCUi2Lkhw9862cSDMd5d
 3SEzs6xIYCMFKT+ssPbFQNq8a0x4pxiTNzWieNs1z341y62R8luVs3vfptn4JRNZ84iXtaU8t
 csNSIDVfQem0MHNQlFeUUTaF520rwmxseHY4nDNcHVxvKFdgnKUlzbOrTZu027a5VneiYYQU9
 wiuPzg1nY85Hnw44JeRMeD4U8QEvfqGb509Kbx7zaALJ35eC9TgUysJ3KRgVfpxCZDMxm5iRi
 7Rk/mkwfVE3CpVCiJW96G7/8Q3FQazhTUftb3u6TUN2/NOUazFvmanc0tNbPsiZ/BHZrZYebM
 He370ubowTLeoaEWEg15/FDjIThHdsIodCkTLfSlNMXVQa+xR1Kt2kBa9HJcChTMZMeZHFyOc
 rAg4WTO1DONzND8SCLO+pcSVlHHvtmKSf31I6xydKcbgNakuefH/DcfakOz0U6253ijA5OOAK
 k3Dt60LiauE6YW+Do+9Dhixa9DGMw7XstlIWKcOYhe1DbKoCQkKfT4TfTy/KaE3nVZloJJJdB
 gogUvQMsR4h3vRKS7WtYTHg92mUzCpI/ChsB8QKCv/C4oHO+BU6uxwEB8fOwzmIKIr/R96Y
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Taylor Simpson <tsimpson@quicinc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updated running scripts/update-syscalltbl.sh

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/syscall.tbl      |  7 ++++++
 linux-user/arm/syscall.tbl        |  7 ++++++
 linux-user/hppa/syscall.tbl       | 31 ++++++++++++++----------
 linux-user/i386/syscall_32.tbl    | 21 +++++++++++------
 linux-user/m68k/syscall.tbl       |  7 ++++++
 linux-user/microblaze/syscall.tbl |  7 ++++++
 linux-user/mips/syscall_o32.tbl   | 19 ++++++++++-----
 linux-user/mips64/syscall_n32.tbl | 19 ++++++++++-----
 linux-user/mips64/syscall_n64.tbl |  7 ++++++
 linux-user/ppc/syscall.tbl        | 39 ++++++++++++++-----------------
 linux-user/s390x/syscall.tbl      | 19 ++++++++++-----
 linux-user/sh4/syscall.tbl        |  7 ++++++
 linux-user/sparc/syscall.tbl      | 19 ++++++++++-----
 linux-user/x86_64/syscall_64.tbl  | 27 ++++++++++++++-------
 linux-user/xtensa/syscall.tbl     |  7 ++++++
 15 files changed, 170 insertions(+), 73 deletions(-)

diff --git a/linux-user/alpha/syscall.tbl b/linux-user/alpha/syscall.tbl
index ec8bed9e7b75..3000a2e8ee21 100644
--- a/linux-user/alpha/syscall.tbl
+++ b/linux-user/alpha/syscall.tbl
@@ -479,3 +479,10 @@
 547	common	openat2				sys_openat2
 548	common	pidfd_getfd			sys_pidfd_getfd
 549	common	faccessat2			sys_faccessat2
+550	common	process_madvise			sys_process_madvise
+551	common	epoll_pwait2			sys_epoll_pwait2
+552	common	mount_setattr			sys_mount_setattr
+# 553 reserved for quotactl_path
+554	common	landlock_create_ruleset		sys_landlock_create_ruleset
+555	common	landlock_add_rule		sys_landlock_add_rule
+556	common	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/arm/syscall.tbl b/linux-user/arm/syscall.tbl
index 171077cbf419..28e03b5fec00 100644
--- a/linux-user/arm/syscall.tbl
+++ b/linux-user/arm/syscall.tbl
@@ -453,3 +453,10 @@
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/hppa/syscall.tbl b/linux-user/hppa/syscall.tbl
index def64d221cd4..aabc37f8cae3 100644
--- a/linux-user/hppa/syscall.tbl
+++ b/linux-user/hppa/syscall.tbl
@@ -29,7 +29,7 @@
 18	common	stat			sys_newstat			compat_sys_newstat
 19	common	lseek			sys_lseek			compat_sys_lseek
 20	common	getpid			sys_getpid
-21	common	mount			sys_mount			compat_sys_mount
+21	common	mount			sys_mount
 22	common	bind			sys_bind
 23	common	setuid			sys_setuid
 24	common	getuid			sys_getuid
@@ -159,8 +159,8 @@
 142	common	_newselect		sys_select			compat_sys_select
 143	common	flock			sys_flock
 144	common	msync			sys_msync
-145	common	readv			sys_readv			compat_sys_readv
-146	common	writev			sys_writev			compat_sys_writev
+145	common	readv			sys_readv
+146	common	writev			sys_writev
 147	common	getsid			sys_getsid
 148	common	fdatasync		sys_fdatasync
 149	common	_sysctl			sys_ni_syscall
@@ -330,7 +330,7 @@
 292	32	sync_file_range		parisc_sync_file_range
 292	64	sync_file_range		sys_sync_file_range
 293	common	tee			sys_tee
-294	common	vmsplice		sys_vmsplice			compat_sys_vmsplice
+294	common	vmsplice		sys_vmsplice
 295	common	move_pages		sys_move_pages			compat_sys_move_pages
 296	common	getcpu			sys_getcpu
 297	common	epoll_pwait		sys_epoll_pwait			compat_sys_epoll_pwait
@@ -344,17 +344,17 @@
 304	common	eventfd			sys_eventfd
 305	32	fallocate		parisc_fallocate
 305	64	fallocate		sys_fallocate
-306	common	timerfd_create		sys_timerfd_create
+306	common	timerfd_create		parisc_timerfd_create
 307	32	timerfd_settime		sys_timerfd_settime32
 307	64	timerfd_settime		sys_timerfd_settime
 308	32	timerfd_gettime		sys_timerfd_gettime32
 308	64	timerfd_gettime		sys_timerfd_gettime
-309	common	signalfd4		sys_signalfd4			compat_sys_signalfd4
-310	common	eventfd2		sys_eventfd2
+309	common	signalfd4		parisc_signalfd4		parisc_compat_signalfd4
+310	common	eventfd2		parisc_eventfd2
 311	common	epoll_create1		sys_epoll_create1
 312	common	dup3			sys_dup3
-313	common	pipe2			sys_pipe2
-314	common	inotify_init1		sys_inotify_init1
+313	common	pipe2			parisc_pipe2
+314	common	inotify_init1		parisc_inotify_init1
 315	common	preadv	sys_preadv	compat_sys_preadv
 316	common	pwritev	sys_pwritev	compat_sys_pwritev
 317	common	rt_tgsigqueueinfo	sys_rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
@@ -372,8 +372,8 @@
 327	common	syncfs			sys_syncfs
 328	common	setns			sys_setns
 329	common	sendmmsg		sys_sendmmsg			compat_sys_sendmmsg
-330	common	process_vm_readv	sys_process_vm_readv		compat_sys_process_vm_readv
-331	common	process_vm_writev	sys_process_vm_writev		compat_sys_process_vm_writev
+330	common	process_vm_readv	sys_process_vm_readv
+331	common	process_vm_writev	sys_process_vm_writev
 332	common	kcmp			sys_kcmp
 333	common	finit_module		sys_finit_module
 334	common	sched_setattr		sys_sched_setattr
@@ -387,7 +387,7 @@
 341	common	bpf			sys_bpf
 342	common	execveat		sys_execveat			compat_sys_execveat
 343	common	membarrier		sys_membarrier
-344	common	userfaultfd		sys_userfaultfd
+344	common	userfaultfd		parisc_userfaultfd
 345	common	mlock2			sys_mlock2
 346	common	copy_file_range		sys_copy_file_range
 347	common	preadv2			sys_preadv2			compat_sys_preadv2
@@ -437,3 +437,10 @@
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/i386/syscall_32.tbl b/linux-user/i386/syscall_32.tbl
index 9d1102873666..4bbc267fb36b 100644
--- a/linux-user/i386/syscall_32.tbl
+++ b/linux-user/i386/syscall_32.tbl
@@ -32,7 +32,7 @@
 18	i386	oldstat			sys_stat
 19	i386	lseek			sys_lseek			compat_sys_lseek
 20	i386	getpid			sys_getpid
-21	i386	mount			sys_mount			compat_sys_mount
+21	i386	mount			sys_mount
 22	i386	umount			sys_oldumount
 23	i386	setuid			sys_setuid16
 24	i386	getuid			sys_getuid16
@@ -142,7 +142,7 @@
 128	i386	init_module		sys_init_module
 129	i386	delete_module		sys_delete_module
 130	i386	get_kernel_syms
-131	i386	quotactl		sys_quotactl			compat_sys_quotactl32
+131	i386	quotactl		sys_quotactl
 132	i386	getpgid			sys_getpgid
 133	i386	fchdir			sys_fchdir
 134	i386	bdflush			sys_bdflush
@@ -156,8 +156,8 @@
 142	i386	_newselect		sys_select			compat_sys_select
 143	i386	flock			sys_flock
 144	i386	msync			sys_msync
-145	i386	readv			sys_readv			compat_sys_readv
-146	i386	writev			sys_writev			compat_sys_writev
+145	i386	readv			sys_readv
+146	i386	writev			sys_writev
 147	i386	getsid			sys_getsid
 148	i386	fdatasync		sys_fdatasync
 149	i386	_sysctl			sys_ni_syscall
@@ -327,7 +327,7 @@
 313	i386	splice			sys_splice
 314	i386	sync_file_range		sys_ia32_sync_file_range
 315	i386	tee			sys_tee
-316	i386	vmsplice		sys_vmsplice			compat_sys_vmsplice
+316	i386	vmsplice		sys_vmsplice
 317	i386	move_pages		sys_move_pages			compat_sys_move_pages
 318	i386	getcpu			sys_getcpu
 319	i386	epoll_pwait		sys_epoll_pwait
@@ -358,8 +358,8 @@
 344	i386	syncfs			sys_syncfs
 345	i386	sendmmsg		sys_sendmmsg			compat_sys_sendmmsg
 346	i386	setns			sys_setns
-347	i386	process_vm_readv	sys_process_vm_readv		compat_sys_process_vm_readv
-348	i386	process_vm_writev	sys_process_vm_writev		compat_sys_process_vm_writev
+347	i386	process_vm_readv	sys_process_vm_readv
+348	i386	process_vm_writev	sys_process_vm_writev
 349	i386	kcmp			sys_kcmp
 350	i386	finit_module		sys_finit_module
 351	i386	sched_setattr		sys_sched_setattr
@@ -444,3 +444,10 @@
 437	i386	openat2			sys_openat2
 438	i386	pidfd_getfd		sys_pidfd_getfd
 439	i386	faccessat2		sys_faccessat2
+440	i386	process_madvise		sys_process_madvise
+441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	i386	mount_setattr		sys_mount_setattr
+# 443 reserved for quotactl_path
+444	i386	landlock_create_ruleset	sys_landlock_create_ruleset
+445	i386	landlock_add_rule	sys_landlock_add_rule
+446	i386	landlock_restrict_self	sys_landlock_restrict_self
diff --git a/linux-user/m68k/syscall.tbl b/linux-user/m68k/syscall.tbl
index 81fc799d8392..79c2d24c89dd 100644
--- a/linux-user/m68k/syscall.tbl
+++ b/linux-user/m68k/syscall.tbl
@@ -439,3 +439,10 @@
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/microblaze/syscall.tbl b/linux-user/microblaze/syscall.tbl
index b4e263916f41..b11395a20c20 100644
--- a/linux-user/microblaze/syscall.tbl
+++ b/linux-user/microblaze/syscall.tbl
@@ -445,3 +445,10 @@
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/mips/syscall_o32.tbl b/linux-user/mips/syscall_o32.tbl
index 195b43cf27c8..d560c467a8c6 100644
--- a/linux-user/mips/syscall_o32.tbl
+++ b/linux-user/mips/syscall_o32.tbl
@@ -29,7 +29,7 @@
 18	o32	unused18			sys_ni_syscall
 19	o32	lseek				sys_lseek
 20	o32	getpid				sys_getpid
-21	o32	mount				sys_mount			compat_sys_mount
+21	o32	mount				sys_mount
 22	o32	umount				sys_oldumount
 23	o32	setuid				sys_setuid
 24	o32	getuid				sys_getuid
@@ -156,8 +156,8 @@
 142	o32	_newselect			sys_select			compat_sys_select
 143	o32	flock				sys_flock
 144	o32	msync				sys_msync
-145	o32	readv				sys_readv			compat_sys_readv
-146	o32	writev				sys_writev			compat_sys_writev
+145	o32	readv				sys_readv
+146	o32	writev				sys_writev
 147	o32	cacheflush			sys_cacheflush
 148	o32	cachectl			sys_cachectl
 149	o32	sysmips				__sys_sysmips
@@ -318,7 +318,7 @@
 304	o32	splice				sys_splice
 305	o32	sync_file_range			sys_sync_file_range		sys32_sync_file_range
 306	o32	tee				sys_tee
-307	o32	vmsplice			sys_vmsplice			compat_sys_vmsplice
+307	o32	vmsplice			sys_vmsplice
 308	o32	move_pages			sys_move_pages			compat_sys_move_pages
 309	o32	set_robust_list			sys_set_robust_list		compat_sys_set_robust_list
 310	o32	get_robust_list			sys_get_robust_list		compat_sys_get_robust_list
@@ -356,8 +356,8 @@
 342	o32	syncfs				sys_syncfs
 343	o32	sendmmsg			sys_sendmmsg			compat_sys_sendmmsg
 344	o32	setns				sys_setns
-345	o32	process_vm_readv		sys_process_vm_readv		compat_sys_process_vm_readv
-346	o32	process_vm_writev		sys_process_vm_writev		compat_sys_process_vm_writev
+345	o32	process_vm_readv		sys_process_vm_readv
+346	o32	process_vm_writev		sys_process_vm_writev
 347	o32	kcmp				sys_kcmp
 348	o32	finit_module			sys_finit_module
 349	o32	sched_setattr			sys_sched_setattr
@@ -427,3 +427,10 @@
 437	o32	openat2				sys_openat2
 438	o32	pidfd_getfd			sys_pidfd_getfd
 439	o32	faccessat2			sys_faccessat2
+440	o32	process_madvise			sys_process_madvise
+441	o32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	o32	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	o32	landlock_create_ruleset		sys_landlock_create_ruleset
+445	o32	landlock_add_rule		sys_landlock_add_rule
+446	o32	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/mips64/syscall_n32.tbl b/linux-user/mips64/syscall_n32.tbl
index f9df9edb67a4..9220909526f9 100644
--- a/linux-user/mips64/syscall_n32.tbl
+++ b/linux-user/mips64/syscall_n32.tbl
@@ -25,8 +25,8 @@
 15	n32	ioctl				compat_sys_ioctl
 16	n32	pread64				sys_pread64
 17	n32	pwrite64			sys_pwrite64
-18	n32	readv				compat_sys_readv
-19	n32	writev				compat_sys_writev
+18	n32	readv				sys_readv
+19	n32	writev				sys_writev
 20	n32	access				sys_access
 21	n32	pipe				sysm_pipe
 22	n32	_newselect			compat_sys_select
@@ -167,7 +167,7 @@
 157	n32	sync				sys_sync
 158	n32	acct				sys_acct
 159	n32	settimeofday			compat_sys_settimeofday
-160	n32	mount				compat_sys_mount
+160	n32	mount				sys_mount
 161	n32	umount2				sys_umount
 162	n32	swapon				sys_swapon
 163	n32	swapoff				sys_swapoff
@@ -278,7 +278,7 @@
 267	n32	splice				sys_splice
 268	n32	sync_file_range			sys_sync_file_range
 269	n32	tee				sys_tee
-270	n32	vmsplice			compat_sys_vmsplice
+270	n32	vmsplice			sys_vmsplice
 271	n32	move_pages			compat_sys_move_pages
 272	n32	set_robust_list			compat_sys_set_robust_list
 273	n32	get_robust_list			compat_sys_get_robust_list
@@ -317,8 +317,8 @@
 306	n32	syncfs				sys_syncfs
 307	n32	sendmmsg			compat_sys_sendmmsg
 308	n32	setns				sys_setns
-309	n32	process_vm_readv		compat_sys_process_vm_readv
-310	n32	process_vm_writev		compat_sys_process_vm_writev
+309	n32	process_vm_readv		sys_process_vm_readv
+310	n32	process_vm_writev		sys_process_vm_writev
 311	n32	kcmp				sys_kcmp
 312	n32	finit_module			sys_finit_module
 313	n32	sched_setattr			sys_sched_setattr
@@ -378,3 +378,10 @@
 437	n32	openat2				sys_openat2
 438	n32	pidfd_getfd			sys_pidfd_getfd
 439	n32	faccessat2			sys_faccessat2
+440	n32	process_madvise			sys_process_madvise
+441	n32	epoll_pwait2			compat_sys_epoll_pwait2
+442	n32	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	n32	landlock_create_ruleset		sys_landlock_create_ruleset
+445	n32	landlock_add_rule		sys_landlock_add_rule
+446	n32	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/mips64/syscall_n64.tbl b/linux-user/mips64/syscall_n64.tbl
index 557f9954a2b9..9cd1c34f31b5 100644
--- a/linux-user/mips64/syscall_n64.tbl
+++ b/linux-user/mips64/syscall_n64.tbl
@@ -354,3 +354,10 @@
 437	n64	openat2				sys_openat2
 438	n64	pidfd_getfd			sys_pidfd_getfd
 439	n64	faccessat2			sys_faccessat2
+440	n64	process_madvise			sys_process_madvise
+441	n64	epoll_pwait2			sys_epoll_pwait2
+442	n64	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	n64	landlock_create_ruleset		sys_landlock_create_ruleset
+445	n64	landlock_add_rule		sys_landlock_add_rule
+446	n64	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/ppc/syscall.tbl b/linux-user/ppc/syscall.tbl
index c2d737ff2e7b..8f052ff4058c 100644
--- a/linux-user/ppc/syscall.tbl
+++ b/linux-user/ppc/syscall.tbl
@@ -9,9 +9,7 @@
 #
 0	nospu	restart_syscall			sys_restart_syscall
 1	nospu	exit				sys_exit
-2	32	fork				ppc_fork			sys_fork
-2	64	fork				sys_fork
-2	spu	fork				sys_ni_syscall
+2	nospu	fork				sys_fork
 3	common	read				sys_read
 4	common	write				sys_write
 5	common	open				sys_open			compat_sys_open
@@ -34,7 +32,7 @@
 18	spu	oldstat				sys_ni_syscall
 19	common	lseek				sys_lseek			compat_sys_lseek
 20	common	getpid				sys_getpid
-21	nospu	mount				sys_mount			compat_sys_mount
+21	nospu	mount				sys_mount
 22	32	umount				sys_oldumount
 22	64	umount				sys_ni_syscall
 22	spu	umount				sys_ni_syscall
@@ -160,9 +158,7 @@
 119	32	sigreturn			sys_sigreturn			compat_sys_sigreturn
 119	64	sigreturn			sys_ni_syscall
 119	spu	sigreturn			sys_ni_syscall
-120	32	clone				ppc_clone			sys_clone
-120	64	clone				sys_clone
-120	spu	clone				sys_ni_syscall
+120	nospu	clone				sys_clone
 121	common	setdomainname			sys_setdomainname
 122	common	uname				sys_newuname
 123	common	modify_ldt			sys_ni_syscall
@@ -193,8 +189,8 @@
 142	common	_newselect			sys_select			compat_sys_select
 143	common	flock				sys_flock
 144	common	msync				sys_msync
-145	common	readv				sys_readv			compat_sys_readv
-146	common	writev				sys_writev			compat_sys_writev
+145	common	readv				sys_readv
+146	common	writev				sys_writev
 147	common	getsid				sys_getsid
 148	common	fdatasync			sys_fdatasync
 149	nospu	_sysctl				sys_ni_syscall
@@ -244,9 +240,7 @@
 186	spu	sendfile			sys_sendfile64
 187	common	getpmsg				sys_ni_syscall
 188	common 	putpmsg				sys_ni_syscall
-189	32	vfork				ppc_vfork			sys_vfork
-189	64	vfork				sys_vfork
-189	spu	vfork				sys_ni_syscall
+189	nospu	vfork				sys_vfork
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
 191	common	readahead			sys_readahead			compat_sys_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
@@ -322,9 +316,7 @@
 248	32	clock_nanosleep			sys_clock_nanosleep_time32
 248	64	clock_nanosleep			sys_clock_nanosleep
 248	spu	clock_nanosleep			sys_clock_nanosleep
-249	32	swapcontext			ppc_swapcontext			compat_sys_swapcontext
-249	64	swapcontext			sys_swapcontext
-249	spu	swapcontext			sys_ni_syscall
+249	nospu	swapcontext			sys_swapcontext			compat_sys_swapcontext
 250	common	tgkill				sys_tgkill
 251	32	utimes				sys_utimes_time32
 251	64	utimes				sys_utimes
@@ -369,7 +361,7 @@
 282	common	unshare				sys_unshare
 283	common	splice				sys_splice
 284	common	tee				sys_tee
-285	common	vmsplice			sys_vmsplice			compat_sys_vmsplice
+285	common	vmsplice			sys_vmsplice
 286	common	openat				sys_openat			compat_sys_openat
 287	common	mkdirat				sys_mkdirat
 288	common	mknodat				sys_mknodat
@@ -449,8 +441,8 @@
 348	common	syncfs				sys_syncfs
 349	common	sendmmsg			sys_sendmmsg			compat_sys_sendmmsg
 350	common	setns				sys_setns
-351	nospu	process_vm_readv		sys_process_vm_readv		compat_sys_process_vm_readv
-352	nospu	process_vm_writev		sys_process_vm_writev		compat_sys_process_vm_writev
+351	nospu	process_vm_readv		sys_process_vm_readv
+352	nospu	process_vm_writev		sys_process_vm_writev
 353	nospu	finit_module			sys_finit_module
 354	nospu	kcmp				sys_kcmp
 355	common	sched_setattr			sys_sched_setattr
@@ -522,10 +514,15 @@
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
-435	32	clone3				ppc_clone3			sys_clone3
-435	64	clone3				sys_clone3
-435	spu	clone3				sys_ni_syscall
+435	nospu	clone3				sys_clone3
 436	common	close_range			sys_close_range
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/s390x/syscall.tbl b/linux-user/s390x/syscall.tbl
index 10456bc936fb..0690263df1dd 100644
--- a/linux-user/s390x/syscall.tbl
+++ b/linux-user/s390x/syscall.tbl
@@ -26,7 +26,7 @@
 16   32		lchown			-				sys_lchown16
 19   common	lseek			sys_lseek			compat_sys_lseek
 20   common	getpid			sys_getpid			sys_getpid
-21   common	mount			sys_mount			compat_sys_mount
+21   common	mount			sys_mount			sys_mount
 22   common	umount			sys_oldumount			sys_oldumount
 23   32		setuid			-				sys_setuid16
 24   32		getuid			-				sys_getuid16
@@ -134,8 +134,8 @@
 142  64		select			sys_select			-
 143  common	flock			sys_flock			sys_flock
 144  common	msync			sys_msync			sys_msync
-145  common	readv			sys_readv			compat_sys_readv
-146  common	writev			sys_writev			compat_sys_writev
+145  common	readv			sys_readv			sys_readv
+146  common	writev			sys_writev			sys_writev
 147  common	getsid			sys_getsid			sys_getsid
 148  common	fdatasync		sys_fdatasync			sys_fdatasync
 149  common	_sysctl			-				-
@@ -316,7 +316,7 @@
 306  common	splice			sys_splice			sys_splice
 307  common	sync_file_range		sys_sync_file_range		compat_sys_s390_sync_file_range
 308  common	tee			sys_tee				sys_tee
-309  common	vmsplice		sys_vmsplice			compat_sys_vmsplice
+309  common	vmsplice		sys_vmsplice			sys_vmsplice
 310  common	move_pages		sys_move_pages			compat_sys_move_pages
 311  common	getcpu			sys_getcpu			sys_getcpu
 312  common	epoll_pwait		sys_epoll_pwait			compat_sys_epoll_pwait
@@ -347,8 +347,8 @@
 337  common	clock_adjtime		sys_clock_adjtime		sys_clock_adjtime32
 338  common	syncfs			sys_syncfs			sys_syncfs
 339  common	setns			sys_setns			sys_setns
-340  common	process_vm_readv	sys_process_vm_readv		compat_sys_process_vm_readv
-341  common	process_vm_writev	sys_process_vm_writev		compat_sys_process_vm_writev
+340  common	process_vm_readv	sys_process_vm_readv		sys_process_vm_readv
+341  common	process_vm_writev	sys_process_vm_writev		sys_process_vm_writev
 342  common	s390_runtime_instr	sys_s390_runtime_instr		sys_s390_runtime_instr
 343  common	kcmp			sys_kcmp			sys_kcmp
 344  common	finit_module		sys_finit_module		sys_finit_module
@@ -442,3 +442,10 @@
 437  common	openat2			sys_openat2			sys_openat2
 438  common	pidfd_getfd		sys_pidfd_getfd			sys_pidfd_getfd
 439  common	faccessat2		sys_faccessat2			sys_faccessat2
+440  common	process_madvise		sys_process_madvise		sys_process_madvise
+441  common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
+442  common	mount_setattr		sys_mount_setattr		sys_mount_setattr
+# 443 reserved for quotactl_path
+444  common	landlock_create_ruleset	sys_landlock_create_ruleset	sys_landlock_create_ruleset
+445  common	landlock_add_rule	sys_landlock_add_rule		sys_landlock_add_rule
+446  common	landlock_restrict_self	sys_landlock_restrict_self	sys_landlock_restrict_self
diff --git a/linux-user/sh4/syscall.tbl b/linux-user/sh4/syscall.tbl
index ae0a00beea5f..0b91499ebdcf 100644
--- a/linux-user/sh4/syscall.tbl
+++ b/linux-user/sh4/syscall.tbl
@@ -442,3 +442,10 @@
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/sparc/syscall.tbl b/linux-user/sparc/syscall.tbl
index 4af114e84f20..e34cc30ef22c 100644
--- a/linux-user/sparc/syscall.tbl
+++ b/linux-user/sparc/syscall.tbl
@@ -38,7 +38,7 @@
 23	64    	setuid			sys_setuid
 24	32	getuid			sys_getuid16
 24	64   	getuid			sys_getuid
-25	common	vmsplice		sys_vmsplice			compat_sys_vmsplice
+25	common	vmsplice		sys_vmsplice
 26	common	ptrace			sys_ptrace			compat_sys_ptrace
 27	common	alarm			sys_alarm
 28	common	sigaltstack		sys_sigaltstack			compat_sys_sigaltstack
@@ -149,8 +149,8 @@
 117	common	getrusage		sys_getrusage			compat_sys_getrusage
 118	common	getsockopt		sys_getsockopt			sys_getsockopt
 119	common	getcwd			sys_getcwd
-120	common	readv			sys_readv			compat_sys_readv
-121	common	writev			sys_writev			compat_sys_writev
+120	common	readv			sys_readv
+121	common	writev			sys_writev
 122	common	settimeofday		sys_settimeofday		compat_sys_settimeofday
 123	32	fchown			sys_fchown16
 123	64	fchown			sys_fchown
@@ -201,7 +201,7 @@
 164	64	utrap_install		sys_utrap_install
 165	common	quotactl		sys_quotactl
 166	common	set_tid_address		sys_set_tid_address
-167	common	mount			sys_mount			compat_sys_mount
+167	common	mount			sys_mount
 168	common	ustat			sys_ustat			compat_sys_ustat
 169	common	setxattr		sys_setxattr
 170	common	lsetxattr		sys_lsetxattr
@@ -406,8 +406,8 @@
 335	common	syncfs			sys_syncfs
 336	common	sendmmsg		sys_sendmmsg			compat_sys_sendmmsg
 337	common	setns			sys_setns
-338	common	process_vm_readv	sys_process_vm_readv		compat_sys_process_vm_readv
-339	common	process_vm_writev	sys_process_vm_writev		compat_sys_process_vm_writev
+338	common	process_vm_readv	sys_process_vm_readv
+339	common	process_vm_writev	sys_process_vm_writev
 340	32	kern_features		sys_ni_syscall			sys_kern_features
 340	64	kern_features		sys_kern_features
 341	common	kcmp			sys_kcmp
@@ -485,3 +485,10 @@
 437	common	openat2			sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --git a/linux-user/x86_64/syscall_64.tbl b/linux-user/x86_64/syscall_64.tbl
index f30d6ae9a688..ce18119ea0d0 100644
--- a/linux-user/x86_64/syscall_64.tbl
+++ b/linux-user/x86_64/syscall_64.tbl
@@ -361,18 +361,25 @@
 437	common	openat2			sys_openat2
 438	common	pidfd_getfd		sys_pidfd_getfd
 439	common	faccessat2		sys_faccessat2
+440	common	process_madvise		sys_process_madvise
+441	common	epoll_pwait2		sys_epoll_pwait2
+442	common	mount_setattr		sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset	sys_landlock_create_ruleset
+445	common	landlock_add_rule	sys_landlock_add_rule
+446	common	landlock_restrict_self	sys_landlock_restrict_self
 
 #
-# x32-specific system call numbers start at 512 to avoid cache impact
-# for native 64-bit operation. The __x32_compat_sys stubs are created
-# on-the-fly for compat_sys_*() compatibility system calls if X86_X32
-# is defined.
+# Due to a historical design error, certain syscalls are numbered differently
+# in x32 as compared to native x86_64.  These syscalls have numbers 512-547.
+# Do not add new syscalls to this range.  Numbers 548 and above are available
+# for non-x32 use.
 #
 512	x32	rt_sigaction		compat_sys_rt_sigaction
 513	x32	rt_sigreturn		compat_sys_x32_rt_sigreturn
 514	x32	ioctl			compat_sys_ioctl
-515	x32	readv			compat_sys_readv
-516	x32	writev			compat_sys_writev
+515	x32	readv			sys_readv
+516	x32	writev			sys_writev
 517	x32	recvfrom		compat_sys_recvfrom
 518	x32	sendmsg			compat_sys_sendmsg
 519	x32	recvmsg			compat_sys_recvmsg
@@ -388,15 +395,15 @@
 529	x32	waitid			compat_sys_waitid
 530	x32	set_robust_list		compat_sys_set_robust_list
 531	x32	get_robust_list		compat_sys_get_robust_list
-532	x32	vmsplice		compat_sys_vmsplice
+532	x32	vmsplice		sys_vmsplice
 533	x32	move_pages		compat_sys_move_pages
 534	x32	preadv			compat_sys_preadv64
 535	x32	pwritev			compat_sys_pwritev64
 536	x32	rt_tgsigqueueinfo	compat_sys_rt_tgsigqueueinfo
 537	x32	recvmmsg		compat_sys_recvmmsg_time64
 538	x32	sendmmsg		compat_sys_sendmmsg
-539	x32	process_vm_readv	compat_sys_process_vm_readv
-540	x32	process_vm_writev	compat_sys_process_vm_writev
+539	x32	process_vm_readv	sys_process_vm_readv
+540	x32	process_vm_writev	sys_process_vm_writev
 541	x32	setsockopt		sys_setsockopt
 542	x32	getsockopt		sys_getsockopt
 543	x32	io_setup		compat_sys_io_setup
@@ -404,3 +411,5 @@
 545	x32	execveat		compat_sys_execveat
 546	x32	preadv2			compat_sys_preadv64v2
 547	x32	pwritev2		compat_sys_pwritev64v2
+# This is the end of the legacy x32 range.  Numbers 548 and above are
+# not special and are not to be used for x32-specific syscalls.
diff --git a/linux-user/xtensa/syscall.tbl b/linux-user/xtensa/syscall.tbl
index 6276e3c2d3fc..fd2f30227d96 100644
--- a/linux-user/xtensa/syscall.tbl
+++ b/linux-user/xtensa/syscall.tbl
@@ -410,3 +410,10 @@
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+# 443 reserved for quotactl_path
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
-- 
2.31.1


