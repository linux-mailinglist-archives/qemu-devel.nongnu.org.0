Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1459A369BA6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:56:23 +0200 (CEST)
Received: from localhost ([::1]:60884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2qc-0001V9-4d
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2bF-0005zh-Ql
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:29 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b3-0008CX-U3
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:26 -0400
Received: by mail-il1-x133.google.com with SMTP id e14so18025728ils.12
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrC/EBQo3vDpMAfJHbws2Iuw1OCGYzSSu4/URs0LFtg=;
 b=F0Izg5xy9ySgegwVG87g3DFcwh1hywzHrqNsidOphmFBaFWWGYA9dlMY6Gh8BUQepu
 zdlM26dYDNn9+TUDuAiMUbcbnuO3CcqsAl0ReUIbtGjJyDE99XlBndjnx2QRQM1ZeMIX
 bTd54yaQJkA5QT5dgvLE3glbKA7GL05TsmoZmWuZ/VPGNFyutU1ii7aDB+aBoW0vsyOV
 srsdZGd65i5ZWPES/IeB7GPW97NosfwRG7ViUktTio51qcyCLMMLQ/SIeWPM+1V5OUf/
 EjS1PBwnR4WZc8ujquHZQ209nT0CP0i4KgHE3RKFv0HdxQyVzYLe6bankmsfRJ/+Hd8N
 8+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrC/EBQo3vDpMAfJHbws2Iuw1OCGYzSSu4/URs0LFtg=;
 b=QGVmuy85fOSe6y3aQVqPLhEO6XMYsB8xg0kpJ0WW3tUhLsE6vIzNqtOjB5Ww7ubzGJ
 z7OTehQeYBRdUfkeSEc7CeVAXKuATASoo62vGAX8UmDIcySEwbLnmg8jcibpYfCGbRcd
 46HR/faij1dcPmYiuLzECjfrJNxQZoyQzXhz+LXgNLv21qU+QD0BR5qoYjEkDQvlGYo+
 sxFQ5m6iqXjGZilB4x2P1jucgeO5OdEGl6/nDxAVvkvoSKAHioL5+N5pziMNZMMJJ7IV
 UvNghLu6lJjo/gG38+ImzTvw6N4jCdgn5UEdl2EqNlox65D8w2GLeT33H3FnVSle+dCT
 RV4Q==
X-Gm-Message-State: AOAM530Q6CCZXQU64JPZJiI8r5pkZptR5vmGaQty4FN3TNfgGT+27iy6
 Q0OSEASselMfco7mobyBrW/7MmGQxkGIpwML
X-Google-Smtp-Source: ABdhPJwviWGhhlVkj65y21PjlDBEYF0lgva6oSoo5sEtLdml416pYCnwQ18re9a4vLm/o7JW6yR+Uw==
X-Received: by 2002:a05:6e02:1c06:: with SMTP id
 l6mr4422821ilh.185.1619210416255; 
 Fri, 23 Apr 2021 13:40:16 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:15 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 18/24] bsd-user: style changes for {}
Date: Fri, 23 Apr 2021 14:39:53 -0600
Message-Id: <20210423203959.78275-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Fix various issues with {} not being present on if / for / case statements.
Tweak indentation where needed to appease checkpatch after this.
Minor line length tweaks

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 100 +++++++++++++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 40 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index a94ab63065..69e5525607 100644
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
@@ -273,10 +273,11 @@ void cpu_loop(CPUX86State *env)
         case EXCP0E_PAGE:
             info.si_signo = SIGSEGV;
             info.si_errno = 0;
-            if (!(env->error_code & 1))
+            if (!(env->error_code & 1)) {
                 info.si_code = TARGET_SEGV_MAPERR;
-            else
+            } else {
                 info.si_code = TARGET_SEGV_ACCERR;
+            }
             info._sifields._sigfault._addr = env->cr[2];
             queue_signal(env, info.si_signo, &info);
             break;
@@ -343,23 +344,23 @@ void cpu_loop(CPUX86State *env)
             break;
 #ifdef notyet
         case EXCP_DEBUG:
