Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21596228F2
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 22:59:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSSuH-0003hU-65
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 16:59:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSZc-0003cV-CZ
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSZX-0004IY-Cv
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:38:23 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSSZV-0004DQ-EZ
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:38:19 -0400
Received: by mail-pg1-x543.google.com with SMTP id z16so5723961pgv.11
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 13:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sa+0LXisYlSy7hSoDzn8UpDJzstJJhbCNrudoztrV7E=;
	b=LEkc0h/QBHXlunyBD5L1PGRREg/PpgacaQCnfm6Pb2aEp74rXBRynD4UHPCxhSyEbB
	Dp87VmOwvYQ5mAT2BiRevBudd7xG8a0TKIQje/zopsn9ujWGqV8tHZ2+/X1GsFcSVmcT
	gDeAzwCNLxrqsDnD01gMKYTTwSGtvX9vTwvzrZ+fktzTY2SC8EoPLehdwdu6O7RDr7x3
	4ywgsAHCfjSpZn096jVLVB6aXwG8Mw3744d6ATUjXHSH92t3Liip+DkjhNMeP/ub62NF
	E0X3NiyUr3MDLTiuzKroE2qTlDFqrO3r9Wt8pezLMidFjGkIgcDNtw/6++Uax30FvRf9
	QZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sa+0LXisYlSy7hSoDzn8UpDJzstJJhbCNrudoztrV7E=;
	b=SRAHsCASa5RiuaqYmfeZ02zaT/8tX9uK+5XrzX6o5i5cwSJPx7T4Pe44ppVlU1H1F6
	eo9TsX+f2FkpObhS78JIAFOu/e2dXq4NyBZO23nsUQjoEETGgj3SdNTOivQQday4PvC6
	gxpoQ5dMidBeUtJ2zUIyOV+f4SMTm6+nkAlyjrqJTggpXCbbtYKFvj5WGumThPIksod/
	hU994HHMoce8bmnPvkE74AXGUnv48ya593q7lHBPyqGsFLdeOCnVpTRiAL/YftOfzRnh
	vkcvlzZ0A4Ko9b2UXI99I1k5Ft9rKNWJqqAp9Q5+Fnxl9XJnT3+XpSDNB8Ks4cKneDRR
	aP7g==
X-Gm-Message-State: APjAAAXw5OV+7gQHtnmcu2YgsyZJkEofOiuG2IJl7yVnQR/RPkJFahil
	pRpcIKmyVenzXEEtVaGwzzp+/aEM8Q4=
X-Google-Smtp-Source: APXvYqyDnlb7ZcxDcW40gyrfYyjBdyW6LSzwcLY3Fa+ozbuHGew5Sib0Dsg0hb3K1vfLbeecXzsrQw==
X-Received: by 2002:a65:5cca:: with SMTP id b10mr71647708pgt.444.1558298294442;
	Sun, 19 May 2019 13:38:14 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	i7sm11397448pfo.19.2019.05.19.13.38.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:38:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 13:36:47 -0700
Message-Id: <20190519203726.20729-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519203726.20729-1-richard.henderson@linaro.org>
References: <20190519203726.20729-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH v7 35/74] linux-user: Split out utime, utimes,
 futimesat
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall-defs.h     |  9 ++++
 linux-user/strace.c           | 41 ---------------
 linux-user/syscall-file.inc.c | 95 +++++++++++++++++++++++++++++++++++
 linux-user/syscall.c          | 63 -----------------------
 linux-user/strace.list        |  9 ----
 5 files changed, 104 insertions(+), 113 deletions(-)

diff --git a/linux-user/syscall-defs.h b/linux-user/syscall-defs.h
index 9d0dd7457b..2767e335d8 100644
--- a/linux-user/syscall-defs.h
+++ b/linux-user/syscall-defs.h
@@ -36,6 +36,9 @@ SYSCALL_DEF(execve, ARG_STR, ARG_PTR, ARG_PTR);
 SYSCALL_DEF(execveat, ARG_ATDIRFD, ARG_STR, ARG_PTR, ARG_PTR, ARG_ATFLAG);
 SYSCALL_DEF(fchmod, ARG_DEC, ARG_MODEFLAG);
 SYSCALL_DEF(fchmodat, ARG_ATDIRFD, ARG_STR, ARG_MODEFLAG);
+#ifdef TARGET_NR_futimesat
+SYSCALL_DEF(futimesat, ARG_ATDIRFD, ARG_STR, ARG_PTR);
+#endif
 #ifdef TARGET_NR_fork
 SYSCALL_DEF(fork);
 #endif
@@ -172,6 +175,12 @@ SYSCALL_DEF(umount2, ARG_STR, ARG_UMOUNTFLAG);
 SYSCALL_DEF(unlink, ARG_STR);
 #endif
 SYSCALL_DEF(unlinkat, ARG_ATDIRFD, ARG_STR, ARG_UNLINKATFLAG);
