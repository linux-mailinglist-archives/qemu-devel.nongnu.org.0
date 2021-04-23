Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC490369B8F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:50:36 +0200 (CEST)
Received: from localhost ([::1]:39088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2l2-0000eC-06
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2bN-000633-FY
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:37 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2bB-0008Fk-O3
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:36 -0400
Received: by mail-il1-x12a.google.com with SMTP id c4so15204786ilq.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pQZxDIVBuSYLHNecJKjQ2VuvLn3vixt7uU0o/CpnGyY=;
 b=uWBRbqWa8GiahmTjrzajdyIrHYZOryUiuR6OM8RO0BsJfNxP+fRW4QlYSQM5Lhk8Fe
 2lt1gdP0M7wopCNZSS96II00Q/1Z3jEFUS6WjaFp6+f1+No7RkGQ23nY3Dr5fEIQgv3Y
 pGn1RHxcvJGX7h45s2FOBIaG/BmE+Z19q56+/x2qy4wou7Bg8kZrsPB2feS+uCBwBXIB
 n9eaVW+0iUzARaBC7A2v7O6Vlp0eLdGwgagwJ3w5MHKyunC1GG/SA2SgB8Zqba+E1+rG
 /kvU6inve2PD/uutFl7NPs0R7Ywn/xUxoF/S/3LgTNBbTmCiwd7fnRg+eB41LF7nEKv7
 ccUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pQZxDIVBuSYLHNecJKjQ2VuvLn3vixt7uU0o/CpnGyY=;
 b=OK3XARQ009AvFcWw1a2Yj5PJ45S36a07GQpNTwmPPsfLnppi4yPMxc8iIzNusf647f
 83OXlrNXgeEGqbMrNRtSWopD6YuSeJwEwdDo8FuNnm27PaXlceWUmmNuogMx/Jf55GsG
 iMcMfsq0lgU+iTwvmsum4Qa7lj2RpJ6T35wdL+qCDF8uWGfYXF8fzvvj5EUNOn9lyInA
 Vh09kXZ3IZxvQkhrNJohvKFcNkM1isoN6l5HiNhy+O//fudXsUTQeW2bqWpsdmwls0m+
 MnsPDGinv/iJWUslTrwDHiWjFG3HftTKCbbMpTIvrLi5H1F33H2AZ1q9OxWkzaCAI+tD
 kOjw==
X-Gm-Message-State: AOAM532sODHSwNR66RSKHShKEnBlC2XghTXZkiDXEjJsrgHc3WTyMkre
 1K8uM8budwH8AHZhkqOSIs3yUKCzetJuuw3v
X-Google-Smtp-Source: ABdhPJzZkP/AcyeDoGNszw54Flv+hq7wqs4tKV619KgOFInBnJd4/czU6wO6DGgQH3+K64FqhYEtzw==
X-Received: by 2002:a05:6e02:d51:: with SMTP id
 h17mr4426624ilj.134.1619210422178; 
 Fri, 23 Apr 2021 13:40:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:21 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 24/24] bsd-user: move sparc cpu_loop into target_arch_cpu.h as
 target_cpu_loop
Date: Fri, 23 Apr 2021 14:39:59 -0600
Message-Id: <20210423203959.78275-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Move the sparc cpu_loop out of main.c and into target_arch_cpu.h and
rename it from cpu_loop to target_cpu_loop. Remove the #ifdef around
the catch-all cpu_loop.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c                  | 305 -------------------------------
 bsd-user/sparc/target_arch_cpu.h | 300 ++++++++++++++++++++++++++++++
 2 files changed, 300 insertions(+), 305 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 3ebfa9425d..5791c3a641 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -87,315 +87,10 @@ void fork_end(int child)
     }
 }
 
-#ifdef TARGET_I386 /* stopgap ifdef */
 void cpu_loop(CPUArchState *env)
 {
     target_cpu_loop(env);
 }
