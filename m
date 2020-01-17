Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BC1411D4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 20:33:33 +0100 (CET)
Received: from localhost ([::1]:33910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isXN5-0000Ik-Mm
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 14:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40101)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <31goiXgMKCmsSTiPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--jkz.bounces.google.com>)
 id 1isXIA-0004Ty-1W
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 14:28:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <31goiXgMKCmsSTiPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--jkz.bounces.google.com>)
 id 1isXI8-00040d-B4
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 14:28:25 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:40868)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <31goiXgMKCmsSTiPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--jkz.bounces.google.com>)
 id 1isXI8-0003zP-35
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 14:28:24 -0500
Received: by mail-pf1-x44a.google.com with SMTP id d127so15640510pfa.7
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 11:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=CxpIz0SmVmTUpXU6rR/3/fia0JiIjvv95B0xreks9eo=;
 b=cLYqeXUhOsrxgO5tmbDC65cdIB2JbL+mcy9Xn2vJ0cipxw0MLSHAJv47LHtu8i3pLJ
 y8+4ZGtf2Nkdxg7ZVx/ymVwfqxFtnkLCrJ7DuuNOH2b+WHqtHO0VdLV2FRHmWJdAudoV
 QTlNDfMwupOdQW8e/aOV2sNk0kn4IyNHIdSTFPZU5xg/U5haAGwA/aQaSCxOIgxO4r97
 NT+qHIFvSlfexTOWreUF1Ehz3iRXGhnAroA4plYV0Y+Lq+HFEr3o6hevshRqkpvMTrOx
 9O/Dvda6EQ1k4BFI48cJIjJt+rnqSf5/b6wfqveqF4SWQILYL7aucrDr8PEKp516HLjS
 N+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=CxpIz0SmVmTUpXU6rR/3/fia0JiIjvv95B0xreks9eo=;
 b=IZNURa8b0KGt9NBYNkPwRNNjsEW8vZvGVSRrkFVZawuRS+sBEf5N2IqEVMvMquzn+u
 FY7CIH8b2j38FRxMVhiOkYdZy2BbmD+ptIBiXgUe8LsJ6ez0707WbgSyHEViOafRmCGs
 IBeFD3JwD0JITs8zwaMkLrP+n5vzVpDmg6gM29K7+PX5fwCUWaoW30wayZW62fiSiuqd
 1kzaunv+OMiUhE5k9ua8+fgVMRkbtKEcYz5W+qFkEbX0hkVSJIui8o0n1POLgmtKPgJ0
 h+x7ioubndEu08GHrz+BPDeMJb+M66NRotKAW16+uvLxT2I9PjE0imLurTOR54j7yE+s
 Pnxg==
X-Gm-Message-State: APjAAAVRqV87aEFXdV0B82mttyZdNCqPTuhoty5gN32OtvvZj/hayvcD
 H3R+HVOVS5cnITw7l4vcopQRETALTSmpa8I/jVxySXnbphgxkRncmut4K46JQBXj84XkLJPqemx
 Hv0WGEH0TpytVnUZBmYBahWnxPWAbh/OTlPKWLXSkDvLmVrbrlN/H
X-Google-Smtp-Source: APXvYqxJoZU+M28UNduNTp1FfRlwh/8ws476VDsFCLtg6Wm0jQWhcnlQBEInOVLxSqoeuAitoQ8wGB8=
X-Received: by 2002:a63:27c4:: with SMTP id
 n187mr48209900pgn.305.1579289302385; 
 Fri, 17 Jan 2020 11:28:22 -0800 (PST)
Date: Fri, 17 Jan 2020 11:28:08 -0800
In-Reply-To: <20200117192808.129398-1-jkz@google.com>
Message-Id: <20200117192808.129398-5-jkz@google.com>
Mime-Version: 1.0
References: <20200117192808.129398-1-jkz@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 4/4] bsd-user: Replace gemu_log with qemu_log
From: Josh Kunz <jkz@google.com>
To: qemu-devel@nongnu.org
Cc: riku.voipio@iki.fi, laurent@vivier.eu, alex.bennee@linaro.org, 
 armbru@redhat.com, imp@bsdimp.com, Josh Kunz <jkz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::44a
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

gemu_log is an old logging mechanism used to implement strace logging in
the bsd-user tree. It logs directly to stderr and cannot easily be
redirected. This change instead causes strace to log via the qemu_log
subsystem which has fine-grained logging control, and a centralized
mechanism for log redirection. bsd-user does not currently implement any
logging redirection options, or log masking options, but this change
brings it more in line with the linux-user tree.

Signed-off-by: Josh Kunz <jkz@google.com>
---
 bsd-user/main.c    | 13 ++-----------
 bsd-user/qemu.h    |  2 --
 bsd-user/strace.c  | 32 +++++++++++++++-----------------
 bsd-user/syscall.c | 31 +++++++++++++++++++------------
 4 files changed, 36 insertions(+), 42 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 770c2b267a..2ca975d52c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -55,15 +55,6 @@ enum BSDType bsd_type;
    by remapping the process stack directly at the right place */
 unsigned long x86_stack_size = 512 * 1024;
 
