Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8C3FF80D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:51:07 +0200 (CEST)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwU6-0000uc-FR
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQx-0006PC-K5
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:51 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:33452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQs-0002p1-5A
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:51 -0400
Received: by mail-io1-xd31.google.com with SMTP id f6so4772826iox.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JiY2LSjoh75ub8VVneYrxWM+2JBoL2yaQmYAF6M1zUI=;
 b=L4WdieVYFEEySKhzpqB3KgxJPLpb66kyLbhfTvsdDLQm9WJ/lPjuGQKDbLRerr/Zg2
 Sg9bMjXq673hKTxD7AzKrn5K5ngwNwVW/rDedZlnw7jJHqqospSsGJ3NOCcAwDXNueWU
 dlLas3AKKJ1UsTyOi4w7JwxF4X8Uw14FhcOC2UPYwKDVU/nfVi9Gnhe91zPAJO0pv+2+
 naLZHGNih08YXnRHKVCPhb7K26oRjqbcnmGQaXOCKNLZoTZ7vFhiisDr0/K1E8Wm6Ben
 fY4cPYWfctNKDobhCjwJO/ywZwPVnjMr4H3V8qgKuIJqbl9SYN3IDO+dVL99lTYY3OYd
 i3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JiY2LSjoh75ub8VVneYrxWM+2JBoL2yaQmYAF6M1zUI=;
 b=o/75fYOyQZ2Ph5Uksp5QtJFlVFx7psugbIWvBMCm+nXxRYKf5v7tRm8cd1YbKgTQyk
 rBzWllSuJd6kLQWCwLtb5BdUTc3Yt3TwKEDCu0bMZ4EXjiWw7HlZt2ua/kH7Y3oW/J5x
 kiuFftBFMsP4BZ7JWHwS6PNqn9W9AF+I2DsxP06mnHA0nwj+ImOZBxVo8183Jsr5pvFx
 NDfaXRlBCpJY6Y2BeVkBqQeGpIRc/nSDjO8DDq2kh0gjZO3INbrhr3WgSMFwkaZ2KRj1
 Ymj66l9GBVnhVZ6DxQWzDT9SEUBNWbnUNR9xBMiEwLdAwZSskkg56sE2ognmtJqelQ9v
 k+zg==
X-Gm-Message-State: AOAM53156SNLGhFqDjp7e3FwjVLbvdb5m7Yli6FS4fwgyn0V4HOn8z2E
 GVIky2anTHWv9My7MHYxrcBGD6RL/SDkbg==
X-Google-Smtp-Source: ABdhPJwuAmwSSv6vnPpouKRDlf94AeOoSMSBnlIkvJRLntE/w6R3xClF/hq6V8kVysbzuf7j7zHuxA==
X-Received: by 2002:a6b:5a04:: with SMTP id o4mr736957iob.44.1630626464246;
 Thu, 02 Sep 2021 16:47:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:43 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/43] bsd-user: remove sparc and sparc64
Date: Thu,  2 Sep 2021 17:46:47 -0600
Message-Id: <20210902234729.76141-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
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
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

These are broken here and in the bsd-user fork. They won't be fixed as
FreeBSD has dropped support for sparc. If people wish to support this in
other BSDs, you're better off starting over than starting from these
files.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c                        | 289 -------------------------
 bsd-user/sparc/target_arch_sysarch.h   |  52 -----
 bsd-user/sparc/target_syscall.h        |  36 ---
 bsd-user/sparc64/target_arch_sysarch.h |  52 -----
 bsd-user/sparc64/target_syscall.h      |  37 ----
 bsd-user/syscall.c                     |  11 -
 6 files changed, 477 deletions(-)
 delete mode 100644 bsd-user/sparc/target_arch_sysarch.h
 delete mode 100644 bsd-user/sparc/target_syscall.h
 delete mode 100644 bsd-user/sparc64/target_arch_sysarch.h
 delete mode 100644 bsd-user/sparc64/target_syscall.h