-#endif
-
-#ifdef TARGET_SPARC
-#define SPARC64_STACK_BIAS 2047
-
-/* #define DEBUG_WIN */
-/*
- * WARNING: dealing with register windows _is_ complicated. More info
- * can be found at http://www.sics.se/~psm/sparcstack.html
- */
-static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
-{
-    index = (index + cwp * 16) % (16 * env->nwindows);
-    /*
-     * wrap handling : if cwp is on the last window, then we use the
-     * registers 'after' the end
-     */
-    if (index < 8 && env->cwp == env->nwindows - 1) {
-        index += 16 * env->nwindows;
-    }
-    return index;
-}
-
-/* save the register window 'cwp1' */
-static inline void save_window_offset(CPUSPARCState *env, int cwp1)
-{
-    unsigned int i;
-    abi_ulong sp_ptr;
-
-    sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
-#ifdef TARGET_SPARC64
-    if (sp_ptr & 3) {
-        sp_ptr += SPARC64_STACK_BIAS;
-    }
-#endif
-#if defined(DEBUG_WIN)
-    printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
-           sp_ptr, cwp1);
-#endif
-    for (i = 0; i < 16; i++) {
-        /* FIXME - what to do if put_user() fails? */
-        put_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
-        sp_ptr += sizeof(abi_ulong);
-    }
-}
-
-static void save_window(CPUSPARCState *env)
-{
-#ifndef TARGET_SPARC64
-    unsigned int new_wim;
-    new_wim = ((env->wim >> 1) | (env->wim << (env->nwindows - 1))) &
-        ((1LL << env->nwindows) - 1);
-    save_window_offset(env, cpu_cwp_dec(env, env->cwp - 2));
-    env->wim = new_wim;
-#else
-    /*
-     * cansave is zero if the spill trap handler is triggered by `save` and
-     * nonzero if triggered by a `flushw`
-     */
-    save_window_offset(env, cpu_cwp_dec(env, env->cwp - env->cansave - 2));
-    env->cansave++;
-    env->canrestore--;
-#endif
-}
-
-static void restore_window(CPUSPARCState *env)
-{
-#ifndef TARGET_SPARC64
-    unsigned int new_wim;
-#endif
-    unsigned int i, cwp1;
-    abi_ulong sp_ptr;
-
-#ifndef TARGET_SPARC64
-    new_wim = ((env->wim << 1) | (env->wim >> (env->nwindows - 1))) &
-        ((1LL << env->nwindows) - 1);
-#endif
-
-    /* restore the invalid window */
-    cwp1 = cpu_cwp_inc(env, env->cwp + 1);
-    sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
-#ifdef TARGET_SPARC64
-    if (sp_ptr & 3) {
-        sp_ptr += SPARC64_STACK_BIAS;
-    }
-#endif
-#if defined(DEBUG_WIN)
-    printf("win_underflow: sp_ptr=0x" TARGET_ABI_FMT_lx " load_cwp=%d\n",
-           sp_ptr, cwp1);
-#endif
-    for (i = 0; i < 16; i++) {
-        /* FIXME - what to do if get_user() fails? */
-        get_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
-        sp_ptr += sizeof(abi_ulong);
-    }
-#ifdef TARGET_SPARC64
-    env->canrestore++;
-    if (env->cleanwin < env->nwindows - 1) {
-        env->cleanwin++;
-    }
-    env->cansave--;
-#else
-    env->wim = new_wim;
-#endif
-}
-
-static void flush_windows(CPUSPARCState *env)
-{
-    int offset, cwp1;
-
-    offset = 1;
-    for (;;) {
-        /* if restore would invoke restore_window(), then we can stop */
-        cwp1 = cpu_cwp_inc(env, env->cwp + offset);
-#ifndef TARGET_SPARC64
-        if (env->wim & (1 << cwp1)) {
-            break;
-        }
-#else
-        if (env->canrestore == 0) {
-            break;
-        }
-        env->cansave++;
-        env->canrestore--;
-#endif
-        save_window_offset(env, cwp1);
-        offset++;
-    }
-    cwp1 = cpu_cwp_inc(env, env->cwp + 1);
-#ifndef TARGET_SPARC64
-    /* set wim so that restore will reload the registers */
-    env->wim = 1 << cwp1;
-#endif
-#if defined(DEBUG_WIN)
-    printf("flush_windows: nb=%d\n", offset - 1);
-#endif
-}
-
-void cpu_loop(CPUSPARCState *env)
-{
-    CPUState *cs = env_cpu(env);
-    int trapnr, ret, syscall_nr;
-    /* target_siginfo_t info; */
-
-    while (1) {
-        cpu_exec_start(cs);
-        trapnr = cpu_exec(cs);
-        cpu_exec_end(cs);
-        process_queued_cpu_work(cs);
-
-        switch (trapnr) {
-#ifndef TARGET_SPARC64
-        case 0x80:
-#else
-        /* FreeBSD uses 0x141 for syscalls too */
-        case 0x141:
-            if (bsd_type != target_freebsd) {
-                goto badtrap;
-            }
-            /* fallthrough */
-        case 0x100:
-#endif
-            syscall_nr = env->gregs[1];
-            if (bsd_type == target_freebsd)
-                ret = do_freebsd_syscall(env, syscall_nr,
-                                         env->regwptr[0], env->regwptr[1],
-                                         env->regwptr[2], env->regwptr[3],
-                                         env->regwptr[4], env->regwptr[5],
-                                         0, 0);
-            else if (bsd_type == target_netbsd)
-                ret = do_netbsd_syscall(env, syscall_nr,
-                                        env->regwptr[0], env->regwptr[1],
-                                        env->regwptr[2], env->regwptr[3],
-                                        env->regwptr[4], env->regwptr[5]);
-            else { /* if (bsd_type == target_openbsd) */
-#if defined(TARGET_SPARC64)
-                syscall_nr &= ~(TARGET_OPENBSD_SYSCALL_G7RFLAG |
-                                TARGET_OPENBSD_SYSCALL_G2RFLAG);
-#endif
-                ret = do_openbsd_syscall(env, syscall_nr,
-                                         env->regwptr[0], env->regwptr[1],
-                                         env->regwptr[2], env->regwptr[3],
-                                         env->regwptr[4], env->regwptr[5]);
-            }
-            if ((unsigned int)ret >= (unsigned int)(-515)) {
-                ret = -ret;
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-                env->xcc |= PSR_CARRY;
-#else
-                env->psr |= PSR_CARRY;
-#endif
-            } else {
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-                env->xcc &= ~PSR_CARRY;
-#else
-                env->psr &= ~PSR_CARRY;
-#endif
-            }
-            env->regwptr[0] = ret;
-            /* next instruction */
-#if defined(TARGET_SPARC64)
-            if (bsd_type == target_openbsd &&
-                env->gregs[1] & TARGET_OPENBSD_SYSCALL_G2RFLAG) {
-                env->pc = env->gregs[2];
-                env->npc = env->pc + 4;
-            } else if (bsd_type == target_openbsd &&
-                       env->gregs[1] & TARGET_OPENBSD_SYSCALL_G7RFLAG) {
-                env->pc = env->gregs[7];
-                env->npc = env->pc + 4;
-            } else {
-                env->pc = env->npc;
-                env->npc = env->npc + 4;
-            }
-#else
-            env->pc = env->npc;
-            env->npc = env->npc + 4;
-#endif
-            break;
-        case 0x83: /* flush windows */
-#ifdef TARGET_ABI32
-        case 0x103:
-#endif
-            flush_windows(env);
-            /* next instruction */
-            env->pc = env->npc;
-            env->npc = env->npc + 4;
-            break;
-#ifndef TARGET_SPARC64
-        case TT_WIN_OVF: /* window overflow */
-            save_window(env);
-            break;
-        case TT_WIN_UNF: /* window underflow */
-            restore_window(env);
-            break;
-        case TT_TFAULT:
-        case TT_DFAULT:
-#ifdef notyet
-            {
-                info.si_signo = SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmuregs[4];
-                queue_signal(env, info.si_signo, &info);
-            }
-#endif
-            break;
-#else
-        case TT_SPILL: /* window overflow */
-            save_window(env);
-            break;
-        case TT_FILL: /* window underflow */
-            restore_window(env);
-            break;
-        case TT_TFAULT:
-        case TT_DFAULT:
-#ifdef notyet
-            {
-                info.si_signo = SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                if (trapnr == TT_DFAULT) {
-                    info._sifields._sigfault._addr = env->dmmuregs[4];
-                } else {
-                    info._sifields._sigfault._addr = env->tsptr->tpc;
-                }
-                /* queue_signal(env, info.si_signo, &info); */
-            }
-#endif
-            break;
-#endif
-        case EXCP_INTERRUPT:
-            /* just indicate that signals should be handled asap */
-            break;
-        case EXCP_DEBUG:
-            {
-#ifdef notyet
-                int sig =
-#endif
-                gdb_handlesig(cs, TARGET_SIGTRAP);
-#ifdef notyet
-                if (sig) {
-                    info.si_signo = sig;
-                    info.si_errno = 0;
-                    info.si_code = TARGET_TRAP_BRKPT;
-                    /* queue_signal(env, info.si_signo, &info); */
-                }
-#endif
-            }
-            break;
-        default:
-#ifdef TARGET_SPARC64
-        badtrap:
-#endif
-            printf("Unhandled trap: 0x%x\n", trapnr);
-            cpu_dump_state(cs, stderr, 0);
-            exit(1);
-        }
-        process_pending_signals(env);
-    }
-}
-
-#endif
 
 static void usage(void)
 {
diff --git a/bsd-user/sparc/target_arch_cpu.h b/bsd-user/sparc/target_arch_cpu.h
index dcf7694cba..c2b9c2480e 100644
--- a/bsd-user/sparc/target_arch_cpu.h
+++ b/bsd-user/sparc/target_arch_cpu.h
@@ -19,4 +19,304 @@
 #ifndef _TARGET_ARCH_CPU_H_
 #define _TARGET_ARCH_CPU_H_
 
+#define SPARC64_STACK_BIAS 2047
+
+/* #define DEBUG_WIN */
+/*
+ * WARNING: dealing with register windows _is_ complicated. More info
+ * can be found at http://www.sics.se/~psm/sparcstack.html
+ */
+static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
+{
+    index = (index + cwp * 16) % (16 * env->nwindows);
+    /*
+     * wrap handling : if cwp is on the last window, then we use the
+     * registers 'after' the end
+     */
+    if (index < 8 && env->cwp == env->nwindows - 1) {
+        index += 16 * env->nwindows;
+    }
+    return index;
+}
+
+/* save the register window 'cwp1' */
+static inline void save_window_offset(CPUSPARCState *env, int cwp1)
+{
+    unsigned int i;
+    abi_ulong sp_ptr;
+
+    sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
+#ifdef TARGET_SPARC64
+    if (sp_ptr & 3) {
+        sp_ptr += SPARC64_STACK_BIAS;
+    }
+#endif
+#if defined(DEBUG_WIN)
+    printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
+           sp_ptr, cwp1);
+#endif
+    for (i = 0; i < 16; i++) {
+        /* FIXME - what to do if put_user() fails? */
+        put_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
+        sp_ptr += sizeof(abi_ulong);
+    }
+}
+
+static void save_window(CPUSPARCState *env)
+{
+#ifndef TARGET_SPARC64
+    unsigned int new_wim;
+    new_wim = ((env->wim >> 1) | (env->wim << (env->nwindows - 1))) &
+        ((1LL << env->nwindows) - 1);
+    save_window_offset(env, cpu_cwp_dec(env, env->cwp - 2));
+    env->wim = new_wim;
+#else
+    /*
+     * cansave is zero if the spill trap handler is triggered by `save` and
+     * nonzero if triggered by a `flushw`
+     */
+    save_window_offset(env, cpu_cwp_dec(env, env->cwp - env->cansave - 2));
+    env->cansave++;
+    env->canrestore--;
+#endif
+}
+
+static void restore_window(CPUSPARCState *env)
+{
+#ifndef TARGET_SPARC64
+    unsigned int new_wim;
+#endif
+    unsigned int i, cwp1;
+    abi_ulong sp_ptr;
+
+#ifndef TARGET_SPARC64
+    new_wim = ((env->wim << 1) | (env->wim >> (env->nwindows - 1))) &
+        ((1LL << env->nwindows) - 1);
+#endif
+
+    /* restore the invalid window */
+    cwp1 = cpu_cwp_inc(env, env->cwp + 1);
+    sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
+#ifdef TARGET_SPARC64
+    if (sp_ptr & 3) {
+        sp_ptr += SPARC64_STACK_BIAS;
+    }
+#endif
+#if defined(DEBUG_WIN)
+    printf("win_underflow: sp_ptr=0x" TARGET_ABI_FMT_lx " load_cwp=%d\n",
+           sp_ptr, cwp1);
+#endif
+    for (i = 0; i < 16; i++) {
+        /* FIXME - what to do if get_user() fails? */
+        get_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
+        sp_ptr += sizeof(abi_ulong);
+    }
+#ifdef TARGET_SPARC64
+    env->canrestore++;
+    if (env->cleanwin < env->nwindows - 1) {
+        env->cleanwin++;
+    }
+    env->cansave--;
+#else
+    env->wim = new_wim;
+#endif
+}
+
+static void flush_windows(CPUSPARCState *env)
+{
+    int offset, cwp1;
+
+    offset = 1;
+    for (;;) {
+        /* if restore would invoke restore_window(), then we can stop */
+        cwp1 = cpu_cwp_inc(env, env->cwp + offset);
+#ifndef TARGET_SPARC64
+        if (env->wim & (1 << cwp1)) {
+            break;
+        }
+#else
+        if (env->canrestore == 0) {
+            break;
+        }
+        env->cansave++;
+        env->canrestore--;
+#endif
+        save_window_offset(env, cwp1);
+        offset++;
+    }
+    cwp1 = cpu_cwp_inc(env, env->cwp + 1);
+#ifndef TARGET_SPARC64
+    /* set wim so that restore will reload the registers */
+    env->wim = 1 << cwp1;
+#endif
+#if defined(DEBUG_WIN)
+    printf("flush_windows: nb=%d\n", offset - 1);
+#endif
+}
+
+void target_cpu_loop(CPUSPARCState *env)
+{
+    CPUState *cs = env_cpu(env);
+    int trapnr, ret, syscall_nr;
+    /* target_siginfo_t info; */
+
+    while (1) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+
+        switch (trapnr) {
+#ifndef TARGET_SPARC64
+        case 0x80:
+#else
+        /* FreeBSD uses 0x141 for syscalls too */
+        case 0x141:
+            if (bsd_type != target_freebsd) {
+                goto badtrap;
+            }
+            /* fallthrough */
+        case 0x100:
+#endif
+            syscall_nr = env->gregs[1];
+            if (bsd_type == target_freebsd)
+                ret = do_freebsd_syscall(env, syscall_nr,
+                                         env->regwptr[0], env->regwptr[1],
+                                         env->regwptr[2], env->regwptr[3],
+                                         env->regwptr[4], env->regwptr[5],
+                                         0, 0);
+            else if (bsd_type == target_netbsd)
+                ret = do_netbsd_syscall(env, syscall_nr,
+                                        env->regwptr[0], env->regwptr[1],
+                                        env->regwptr[2], env->regwptr[3],
+                                        env->regwptr[4], env->regwptr[5]);
+            else { /* if (bsd_type == target_openbsd) */
+#if defined(TARGET_SPARC64)
+                syscall_nr &= ~(TARGET_OPENBSD_SYSCALL_G7RFLAG |
+                                TARGET_OPENBSD_SYSCALL_G2RFLAG);
+#endif
+                ret = do_openbsd_syscall(env, syscall_nr,
+                                         env->regwptr[0], env->regwptr[1],
+                                         env->regwptr[2], env->regwptr[3],
+                                         env->regwptr[4], env->regwptr[5]);
+            }
+            if ((unsigned int)ret >= (unsigned int)(-515)) {
+                ret = -ret;
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+                env->xcc |= PSR_CARRY;
+#else
+                env->psr |= PSR_CARRY;
+#endif
+            } else {
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+                env->xcc &= ~PSR_CARRY;
+#else
+                env->psr &= ~PSR_CARRY;
+#endif
+            }
+            env->regwptr[0] = ret;
+            /* next instruction */
+#if defined(TARGET_SPARC64)
+            if (bsd_type == target_openbsd &&
+                env->gregs[1] & TARGET_OPENBSD_SYSCALL_G2RFLAG) {
+                env->pc = env->gregs[2];
+                env->npc = env->pc + 4;
+            } else if (bsd_type == target_openbsd &&
+                       env->gregs[1] & TARGET_OPENBSD_SYSCALL_G7RFLAG) {
+                env->pc = env->gregs[7];
+                env->npc = env->pc + 4;
+            } else {
+                env->pc = env->npc;
+                env->npc = env->npc + 4;
+            }
+#else
+            env->pc = env->npc;
+            env->npc = env->npc + 4;
+#endif
+            break;
+        case 0x83: /* flush windows */
+#ifdef TARGET_ABI32
+        case 0x103:
+#endif
+            flush_windows(env);
+            /* next instruction */
+            env->pc = env->npc;
+            env->npc = env->npc + 4;
+            break;
+#ifndef TARGET_SPARC64
+        case TT_WIN_OVF: /* window overflow */
+            save_window(env);
+            break;
+        case TT_WIN_UNF: /* window underflow */
+            restore_window(env);
+            break;
+        case TT_TFAULT:
+        case TT_DFAULT:
+#ifdef notyet
+            {
+                info.si_signo = SIGSEGV;
+                info.si_errno = 0;
+                /* XXX: check env->error_code */
+                info.si_code = TARGET_SEGV_MAPERR;
+                info._sifields._sigfault._addr = env->mmuregs[4];
+                queue_signal(env, info.si_signo, &info);
+            }
+#endif
+            break;
+#else
+        case TT_SPILL: /* window overflow */
+            save_window(env);
+            break;
+        case TT_FILL: /* window underflow */
+            restore_window(env);
+            break;
+        case TT_TFAULT:
+        case TT_DFAULT:
+#ifdef notyet
+            {
+                info.si_signo = SIGSEGV;
+                info.si_errno = 0;
+                /* XXX: check env->error_code */
+                info.si_code = TARGET_SEGV_MAPERR;
+                if (trapnr == TT_DFAULT) {
+                    info._sifields._sigfault._addr = env->dmmuregs[4];
+                } else {
+                    info._sifields._sigfault._addr = env->tsptr->tpc;
+                }
+                /* queue_signal(env, info.si_signo, &info); */
+            }
+#endif
+            break;
+#endif
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+        case EXCP_DEBUG:
+            {
+#ifdef notyet
+                int sig =
+#endif
+                gdb_handlesig(cs, TARGET_SIGTRAP);
+#ifdef notyet
+                if (sig) {
+                    info.si_signo = sig;
+                    info.si_errno = 0;
+                    info.si_code = TARGET_TRAP_BRKPT;
+                    /* queue_signal(env, info.si_signo, &info); */
+                }
+#endif
+            }
+            break;
+        default:
+#ifdef TARGET_SPARC64
+        badtrap:
+#endif
+            printf("Unhandled trap: 0x%x\n", trapnr);
+            cpu_dump_state(cs, stderr, 0);
+            exit(1);
+        }
+        process_pending_signals(env);
+    }
+}
+
 #endif /* ! _TARGET_ARCH_CPU_H_ */
-- 
2.22.1


