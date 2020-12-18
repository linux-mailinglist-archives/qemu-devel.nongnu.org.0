Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FFD2DEB5A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 23:01:00 +0100 (CET)
Received: from localhost ([::1]:60246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqNo1-0006l2-NU
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 17:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1kqMmU-0002Cl-M2
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:55:18 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:43130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1kqMmK-00039N-UE
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:55:18 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits)) (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 3EDCD7D5EE;
 Fri, 18 Dec 2020 20:55:07 +0000 (UTC) (envelope-from imp@freebsd.org)
Received: from freefall.freebsd.org (freefall.freebsd.org [96.47.72.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "freefall.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4CyLj714Txz3h0M;
 Fri, 18 Dec 2020 20:55:07 +0000 (UTC) (envelope-from imp@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1608324907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8i7sRgnwMuGQ+8IfrXWArpRX0Q1814y9OnXO9ma9HY=;
 b=FOoyQC72EkefaWWsAIlym43h2St282Ber2xCHdUdC/833Z1NHNJkaGk0oBp1HSqiZjzUPN
 pUpZFs4sO1pas6wv67y8GF4TR/tiJFhPZ0gvzaawvnWDRf8ynbT75BLO1fg60lSL7On0h+
 fFNT1eYDt1lGK1tiIFU4EReU9afUZRG5OGZrcC0JiwOaGlOa9GPgVbZFVxpPoa/87Bqp7R
 winzk+OUK5vCiqRu7i1h1ATkwDFyZChtYR/FFgcC3M2UC7QJMNzoJtZfNbA4niEBaGBoxz
 VfFAxhQCG4IbN0mLJAo5Y7Egp1LvEeTp+5fXMMM7WTg41Ek4rQqEePsTw0pWuQ==
Received: by freefall.freebsd.org (Postfix, from userid 547)
 id 0BEB9E6DC; Fri, 18 Dec 2020 20:55:07 +0000 (UTC)
From: imp@freebsd.org
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] bsd-user: Update strace.list for FreeBSD's latest syscalls
Date: Fri, 18 Dec 2020 13:54:51 -0700
Message-Id: <20201218205451.10559-5-imp@freebsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201218205451.10559-1-imp@freebsd.org>
References: <20201218205451.10559-1-imp@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1608324907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8i7sRgnwMuGQ+8IfrXWArpRX0Q1814y9OnXO9ma9HY=;
 b=qH8xU33MUuLMGSPsFfhN+wmrxDy/S5ZtDKE7HZpSRGpYj0f9Gtx5U3E20bUoJY1JcrjtB4
 wX4LcB+cWRBeWKHFtErFVa3Yyo7d08P+q6hu5ITlffqn40xoiSFWhmLxdnQjdnmYJiv7dy
 rMRsUfbAGSO73e68yaaQpKslg/8zVyP7FZaxL/vjE+x3mUhVjPf+xyAgg4a8fm5V+eWztZ
 1osWy10p+Wz6QCJfdJzFIaAYsGL/B9fxb2SdfqbimVo6wIHYdfIzUzEnX5AAG+EXRtR701
 uBHaqlDmJvYYtYzhBq+7W1lCa+LtFei207R0GSeJ+RJ3urGMDUsUWS8IvrKHng==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1608324907; a=rsa-sha256; cv=none;
 b=cIfhPGW1yjrETHtgE2gfH6CdEHHrlFQ6IioEYScqU9gHUoozEExkB3dp9t8mpoaK7PFuYi
 5Ocq37Mnf/2m145bFawLBUqoI0AXPfLcLD+vvDj7+EgjWeSE+LlY3aByyCbWCvuhUPbx6J
 gysc+wV8R179GSublnvyVMx5gCW4swVUt1FrWWrutl4Csk2pFTLKGW+RUYXDnKVpkT0vvS
 HKBlRrps7/Afiq/cp/abL1s0qkZj7fYu+BGERzYInA4jlHTdhyRJDJKB/0BBiVG+c67cBE
 VoOFAHB2oTp1ykUlldrlSHn+yMB5PI1ytFy9ipJ7AhqIhHaA6B2j4p3A3f9o8A==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=imp@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Dec 2020 16:50:11 -0500
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
Cc: Stacey Son <sson@FreeBSD.org>, Warner Losh <wlosh@netflix.com>,
 Alexander Kabaev <kan@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>,
 Sean Bruno <sburno@FreeBSD.org>, Warner Losh <imp@FreeBSD.org>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <wlosh@netflix.com>

Update strace.list to include all of FreeBSD's syscalls up through svn
r331280.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Sean Bruno <sburno@FreeBSD.org>
Signed-off-by: Alexander Kabaev <kan@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Author: Michal Meloun <mmel@FreeBSD.org>
Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
[imp moved this change to early in the sequence]
Signed-off-by: Warner Losh <imp@FreeBSD.org>
---
 bsd-user/freebsd/strace.list | 62 ++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/bsd-user/freebsd/strace.list b/bsd-user/freebsd/strace.list
index d8f2eb66a6..b01b5f36e8 100644
--- a/bsd-user/freebsd/strace.list
+++ b/bsd-user/freebsd/strace.list
@@ -33,14 +33,32 @@
 { TARGET_FREEBSD_NR___syscall, "__syscall", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR___sysctl, "__sysctl", NULL, print_sysctl, NULL },
 { TARGET_FREEBSD_NR__umtx_op, "_umtx_op", "%s(%#x, %d, %d, %#x, %#x)", NULL, NULL },
+#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
+{ TARGET_FREEBSD_NR__umtx_lock, "__umtx_lock", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR__umtx_unlock, "__umtx_unlock", NULL, NULL, NULL },
+#endif
 { TARGET_FREEBSD_NR_accept, "accept", "%s(%d,%#x,%#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR_accept4, "accept4", "%s(%d,%d,%#x,%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_access, "access", "%s(\"%s\",%#o)", NULL, NULL },
 { TARGET_FREEBSD_NR_acct, "acct", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_adjtime, "adjtime", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_bind, "bind", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_bindat, "bindat", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_break, "break", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_enter, "cap_enter", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_fcntls_get, "cap_fcntls_get", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_fcntls_limit, "cap_fcntls_limit", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_getmode, "cap_getmode", NULL, NULL, NULL },
+#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
+{ TARGET_FREEBSD_NR_cap_getrights, "cap_getrights", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_new, "cap_new", NULL, NULL, NULL },
+#endif
+{ TARGET_FREEBSD_NR_cap_ioctls_get, "cap_ioctls_get", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_ioctls_limit, "cap_ioctls_limit", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_rights_limit, "cap_rights_limit", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_chdir, "chdir", "%s(\"%s\")", NULL, NULL },
 { TARGET_FREEBSD_NR_chflags, "chflags", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_chflagsat, "chflagsat", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_chmod, "chmod", "%s(\"%s\",%#o)", NULL, NULL },
 { TARGET_FREEBSD_NR_chown, "chown", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_chroot, "chroot", NULL, NULL, NULL },
@@ -49,6 +67,9 @@
 { TARGET_FREEBSD_NR_clock_settime, "clock_settime", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_close, "close", "%s(%d)", NULL, NULL },
 { TARGET_FREEBSD_NR_connect, "connect", "%s(%d,%#x,%d)", NULL, NULL },
+{ TARGET_FREEBSD_NR_connectat, "connectat", "%s(%d,%d,%#x,%d)", NULL, NULL },
+{ TARGET_FREEBSD_NR_cpuset_getdomain, "cpuset_getdomain", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cpuset_setdomain, "cpuset_setdomain", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_dup, "dup", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_dup2, "dup2", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_eaccess, "eaccess", "%s(\"%s\",%#x)", NULL, NULL },
@@ -62,7 +83,7 @@
 { TARGET_FREEBSD_NR_extattr_get_file, "extattr_get_file", "%s(\"%s\", %d, \"%s\", %#x, %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_extattr_get_file, "extattr_get_link", "%s(\"%s\", %d, \"%s\", %#x, %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_extattr_list_fd, "extattr_list_fd", "%s(%d, %d, %#x, %d)", NULL, NULL },
-{ TARGET_FREEBSD_NR_extattr_list_file, "extattr_list_file", "%s(\"%s\", %d, %#x, %d)", NULL, NULL },
+{ TARGET_FREEBSD_NR_extattr_list_file, "extattr_list_file", "%s(\"%s\", %#x, %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_extattr_list_link, "extattr_list_link", "%s(\"%s\", %d, %#x, %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_extattr_set_fd, "extattr_set_fd", "%s(%d, %d, \"%s\", %#x, %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_extattr_set_file, "extattr_set_file", "%s(\"%s\", %d, \"%s\", %#x, %d)", NULL, NULL },
@@ -72,26 +93,34 @@
 { TARGET_FREEBSD_NR_fchmod, "fchmod", "%s(%d,%#o)", NULL, NULL },
 { TARGET_FREEBSD_NR_fchown, "fchown", "%s(%d,%d,%d)", NULL, NULL },
 { TARGET_FREEBSD_NR_fcntl, "fcntl", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_fdatasync, "fdatasync", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_fexecve, "fexecve", NULL, print_execve, NULL },
 { TARGET_FREEBSD_NR_fhopen, "fhopen", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_fhstat, "fhstat", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_fhstatfs, "fhstatfs", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_fhstat, "freebsd11_fhstat", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_fhstatfs, "freebsd11_fhstatfs", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_flock, "flock", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_fork, "fork", "%s()", NULL, NULL },
 { TARGET_FREEBSD_NR_fpathconf, "fpathconf", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_fstat, "fstat", "%s(%d,%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_fstatat, "fstatat", "%s(%d,\"%s\", %#x, %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_fstatfs, "fstatfs", "%s(%d,%#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_fstat, "freebsd11_fstat", "%s(%d,%#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_fstatat, "freebsd11_fstatat", "%s(%d,\"%s\", %#x, %d)", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_fstatfs, "freebsd11_fstatfs", "%s(%d,%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_fsync, "fsync", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_ftruncate, "ftruncate", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_futimens, "futimens", "%s(%d,%p)", NULL, NULL },
 { TARGET_FREEBSD_NR_futimes, "futimes", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_getcontext, "getcontext", "%s(%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_getdirentries, "getdirentries", NULL, NULL, NULL },
-{ TARGET_FREEBSD_NR_freebsd6_mmap, "freebsd6_mmap", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_getdirentries, "freebsd11_getdirentries", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_getegid, "getegid", "%s()", NULL, NULL },
 { TARGET_FREEBSD_NR_geteuid, "geteuid", "%s()", NULL, NULL },
 { TARGET_FREEBSD_NR_getfh, "getfh", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_getfsstat, "getfsstat", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_getfsstat, "freebsd11_getfsstat", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_getgid, "getgid", "%s()", NULL, NULL },
 { TARGET_FREEBSD_NR_getgroups, "getgroups", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_getitimer, "getitimer", NULL, NULL, NULL },
@@ -102,6 +131,7 @@
 { TARGET_FREEBSD_NR_getpid, "getpid", "%s()", NULL, NULL },
 { TARGET_FREEBSD_NR_getppid, "getppid", "%s()", NULL, NULL },
 { TARGET_FREEBSD_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR_getrandom, "getrandom", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_getresgid, "getresgid", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_getresuid, "getresuid", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_getrlimit, "getrlimit", NULL, NULL, NULL },
@@ -113,8 +143,12 @@
 { TARGET_FREEBSD_NR_getuid, "getuid", "%s()", NULL, NULL },
 { TARGET_FREEBSD_NR_ioctl, "ioctl", NULL, print_ioctl, NULL },
 { TARGET_FREEBSD_NR_issetugid, "issetugid", "%s()", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_kevent, "freebsd11_kevent", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_kevent, "kevent", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_kill, "kill", NULL, NULL, NULL },
+#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
+{ TARGET_FREEBSD_NR_killpg, "killpg", NULL, NULL, NULL },
+#endif
 { TARGET_FREEBSD_NR_kqueue, "kqueue", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_ktrace, "ktrace", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_lchown, "lchown", NULL, NULL, NULL },
@@ -122,13 +156,15 @@
 { TARGET_FREEBSD_NR_listen, "listen", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_lpathconf, "lpathconf", "%s(\"%s\", %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_lseek, "lseek", NULL, NULL, NULL },
-{ TARGET_FREEBSD_NR_lstat, "lstat", "%s(\"%s\",%p)", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_lstat, "freebsd11_lstat", "%s(\"%s\",%p)", NULL, NULL },
 { TARGET_FREEBSD_NR_madvise, "madvise", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_mincore, "mincore", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_minherit, "minherit", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_mkdir, "mkdir", "%s(\"%s\",%#o)", NULL, NULL },
 { TARGET_FREEBSD_NR_mkfifo, "mkfifo", NULL, NULL, NULL },
-{ TARGET_FREEBSD_NR_mknod, "mknod", "%s(\"%s\",%#o,%#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR_mknodat, "mknodat", "%s(%d, \"%s\",%#o,%#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_mknod, "freebsd11_mknod", "%s(\"%s\",%#o,%#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_mknodat, "freebsd11_mknodat", "%s(%d, \"%s\",%#o,%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_mlock, "mlock", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_mlockall, "mlockall", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_mmap, "mmap", NULL, NULL, print_syscall_ret_addr },
@@ -147,8 +183,10 @@
 { TARGET_FREEBSD_NR_open, "open", "%s(\"%s\",%#x,%#o)", NULL, NULL },
 { TARGET_FREEBSD_NR_openat, "openat", "%s(%d, \"%s\",%#x,%#o)", NULL, NULL },
 { TARGET_FREEBSD_NR_pathconf, "pathconf", "%s(\"%s\", %d)", NULL, NULL },
-{ TARGET_FREEBSD_NR_pipe, "pipe", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd10_pipe, "freebsd10_pipe", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_pipe2, "pipe2", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_poll, "poll", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_posix_fallocate, "posix_fallocate", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_pread, "pread", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_preadv, "preadv", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_profil, "profil", NULL, NULL, NULL },
@@ -168,6 +206,8 @@
 { TARGET_FREEBSD_NR_rmdir, "rmdir", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_rtprio_thread, "rtprio_thread", "%s(%d, %d, %p)", NULL, NULL },
 { TARGET_FREEBSD_NR_sbrk, "sbrk", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_sched_get_priority_max, "sched_get_priority_max", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_sched_get_priority_min, "sched_get_priority_min", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_sched_yield, "sched_yield", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_select, "select", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_semget, "semget", NULL, NULL, NULL },
@@ -206,12 +246,17 @@
 { TARGET_FREEBSD_NR_socket, "socket", "%s(%d,%d,%d)", NULL, NULL },
 { TARGET_FREEBSD_NR_socketpair, "socketpair", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_sstk, "sstk", NULL, NULL, NULL },
-{ TARGET_FREEBSD_NR_stat, "stat", "%s(\"%s\",%p)", NULL, NULL },
-{ TARGET_FREEBSD_NR_statfs, "statfs", "%s(\"%s\",%p)", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_stat, "freebsd11_stat", "%s(\"%s\",%p)", NULL, NULL },
+{ TARGET_FREEBSD_NR_freebsd11_statfs, "freebsd11_statfs", "%s(\"%s\",%p)", NULL, NULL },
 { TARGET_FREEBSD_NR_symlink, "symlink", "%s(\"%s\",\"%s\")", NULL, NULL },
 { TARGET_FREEBSD_NR_sync, "sync", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_sysarch, "sysarch", NULL, print_sysarch, NULL },
 { TARGET_FREEBSD_NR_syscall, "syscall", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_ktimer_create, "timer_create" , NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_ktimer_delete, "timer_delete" , NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_ktimer_settime, "timer_settime" , NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_ktimer_gettime, "timer_gettime" , NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_ktimer_getoverrun, "timer_getoverrun" , NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_thr_create, "thr_create", "%s(%#x, %#x, %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_thr_exit, "thr_exit", "%s(%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_thr_kill, "thr_kill", "%s(%d, %#x)", NULL, NULL },
@@ -226,7 +271,10 @@
 { TARGET_FREEBSD_NR_unlink, "unlink", "%s(\"%s\")", NULL, NULL },
 { TARGET_FREEBSD_NR_unmount, "unmount", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_utimes, "utimes", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_utimensat, "utimensat", "%s(%d,%s,%p,%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_vfork, "vfork", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_wait4, "wait4", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_wait6, "wait6", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_write, "write", "%s(%d,%#x,%d)", NULL, NULL },
 { TARGET_FREEBSD_NR_writev, "writev", "%s(%d,%p,%#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR_posix_openpt, "posix_openpt", "%s(%d)", NULL, NULL },
-- 
2.22.1