+#ifdef TARGET_NR_utime
+SYSCALL_DEF(utime, ARG_STR, ARG_PTR);
+#endif
+#ifdef TARGET_NR_utimes
+SYSCALL_DEF(utimes, ARG_STR, ARG_PTR);
+#endif
 #ifdef TARGET_NR_vfork
 /* Emulate vfork() with fork().  */
 SYSCALL_DEF_FULL(vfork, .impl = impl_fork);
diff --git a/linux-user/strace.c b/linux-user/strace.c
index 278d235ae6..3a7a5c30ec 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1296,21 +1296,6 @@ print_fcntl(const struct syscallname *name,
 #endif
 
 
-#ifdef TARGET_NR_futimesat
-static void
-print_futimesat(const struct syscallname *name,
-    abi_long arg0, abi_long arg1, abi_long arg2,
-    abi_long arg3, abi_long arg4, abi_long arg5)
-{
-    print_syscall_prologue(name);
-    print_at_dirfd(arg0, 0);
-    print_string(arg1, 0);
-    print_timeval(arg2, 0);
-    print_timeval(arg2 + sizeof (struct target_timeval), 1);
-    print_syscall_epilogue(name);
-}
-#endif
-
 #if defined(TARGET_NR_socket)
 static void
 print_socket(const struct syscallname *name,
@@ -2015,32 +2000,6 @@ print_symlinkat(const struct syscallname *name,
 }
 #endif
 
-#ifdef TARGET_NR_utime
-static void
-print_utime(const struct syscallname *name,
-    abi_long arg0, abi_long arg1, abi_long arg2,
-    abi_long arg3, abi_long arg4, abi_long arg5)
-{
-    print_syscall_prologue(name);
-    print_string(arg0, 0);
-    print_pointer(arg1, 1);
-    print_syscall_epilogue(name);
-}
-#endif
-
-#ifdef TARGET_NR_utimes
-static void
-print_utimes(const struct syscallname *name,
-    abi_long arg0, abi_long arg1, abi_long arg2,
-    abi_long arg3, abi_long arg4, abi_long arg5)
-{
-    print_syscall_prologue(name);
-    print_string(arg0, 0);
-    print_pointer(arg1, 1);
-    print_syscall_epilogue(name);
-}
-#endif
-
 #ifdef TARGET_NR_utimensat
 static void
 print_utimensat(const struct syscallname *name,
diff --git a/linux-user/syscall-file.inc.c b/linux-user/syscall-file.inc.c
index 345b4cb421..42e5cd2dc1 100644
--- a/linux-user/syscall-file.inc.c
+++ b/linux-user/syscall-file.inc.c
@@ -84,6 +84,38 @@ SYSCALL_IMPL(fchmodat)
     return do_fchmodat(arg1, arg2, arg3);
 }
 
+#ifdef TARGET_NR_futimesat
+SYSCALL_IMPL(futimesat)
+{
+    int dirfd = arg1;
+    abi_ulong target_path = arg2;
+    abi_ulong target_tv = arg3;
+    struct timeval *tvp, tv[2];
+    char *p;
+    abi_long ret;
+
+    if (target_tv) {
+        if (copy_from_user_timeval(&tv[0], target_tv)
+            || copy_from_user_timeval(&tv[1],
+                                      target_tv +
+                                      sizeof(struct target_timeval))) {
+            return -TARGET_EFAULT;
+        }
+        tvp = tv;
+    } else {
+        tvp = NULL;
+    }
+
+    p = lock_user_string(target_path);
+    if (!p) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(futimesat(dirfd, path(p), tvp));
+    unlock_user(p, target_path, 0);
+    return ret;
+}
+#endif
+
 static abi_long do_linkat(int olddirfd, abi_ulong target_oldpath,
                           int newdirfd, abi_ulong target_newpath,
                           int flags)
@@ -873,6 +905,69 @@ SYSCALL_IMPL(unlinkat)
     return do_unlinkat(arg1, arg2, arg3);
 }
 
+#ifdef TARGET_NR_utime
+SYSCALL_IMPL(utime)
+{
+    abi_ulong target_path = arg1;
+    abi_ulong target_times = arg2;
+    struct utimbuf tbuf, *host_tbuf;
+    struct target_utimbuf *target_tbuf;
+    char *p;
+    abi_long ret;
+
+    if (target_times) {
+        if (!lock_user_struct(VERIFY_READ, target_tbuf, target_times, 1)) {
+            return -TARGET_EFAULT;
+        }
+        tbuf.actime = tswapal(target_tbuf->actime);
+        tbuf.modtime = tswapal(target_tbuf->modtime);
+        unlock_user_struct(target_tbuf, arg2, 0);
+        host_tbuf = &tbuf;
+    } else {
+        host_tbuf = NULL;
+    }
+
+    p = lock_user_string(target_path);
+    if (!p) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(utime(p, host_tbuf));
+    unlock_user(p, target_path, 0);
+    return ret;
+}
+#endif
+
+#ifdef TARGET_NR_utimes
+SYSCALL_IMPL(utimes)
+{
+    abi_ulong target_path = arg1;
+    abi_ulong target_tv = arg2;
+    struct timeval *tvp, tv[2];
+    char *p;
+    abi_long ret;
+
+    if (target_tv) {
+        if (copy_from_user_timeval(&tv[0], target_tv)
+            || copy_from_user_timeval(&tv[1],
+                                      target_tv +
+                                      sizeof(struct target_timeval))) {
+            return -TARGET_EFAULT;
+        }
+        tvp = tv;
+    } else {
+        tvp = NULL;
+    }
+
+    p = lock_user_string(target_path);
+    if (!p) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(utimes(p, tvp));
+    unlock_user(p, target_path, 0);
+    return ret;
+}
+#endif
+
 SYSCALL_IMPL(write)
 {
     int fd = arg1;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 96e77ea38f..f66acbf27c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5380,69 +5380,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     void *p;
 
     switch(num) {
-#ifdef TARGET_NR_utime
-    case TARGET_NR_utime:
-        {
-            struct utimbuf tbuf, *host_tbuf;
-            struct target_utimbuf *target_tbuf;
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, target_tbuf, arg2, 1))
-                    return -TARGET_EFAULT;
-                tbuf.actime = tswapal(target_tbuf->actime);
-                tbuf.modtime = tswapal(target_tbuf->modtime);
-                unlock_user_struct(target_tbuf, arg2, 0);
-                host_tbuf = &tbuf;
-            } else {
-                host_tbuf = NULL;
-            }
-            if (!(p = lock_user_string(arg1)))
-                return -TARGET_EFAULT;
-            ret = get_errno(utime(p, host_tbuf));
-            unlock_user(p, arg1, 0);
-        }
-        return ret;
-#endif
-#ifdef TARGET_NR_utimes
-    case TARGET_NR_utimes:
-        {
-            struct timeval *tvp, tv[2];
-            if (arg2) {
-                if (copy_from_user_timeval(&tv[0], arg2)
-                    || copy_from_user_timeval(&tv[1],
-                                              arg2 + sizeof(struct target_timeval)))
-                    return -TARGET_EFAULT;
-                tvp = tv;
-            } else {
-                tvp = NULL;
-            }
-            if (!(p = lock_user_string(arg1)))
-                return -TARGET_EFAULT;
-            ret = get_errno(utimes(p, tvp));
-            unlock_user(p, arg1, 0);
-        }
-        return ret;
-#endif
-#if defined(TARGET_NR_futimesat)
-    case TARGET_NR_futimesat:
-        {
-            struct timeval *tvp, tv[2];
-            if (arg3) {
-                if (copy_from_user_timeval(&tv[0], arg3)
-                    || copy_from_user_timeval(&tv[1],
-                                              arg3 + sizeof(struct target_timeval)))
-                    return -TARGET_EFAULT;
-                tvp = tv;
-            } else {
-                tvp = NULL;
-            }
-            if (!(p = lock_user_string(arg2))) {
-                return -TARGET_EFAULT;
-            }
-            ret = get_errno(futimesat(arg1, path(p), tvp));
-            unlock_user(p, arg2, 0);
-        }
-        return ret;
-#endif
 #ifdef TARGET_NR_access
     case TARGET_NR_access:
         if (!(p = lock_user_string(arg1))) {
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 2a65457c76..3f92224b55 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -226,9 +226,6 @@
 #ifdef TARGET_NR_futex
 { TARGET_NR_futex, "futex" , NULL, print_futex, NULL },
 #endif
-#ifdef TARGET_NR_futimesat
-{ TARGET_NR_futimesat, "futimesat" , NULL, print_futimesat, NULL },
-#endif
 #ifdef TARGET_NR_getcpu
 { TARGET_NR_getcpu, "getcpu" , "%s(%p,%d)", NULL, NULL },
 #endif
@@ -1392,12 +1389,6 @@
 #ifdef TARGET_NR_ustat
 { TARGET_NR_ustat, "ustat" , "%s(%#x,%p)", NULL, NULL },
 #endif
-#ifdef TARGET_NR_utime
-{ TARGET_NR_utime, "utime" , NULL, print_utime, NULL },
-#endif
-#ifdef TARGET_NR_utimes
-{ TARGET_NR_utimes, "utimes" , NULL, print_utimes, NULL },
-#endif
 #ifdef TARGET_NR_utrap_install
 { TARGET_NR_utrap_install, "utrap_install" , NULL, NULL, NULL },
 #endif
-- 
2.17.1