-void gemu_log(const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start(ap, fmt);
-    vfprintf(stderr, fmt, ap);
-    va_end(ap);
-}
-
 #if defined(TARGET_I386)
 int cpu_get_pic_interrupt(CPUX86State *env)
 {
@@ -845,7 +836,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "singlestep")) {
             singlestep = 1;
         } else if (!strcmp(r, "strace")) {
-            do_strace = 1;
+            qemu_add_log(LOG_STRACE);
         } else if (!strcmp(r, "trace")) {
             g_free(trace_file);
             trace_file = trace_opt_parse(optarg);
@@ -917,7 +908,7 @@ int main(int argc, char **argv)
     thread_cpu = cpu;
 
     if (getenv("QEMU_STRACE")) {
-        do_strace = 1;
+        qemu_add_log(LOG_STRACE);
     }
 
     target_environ = envlist_to_environ(envlist, NULL);
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 09e8aed9c7..5762e3a6e5 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -152,7 +152,6 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
 abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6);
-void gemu_log(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
 extern THREAD CPUState *thread_cpu;
 void cpu_loop(CPUArchState *env);
 char *target_strerror(int err);
@@ -188,7 +187,6 @@ print_openbsd_syscall(int num,
                       abi_long arg1, abi_long arg2, abi_long arg3,
                       abi_long arg4, abi_long arg5, abi_long arg6);
 void print_openbsd_syscall_ret(int num, abi_long ret);
-extern int do_strace;
 
 /* signal.c */
 void process_pending_signals(CPUArchState *cpu_env);
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index fa66fe1ee2..6ee1510555 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -23,8 +23,6 @@
 
 #include "qemu.h"
 
-int do_strace;
-
 /*
  * Utility functions
  */
@@ -36,17 +34,17 @@ static void print_sysctl(const struct syscallname *name, abi_long arg1,
     uint32_t i;
     int32_t *namep;
 
-    gemu_log("%s({ ", name->name);
+    qemu_log("%s({ ", name->name);
     namep = lock_user(VERIFY_READ, arg1, sizeof(int32_t) * arg2, 1);
     if (namep) {
         int32_t *p = namep;
 
         for (i = 0; i < (uint32_t)arg2; i++) {
-            gemu_log("%d ", tswap32(*p++));
+            qemu_log("%d ", tswap32(*p++));
         }
         unlock_user(namep, arg1, 0);
     }
-    gemu_log("}, %u, 0x" TARGET_ABI_FMT_lx ", 0x" TARGET_ABI_FMT_lx ", 0x"
+    qemu_log("}, %u, 0x" TARGET_ABI_FMT_lx ", 0x" TARGET_ABI_FMT_lx ", 0x"
         TARGET_ABI_FMT_lx ", 0x" TARGET_ABI_FMT_lx ")",
         (uint32_t)arg2, arg3, arg4, arg5, arg6);
 }
@@ -62,7 +60,7 @@ static void print_execve(const struct syscallname *name, abi_long arg1,
     if (s == NULL) {
         return;
     }
-    gemu_log("%s(\"%s\",{", name->name, s);
+    qemu_log("%s(\"%s\",{", name->name, s);
     unlock_user(s, arg1, 0);
 
     for (arg_ptr_addr = arg2; ; arg_ptr_addr += sizeof(abi_ulong)) {
@@ -78,11 +76,11 @@ static void print_execve(const struct syscallname *name, abi_long arg1,
             break;
         }
         if ((s = lock_user_string(arg_addr))) {
-            gemu_log("\"%s\",", s);
+            qemu_log("\"%s\",", s);
             unlock_user(s, arg_addr, 0);
         }
     }
-    gemu_log("NULL})");
+    qemu_log("NULL})");
 }
 
 static void print_ioctl(const struct syscallname *name,
@@ -90,7 +88,7 @@ static void print_ioctl(const struct syscallname *name,
         abi_long arg5, abi_long arg6)
 {
     /* Decode the ioctl request */
-    gemu_log("%s(%d, 0x%0lx { IO%s%s GRP:0x%x('%c') CMD:%d LEN:%d }, 0x"
+    qemu_log("%s(%d, 0x%0lx { IO%s%s GRP:0x%x('%c') CMD:%d LEN:%d }, 0x"
             TARGET_ABI_FMT_lx ", ...)",
             name->name,
             (int)arg1,
@@ -111,9 +109,9 @@ static void print_ioctl(const struct syscallname *name,
 static void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
 {
     if (ret == -1) {
-        gemu_log(" = -1 errno=%d (%s)\n", errno, strerror(errno));
+        qemu_log(" = -1 errno=%d (%s)\n", errno, strerror(errno));
     } else {
-        gemu_log(" = 0x" TARGET_ABI_FMT_lx "\n", ret);
+        qemu_log(" = 0x" TARGET_ABI_FMT_lx "\n", ret);
     }
 }
 
@@ -121,7 +119,7 @@ static void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
 static void
 print_syscall_ret_raw(struct syscallname *name, abi_long ret)
 {
-        gemu_log(" = 0x" TARGET_ABI_FMT_lx "\n", ret);
+        qemu_log(" = 0x" TARGET_ABI_FMT_lx "\n", ret);
 }
 #endif
 
@@ -148,7 +146,7 @@ static void print_syscall(int num, const struct syscallname *scnames,
         TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ","
         TARGET_ABI_FMT_ld ")";
 
-    gemu_log("%d ", getpid() );
+    qemu_log("%d ", getpid());
 
     for (i = 0; i < nscnames; i++) {
         if (scnames[i].nr == num) {
@@ -161,13 +159,13 @@ static void print_syscall(int num, const struct syscallname *scnames,
                 if (scnames[i].format != NULL) {
                     format = scnames[i].format;
                 }
-                gemu_log(format, scnames[i].name, arg1, arg2, arg3, arg4, arg5,
+                qemu_log(format, scnames[i].name, arg1, arg2, arg3, arg4, arg5,
                         arg6);
             }
             return;
         }
     }
-    gemu_log("Unknown syscall %d\n", num);
+    qemu_log("Unknown syscall %d\n", num);
 }
 
 static void print_syscall_ret(int num, abi_long ret,
@@ -181,10 +179,10 @@ static void print_syscall_ret(int num, abi_long ret,
                 scnames[i].result(&scnames[i], ret);
             } else {
                 if (ret < 0) {
-                    gemu_log(" = -1 errno=" TARGET_ABI_FMT_ld " (%s)\n", -ret,
+                    qemu_log(" = -1 errno=" TARGET_ABI_FMT_ld " (%s)\n", -ret,
                              strerror(-ret));
                 } else {
-                    gemu_log(" = " TARGET_ABI_FMT_ld "\n", ret);
+                    qemu_log(" = " TARGET_ABI_FMT_ld "\n", ret);
                 }
             }
             break;
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 0d45b654bb..53635d183e 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -321,12 +321,13 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     void *p;
 
 #ifdef DEBUG
-    gemu_log("freebsd syscall %d\n", num);
+    qemu_log("freebsd syscall %d\n", num);
 #endif
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if(do_strace)
+    if (unlikely(qemu_loglevel_mask(LOG_STRACE))) {
         print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
 
     switch(num) {
     case TARGET_FREEBSD_NR_exit:
@@ -401,10 +402,12 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     }
  fail:
 #ifdef DEBUG
-    gemu_log(" = %ld\n", ret);
+    qemu_log(" = %ld\n", ret);
 #endif
-    if (do_strace)
+
+    if (unlikely(qemu_loglevel_mask(LOG_STRACE))) {
         print_freebsd_syscall_ret(num, ret);
+    }
 
     record_syscall_return(cpu, num, ret);
     return ret;
@@ -422,13 +425,14 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
     void *p;
 
 #ifdef DEBUG
-    gemu_log("netbsd syscall %d\n", num);
+    qemu_log("netbsd syscall %d\n", num);
 #endif
 
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if(do_strace)
+    if (unlikely(qemu_loglevel_mask(LOG_STRACE))) {
         print_netbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
 
     switch(num) {
     case TARGET_NETBSD_NR_exit:
@@ -480,10 +484,11 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
     }
  fail:
 #ifdef DEBUG
-    gemu_log(" = %ld\n", ret);
+    qemu_log(" = %ld\n", ret);
 #endif
-    if (do_strace)
+    if (unlikely(qemu_loglevel_mask(LOG_STRACE))) {
         print_netbsd_syscall_ret(num, ret);
+    }
 
     record_syscall_return(cpu, num, ret);
     return ret;
@@ -501,13 +506,14 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
     void *p;
 
 #ifdef DEBUG
-    gemu_log("openbsd syscall %d\n", num);
+    qemu_log("openbsd syscall %d\n", num);
 #endif
 
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if(do_strace)
+    if (unlikely(qemu_loglevel_mask(LOG_STRACE))) {
         print_openbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
 
     switch(num) {
     case TARGET_OPENBSD_NR_exit:
@@ -559,10 +565,11 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
     }
  fail:
 #ifdef DEBUG
-    gemu_log(" = %ld\n", ret);
+    qemu_log(" = %ld\n", ret);
 #endif
-    if (do_strace)
+    if (unlikely(qemu_loglevel_mask(LOG_STRACE))) {
         print_openbsd_syscall_ret(num, ret);
+    }
 
     record_syscall_return(cpu, num, ret);
     return ret;
-- 
2.25.0.341.g760bfbb309-goog


