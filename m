Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2118736A202
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:17:13 +0200 (CEST)
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKy0-0008Ak-4F
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiL-0005d8-8l
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:10 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi4-0004G5-ET
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:59 -0400
Received: by mail-il1-x12a.google.com with SMTP id l19so2612382ilk.13
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqvL7SBx52oX7eGuRLboo8MvR/9/Fu4t1g4WpvQPaco=;
 b=cXxC3sBk+C8hj4IM1ty+yoye5+QaGRTGxqujPSUNaBaAh/7VCiIHTCgig68wC3l0YX
 hPsn0qboRplRRnlExM5QWMOFO8Q7BjneRrePnnjKO+5ZMFO9kGpzp4UDK/l/t/UzLT6P
 QuvbKRJ0ScUT4bCfd95Tea+PSduCpHtUCdxrE/3T7KaJbAbpZqLHbEcqiSXzPoJQ9HxY
 JhbWmS7Sspx+L2C8ses18+hXQtSQxdwEtbqsik91gld/OIs2MnfjC3YIuznNStvOzcLK
 QK0EyVAZyyTBlEXCvmwCJrNdX8tSrsHlY2LSxeQkJV2H5B5h/N82gG4ghxTpQYfvOyaR
 NZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqvL7SBx52oX7eGuRLboo8MvR/9/Fu4t1g4WpvQPaco=;
 b=S9akepqpkRSMUZg/nd5ruidvItB8LL1CfKLn95PKvTaUqq/zlF4WpvN6g2oojJzGiP
 f5pBphb5b31Gek3L0kcC0cQJUT63ry417gYZ1Fp1bCPsRonuvbElHwlm+DHemwdwsitN
 ensWjuxEh8PICmVlAM1odOBqXMmfU+7o1CaUtAbgRjPhqDJ1A6whH407vOIcEnlV/mhn
 hbnp0HF2bm4ATvqT4zQ29SrPO2Jdvqd/Qh5fJ2ZECqqJj8EVUiQQ6SA9q3lsYASDzs0B
 HKnVHhHlOO83JzjIpELtqkS+d8hjoG3UeOVZbeglHgaBISAZz96j3qqwk9a3H7mv+IKA
 t4Aw==
X-Gm-Message-State: AOAM533bFVz+nr/c0PL/lfwRmDMkJfHGTxzjUOtnvsOcWamgxSyOZpWm
 4XZ05quUGC4g97UqD+yZ9J2X6pSwPVfFultn
X-Google-Smtp-Source: ABdhPJw0syvNF3D+E6wzmjQVFYKL8czV4vGdfKVBLI8L+st98yFPvbSQJ6gRgxjXEcA+cfH+sQUC3Q==
X-Received: by 2002:a05:6e02:154d:: with SMTP id
 j13mr6787216ilu.46.1619280043016; 
 Sat, 24 Apr 2021 09:00:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:42 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/48] bsd-user: style tweak: use {} consistently in for /
 if / else statements
Date: Sat, 24 Apr 2021 09:59:48 -0600
Message-Id: <20210424160016.15200-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Fix various issues with {} not being present on if / for statements.
Minor line length tweaks
Move an assignment in an if out.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 66 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 1b5d815c3a..8f5cb7162d 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -218,7 +218,7 @@ void cpu_loop(CPUX86State *env)
 #ifndef TARGET_ABI32
         case EXCP_SYSCALL:
             /* syscall from syscall instruction */
-            if (bsd_type == target_freebsd)
+            if (bsd_type == target_freebsd) {
                 env->regs[R_EAX] = do_freebsd_syscall(env,
                                                       env->regs[R_EAX],
                                                       env->regs[R_EDI],
@@ -227,7 +227,7 @@ void cpu_loop(CPUX86State *env)
                                                       env->regs[R_ECX],
                                                       env->regs[8],
                                                       env->regs[9], 0, 0);
-            else { /* if (bsd_type == target_openbsd) */
+            } else { /* if (bsd_type == target_openbsd) */
                 env->regs[R_EAX] = do_openbsd_syscall(env,
                                                       env->regs[R_EAX],
                                                       env->regs[R_EDI],
@@ -251,7 +251,8 @@ void cpu_loop(CPUX86State *env)
             break;
         default:
             pc = env->segs[R_CS].base + env->eip;
-            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
+            fprintf(stderr,
+                    "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
                     (long)pc, trapnr);
             abort();
         }
@@ -275,8 +276,9 @@ static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
      * wrap handling : if cwp is on the last window, then we use the
      * registers 'after' the end
      */
-    if (index < 8 && env->cwp == env->nwindows - 1)
+    if (index < 8 && env->cwp == env->nwindows - 1) {
         index += 16 * env->nwindows;
+    }
     return index;
 }
 
@@ -288,8 +290,9 @@ static inline void save_window_offset(CPUSPARCState *env, int cwp1)
 
     sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
 #ifdef TARGET_SPARC64
-    if (sp_ptr & 3)
+    if (sp_ptr & 3) {
         sp_ptr += SPARC64_STACK_BIAS;
+    }
 #endif
 #if defined(DEBUG_WIN)
     printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
@@ -338,8 +341,9 @@ static void restore_window(CPUSPARCState *env)
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
@@ -352,8 +356,9 @@ static void restore_window(CPUSPARCState *env)
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
@@ -369,11 +374,13 @@ static void flush_windows(CPUSPARCState *env)
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
@@ -408,8 +415,9 @@ void cpu_loop(CPUSPARCState *env)
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
@@ -418,7 +426,8 @@ void cpu_loop(CPUSPARCState *env)
                 ret = do_freebsd_syscall(env, syscall_nr,
                                          env->regwptr[0], env->regwptr[1],
                                          env->regwptr[2], env->regwptr[3],
-                                         env->regwptr[4], env->regwptr[5], 0, 0);
+                                         env->regwptr[4], env->regwptr[5],
+                                         0, 0);
             else if (bsd_type == target_netbsd)
                 ret = do_netbsd_syscall(env, syscall_nr,
                                         env->regwptr[0], env->regwptr[1],
@@ -611,8 +620,9 @@ int main(int argc, char **argv)
     envlist_t *envlist = NULL;
     bsd_type = target_openbsd;
 
-    if (argc <= 1)
+    if (argc <= 1) {
         usage();
+    }
 
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
@@ -632,11 +642,13 @@ int main(int argc, char **argv)
 
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
@@ -653,24 +665,28 @@ int main(int argc, char **argv)
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
@@ -810,11 +826,13 @@ int main(int argc, char **argv)
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
@@ -987,10 +1005,12 @@ int main(int argc, char **argv)
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


