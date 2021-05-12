Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492437CFD0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:32:58 +0200 (CEST)
Received: from localhost ([::1]:60488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsjB-0006b5-5b
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUe-0007EW-Ee
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:56 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUO-0008LQ-Nb
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:56 -0400
Received: by mail-io1-xd31.google.com with SMTP id n40so6642185ioz.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PTBbSYYJVsByI4TeGnQsbvTNd/mEb0R8DgVhE9PirYU=;
 b=VyInb+1E24mve4YBnCFEddWG4iil4YY3i4IhPP3HkUWBK2T8pGAEVFSUfFX4luBPYM
 yJpzVPX8mTtMJF8NeKCPmOPT5gcOE8HWTlYKzMtsi4fv7rTVRTnNS6ATntzv6wMWPny4
 ra2mRQjQPfnmrHd2jWqxiAKyESoZuT5MNcAmWiJrU7lBNYTGhcwJe/yFgVN/IaJIOkKV
 9BOjAbmAYiGiGoBpFfQYAUaXyJkK+ji2Hq2WFBqm3WL9406x3w4XEn/2FTXxy5nLWrG9
 KE3AELgVdO0kt0XU1zJItjVyfV225VxOxgChmH5lygopt9sr0EfMLwWFeDPevRHnzOT5
 o2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTBbSYYJVsByI4TeGnQsbvTNd/mEb0R8DgVhE9PirYU=;
 b=opJ8mqTsEu0v6QwnB07V9dlh+lWMRYj6pxR1aTv8s9SNa4pKn3DbUURLiuBQPa9IhF
 3LMfzkI9VeT1tiRLukD8UO5+yexTRUa2dKqcu5ApWgsWrff6nEA0sEVdjsrr/1U1McWP
 wllDAyyBc0k6RCGLjxqdCL4qklc/sEpUHsV+XN5ycAPTBLYJcVvJECaxrPshXkjjBD8b
 8CsuXfk4dpXGPO+NUpUp3Qi7giqfbrwDH24Z2ne2BhhTG8/BP+EgSMDOdON1LcqAEpwN
 Xrj45+Nnyt5sIeH3ORoaRy9ErNYweD4IBDc+PGF5oUtYs+Hof3g2J5HACli9HNsXgntC
 1Rxw==
X-Gm-Message-State: AOAM532xkI0GelMmKrULuhwOfCeDYNmbZbWBhE09hm7CaizCBMus4Jgd
 E8jx8VNXMr67KozDvi6I3+Wh/vl7Zm4hxA==
X-Google-Smtp-Source: ABdhPJwrWtFRX0o39HdcSFCeATA2ix7g5Yct5XGMSCJ0+u5O0NuzDNka8dZakP/k7Y83fi+ODO88JQ==
X-Received: by 2002:a05:6602:14d3:: with SMTP id
 b19mr19779112iow.154.1620839858160; 
 Wed, 12 May 2021 10:17:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/20] bsd-user: style tweak: use {} consistently in for / if /
 else statements
Date: Wed, 12 May 2021 11:17:11 -0600
Message-Id: <20210512171720.46744-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix various issues with {} not being present on if / for statements.
Minor line length tweaks
Move an assignment in an if out.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 66 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 71bfe17f38..0f9e6bfbc0 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -217,7 +217,7 @@ void cpu_loop(CPUX86State *env)
 #ifndef TARGET_ABI32
         case EXCP_SYSCALL:
             /* syscall from syscall instruction */