-            {
-                int sig;
+        {
+            int sig;
 
-                sig = gdb_handlesig(env, TARGET_SIGTRAP);
-                if (sig)
-                  {
-                    info.si_signo = sig;
-                    info.si_errno = 0;
-                    info.si_code = TARGET_TRAP_BRKPT;
-                    queue_signal(env, info.si_signo, &info);
-                  }
+            sig = gdb_handlesig(env, TARGET_SIGTRAP);
+            if (sig) {
+                info.si_signo = sig;
+                info.si_errno = 0;
+                info.si_code = TARGET_TRAP_BRKPT;
+                queue_signal(env, info.si_signo, &info);
             }
             break;
+        }
 #endif
         default:
             pc = env->segs[R_CS].base + env->eip;
-            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
+            fprintf(stderr,
+                    "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
                     (long)pc, trapnr);
             abort();
         }
@@ -383,8 +384,9 @@ static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
      * wrap handling : if cwp is on the last window, then we use the
      * registers 'after' the end
      */
-    if (index < 8 && env->cwp == env->nwindows - 1)
+    if (index < 8 && env->cwp == env->nwindows - 1) {
         index += 16 * env->nwindows;
+    }
     return index;
 }
 
@@ -396,8 +398,9 @@ static inline void save_window_offset(CPUSPARCState *env, int cwp1)
 
     sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
 #ifdef TARGET_SPARC64
-    if (sp_ptr & 3)
+    if (sp_ptr & 3) {
         sp_ptr += SPARC64_STACK_BIAS;
+    }
 #endif
 #if defined(DEBUG_WIN)
     printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
@@ -446,8 +449,9 @@ static void restore_window(CPUSPARCState *env)
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
@@ -460,8 +464,9 @@ static void restore_window(CPUSPARCState *env)
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
@@ -477,11 +482,13 @@ static void flush_windows(CPUSPARCState *env)
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
@@ -516,8 +523,9 @@ void cpu_loop(CPUSPARCState *env)
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
@@ -526,7 +534,8 @@ void cpu_loop(CPUSPARCState *env)
                 ret = do_freebsd_syscall(env, syscall_nr,
                                          env->regwptr[0], env->regwptr[1],
                                          env->regwptr[2], env->regwptr[3],
-                                         env->regwptr[4], env->regwptr[5], 0, 0);
+                                         env->regwptr[4], env->regwptr[5],
+                                         0, 0);
             else if (bsd_type == target_netbsd)
                 ret = do_netbsd_syscall(env, syscall_nr,
                                         env->regwptr[0], env->regwptr[1],
@@ -620,10 +629,11 @@ void cpu_loop(CPUSPARCState *env)
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
-                if (trapnr == TT_DFAULT)
+                if (trapnr == TT_DFAULT) {
                     info._sifields._sigfault._addr = env->dmmuregs[4];
-                else
+                } else {
                     info._sifields._sigfault._addr = env->tsptr->tpc;
+                }
                 /* queue_signal(env, info.si_signo, &info); */
             }
 #endif
@@ -639,13 +649,12 @@ void cpu_loop(CPUSPARCState *env)
 #endif
                 gdb_handlesig(cs, TARGET_SIGTRAP);
 #ifdef notyet
-                if (sig)
-                  {
+                if (sig) {
                     info.si_signo = sig;
                     info.si_errno = 0;
                     info.si_code = TARGET_TRAP_BRKPT;
                     /* queue_signal(env, info.si_signo, &info); */
-                  }
+                }
 #endif
             }
             break;
@@ -754,8 +763,9 @@ int main(int argc, char **argv)
     envlist_t *envlist = NULL;
     bsd_type = target_openbsd;
 
-    if (argc <= 1)
+    if (argc <= 1) {
         usage();
+    }
 
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
@@ -775,11 +785,13 @@ int main(int argc, char **argv)
 
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
@@ -796,24 +808,28 @@ int main(int argc, char **argv)
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
@@ -953,11 +969,13 @@ int main(int argc, char **argv)
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
@@ -1130,10 +1148,12 @@ int main(int argc, char **argv)
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


