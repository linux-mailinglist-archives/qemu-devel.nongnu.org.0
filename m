Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85416228D9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 22:49:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSSkP-0003pF-I3
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 16:49:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSZ6-00033w-3X
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSZ3-0003hS-Nm
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:37:52 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSSZ3-0003gO-EI
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:37:49 -0400
Received: by mail-pl1-x642.google.com with SMTP id g9so5708907plm.6
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o4Cy9KpSXJVO+i5TmvjoE8Way2fcEusxZ0oBwBxLiAg=;
	b=F1xJvdIFpvumBk/ySlZuqw0XRxRY6ZfNLveLW0AvHyJNvnL5W16xq+eDZX/bgy8piS
	ss5FHWYC2WeEsLR6NbKdRp/TncIXblzrgGxSlhHE1mcPdWMzb2pca7uc0g+EWKAgi3MG
	cKKQHJ5mIvCET3++Ep6E2zTKvG5tvNOA2mCdV9NJmuK/317ana0tvbe6SYEMIVD9DHzN
	lxnYtqvnjNGO4N/ehA9zbv/q2O55UNEL6UY9StW7uKKpH4pcV1EAq4wseZJgiTvdZ6Ux
	Wr4s4VM67vRO68v2g10r77NKZNLnk/rqA9cTCyq/rYucgIDjlAbsrmTg6iHdljfojZu2
	Zv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o4Cy9KpSXJVO+i5TmvjoE8Way2fcEusxZ0oBwBxLiAg=;
	b=WuAwVNtoUglNnw0YZrzS+X3TyW8yCOo1gLwKddrQYSH5+SJ+ehbVN+kwc1UKXT6veB
	mYBA5Sb2NVAAGxpU9hjEU6/fLOLfafVyr87DMwQuIr9/y3XalWs+WlPKtObGCxX1wex5
	9gPg+bkR7IXfUfaPsBxyVkEJq9+WaRbJWRWnc/jnoEV5Uz1BkcV97BbYm3LymdRFSCkb
	2MC+smIecbxLHnmURsBDF7HBC7VSm+r3rTkmKPVEQKHTwCP8NGNZYIRMK51Z8/mwSy8n
	iVd//Mnqm6dq3bfJPTtZJ/IWIopcEnDZfUXmA4YUpukzrzuqlBnLh33lCAYfAQ/soyVp
	WgcA==
X-Gm-Message-State: APjAAAUeh11W7thSAdTTMdIZjFATrl4H/BdWHfoBLLJEixDK2qOze+b7
	A+Ey9US0ID3MZOVqHzqcHLWe/5NBPok=
X-Google-Smtp-Source: APXvYqzEiGn72FqtOfd7vSFmEPFh6Grj1TOaQF8dxhT3oV8vIDg7YacHq9wI4LxOBVo4NrfjFqKH3Q==
X-Received: by 2002:a17:902:c85:: with SMTP id
	5mr70134481plt.172.1558298267981; 
	Sun, 19 May 2019 13:37:47 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	i7sm11397448pfo.19.2019.05.19.13.37.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:37:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 13:36:26 -0700
Message-Id: <20190519203726.20729-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519203726.20729-1-richard.henderson@linaro.org>
References: <20190519203726.20729-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-devel] [PATCH v7 14/74] linux-user: Split out memory syscalls
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

This includes mmap, mmap2, munmap, mlock, mlockall, munlock,
munlockall, mprotect, mremap, msync.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall-defs.h    |  24 ++++++
 linux-user/syscall.h         |   2 +
 linux-user/strace.c          |  55 ++-----------
 linux-user/syscall-mem.inc.c | 154 +++++++++++++++++++++++++++++++++++
 linux-user/syscall.c         | 119 +--------------------------
 linux-user/strace.list       |  33 --------
 6 files changed, 189 insertions(+), 198 deletions(-)
 create mode 100644 linux-user/syscall-mem.inc.c

diff --git a/linux-user/syscall-defs.h b/linux-user/syscall-defs.h
index 6d6349da01..88f433e998 100644
--- a/linux-user/syscall-defs.h
+++ b/linux-user/syscall-defs.h
@@ -20,6 +20,26 @@ SYSCALL_DEF(close, ARG_DEC);
 #ifdef TARGET_NR_ipc
 SYSCALL_DEF_ARGS(ipc, ARG_HEX, ARG_DEC, ARG_DEC, ARG_HEX, ARG_PTR, ARG_HEX);
 #endif
