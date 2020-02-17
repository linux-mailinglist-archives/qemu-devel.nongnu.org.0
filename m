Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D05161D86
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 23:43:51 +0100 (CET)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3p7G-00034Z-HB
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 17:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j3p0m-0007KN-JO
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 17:37:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j3p0i-0000ZO-3m
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 17:37:08 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:46267)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j3p0h-0000Ym-Lz; Mon, 17 Feb 2020 17:37:04 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MILnm-1jI8LI0Lem-00EJbd; Mon, 17 Feb 2020 23:36:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/22] linux-user,arm: add syscall table generation support
Date: Mon, 17 Feb 2020 23:35:44 +0100
Message-Id: <20200217223558.863199-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217223558.863199-1-laurent@vivier.eu>
References: <20200217223558.863199-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4k37SFvK/OPXvgoKRTjuT1Jlz05G0flzWME+30+T9fi5emDIL4m
 TuG3wlAc+Nv7hZc1zJxsI+enZedoGu5D9jUL1jpzgdpr25hBMrR+BA2zPeJx+R4ljEAfc4a
 QbVMqGOuLTEo43cqhfWETsB4ZGJ6LrKfiV4XgD9OMIkClNSUsEGjhasWfKrI50/hxzMr1Ej
 2p1ylGUuAdXNn8z1ZhJNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BV9zKsUjeC8=:ZL5vRBR6xSCweP9e/tkZnj
 ZK7EoBGswMyHP3Edum+m69tmjqjL4iwtrUeGvLOHouDDcBn5gFtnJTeWaubP8qAB5PNj1caYV
 wXeuVH3a0eEDbTi67+DvN/R+3SeIp8gxvkI5cggPFDdpd1dX+un98SKAmNlpetrzFzyDkzWyK
 3PZ1h1WSaveEpE+B5VUerY985dgC/RouxfTBj9xvcmI/WeUAj/WbVSuPVhXJJNsmVB1D4C2w7
 Dpr9yPCvlnFsDbkIf+N/0WzlortAw+JAqjpG1C0n+TOhZ0YPt3KLXfjiO3qAPwEAUCoP1viFn
 MqpuUaO9Y0B2Me4GMga+HVyjkCP8OJhWmQ4YSH/sJnSlf3KAORf8k3rk6cKSRqDpe27wLhMJ6
 4xE/kfhlgzWKZE+RpnZMvDfuyEv3EhtUUP00/KhGByNn5H5UZfOdpda+xJVGKQxGCI1qRW01N
 z+fw08if90VGW7D5Cgrks9nmrFNxC0S10ZWc1I4+9+pOvm4+3P5NujYb5ALzZVdL00VUG0G2P
 7Ax0aW4JH4FYRvFr5Nf3rZCMXQuD9CYQt0Hn+vCEscDcemNTCXtCK33aOhY+ykxTjBZMXrkqe
 Xd8yCzKxfVIzoMkm8dAixU1rMW/8FFKMhSBwThgCFSlnajzzNZet+Dckk6C0aJKsrsQriiIEa
 cIm8siMuU4Qttw7owoMwlmsmCEnJJIbuiJ/o3bzgd7zx5/wGXQ25ew9XMruedrba5jQ71J8+W
 /RWZZCvYGtgd/hvumbkzitYWMlZNeOJo+g0uXGQyNiwXQVJyvY8eGYfxlF7E/7PG8pk90DuYD
 kavUhcBBDEzWaIh+Qy1hZoCwnlUKm6SdhrCpvpjxN9soM5U4voZThrBS0ITTUpH+eICAaAv
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy syscall.tbl and syscallhdr.sh from linux/arch/arm/tools/syscalls v5.5
Update syscallhdr.sh to generate QEMU syscall_nr.h

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure                    |   1 +
 linux-user/Makefile.objs     |   3 +-
 linux-user/arm/Makefile.objs |   8 +
 linux-user/arm/syscall.tbl   | 451 +++++++++++++++++++++++++++++++++++
 linux-user/arm/syscall_nr.h  | 447 ----------------------------------
 linux-user/arm/syscallhdr.sh |  31 +++
 6 files changed, 492 insertions(+), 449 deletions(-)
 create mode 100644 linux-user/arm/Makefile.objs
 create mode 100644 linux-user/arm/syscall.tbl
 delete mode 100644 linux-user/arm/syscall_nr.h
 create mode 100644 linux-user/arm/syscallhdr.sh

diff --git a/configure b/configure
index 7873e059e8c4..6db6a658b355 100755
--- a/configure
+++ b/configure
@@ -7686,6 +7686,7 @@ case "$target_name" in
   ;;
   arm|armeb)
     TARGET_ARCH=arm
+    TARGET_SYSTBL_ABI=common,oabi
     bflt="yes"
     mttcg="yes"
     gdb_xml_files="arm-core.xml arm-vfp.xml arm-vfp3.xml arm-neon.xml"
diff --git a/linux-user/Makefile.objs b/linux-user/Makefile.objs
index 5a26281e8867..bc12e38291bc 100644
--- a/linux-user/Makefile.objs
+++ b/linux-user/Makefile.objs
@@ -5,11 +5,10 @@ obj-y = main.o syscall.o strace.o mmap.o signal.o \
 
 obj-$(TARGET_HAS_BFLT) += flatload.o
 obj-$(TARGET_I386) += vm86.o
-obj-$(TARGET_ARM) += arm/nwfpe/
-obj-$(TARGET_ARM) += arm/semihost.o
 obj-$(TARGET_AARCH64) += arm/semihost.o
 
 obj-$(TARGET_ALPHA) += alpha/
+obj-$(TARGET_ARM) += arm/
 obj-$(TARGET_HPPA) += hppa/
 obj-$(TARGET_M68K) += m68k/
 obj-$(TARGET_MICROBLAZE) += microblaze/