diff --git a/bsd-user/main.c b/bsd-user/main.c
index fe66204b6b..38185da111 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -261,274 +261,6 @@ void cpu_loop(CPUX86State *env)
 }
 #endif
 
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
-            break;
-#endif
-        case EXCP_INTERRUPT:
-            /* just indicate that signals should be handled asap */
-            break;
-        case EXCP_DEBUG:
-            {
-                gdb_handlesig(cs, TARGET_SIGTRAP);
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
-
 static void usage(void)
 {
     printf("qemu-" TARGET_NAME " version " QEMU_FULL_VERSION
@@ -779,12 +511,6 @@ int main(int argc, char **argv)
 #else
         cpu_model = "qemu32";
 #endif
-#elif defined(TARGET_SPARC)
-#ifdef TARGET_SPARC64
-        cpu_model = "TI UltraSparc II";
-#else
-        cpu_model = "Fujitsu MB86904";
-#endif
 #else
         cpu_model = "any";
 #endif
@@ -800,9 +526,7 @@ int main(int argc, char **argv)
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
-#if defined(TARGET_SPARC) || defined(TARGET_PPC)
     cpu_reset(cpu);
-#endif
     thread_cpu = cpu;
 
     if (getenv("QEMU_STRACE")) {
@@ -1001,19 +725,6 @@ int main(int argc, char **argv)
     cpu_x86_load_seg(env, R_FS, 0);
     cpu_x86_load_seg(env, R_GS, 0);
 #endif
-#elif defined(TARGET_SPARC)
-    {
-        int i;
-        env->pc = regs->pc;
-        env->npc = regs->npc;
-        env->y = regs->y;
-        for (i = 0; i < 8; i++) {
-            env->gregs[i] = regs->u_regs[i];
-        }
-        for (i = 0; i < 8; i++) {
-            env->regwptr[i] = regs->u_regs[i + 8];
-        }
-    }
 #else
 #error unsupported target CPU
 #endif
diff --git a/bsd-user/sparc/target_arch_sysarch.h b/bsd-user/sparc/target_arch_sysarch.h
deleted file mode 100644
index d0b85ef6bb..0000000000
--- a/bsd-user/sparc/target_arch_sysarch.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- *  SPARC sysarch() system call emulation
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
-
-#include "target_syscall.h"
-
-static inline abi_long do_freebsd_arch_sysarch(void *env, int op,
-        abi_ulong parms)
-{
-    int ret = 0;
-
-    switch (op) {
-    case TARGET_SPARC_SIGTRAMP_INSTALL:
-        /* XXX not currently handled */
-    case TARGET_SPARC_UTRAP_INSTALL:
-        /* XXX not currently handled */
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static inline void do_freebsd_arch_print_sysarch(
-        const struct syscallname *name, abi_long arg1, abi_long arg2,
-        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    gemu_log("%s(%d, " TARGET_ABI_FMT_lx ", " TARGET_ABI_FMT_lx ", "
-        TARGET_ABI_FMT_lx ")", name->name, (int)arg1, arg2, arg3, arg4);
-}
-
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/sparc/target_syscall.h b/bsd-user/sparc/target_syscall.h
deleted file mode 100644
index 151284754b..0000000000
--- a/bsd-user/sparc/target_syscall.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- *  sparc dependent system call definitions
- *
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef TARGET_SYSCALL_H
-#define TARGET_SYSCALL_H
-
-struct target_pt_regs {
-	abi_ulong psr;
-	abi_ulong pc;
-	abi_ulong npc;
-	abi_ulong y;
-	abi_ulong u_regs[16];
-};
-
-#define UNAME_MACHINE           "sun4"
-#define TARGET_HW_MACHINE       "sparc"
-#define TARGET_HW_MACHINE_ARCH  "sparc"
-
-#define TARGET_SPARC_UTRAP_INSTALL      1
-#define TARGET_SPARC_SIGTRAMP_INSTALL   2
-
-#endif /* TARGET_SYSCALL_H */
diff --git a/bsd-user/sparc64/target_arch_sysarch.h b/bsd-user/sparc64/target_arch_sysarch.h
deleted file mode 100644
index e6f17c1504..0000000000
--- a/bsd-user/sparc64/target_arch_sysarch.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- *  SPARC64 sysarch() system call emulation
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
-
-#include "target_syscall.h"
-
-static inline abi_long do_freebsd_arch_sysarch(void *env, int op,
-        abi_ulong parms)
-{
-    int ret = 0;
-
-    switch (op) {
-    case TARGET_SPARC_SIGTRAMP_INSTALL:
-        /* XXX not currently handled */
-    case TARGET_SPARC_UTRAP_INSTALL:
-        /* XXX not currently handled */
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static inline void do_freebsd_arch_print_sysarch(
-        const struct syscallname *name, abi_long arg1, abi_long arg2,
-        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    gemu_log("%s(%d, " TARGET_ABI_FMT_lx ", " TARGET_ABI_FMT_lx ", "
-        TARGET_ABI_FMT_lx ")", name->name, (int)arg1, arg2, arg3, arg4);
-}
-
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/sparc64/target_syscall.h b/bsd-user/sparc64/target_syscall.h
deleted file mode 100644
index b7d986a76d..0000000000
--- a/bsd-user/sparc64/target_syscall.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/*
- *  sparc64 dependent system call definitions
- *
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef TARGET_SYSCALL_H
-#define TARGET_SYSCALL_H
-
-struct target_pt_regs {
-	abi_ulong u_regs[16];
-	abi_ulong tstate;
-	abi_ulong pc;
-	abi_ulong npc;
-	abi_ulong y;
-	abi_ulong fprs;
-};
-
-#define UNAME_MACHINE           "sun4u"
-#define TARGET_HW_MACHINE       "sparc"
-#define TARGET_HW_MACHINE_ARCH  "sparc64"
-
-#define TARGET_SPARC_UTRAP_INSTALL      1
-#define TARGET_SPARC_SIGTRAMP_INSTALL   2
-
-#endif /* TARGET_SYSCALL_H */
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 3f44311396..372836d44d 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -138,17 +138,6 @@ static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
 }
 #endif
 
-#ifdef TARGET_SPARC
-static abi_long do_freebsd_sysarch(void *env, int op, abi_ulong parms)
-{
-    /* XXX handle
-     * TARGET_FREEBSD_SPARC_UTRAP_INSTALL,
-     * TARGET_FREEBSD_SPARC_SIGTRAMP_INSTALL
-     */
-    return -TARGET_EINVAL;
-}
-#endif
-
 #ifdef __FreeBSD__
 /*
  * XXX this uses the undocumented oidfmt interface to find the kind of
-- 
2.32.0