+SYSCALL_DEF(mlock, ARG_PTR, ARG_DEC);
+SYSCALL_DEF(mlockall, ARG_HEX);
+#ifdef TARGET_NR_mmap
+SYSCALL_DEF_FULL(mmap, .impl = impl_mmap,
+                 .args = args_mmap,
+                 .print_ret = print_syscall_ptr_ret,
+                 .arg_type = { ARG_PTR, ARG_DEC, ARG_MMAPPROT,
+                               ARG_MMAPFLAG, ARG_DEC, ARG_DEC });
+#endif
+#ifdef TARGET_NR_mmap2
+SYSCALL_DEF_FULL(mmap2, .impl = impl_mmap,
+                 .args = args_mmap2,
+                 .print_ret = print_syscall_ptr_ret,
+                 .arg_type = { ARG_PTR, ARG_DEC, ARG_MMAPPROT,
+                               ARG_MMAPFLAG, ARG_DEC, ARG_DEC64 });
+#endif
+SYSCALL_DEF(mprotect, ARG_PTR, ARG_DEC, ARG_MMAPPROT);
+SYSCALL_DEF_FULL(mremap, .impl = impl_mremap,
+                 .print_ret = print_syscall_ptr_ret,
+                 .arg_type = { ARG_PTR, ARG_DEC, ARG_DEC, ARG_HEX, ARG_PTR });
 #if !defined(SYSCALL_TABLE) || defined(TARGET_NR_msgctl)
 SYSCALL_DEF(msgctl, ARG_DEC, ARG_DEC, ARG_PTR);
 #endif
@@ -32,6 +52,10 @@ SYSCALL_DEF(msgrcv, ARG_DEC, ARG_PTR, ARG_DEC, ARG_DEC, ARG_HEX);
 #if !defined(SYSCALL_TABLE) || defined(TARGET_NR_msgsnd)
 SYSCALL_DEF(msgsnd, ARG_DEC, ARG_PTR, ARG_DEC, ARG_HEX);
 #endif
+SYSCALL_DEF(msync, ARG_PTR, ARG_DEC, ARG_HEX);
+SYSCALL_DEF(munlock, ARG_PTR, ARG_DEC);
+SYSCALL_DEF(munlockall);
+SYSCALL_DEF(munmap, ARG_PTR, ARG_DEC);
 SYSCALL_DEF(name_to_handle_at,
             ARG_ATDIRFD, ARG_STR, ARG_PTR, ARG_PTR, ARG_ATFLAG);
 #ifdef TARGET_NR_open