diff --git a/linux-user/arm/Makefile.objs b/linux-user/arm/Makefile.objs
new file mode 100644
index 000000000000..bb763838bf5c
--- /dev/null
+++ b/linux-user/arm/Makefile.objs
@@ -0,0 +1,8 @@
+obj-$(TARGET_ARM) += nwfpe/
+obj-$(TARGET_ARM) += semihost.o
+
+generated-files-y += linux-user/arm/syscall_nr.h
+
+syshdr := $(SRC_PATH)/linux-user/arm/syscallhdr.sh
+%/syscall_nr.h: $(SRC_PATH)/linux-user/arm/syscall.tbl $(syshdr)
+	$(call quiet-command, sh $(syshdr) $< $@ $(TARGET_SYSTBL_ABI),,"GEN","$@")
diff --git a/linux-user/arm/syscall.tbl b/linux-user/arm/syscall.tbl
new file mode 100644
index 000000000000..6da7dc4d79cc
--- /dev/null
+++ b/linux-user/arm/syscall.tbl
@@ -0,0 +1,451 @@
+#
+# Linux system call numbers and entry vectors
+#
+# The format is:
+# <num>	<abi>	<name>			[<entry point>			[<oabi compat entry point>]]
+#
+# Where abi is:
+#  common - for system calls shared between oabi and eabi (may have compat)
+#  oabi   - for oabi-only system calls (may have compat)
+#  eabi   - for eabi-only system calls
+#
+# For each syscall number, "common" is mutually exclusive with oabi and eabi
+#
+0	common	restart_syscall		sys_restart_syscall
+1	common	exit			sys_exit
+2	common	fork			sys_fork
+3	common	read			sys_read
+4	common	write			sys_write
+5	common	open			sys_open
+6	common	close			sys_close
+# 7 was sys_waitpid
+8	common	creat			sys_creat
+9	common	link			sys_link
+10	common	unlink			sys_unlink
+11	common	execve			sys_execve
+12	common	chdir			sys_chdir
+13	oabi	time			sys_time32
+14	common	mknod			sys_mknod
+15	common	chmod			sys_chmod
+16	common	lchown			sys_lchown16
+# 17 was sys_break
+# 18 was sys_stat
+19	common	lseek			sys_lseek
+20	common	getpid			sys_getpid
+21	common	mount			sys_mount
+22	oabi	umount			sys_oldumount
+23	common	setuid			sys_setuid16
+24	common	getuid			sys_getuid16
+25	oabi	stime			sys_stime32
+26	common	ptrace			sys_ptrace
+27	oabi	alarm			sys_alarm
+# 28 was sys_fstat
+29	common	pause			sys_pause
+30	oabi	utime			sys_utime32
+# 31 was sys_stty
+# 32 was sys_gtty
+33	common	access			sys_access
+34	common	nice			sys_nice
+# 35 was sys_ftime
+36	common	sync			sys_sync
+37	common	kill			sys_kill
+38	common	rename			sys_rename
+39	common	mkdir			sys_mkdir
+40	common	rmdir			sys_rmdir
+41	common	dup			sys_dup
+42	common	pipe			sys_pipe
+43	common	times			sys_times
+# 44 was sys_prof
+45	common	brk			sys_brk
+46	common	setgid			sys_setgid16
+47	common	getgid			sys_getgid16
+# 48 was sys_signal
+49	common	geteuid			sys_geteuid16
+50	common	getegid			sys_getegid16
+51	common	acct			sys_acct
+52	common	umount2			sys_umount
+# 53 was sys_lock
+54	common	ioctl			sys_ioctl
+55	common	fcntl			sys_fcntl
+# 56 was sys_mpx
+57	common	setpgid			sys_setpgid
+# 58 was sys_ulimit
+# 59 was sys_olduname
+60	common	umask			sys_umask
+61	common	chroot			sys_chroot
+62	common	ustat			sys_ustat
+63	common	dup2			sys_dup2
+64	common	getppid			sys_getppid
+65	common	getpgrp			sys_getpgrp
+66	common	setsid			sys_setsid
+67	common	sigaction		sys_sigaction
+# 68 was sys_sgetmask
+# 69 was sys_ssetmask
+70	common	setreuid		sys_setreuid16
+71	common	setregid		sys_setregid16
+72	common	sigsuspend		sys_sigsuspend
+73	common	sigpending		sys_sigpending
+74	common	sethostname		sys_sethostname
+75	common	setrlimit		sys_setrlimit
+# Back compat 2GB limited rlimit
+76	oabi	getrlimit		sys_old_getrlimit
+77	common	getrusage		sys_getrusage
+78	common	gettimeofday		sys_gettimeofday
+79	common	settimeofday		sys_settimeofday
+80	common	getgroups		sys_getgroups16
+81	common	setgroups		sys_setgroups16
+82	oabi	select			sys_old_select
+83	common	symlink			sys_symlink
+# 84 was sys_lstat
+85	common	readlink		sys_readlink
+86	common	uselib			sys_uselib
+87	common	swapon			sys_swapon
+88	common	reboot			sys_reboot
+89	oabi	readdir			sys_old_readdir
+90	oabi	mmap			sys_old_mmap
+91	common	munmap			sys_munmap
+92	common	truncate		sys_truncate
+93	common	ftruncate		sys_ftruncate
+94	common	fchmod			sys_fchmod
+95	common	fchown			sys_fchown16
+96	common	getpriority		sys_getpriority
+97	common	setpriority		sys_setpriority
+# 98 was sys_profil
+99	common	statfs			sys_statfs
+100	common	fstatfs			sys_fstatfs
+# 101 was sys_ioperm
+102	oabi	socketcall		sys_socketcall		sys_oabi_socketcall
+103	common	syslog			sys_syslog
+104	common	setitimer		sys_setitimer
+105	common	getitimer		sys_getitimer
+106	common	stat			sys_newstat
+107	common	lstat			sys_newlstat
+108	common	fstat			sys_newfstat
+# 109 was sys_uname
+# 110 was sys_iopl
+111	common	vhangup			sys_vhangup
+# 112 was sys_idle
+# syscall to call a syscall!
+113	oabi	syscall			sys_syscall
+114	common	wait4			sys_wait4
+115	common	swapoff			sys_swapoff
+116	common	sysinfo			sys_sysinfo
+117	oabi	ipc			sys_ipc			sys_oabi_ipc
+118	common	fsync			sys_fsync
+119	common	sigreturn		sys_sigreturn_wrapper
+120	common	clone			sys_clone
+121	common	setdomainname		sys_setdomainname
+122	common	uname			sys_newuname
+# 123 was sys_modify_ldt
+124	common	adjtimex		sys_adjtimex_time32
+125	common	mprotect		sys_mprotect
+126	common	sigprocmask		sys_sigprocmask
+# 127 was sys_create_module
+128	common	init_module		sys_init_module
+129	common	delete_module		sys_delete_module
+# 130 was sys_get_kernel_syms
+131	common	quotactl		sys_quotactl
+132	common	getpgid			sys_getpgid
+133	common	fchdir			sys_fchdir
+134	common	bdflush			sys_bdflush
+135	common	sysfs			sys_sysfs
+136	common	personality		sys_personality
+# 137 was sys_afs_syscall
+138	common	setfsuid		sys_setfsuid16
+139	common	setfsgid		sys_setfsgid16
+140	common	_llseek			sys_llseek
+141	common	getdents		sys_getdents
+142	common	_newselect		sys_select
+143	common	flock			sys_flock
+144	common	msync			sys_msync
+145	common	readv			sys_readv
+146	common	writev			sys_writev
+147	common	getsid			sys_getsid
+148	common	fdatasync		sys_fdatasync
+149	common	_sysctl			sys_sysctl
+150	common	mlock			sys_mlock
+151	common	munlock			sys_munlock
+152	common	mlockall		sys_mlockall
+153	common	munlockall		sys_munlockall
+154	common	sched_setparam		sys_sched_setparam
+155	common	sched_getparam		sys_sched_getparam
+156	common	sched_setscheduler	sys_sched_setscheduler
+157	common	sched_getscheduler	sys_sched_getscheduler
+158	common	sched_yield		sys_sched_yield
+159	common	sched_get_priority_max	sys_sched_get_priority_max
+160	common	sched_get_priority_min	sys_sched_get_priority_min
+161	common	sched_rr_get_interval	sys_sched_rr_get_interval_time32
+162	common	nanosleep		sys_nanosleep_time32
+163	common	mremap			sys_mremap
+164	common	setresuid		sys_setresuid16
+165	common	getresuid		sys_getresuid16
+# 166 was sys_vm86
+# 167 was sys_query_module
+168	common	poll			sys_poll
+169	common	nfsservctl
+170	common	setresgid		sys_setresgid16
+171	common	getresgid		sys_getresgid16
+172	common	prctl			sys_prctl
+173	common	rt_sigreturn		sys_rt_sigreturn_wrapper
+174	common	rt_sigaction		sys_rt_sigaction
+175	common	rt_sigprocmask		sys_rt_sigprocmask
+176	common	rt_sigpending		sys_rt_sigpending
+177	common	rt_sigtimedwait		sys_rt_sigtimedwait_time32
+178	common	rt_sigqueueinfo		sys_rt_sigqueueinfo
+179	common	rt_sigsuspend		sys_rt_sigsuspend
+180	common	pread64			sys_pread64		sys_oabi_pread64
+181	common	pwrite64		sys_pwrite64		sys_oabi_pwrite64
+182	common	chown			sys_chown16
+183	common	getcwd			sys_getcwd
+184	common	capget			sys_capget
+185	common	capset			sys_capset
+186	common	sigaltstack		sys_sigaltstack
+187	common	sendfile		sys_sendfile
+# 188 reserved
+# 189 reserved
+190	common	vfork			sys_vfork
+# SuS compliant getrlimit
+191	common	ugetrlimit		sys_getrlimit
+192	common	mmap2			sys_mmap2
+193	common	truncate64		sys_truncate64		sys_oabi_truncate64
+194	common	ftruncate64		sys_ftruncate64		sys_oabi_ftruncate64
+195	common	stat64			sys_stat64		sys_oabi_stat64
+196	common	lstat64			sys_lstat64		sys_oabi_lstat64
+197	common	fstat64			sys_fstat64		sys_oabi_fstat64
+198	common	lchown32		sys_lchown
+199	common	getuid32		sys_getuid
+200	common	getgid32		sys_getgid
+201	common	geteuid32		sys_geteuid
+202	common	getegid32		sys_getegid
+203	common	setreuid32		sys_setreuid
+204	common	setregid32		sys_setregid
+205	common	getgroups32		sys_getgroups
+206	common	setgroups32		sys_setgroups
+207	common	fchown32		sys_fchown
+208	common	setresuid32		sys_setresuid
+209	common	getresuid32		sys_getresuid
+210	common	setresgid32		sys_setresgid
+211	common	getresgid32		sys_getresgid
+212	common	chown32			sys_chown
+213	common	setuid32		sys_setuid
+214	common	setgid32		sys_setgid
+215	common	setfsuid32		sys_setfsuid
+216	common	setfsgid32		sys_setfsgid
+217	common	getdents64		sys_getdents64
+218	common	pivot_root		sys_pivot_root
+219	common	mincore			sys_mincore
+220	common	madvise			sys_madvise
+221	common	fcntl64			sys_fcntl64		sys_oabi_fcntl64
+# 222 for tux
+# 223 is unused
+224	common	gettid			sys_gettid
+225	common	readahead		sys_readahead		sys_oabi_readahead
+226	common	setxattr		sys_setxattr
+227	common	lsetxattr		sys_lsetxattr
+228	common	fsetxattr		sys_fsetxattr
+229	common	getxattr		sys_getxattr
+230	common	lgetxattr		sys_lgetxattr
+231	common	fgetxattr		sys_fgetxattr
+232	common	listxattr		sys_listxattr
+233	common	llistxattr		sys_llistxattr
+234	common	flistxattr		sys_flistxattr
+235	common	removexattr		sys_removexattr
+236	common	lremovexattr		sys_lremovexattr
+237	common	fremovexattr		sys_fremovexattr
+238	common	tkill			sys_tkill
+239	common	sendfile64		sys_sendfile64
+240	common	futex			sys_futex_time32
+241	common	sched_setaffinity	sys_sched_setaffinity
+242	common	sched_getaffinity	sys_sched_getaffinity
+243	common	io_setup		sys_io_setup
+244	common	io_destroy		sys_io_destroy
+245	common	io_getevents		sys_io_getevents_time32
+246	common	io_submit		sys_io_submit
+247	common	io_cancel		sys_io_cancel
+248	common	exit_group		sys_exit_group
+249	common	lookup_dcookie		sys_lookup_dcookie
+250	common	epoll_create		sys_epoll_create
+251	common	epoll_ctl		sys_epoll_ctl		sys_oabi_epoll_ctl
+252	common	epoll_wait		sys_epoll_wait		sys_oabi_epoll_wait
+253	common	remap_file_pages	sys_remap_file_pages
+# 254 for set_thread_area
+# 255 for get_thread_area
+256	common	set_tid_address		sys_set_tid_address
+257	common	timer_create		sys_timer_create
+258	common	timer_settime		sys_timer_settime32
+259	common	timer_gettime		sys_timer_gettime32
+260	common	timer_getoverrun	sys_timer_getoverrun
+261	common	timer_delete		sys_timer_delete
+262	common	clock_settime		sys_clock_settime32
+263	common	clock_gettime		sys_clock_gettime32
+264	common	clock_getres		sys_clock_getres_time32
+265	common	clock_nanosleep		sys_clock_nanosleep_time32
+266	common	statfs64		sys_statfs64_wrapper
+267	common	fstatfs64		sys_fstatfs64_wrapper
+268	common	tgkill			sys_tgkill
+269	common	utimes			sys_utimes_time32
+270	common	arm_fadvise64_64	sys_arm_fadvise64_64
+271	common	pciconfig_iobase	sys_pciconfig_iobase
+272	common	pciconfig_read		sys_pciconfig_read
+273	common	pciconfig_write		sys_pciconfig_write
+274	common	mq_open			sys_mq_open
+275	common	mq_unlink		sys_mq_unlink
+276	common	mq_timedsend		sys_mq_timedsend_time32
+277	common	mq_timedreceive		sys_mq_timedreceive_time32
+278	common	mq_notify		sys_mq_notify
+279	common	mq_getsetattr		sys_mq_getsetattr
+280	common	waitid			sys_waitid
+281	common	socket			sys_socket
+282	common	bind			sys_bind		sys_oabi_bind
+283	common	connect			sys_connect		sys_oabi_connect
+284	common	listen			sys_listen
+285	common	accept			sys_accept
+286	common	getsockname		sys_getsockname
+287	common	getpeername		sys_getpeername
+288	common	socketpair		sys_socketpair
+289	common	send			sys_send
+290	common	sendto			sys_sendto		sys_oabi_sendto
+291	common	recv			sys_recv
+292	common	recvfrom		sys_recvfrom
+293	common	shutdown		sys_shutdown
+294	common	setsockopt		sys_setsockopt
+295	common	getsockopt		sys_getsockopt
+296	common	sendmsg			sys_sendmsg		sys_oabi_sendmsg
+297	common	recvmsg			sys_recvmsg
+298	common	semop			sys_semop		sys_oabi_semop
+299	common	semget			sys_semget
+300	common	semctl			sys_old_semctl
+301	common	msgsnd			sys_msgsnd
+302	common	msgrcv			sys_msgrcv
+303	common	msgget			sys_msgget
+304	common	msgctl			sys_old_msgctl
+305	common	shmat			sys_shmat
+306	common	shmdt			sys_shmdt
+307	common	shmget			sys_shmget
+308	common	shmctl			sys_old_shmctl
+309	common	add_key			sys_add_key
+310	common	request_key		sys_request_key
+311	common	keyctl			sys_keyctl
+312	common	semtimedop		sys_semtimedop_time32	sys_oabi_semtimedop
+313	common	vserver
+314	common	ioprio_set		sys_ioprio_set
+315	common	ioprio_get		sys_ioprio_get
+316	common	inotify_init		sys_inotify_init
+317	common	inotify_add_watch	sys_inotify_add_watch
+318	common	inotify_rm_watch	sys_inotify_rm_watch
+319	common	mbind			sys_mbind
+320	common	get_mempolicy		sys_get_mempolicy
+321	common	set_mempolicy		sys_set_mempolicy
+322	common	openat			sys_openat
+323	common	mkdirat			sys_mkdirat
+324	common	mknodat			sys_mknodat
+325	common	fchownat		sys_fchownat
+326	common	futimesat		sys_futimesat_time32
+327	common	fstatat64		sys_fstatat64		sys_oabi_fstatat64
+328	common	unlinkat		sys_unlinkat
+329	common	renameat		sys_renameat
+330	common	linkat			sys_linkat
+331	common	symlinkat		sys_symlinkat
+332	common	readlinkat		sys_readlinkat
+333	common	fchmodat		sys_fchmodat
+334	common	faccessat		sys_faccessat
+335	common	pselect6		sys_pselect6_time32
+336	common	ppoll			sys_ppoll_time32
+337	common	unshare			sys_unshare
+338	common	set_robust_list		sys_set_robust_list
+339	common	get_robust_list		sys_get_robust_list
+340	common	splice			sys_splice
+341	common	arm_sync_file_range	sys_sync_file_range2
+342	common	tee			sys_tee
+343	common	vmsplice		sys_vmsplice
+344	common	move_pages		sys_move_pages
+345	common	getcpu			sys_getcpu
+346	common	epoll_pwait		sys_epoll_pwait
+347	common	kexec_load		sys_kexec_load
+348	common	utimensat		sys_utimensat_time32
+349	common	signalfd		sys_signalfd
+350	common	timerfd_create		sys_timerfd_create
+351	common	eventfd			sys_eventfd
+352	common	fallocate		sys_fallocate
+353	common	timerfd_settime		sys_timerfd_settime32
+354	common	timerfd_gettime		sys_timerfd_gettime32
+355	common	signalfd4		sys_signalfd4
+356	common	eventfd2		sys_eventfd2
+357	common	epoll_create1		sys_epoll_create1
+358	common	dup3			sys_dup3
+359	common	pipe2			sys_pipe2
+360	common	inotify_init1		sys_inotify_init1
+361	common	preadv			sys_preadv
+362	common	pwritev			sys_pwritev
+363	common	rt_tgsigqueueinfo	sys_rt_tgsigqueueinfo
+364	common	perf_event_open		sys_perf_event_open
+365	common	recvmmsg		sys_recvmmsg_time32
+366	common	accept4			sys_accept4
+367	common	fanotify_init		sys_fanotify_init
+368	common	fanotify_mark		sys_fanotify_mark
+369	common	prlimit64		sys_prlimit64
+370	common	name_to_handle_at	sys_name_to_handle_at
+371	common	open_by_handle_at	sys_open_by_handle_at
+372	common	clock_adjtime		sys_clock_adjtime32
+373	common	syncfs			sys_syncfs
+374	common	sendmmsg		sys_sendmmsg
+375	common	setns			sys_setns
+376	common	process_vm_readv	sys_process_vm_readv
+377	common	process_vm_writev	sys_process_vm_writev
+378	common	kcmp			sys_kcmp
+379	common	finit_module		sys_finit_module
+380	common	sched_setattr		sys_sched_setattr
+381	common	sched_getattr		sys_sched_getattr
+382	common	renameat2		sys_renameat2
+383	common	seccomp			sys_seccomp
+384	common	getrandom		sys_getrandom
+385	common	memfd_create		sys_memfd_create
+386	common	bpf			sys_bpf
+387	common	execveat		sys_execveat
+388	common	userfaultfd		sys_userfaultfd
+389	common	membarrier		sys_membarrier
+390	common	mlock2			sys_mlock2
+391	common	copy_file_range		sys_copy_file_range
+392	common	preadv2			sys_preadv2
+393	common	pwritev2		sys_pwritev2
+394	common	pkey_mprotect		sys_pkey_mprotect
+395	common	pkey_alloc		sys_pkey_alloc
+396	common	pkey_free		sys_pkey_free
+397	common	statx			sys_statx
+398	common	rseq			sys_rseq
+399	common	io_pgetevents		sys_io_pgetevents_time32
+400	common	migrate_pages		sys_migrate_pages
+401	common	kexec_file_load		sys_kexec_file_load
+# 402 is unused
+403	common	clock_gettime64			sys_clock_gettime
+404	common	clock_settime64			sys_clock_settime
+405	common	clock_adjtime64			sys_clock_adjtime
+406	common	clock_getres_time64		sys_clock_getres
+407	common	clock_nanosleep_time64		sys_clock_nanosleep
+408	common	timer_gettime64			sys_timer_gettime
+409	common	timer_settime64			sys_timer_settime
+410	common	timerfd_gettime64		sys_timerfd_gettime
+411	common	timerfd_settime64		sys_timerfd_settime
+412	common	utimensat_time64		sys_utimensat
+413	common	pselect6_time64			sys_pselect6
+414	common	ppoll_time64			sys_ppoll
+416	common	io_pgetevents_time64		sys_io_pgetevents
+417	common	recvmmsg_time64			sys_recvmmsg
+418	common	mq_timedsend_time64		sys_mq_timedsend
+419	common	mq_timedreceive_time64		sys_mq_timedreceive
+420	common	semtimedop_time64		sys_semtimedop
+421	common	rt_sigtimedwait_time64		sys_rt_sigtimedwait
+422	common	futex_time64			sys_futex
+423	common	sched_rr_get_interval_time64	sys_sched_rr_get_interval
+424	common	pidfd_send_signal		sys_pidfd_send_signal
+425	common	io_uring_setup			sys_io_uring_setup
+426	common	io_uring_enter			sys_io_uring_enter
+427	common	io_uring_register		sys_io_uring_register
+428	common	open_tree			sys_open_tree
+429	common	move_mount			sys_move_mount
+430	common	fsopen				sys_fsopen
+431	common	fsconfig			sys_fsconfig
+432	common	fsmount				sys_fsmount
+433	common	fspick				sys_fspick
+434	common	pidfd_open			sys_pidfd_open
+435	common	clone3				sys_clone3
diff --git a/linux-user/arm/syscall_nr.h b/linux-user/arm/syscall_nr.h
deleted file mode 100644
index 6db9235f2bfd..000000000000
--- a/linux-user/arm/syscall_nr.h
+++ /dev/null
@@ -1,447 +0,0 @@
-/*
- * This file contains the system call numbers.
- */
-
-#ifndef LINUX_USER_ARM_SYSCALL_NR_H
-#define LINUX_USER_ARM_SYSCALL_NR_H
-
-#define TARGET_NR_restart_syscall		(  0)
-#define TARGET_NR_exit			(  1)
-#define TARGET_NR_fork			(  2)
-#define TARGET_NR_read			(  3)
-#define TARGET_NR_write			(  4)
-#define TARGET_NR_open			(  5)
-#define TARGET_NR_close			(  6)
-#define TARGET_NR_waitpid			(  7)	/* removed */
-#define TARGET_NR_creat			(  8)
-#define TARGET_NR_link			(  9)
-#define TARGET_NR_unlink			( 10)
-#define TARGET_NR_execve			( 11)
-#define TARGET_NR_chdir			( 12)
-#define TARGET_NR_time			( 13)
-#define TARGET_NR_mknod			( 14)
-#define TARGET_NR_chmod			( 15)
-#define TARGET_NR_lchown			( 16)
-#define TARGET_NR_break			( 17)	/* removed */
-					/* 18 was sys_stat */
-#define TARGET_NR_lseek			( 19)
-#define TARGET_NR_getpid			( 20)
-#define TARGET_NR_mount			( 21)
-#define TARGET_NR_umount			( 22)
-#define TARGET_NR_setuid			( 23)
-#define TARGET_NR_getuid			( 24)
-#define TARGET_NR_stime			( 25)
-#define TARGET_NR_ptrace			( 26)
-#define TARGET_NR_alarm			( 27)
-
-#define TARGET_NR_pause			( 29)
-#define TARGET_NR_utime			( 30)
-#define TARGET_NR_stty			( 31)	/* removed */
-#define TARGET_NR_gtty			( 32)	/* removed */
-#define TARGET_NR_access			( 33)
-#define TARGET_NR_nice			( 34)
-#define TARGET_NR_ftime			( 35)	/* removed */
-#define TARGET_NR_sync			( 36)
-#define TARGET_NR_kill			( 37)
-#define TARGET_NR_rename			( 38)
-#define TARGET_NR_mkdir			( 39)
-#define TARGET_NR_rmdir			( 40)
-#define TARGET_NR_dup			( 41)
-#define TARGET_NR_pipe			( 42)
-#define TARGET_NR_times			( 43)
-#define TARGET_NR_prof			( 44)	/* removed */
-#define TARGET_NR_brk			( 45)
-#define TARGET_NR_setgid			( 46)
-#define TARGET_NR_getgid			( 47)
-#define TARGET_NR_signal			( 48)	/* removed */
-#define TARGET_NR_geteuid			( 49)
-#define TARGET_NR_getegid			( 50)
-#define TARGET_NR_acct			( 51)
-#define TARGET_NR_umount2			( 52)
-#define TARGET_NR_lock			( 53)	/* removed */
-#define TARGET_NR_ioctl			( 54)
-#define TARGET_NR_fcntl			( 55)
-#define TARGET_NR_mpx			( 56)	/* removed */
-#define TARGET_NR_setpgid			( 57)
-#define TARGET_NR_ulimit			( 58)	/* removed */
-					/* 59 was sys_olduname */
-#define TARGET_NR_umask			( 60)
-#define TARGET_NR_chroot			( 61)
-#define TARGET_NR_ustat			( 62)
-#define TARGET_NR_dup2			( 63)
-#define TARGET_NR_getppid			( 64)
-#define TARGET_NR_getpgrp			( 65)
-#define TARGET_NR_setsid			( 66)
-#define TARGET_NR_sigaction			( 67)
-#define TARGET_NR_sgetmask			( 68)	/* removed */
-#define TARGET_NR_ssetmask			( 69)	/* removed */
-#define TARGET_NR_setreuid			( 70)
-#define TARGET_NR_setregid			( 71)
-#define TARGET_NR_sigsuspend			( 72)
-#define TARGET_NR_sigpending			( 73)
-#define TARGET_NR_sethostname		( 74)
-#define TARGET_NR_setrlimit			( 75)
-#define TARGET_NR_getrlimit			( 76)	/* Back compat 2GB limited rlimit */
-#define TARGET_NR_getrusage			( 77)
-#define TARGET_NR_gettimeofday		( 78)
-#define TARGET_NR_settimeofday		( 79)
-#define TARGET_NR_getgroups			( 80)
-#define TARGET_NR_setgroups			( 81)
-#define TARGET_NR_select			( 82)
-#define TARGET_NR_symlink			( 83)
-					/* 84 was sys_lstat */
-#define TARGET_NR_readlink			( 85)
-#define TARGET_NR_uselib			( 86)
-#define TARGET_NR_swapon			( 87)
-#define TARGET_NR_reboot			( 88)
-#define TARGET_NR_readdir			( 89)
-#define TARGET_NR_mmap			( 90)
-#define TARGET_NR_munmap			( 91)
-#define TARGET_NR_truncate			( 92)
-#define TARGET_NR_ftruncate			( 93)
-#define TARGET_NR_fchmod			( 94)
-#define TARGET_NR_fchown			( 95)
-#define TARGET_NR_getpriority		( 96)
-#define TARGET_NR_setpriority		( 97)
-#define TARGET_NR_profil			( 98)	/* removed */
-#define TARGET_NR_statfs			( 99)
-#define TARGET_NR_fstatfs			(100)
-#define TARGET_NR_ioperm			(101)
-#define TARGET_NR_socketcall			(102)
-#define TARGET_NR_syslog			(103)
-#define TARGET_NR_setitimer			(104)
-#define TARGET_NR_getitimer			(105)
-#define TARGET_NR_stat			(106)
-#define TARGET_NR_lstat			(107)
-#define TARGET_NR_fstat			(108)
-					/* 109 was sys_uname */
-					/* 110 was sys_iopl */
-#define TARGET_NR_vhangup			(111)
-#define TARGET_NR_idle			(112)
-#define TARGET_NR_syscall			(113) /* syscall to call a syscall! */
-#define TARGET_NR_wait4			(114)
-#define TARGET_NR_swapoff			(115)
-#define TARGET_NR_sysinfo			(116)
-#define TARGET_NR_ipc			(117)
-#define TARGET_NR_fsync			(118)
-#define TARGET_NR_sigreturn			(119)
-#define TARGET_NR_clone			(120)
-#define TARGET_NR_setdomainname		(121)
-#define TARGET_NR_uname			(122)
-#define TARGET_NR_modify_ldt			(123)
-#define TARGET_NR_adjtimex			(124)
-#define TARGET_NR_mprotect			(125)
-#define TARGET_NR_sigprocmask		(126)
-#define TARGET_NR_create_module		(127)	/* removed */
-#define TARGET_NR_init_module		(128)
-#define TARGET_NR_delete_module		(129)
-#define TARGET_NR_get_kernel_syms		(130)	/* removed */
-#define TARGET_NR_quotactl			(131)
-#define TARGET_NR_getpgid			(132)
-#define TARGET_NR_fchdir			(133)
-#define TARGET_NR_bdflush			(134)
-#define TARGET_NR_sysfs			(135)
-#define TARGET_NR_personality		(136)
-#define TARGET_NR_afs_syscall		(137) /* Syscall for Andrew File System */
-#define TARGET_NR_setfsuid			(138)
-#define TARGET_NR_setfsgid			(139)
-#define TARGET_NR__llseek			(140)
-#define TARGET_NR_getdents			(141)
-#define TARGET_NR__newselect			(142)
-#define TARGET_NR_flock			(143)
-#define TARGET_NR_msync			(144)
-#define TARGET_NR_readv			(145)
-#define TARGET_NR_writev			(146)
-#define TARGET_NR_getsid			(147)
-#define TARGET_NR_fdatasync			(148)
-#define TARGET_NR__sysctl			(149)
-#define TARGET_NR_mlock			(150)
-#define TARGET_NR_munlock			(151)
-#define TARGET_NR_mlockall			(152)
-#define TARGET_NR_munlockall			(153)
-#define TARGET_NR_sched_setparam		(154)
-#define TARGET_NR_sched_getparam		(155)
-#define TARGET_NR_sched_setscheduler		(156)
-#define TARGET_NR_sched_getscheduler		(157)
-#define TARGET_NR_sched_yield		(158)
-#define TARGET_NR_sched_get_priority_max	(159)
-#define TARGET_NR_sched_get_priority_min	(160)
-#define TARGET_NR_sched_rr_get_interval	(161)
-#define TARGET_NR_nanosleep			(162)
-#define TARGET_NR_mremap			(163)
-#define TARGET_NR_setresuid			(164)
-#define TARGET_NR_getresuid			(165)
-#define TARGET_NR_vm86			(166)	/* removed */
-#define TARGET_NR_query_module		(167)	/* removed */
-#define TARGET_NR_poll			(168)
-#define TARGET_NR_nfsservctl			(169)
-#define TARGET_NR_setresgid			(170)
-#define TARGET_NR_getresgid			(171)
-#define TARGET_NR_prctl			(172)
-#define TARGET_NR_rt_sigreturn		(173)
-#define TARGET_NR_rt_sigaction		(174)
-#define TARGET_NR_rt_sigprocmask		(175)
-#define TARGET_NR_rt_sigpending		(176)
-#define TARGET_NR_rt_sigtimedwait		(177)
-#define TARGET_NR_rt_sigqueueinfo		(178)
-#define TARGET_NR_rt_sigsuspend		(179)
-#define TARGET_NR_pread64                       (180)
-#define TARGET_NR_pwrite64                      (181)
-#define TARGET_NR_chown			(182)
-#define TARGET_NR_getcwd			(183)
-#define TARGET_NR_capget			(184)
-#define TARGET_NR_capset			(185)
-#define TARGET_NR_sigaltstack		(186)
-#define TARGET_NR_sendfile			(187)
-					/* 188 reserved */
-					/* 189 reserved */
-#define TARGET_NR_vfork			(190)
-#define TARGET_NR_ugetrlimit			(191)	/* SuS compliant getrlimit */
-#define TARGET_NR_mmap2			(192)
-#define TARGET_NR_truncate64			(193)
-#define TARGET_NR_ftruncate64		(194)
-#define TARGET_NR_stat64			(195)
-#define TARGET_NR_lstat64			(196)
-#define TARGET_NR_fstat64			(197)
-#define TARGET_NR_lchown32			(198)
-#define TARGET_NR_getuid32			(199)
-#define TARGET_NR_getgid32			(200)
-#define TARGET_NR_geteuid32			(201)
-#define TARGET_NR_getegid32			(202)
-#define TARGET_NR_setreuid32			(203)
-#define TARGET_NR_setregid32			(204)
-#define TARGET_NR_getgroups32		(205)
-#define TARGET_NR_setgroups32		(206)
-#define TARGET_NR_fchown32			(207)
-#define TARGET_NR_setresuid32		(208)
-#define TARGET_NR_getresuid32		(209)
-#define TARGET_NR_setresgid32		(210)
-#define TARGET_NR_getresgid32		(211)
-#define TARGET_NR_chown32			(212)
-#define TARGET_NR_setuid32			(213)
-#define TARGET_NR_setgid32			(214)
-#define TARGET_NR_setfsuid32			(215)
-#define TARGET_NR_setfsgid32			(216)
-#define TARGET_NR_getdents64			(217)
-#define TARGET_NR_pivot_root			(218)
-#define TARGET_NR_mincore			(219)
-#define TARGET_NR_madvise			(220)
-#define TARGET_NR_fcntl64			(221)
-					/* 222 for tux */
-					/* 223 is unused */
-#define TARGET_NR_gettid			(224)
-#define TARGET_NR_readahead			(225)
-#define TARGET_NR_setxattr			(226)
-#define TARGET_NR_lsetxattr			(227)
-#define TARGET_NR_fsetxattr			(228)
-#define TARGET_NR_getxattr			(229)
-#define TARGET_NR_lgetxattr			(230)
-#define TARGET_NR_fgetxattr			(231)
-#define TARGET_NR_listxattr			(232)
-#define TARGET_NR_llistxattr			(233)
-#define TARGET_NR_flistxattr			(234)
-#define TARGET_NR_removexattr		(235)
-#define TARGET_NR_lremovexattr		(236)
-#define TARGET_NR_fremovexattr		(237)
-#define TARGET_NR_tkill			(238)
-#define TARGET_NR_sendfile64			(239)
-#define TARGET_NR_futex			(240)
-#define TARGET_NR_sched_setaffinity		(241)
-#define TARGET_NR_sched_getaffinity		(242)
-#define TARGET_NR_io_setup			(243)
-#define TARGET_NR_io_destroy			(244)
-#define TARGET_NR_io_getevents		(245)
-#define TARGET_NR_io_submit			(246)
-#define TARGET_NR_io_cancel			(247)
-#define TARGET_NR_exit_group			(248)
-#define TARGET_NR_lookup_dcookie		(249)
-#define TARGET_NR_epoll_create		(250)
-#define TARGET_NR_epoll_ctl			(251)
-#define TARGET_NR_epoll_wait			(252)
-#define TARGET_NR_remap_file_pages		(253)
-					/* 254 for set_thread_area */
-					/* 255 for get_thread_area */
-					/* 256 for set_tid_address */
-#define TARGET_NR_set_tid_address		256
-#define TARGET_NR_timer_create		257
-#define TARGET_NR_timer_settime		258
-#define TARGET_NR_timer_gettime		259
-#define TARGET_NR_timer_getoverrun		260
-#define TARGET_NR_timer_delete		261
-#define TARGET_NR_clock_settime		262
-#define TARGET_NR_clock_gettime		263
-#define TARGET_NR_clock_getres		264
-#define TARGET_NR_clock_nanosleep		265
-#define TARGET_NR_statfs64			266
-#define TARGET_NR_fstatfs64			267
-#define TARGET_NR_tgkill			268
-#define TARGET_NR_utimes			269
-#define TARGET_NR_arm_fadvise64_64		270
-#define TARGET_NR_pciconfig_iobase		271
-#define TARGET_NR_pciconfig_read		272
-#define TARGET_NR_pciconfig_write		273
-#define TARGET_NR_mq_open			274
-#define TARGET_NR_mq_unlink			275
-#define TARGET_NR_mq_timedsend		276
-#define TARGET_NR_mq_timedreceive		277
-#define TARGET_NR_mq_notify			278
-#define TARGET_NR_mq_getsetattr		279
-#define TARGET_NR_waitid			280
-#define TARGET_NR_socket			281
-#define TARGET_NR_bind			282
-#define TARGET_NR_connect			283
-#define TARGET_NR_listen			284
-#define TARGET_NR_accept			285
-#define TARGET_NR_getsockname		286
-#define TARGET_NR_getpeername		287
-#define TARGET_NR_socketpair			288
-#define TARGET_NR_send			289
-#define TARGET_NR_sendto			290
-#define TARGET_NR_recv			291
-#define TARGET_NR_recvfrom			292
-#define TARGET_NR_shutdown			293
-#define TARGET_NR_setsockopt			294
-#define TARGET_NR_getsockopt			295
-#define TARGET_NR_sendmsg			296
-#define TARGET_NR_recvmsg			297
-#define TARGET_NR_semop			298
-#define TARGET_NR_semget			299
-#define TARGET_NR_semctl			300
-#define TARGET_NR_msgsnd			301
-#define TARGET_NR_msgrcv			302
-#define TARGET_NR_msgget			303
-#define TARGET_NR_msgctl			304
-#define TARGET_NR_shmat			305
-#define TARGET_NR_shmdt			306
-#define TARGET_NR_shmget			307
-#define TARGET_NR_shmctl			308
-#define TARGET_NR_add_key			309
-#define TARGET_NR_request_key		310
-#define TARGET_NR_keyctl			311
-#define TARGET_NR_semtimedop			312
-#define TARGET_NR_vserver			313
-#define TARGET_NR_ioprio_set			314
-#define TARGET_NR_ioprio_get			315
-#define TARGET_NR_inotify_init		316
-#define TARGET_NR_inotify_add_watch		317
-#define TARGET_NR_inotify_rm_watch		318
-#define TARGET_NR_mbind			319
-#define TARGET_NR_get_mempolicy		320
-#define TARGET_NR_set_mempolicy		321
-#define TARGET_NR_openat			(322)
-#define TARGET_NR_mkdirat			(323)
-#define TARGET_NR_mknodat			(324)
-#define TARGET_NR_fchownat			(325)
-#define TARGET_NR_futimesat			(326)
-#define TARGET_NR_fstatat64			(327)
-#define TARGET_NR_unlinkat			(328)
-#define TARGET_NR_renameat			(329)
-#define TARGET_NR_linkat			(330)
-#define TARGET_NR_symlinkat			(331)
-#define TARGET_NR_readlinkat			(332)
-#define TARGET_NR_fchmodat			(333)
-#define TARGET_NR_faccessat			(334)
-#define TARGET_NR_pselect6			(335)
-#define TARGET_NR_ppoll                         (336)
-#define TARGET_NR_unshare			(337)
-#define TARGET_NR_set_robust_list		(338)
-#define TARGET_NR_get_robust_list		(339)
-#define TARGET_NR_splice			(340)
-#define TARGET_NR_arm_sync_file_range	(341)
-#define TARGET_NR_sync_file_range2		TARGET_NR_arm_sync_file_range
-#define TARGET_NR_tee			(342)
-#define TARGET_NR_vmsplice			(343)
-#define TARGET_NR_move_pages			(344)
-#define TARGET_NR_getcpu			(345)
-#define TARGET_NR_epoll_pwait                   (346)
-#define TARGET_NR_kexec_load			(347)
-#define TARGET_NR_utimensat			(348)
-#define TARGET_NR_signalfd			(349)
-#define TARGET_NR_timerfd_create		(350)
-#define TARGET_NR_eventfd			(351)
-#define TARGET_NR_fallocate			(352)
-#define TARGET_NR_timerfd_settime		(353)
-#define TARGET_NR_timerfd_gettime		(354)
-#define TARGET_NR_signalfd4			(355)
-#define TARGET_NR_eventfd2			(356)
-#define TARGET_NR_epoll_create1		(357)
-#define TARGET_NR_dup3				(358)
-#define TARGET_NR_pipe2			(359)
-#define TARGET_NR_inotify_init1		(360)
-#define TARGET_NR_preadv                       (361)
-#define TARGET_NR_pwritev                      (362)
-#define TARGET_NR_rt_tgsigqueueinfo            (363)
-#define TARGET_NR_perf_event_open              (364)
-#define TARGET_NR_recvmmsg                     (365)
-#define TARGET_NR_accept4                      (366)
-#define TARGET_NR_fanotify_init                (367)
-#define TARGET_NR_fanotify_mark                (368)
-#define TARGET_NR_prlimit64                    (369)
-#define TARGET_NR_name_to_handle_at            (370)
-#define TARGET_NR_open_by_handle_at            (371)
-#define TARGET_NR_clock_adjtime                (372)
-#define TARGET_NR_syncfs                       (373)
-#define TARGET_NR_sendmmsg                     (374)
-#define TARGET_NR_setns                        (375)
-#define TARGET_NR_process_vm_readv             (376)
-#define TARGET_NR_process_vm_writev            (377)
-#define TARGET_NR_kcmp                         (378)
-#define TARGET_NR_finit_module                 (379)
-
-#define TARGET_NR_sched_setattr                (380)
-#define TARGET_NR_sched_getattr                (381)
-#define TARGET_NR_renameat2                    (382)
-#define TARGET_NR_seccomp                      (383)
-#define TARGET_NR_getrandom                    (384)
-#define TARGET_NR_memfd_create                 (385)
-#define TARGET_NR_bpf                          (386)
-#define TARGET_NR_execveat                     (387)
-#define TARGET_NR_userfaultfd                  (388)
-#define TARGET_NR_membarrier                   (389)
-#define TARGET_NR_mlock2                       (390)
-#define TARGET_NR_copy_file_range              (391)
-#define TARGET_NR_preadv2                      (392)
-#define TARGET_NR_pwritev2                     (393)
-#define TARGET_NR_pkey_mprotect                (394)
-#define TARGET_NR_pkey_alloc                   (395)
-#define TARGET_NR_pkey_free                    (396)
-#define TARGET_NR_statx                        (397)
-#define TARGET_NR_rseq                         (398)
-#define TARGET_NR_io_pgetevents                (399)
-#define TARGET_NR_migrate_pages                (400)
-#define TARGET_NR_kexec_file_load              (401)
-/* 402 is unused */
-#define TARGET_NR_clock_gettime64              (403)
-#define TARGET_NR_clock_settime64              (404)
-#define TARGET_NR_clock_adjtime64              (405)
-#define TARGET_NR_clock_getres_time64          (406)
-#define TARGET_NR_clock_nanosleep_time64       (407)
-#define TARGET_NR_timer_gettime64              (408)
-#define TARGET_NR_timer_settime64              (409)
-#define TARGET_NR_timerfd_gettime64            (410)
-#define TARGET_NR_timerfd_settime64            (411)
-#define TARGET_NR_utimensat_time64             (412)
-#define TARGET_NR_pselect6_time64              (413)
-#define TARGET_NR_ppoll_time64                 (414)
-#define TARGET_NR_io_pgetevents_time64         (416)
-#define TARGET_NR_recvmmsg_time64              (417)
-#define TARGET_NR_mq_timedsend_time64          (418)
-#define TARGET_NR_mq_timedreceive_time64       (419)
-#define TARGET_NR_semtimedop_time64            (420)
-#define TARGET_NR_rt_sigtimedwait_time64       (421)
-#define TARGET_NR_futex_time64                 (422)
-#define TARGET_NR_sched_rr_get_interval_time64 (423)
-#define TARGET_NR_pidfd_send_signal            (424)
-#define TARGET_NR_io_uring_setup               (425)
-#define TARGET_NR_io_uring_enter               (426)
-#define TARGET_NR_io_uring_register            (427)
-#define TARGET_NR_open_tree                    (428)
-#define TARGET_NR_move_mount                   (429)
-#define TARGET_NR_fsopen                       (430)
-#define TARGET_NR_fsconfig                     (431)
-#define TARGET_NR_fsmount                      (432)
-#define TARGET_NR_fspick                       (433)
-#define TARGET_NR_pidfd_open                   (434)
-#define TARGET_NR_clone3                       (435)
-
-#endif
diff --git a/linux-user/arm/syscallhdr.sh b/linux-user/arm/syscallhdr.sh
new file mode 100644
index 000000000000..4c952b2cfb20
--- /dev/null
+++ b/linux-user/arm/syscallhdr.sh
@@ -0,0 +1,31 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+in="$1"
+out="$2"
+my_abis=`echo "($3)" | tr ',' '|'`
+prefix="$4"
+offset="$5"
+
+fileguard=LINUX_USER_ARM_`basename "$out" | sed \
+    -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
+    -e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g'`
+if echo $out | grep -q uapi; then
+    fileguard="_UAPI$fileguard"
+fi
+grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
+    echo "#ifndef ${fileguard}"
+    echo "#define ${fileguard} 1"
+    echo ""
+
+    while read nr abi name entry ; do
+    if [ -z "$offset" ]; then
+        echo "#define TARGET_NR_${prefix}${name} $nr"
+    else
+        echo "#define TARGET_NR_${prefix}${name} ($offset + $nr)"
+        fi
+    done
+
+    echo ""
+    echo "#endif /* ${fileguard} */"
+) > "$out"
-- 
2.24.1