-            if (bsd_type == target_freebsd)
+            if (bsd_type == target_freebsd) {
                 env->regs[R_EAX] = do_freebsd_syscall(env,
                                                       env->regs[R_EAX],
                                                       env->regs[R_EDI],
@@ -226,7 +226,7 @@ void cpu_loop(CPUX86State *env)
                                                       env->regs[R_ECX],
                                                       env->regs[8],
                                                       env->regs[9], 0, 0);
-            else { /* if (bsd_type == target_openbsd) */
+            } else { /* if (bsd_type == target_openbsd) */
                 env->regs[R_EAX] = do_openbsd_syscall(env,
                                                       env->regs[R_EAX],
                                                       env->regs[R_EDI],
@@ -250,7 +250,8 @@ void cpu_loop(CPUX86State *env)
             break;
         default:
             pc = env->segs[R_CS].base + env->eip;
-            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
+            fprintf(stderr,
+                    "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
                     (long)pc, trapnr);
             abort();
         }
@@ -274,8 +275,9 @@ static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
      * wrap handling : if cwp is on the last window, then we use the
      * registers 'after' the end
      */
-    if (index < 8 && env->cwp == env->nwindows - 1)
+    if (index < 8 && env->cwp == env->nwindows - 1) {
         index += 16 * env->nwindows;
+    }
     return index;
 }
 
@@ -287,8 +289,9 @@ static inline void save_window_offset(CPUSPARCState *env, int cwp1)
 
     sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
 #ifdef TARGET_SPARC64
-    if (sp_ptr & 3)
+    if (sp_ptr & 3) {
         sp_ptr += SPARC64_STACK_BIAS;
+    }
 #endif
 #if defined(DEBUG_WIN)
     printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
@@ -337,8 +340,9 @@ static void restore_window(CPUSPARCState *env)
     cwp1 = cpu_cwp_inc(env, env->cwp + 1);
     sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
 #ifdef TARGET_SPARC64
-    if (sp_ptr & 3)
+    if (sp_ptr & 3) {
         sp_ptr += SPARC64_STACK_BIAS;
+    }
 #endif
 #if defined(DEBUG_WIN)
     printf("win_underflow: sp_ptr=0x" TARGET_ABI_FMT_lx " load_cwp=%d\n",
@@ -351,8 +355,9 @@ static void restore_window(CPUSPARCState *env)
     }
 #ifdef TARGET_SPARC64
     env->canrestore++;
-    if (env->cleanwin < env->nwindows - 1)
+    if (env->cleanwin < env->nwindows - 1) {
         env->cleanwin++;
+    }
     env->cansave--;
 #else
     env->wim = new_wim;
@@ -368,11 +373,13 @@ static void flush_windows(CPUSPARCState *env)
         /* if restore would invoke restore_window(), then we can stop */
         cwp1 = cpu_cwp_inc(env, env->cwp + offset);
 #ifndef TARGET_SPARC64
-        if (env->wim & (1 << cwp1))
+        if (env->wim & (1 << cwp1)) {
             break;
+        }
 #else
-        if (env->canrestore == 0)
+        if (env->canrestore == 0) {
             break;
+        }
         env->cansave++;
         env->canrestore--;
 #endif
@@ -407,8 +414,9 @@ void cpu_loop(CPUSPARCState *env)
 #else
         /* FreeBSD uses 0x141 for syscalls too */
         case 0x141:
-            if (bsd_type != target_freebsd)
+            if (bsd_type != target_freebsd) {
                 goto badtrap;
+            }
             /* fallthrough */
         case 0x100:
 #endif
@@ -417,7 +425,8 @@ void cpu_loop(CPUSPARCState *env)
                 ret = do_freebsd_syscall(env, syscall_nr,
                                          env->regwptr[0], env->regwptr[1],
                                          env->regwptr[2], env->regwptr[3],
-                                         env->regwptr[4], env->regwptr[5], 0, 0);
+                                         env->regwptr[4], env->regwptr[5],
+                                         0, 0);
             else if (bsd_type == target_netbsd)
                 ret = do_netbsd_syscall(env, syscall_nr,
                                         env->regwptr[0], env->regwptr[1],
@@ -610,8 +619,9 @@ int main(int argc, char **argv)
     envlist_t *envlist = NULL;
     bsd_type = target_openbsd;
 
-    if (argc <= 1)
+    if (argc <= 1) {
         usage();
+    }
 
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
@@ -631,11 +641,13 @@ int main(int argc, char **argv)
 
     optind = 1;
     for (;;) {
-        if (optind >= argc)
+        if (optind >= argc) {
             break;
+        }
         r = argv[optind];
-        if (r[0] != '-')
+        if (r[0] != '-') {
             break;
+        }
         optind++;
         r++;
         if (!strcmp(r, "-")) {
@@ -652,24 +664,28 @@ int main(int argc, char **argv)
             log_file = argv[optind++];
         } else if (!strcmp(r, "E")) {
             r = argv[optind++];
-            if (envlist_setenv(envlist, r) != 0)
+            if (envlist_setenv(envlist, r) != 0) {
                 usage();
+            }
         } else if (!strcmp(r, "ignore-environment")) {
             envlist_free(envlist);
             envlist = envlist_create();
         } else if (!strcmp(r, "U")) {
             r = argv[optind++];
-            if (envlist_unsetenv(envlist, r) != 0)
+            if (envlist_unsetenv(envlist, r) != 0) {
                 usage();
+            }
         } else if (!strcmp(r, "s")) {
             r = argv[optind++];
             x86_stack_size = strtol(r, (char **)&r, 0);
-            if (x86_stack_size <= 0)
+            if (x86_stack_size <= 0) {
                 usage();
-            if (*r == 'M')
+            }
+            if (*r == 'M') {
                 x86_stack_size *= MiB;
-            else if (*r == 'k' || *r == 'K')
+            } else if (*r == 'k' || *r == 'K') {
                 x86_stack_size *= KiB;
+            }
         } else if (!strcmp(r, "L")) {
             interp_prefix = argv[optind++];
         } else if (!strcmp(r, "p")) {
@@ -809,11 +825,13 @@ int main(int argc, char **argv)
     if (!have_guest_base) {
         FILE *fp;
 
-        if ((fp = fopen("/proc/sys/vm/mmap_min_addr", "r")) != NULL) {
+        fp = fopen("/proc/sys/vm/mmap_min_addr", "r");
+        if (fp != NULL) {
             unsigned long tmp;
             if (fscanf(fp, "%lu", &tmp) == 1) {
                 mmap_min_addr = tmp;
-                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n", mmap_min_addr);
+                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
+                              mmap_min_addr);
             }
             fclose(fp);
         }
@@ -986,10 +1004,12 @@ int main(int argc, char **argv)
         env->pc = regs->pc;
         env->npc = regs->npc;
         env->y = regs->y;
-        for (i = 0; i < 8; i++)
+        for (i = 0; i < 8; i++) {
             env->gregs[i] = regs->u_regs[i];
-        for (i = 0; i < 8; i++)
+        }
+        for (i = 0; i < 8; i++) {
             env->regwptr[i] = regs->u_regs[i + 8];
+        }
     }
 #else
 #error unsupported target CPU
-- 
2.22.1