diff --git a/linux-user/syscall.h b/linux-user/syscall.h
index 83f602f8e7..8175de4c31 100644
--- a/linux-user/syscall.h
+++ b/linux-user/syscall.h
@@ -58,6 +58,8 @@ typedef enum {
     /* These print as sets of flags.  */
     ARG_ATDIRFD,
     ARG_ATFLAG,
+    ARG_MMAPFLAG,
+    ARG_MMAPPROT,
     ARG_MODEFLAG,
     ARG_OPENFLAG,
 
diff --git a/linux-user/strace.c b/linux-user/strace.c
index e1c4859a95..a767227ac1 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -801,7 +801,7 @@ UNUSED static struct flags umount2_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mmap_prot_flags[] = {
+static struct flags const mmap_prot_flags[] = {
     FLAG_GENERIC(PROT_NONE),
     FLAG_GENERIC(PROT_EXEC),
     FLAG_GENERIC(PROT_READ),
@@ -812,7 +812,7 @@ UNUSED static struct flags mmap_prot_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mmap_flags[] = {
+static struct flags const mmap_flags[] = {
     FLAG_TARGET(MAP_SHARED),
     FLAG_TARGET(MAP_PRIVATE),
     FLAG_TARGET(MAP_ANONYMOUS),
@@ -2362,51 +2362,6 @@ print_utimensat(const struct syscallname *name,
 }
 #endif
 
-#if defined(TARGET_NR_mmap) || defined(TARGET_NR_mmap2)
-static void
-print_mmap(const struct syscallname *name,
-    abi_long arg0, abi_long arg1, abi_long arg2,
-    abi_long arg3, abi_long arg4, abi_long arg5)
-{
-    print_syscall_prologue(name);
-    print_pointer(arg0, 0);
-    print_raw_param("%d", arg1, 0);
-    print_flags(mmap_prot_flags, arg2, 0);
-    print_flags(mmap_flags, arg3, 0);
-    print_raw_param("%d", arg4, 0);
-    print_raw_param("%#x", arg5, 1);
-    print_syscall_epilogue(name);
-}
-#define print_mmap2     print_mmap
-#endif
-
-#ifdef TARGET_NR_mprotect
-static void
-print_mprotect(const struct syscallname *name,
-    abi_long arg0, abi_long arg1, abi_long arg2,
-    abi_long arg3, abi_long arg4, abi_long arg5)
-{
-    print_syscall_prologue(name);
-    print_pointer(arg0, 0);
-    print_raw_param("%d", arg1, 0);
-    print_flags(mmap_prot_flags, arg2, 1);
-    print_syscall_epilogue(name);
-}
-#endif
-
-#ifdef TARGET_NR_munmap
-static void
-print_munmap(const struct syscallname *name,
-    abi_long arg0, abi_long arg1, abi_long arg2,
-    abi_long arg3, abi_long arg4, abi_long arg5)
-{
-    print_syscall_prologue(name);
-    print_pointer(arg0, 0);
-    print_raw_param("%d", arg1, 1);
-    print_syscall_epilogue(name);
-}
-#endif
-
 #ifdef TARGET_NR_futex
 static void print_futex_op(abi_long tflag, int last)
 {
@@ -2613,6 +2568,12 @@ static void print_syscall_def1(const SyscallDef *def, int64_t args[6])
         case ARG_ATFLAG:
             len = add_flags(b, rest, at_file_flags, arg, false);
             break;
+        case ARG_MMAPFLAG:
+            len = add_flags(b, rest, mmap_flags, arg, false);
+            break;
+        case ARG_MMAPPROT:
+            len = add_flags(b, rest, mmap_prot_flags, arg, false);
+            break;
         case ARG_MODEFLAG:
             len = add_flags(b, rest, mode_flags, arg, true);
             break;
diff --git a/linux-user/syscall-mem.inc.c b/linux-user/syscall-mem.inc.c
new file mode 100644
index 0000000000..d2ce0cb8cc
--- /dev/null
+++ b/linux-user/syscall-mem.inc.c
@@ -0,0 +1,154 @@
+/*
+ *  Linux memory-related syscalls
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+
+static bitmask_transtbl const mmap_flags_tbl[] = {
+    { TARGET_MAP_SHARED, TARGET_MAP_SHARED, MAP_SHARED, MAP_SHARED },
+    { TARGET_MAP_PRIVATE, TARGET_MAP_PRIVATE, MAP_PRIVATE, MAP_PRIVATE },
+    { TARGET_MAP_FIXED, TARGET_MAP_FIXED, MAP_FIXED, MAP_FIXED },
+    { TARGET_MAP_ANONYMOUS, TARGET_MAP_ANONYMOUS,
+      MAP_ANONYMOUS, MAP_ANONYMOUS },
+    { TARGET_MAP_GROWSDOWN, TARGET_MAP_GROWSDOWN,
+      MAP_GROWSDOWN, MAP_GROWSDOWN },
+    { TARGET_MAP_DENYWRITE, TARGET_MAP_DENYWRITE,
+      MAP_DENYWRITE, MAP_DENYWRITE },
+    { TARGET_MAP_EXECUTABLE, TARGET_MAP_EXECUTABLE,
+      MAP_EXECUTABLE, MAP_EXECUTABLE },
+    { TARGET_MAP_LOCKED, TARGET_MAP_LOCKED, MAP_LOCKED, MAP_LOCKED },
+    { TARGET_MAP_NORESERVE, TARGET_MAP_NORESERVE,
+      MAP_NORESERVE, MAP_NORESERVE },
+    { TARGET_MAP_HUGETLB, TARGET_MAP_HUGETLB, MAP_HUGETLB, MAP_HUGETLB },
+    /*
+     * MAP_STACK had been ignored by the kernel for quite some time.
+     * Recognize it for the target insofar as we do not want to pass
+     * it through to the host.
+     */
+    { TARGET_MAP_STACK, TARGET_MAP_STACK, 0, 0 },
+    { 0, 0, 0, 0 }
+};
+
+
+SYSCALL_IMPL(mlock)
+{
+    return get_errno(mlock(g2h(arg1), arg2));
+}
+
+SYSCALL_IMPL(mlockall)
+{
+    int host_flag = 0;
+    if (arg1 & TARGET_MLOCKALL_MCL_CURRENT) {
+        host_flag |= MCL_CURRENT;
+    }
+    if (arg1 & TARGET_MLOCKALL_MCL_FUTURE) {
+        host_flag |= MCL_FUTURE;
+    }
+    return get_errno(mlockall(host_flag));
+}
+
+#if (defined(TARGET_I386) && defined(TARGET_ABI32)) || \
+    (defined(TARGET_ARM) && defined(TARGET_ABI32)) || \
+    defined(TARGET_M68K) || defined(TARGET_CRIS) || \
+    defined(TARGET_MICROBLAZE) || defined(TARGET_S390X)
+SYSCALL_ARGS(mmap)
+{
+    abi_ulong ptr = in[0];
+    abi_long *v = lock_user(VERIFY_READ, ptr, 6 * sizeof(abi_long), 1);
+    if (v == NULL) {
+        errno = EFAULT;
+        return NULL;
+    }
+    out[0] = tswapal(v[0]);
+    out[1] = tswapal(v[1]);
+    out[2] = tswapal(v[2]);
+    out[3] = tswapal(v[3]);
+    out[4] = tswapal(v[4]);
+    out[5] = tswapal(v[5]);
+    unlock_user(v, ptr, 0);
+    return def;
+}
+#else
+# define args_mmap NULL
+#endif
+
+SYSCALL_IMPL(mmap)
+{
+    int host_flags = target_to_host_bitmask(arg4, mmap_flags_tbl);
+    return get_errno(target_mmap(arg1, arg2, arg3, host_flags, arg5, arg6));
+}
+
+#ifdef TARGET_NR_mmap2
+/*
+ * Define mmap2 in terms of mmap.
+ * !!! Note that there is a fundamental problem here in that
+ * target_mmap has an offset parameter that is abi_ulong
+ * and not off_t.  This means that we cannot actually pass
+ * through a 64-bit file offset as intended.
+ */
+
+#ifndef MMAP_SHIFT
+# define MMAP_SHIFT 12
+#endif
+
+SYSCALL_ARGS(mmap2)
+{
+    /* We have already assigned out[0-4].  */
+    out[5] = (uint64_t)(abi_ulong)in[5] << MMAP_SHIFT;
+    return def;
+}
+#endif
+
+SYSCALL_IMPL(mprotect)
+{
+    CPUState *cpu = ENV_GET_CPU(cpu_env);
+    TaskState *ts = cpu->opaque;
+
+    /* Special hack to detect libc making the stack executable.  */
+    if ((arg3 & PROT_GROWSDOWN)
+        && arg1 >= ts->info->stack_limit
+        && arg1 <= ts->info->start_stack) {
+        arg3 &= ~PROT_GROWSDOWN;
+        arg2 = arg2 + arg1 - ts->info->stack_limit;
+        arg1 = ts->info->stack_limit;
+    }
+    return get_errno(target_mprotect(arg1, arg2, arg3));
+}
+
+SYSCALL_IMPL(mremap)
+{
+    return get_errno(target_mremap(arg1, arg2, arg3, arg4, arg5));
+}
+
+SYSCALL_IMPL(msync)
+{
+    return get_errno(msync(g2h(arg1), arg2, arg3));
+}
+
+SYSCALL_IMPL(munlock)
+{
+    return get_errno(munlock(g2h(arg1), arg2));
+}
+
+SYSCALL_IMPL(munlockall)
+{
+    return get_errno(munlockall());
+}
+
+SYSCALL_IMPL(munmap)
+{
+    return get_errno(target_munmap(arg1, arg2));
+}
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ca345ffb4c..876426dd9c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4183,29 +4183,6 @@ static const StructEntry struct_termios_def = {
     .align = { __alignof__(struct target_termios), __alignof__(struct host_termios) },
 };
 
-static bitmask_transtbl mmap_flags_tbl[] = {
-    { TARGET_MAP_SHARED, TARGET_MAP_SHARED, MAP_SHARED, MAP_SHARED },
-    { TARGET_MAP_PRIVATE, TARGET_MAP_PRIVATE, MAP_PRIVATE, MAP_PRIVATE },
-    { TARGET_MAP_FIXED, TARGET_MAP_FIXED, MAP_FIXED, MAP_FIXED },
-    { TARGET_MAP_ANONYMOUS, TARGET_MAP_ANONYMOUS,
-      MAP_ANONYMOUS, MAP_ANONYMOUS },
-    { TARGET_MAP_GROWSDOWN, TARGET_MAP_GROWSDOWN,
-      MAP_GROWSDOWN, MAP_GROWSDOWN },
-    { TARGET_MAP_DENYWRITE, TARGET_MAP_DENYWRITE,
-      MAP_DENYWRITE, MAP_DENYWRITE },
-    { TARGET_MAP_EXECUTABLE, TARGET_MAP_EXECUTABLE,
-      MAP_EXECUTABLE, MAP_EXECUTABLE },
-    { TARGET_MAP_LOCKED, TARGET_MAP_LOCKED, MAP_LOCKED, MAP_LOCKED },
-    { TARGET_MAP_NORESERVE, TARGET_MAP_NORESERVE,
-      MAP_NORESERVE, MAP_NORESERVE },
-    { TARGET_MAP_HUGETLB, TARGET_MAP_HUGETLB, MAP_HUGETLB, MAP_HUGETLB },
-    /* MAP_STACK had been ignored by the kernel for quite some time.
-       Recognize it for the target insofar as we do not want to pass
-       it through to the host.  */
-    { TARGET_MAP_STACK, TARGET_MAP_STACK, 0, 0 },
-    { 0, 0, 0, 0 }
-};
-
 #if defined(TARGET_I386)
 
 /* NOTE: there is really one LDT for all the threads */
@@ -5428,21 +5405,6 @@ static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
     return 0;
 }
 
-#if defined(TARGET_NR_mlockall)
-static inline int target_to_host_mlockall_arg(int arg)
-{
-    int result = 0;
-
-    if (arg & TARGET_MLOCKALL_MCL_CURRENT) {
-        result |= MCL_CURRENT;
-    }
-    if (arg & TARGET_MLOCKALL_MCL_FUTURE) {
-        result |= MCL_FUTURE;
-    }
-    return result;
-}
-#endif
-
 #if (defined(TARGET_NR_stat64) || defined(TARGET_NR_lstat64) ||     \
      defined(TARGET_NR_fstat64) || defined(TARGET_NR_fstatat64) ||  \
      defined(TARGET_NR_newfstatat))
@@ -7052,86 +7014,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
            ret = get_errno(reboot(arg1, arg2, arg3, NULL));
         }
         return ret;
-#ifdef TARGET_NR_mmap
-    case TARGET_NR_mmap:
-#if (defined(TARGET_I386) && defined(TARGET_ABI32)) || \
-    (defined(TARGET_ARM) && defined(TARGET_ABI32)) || \
-    defined(TARGET_M68K) || defined(TARGET_CRIS) || defined(TARGET_MICROBLAZE) \
-    || defined(TARGET_S390X)
-        {
-            abi_ulong *v;
-            abi_ulong v1, v2, v3, v4, v5, v6;
-            if (!(v = lock_user(VERIFY_READ, arg1, 6 * sizeof(abi_ulong), 1)))
-                return -TARGET_EFAULT;
-            v1 = tswapal(v[0]);
-            v2 = tswapal(v[1]);
-            v3 = tswapal(v[2]);
-            v4 = tswapal(v[3]);
-            v5 = tswapal(v[4]);
-            v6 = tswapal(v[5]);
-            unlock_user(v, arg1, 0);
-            ret = get_errno(target_mmap(v1, v2, v3,
-                                        target_to_host_bitmask(v4, mmap_flags_tbl),
-                                        v5, v6));
-        }
-#else
-        ret = get_errno(target_mmap(arg1, arg2, arg3,
-                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
-                                    arg5,
-                                    arg6));
-#endif
-        return ret;
-#endif
-#ifdef TARGET_NR_mmap2
-    case TARGET_NR_mmap2:
-#ifndef MMAP_SHIFT
-#define MMAP_SHIFT 12
-#endif
-        ret = target_mmap(arg1, arg2, arg3,
-                          target_to_host_bitmask(arg4, mmap_flags_tbl),
-                          arg5, arg6 << MMAP_SHIFT);
-        return get_errno(ret);
-#endif
-    case TARGET_NR_munmap:
-        return get_errno(target_munmap(arg1, arg2));
-    case TARGET_NR_mprotect:
-        {
-            TaskState *ts = cpu->opaque;
-            /* Special hack to detect libc making the stack executable.  */
-            if ((arg3 & PROT_GROWSDOWN)
-                && arg1 >= ts->info->stack_limit
-                && arg1 <= ts->info->start_stack) {
-                arg3 &= ~PROT_GROWSDOWN;
-                arg2 = arg2 + arg1 - ts->info->stack_limit;
-                arg1 = ts->info->stack_limit;
-            }
-        }
-        return get_errno(target_mprotect(arg1, arg2, arg3));
-#ifdef TARGET_NR_mremap
-    case TARGET_NR_mremap:
-        return get_errno(target_mremap(arg1, arg2, arg3, arg4, arg5));
-#endif
-        /* ??? msync/mlock/munlock are broken for softmmu.  */
-#ifdef TARGET_NR_msync
-    case TARGET_NR_msync:
-        return get_errno(msync(g2h(arg1), arg2, arg3));
-#endif
-#ifdef TARGET_NR_mlock
-    case TARGET_NR_mlock:
-        return get_errno(mlock(g2h(arg1), arg2));
-#endif
-#ifdef TARGET_NR_munlock
-    case TARGET_NR_munlock:
-        return get_errno(munlock(g2h(arg1), arg2));
-#endif
-#ifdef TARGET_NR_mlockall
-    case TARGET_NR_mlockall:
-        return get_errno(mlockall(target_to_host_mlockall_arg(arg1)));
-#endif
-#ifdef TARGET_NR_munlockall
-    case TARGET_NR_munlockall:
-        return get_errno(munlockall());
-#endif
 #ifdef TARGET_NR_truncate
     case TARGET_NR_truncate:
         if (!(p = lock_user_string(arg1)))
@@ -10092,6 +9974,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 
 #include "syscall-file.inc.c"
 #include "syscall-ipc.inc.c"
+#include "syscall-mem.inc.c"
 
 #undef SYSCALL_IMPL
 #undef SYSCALL_ARGS
diff --git a/linux-user/strace.list b/linux-user/strace.list
index f99bd57c09..cc0bb10a7a 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -554,21 +554,6 @@
 #ifdef TARGET_NR_mknodat
 { TARGET_NR_mknodat, "mknodat" , NULL, print_mknodat, NULL },
 #endif
-#ifdef TARGET_NR_mlock
-{ TARGET_NR_mlock, "mlock" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_mlock2
-{ TARGET_NR_mlock2, "mlock2" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_mlockall
-{ TARGET_NR_mlockall, "mlockall" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_mmap
-{ TARGET_NR_mmap, "mmap" , NULL, print_mmap, print_syscall_ret_addr },
-#endif
-#ifdef TARGET_NR_mmap2
-{ TARGET_NR_mmap2, "mmap2" , NULL, print_mmap2, print_syscall_ret_addr },
-#endif
 #ifdef TARGET_NR_modify_ldt
 { TARGET_NR_modify_ldt, "modify_ldt" , NULL, NULL, NULL },
 #endif
@@ -578,9 +563,6 @@
 #ifdef TARGET_NR_move_pages
 { TARGET_NR_move_pages, "move_pages" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_mprotect
-{ TARGET_NR_mprotect, "mprotect" , NULL, print_mprotect, NULL },
-#endif
 #ifdef TARGET_NR_mpx
 { TARGET_NR_mpx, "mpx" , NULL, NULL, NULL },
 #endif
@@ -602,24 +584,9 @@
 #ifdef TARGET_NR_mq_unlink
 { TARGET_NR_mq_unlink, "mq_unlink" , NULL, print_mq_unlink, NULL },
 #endif
-#ifdef TARGET_NR_mremap
-{ TARGET_NR_mremap, "mremap" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_msync
-{ TARGET_NR_msync, "msync" , NULL, NULL, NULL },
-#endif
 #ifdef TARGET_NR_multiplexer
 { TARGET_NR_multiplexer, "multiplexer" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_munlock
-{ TARGET_NR_munlock, "munlock" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_munlockall
-{ TARGET_NR_munlockall, "munlockall" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_munmap
-{ TARGET_NR_munmap, "munmap" , NULL, print_munmap, NULL },
-#endif
 #ifdef TARGET_NR_nanosleep
 { TARGET_NR_nanosleep, "nanosleep" , NULL, NULL, NULL },
 #endif
-- 
2.17.1


