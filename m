Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A536A1EF
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:09:48 +0200 (CEST)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKqp-0006QX-5a
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiA-0005ag-08
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:55 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhx-0004E4-VH
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:49 -0400
Received: by mail-io1-xd32.google.com with SMTP id p8so3348876iol.11
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfOm/Ivh+JfqV00Fz/64C5CrriNC8PYXVMSw99nEiXo=;
 b=M08zcBflkKPwl8zJ9ZH6/2GSGzxcS4IQ/iKkuNVTWBbaNLl2Hqa2kl9VMfVDYb37do
 M2+/er5RTZolR5OoXkNMPMfxr4JpfjQjUqA5lWhvKqkd01rz/s/hofBYVOzZ81w7XrOu
 IiTYeUA3ufkgpfeWag3OwtfIm4Qs74Be4vmhBn0kXimaiDIa9FmA/EerdYapD/6OJ7dM
 52IYq+CWQh6WabTgYGT05YGly8G2gZ4xfvRKTI+Bp0GUChj1QNMqrptOPWHlwd9AIt/Z
 BK0LcDCx8O8sbBWrRkyzTpL0Hu/c22TA7J8M0LV8rl0ilewIxeDRJZ9NPVAlSM2ZpqxW
 E9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfOm/Ivh+JfqV00Fz/64C5CrriNC8PYXVMSw99nEiXo=;
 b=omAKXeXLS4De+Jvi8yxErSoCoSELYEGcEwJUnBChMm/xQHWRXbNqTpT9GCowdNHp1W
 KNe/04hErr5SnYkOtlHZ1LwIGJNCDvxmw49Mxn2MteeVA6KQtP2oYvEGHzHzyZE6QEO/
 7CCMkomHfufwdegHiF6TMQK6UTzyecGGe/ecWkY2rIC45humy+sArtebFTQS27nyl/v8
 7fe1BpqOAEylqk918l45GZQYo2RnezYihIcCQqm1/srIY186tzlbLTyoW8ruPngjrl3h
 wcOX8wqAER8fsoPM59FOVkebMerejan9paSIoPNJVXld3/NilWMXwMlZ09DVJSQMkLUb
 ROsg==
X-Gm-Message-State: AOAM531X3GV7Ue1eANBEnqeKlr4QnTjS+xiaHO3DawT29kw+nhnHtP/N
 2bQGeekxreDsS/Y1P2c6a6jcMb2bUb9lQ79N
X-Google-Smtp-Source: ABdhPJy4Vt5vPC+UkT+K6q9dpeK81gBsLiEiEseyK0HZe2EQ/F0NbuuLnWiq+cxyoC1e+pPQ9+tPVg==
X-Received: by 2002:a05:6638:258e:: with SMTP id
 s14mr8425333jat.28.1619280036510; 
 Sat, 24 Apr 2021 09:00:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:36 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/48] bsd-user: style tweak: Remove #if 0'd code
Date: Sat, 24 Apr 2021 09:59:40 -0600
Message-Id: <20210424160016.15200-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 143 ------------------------------------------------
 1 file changed, 143 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index ff886de98e..3c6c0ec687 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -244,118 +244,10 @@ void cpu_loop(CPUX86State *env)
                 env->eflags &= ~CC_C;
             }
             break;
-#endif
-#if 0
-        case EXCP0B_NOSEG:
-        case EXCP0C_STACK:
-            info.si_signo = SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_SI_KERNEL;
-            info._sifields._sigfault._addr = 0;
-            queue_signal(env, info.si_signo, &info);
-            break;
-        case EXCP0D_GPF:
-            /* XXX: potential problem if ABI32 */
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_fault(env);
-            } else
-#endif
-            {
-                info.si_signo = SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SI_KERNEL;
-                info._sifields._sigfault._addr = 0;
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        case EXCP0E_PAGE:
-            info.si_signo = SIGSEGV;
-            info.si_errno = 0;
-            if (!(env->error_code & 1))
-                info.si_code = TARGET_SEGV_MAPERR;
-            else
-                info.si_code = TARGET_SEGV_ACCERR;
-            info._sifields._sigfault._addr = env->cr[2];
-            queue_signal(env, info.si_signo, &info);
-            break;
-        case EXCP00_DIVZ:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
-            } else
-#endif
-            {
-                /* division by zero */
-                info.si_signo = SIGFPE;
-                info.si_errno = 0;
-                info.si_code = TARGET_FPE_INTDIV;
-                info._sifields._sigfault._addr = env->eip;
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        case EXCP01_DB:
-        case EXCP03_INT3:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
-            } else
-#endif
-            {
-                info.si_signo = SIGTRAP;
-                info.si_errno = 0;
-                if (trapnr == EXCP01_DB) {
-                    info.si_code = TARGET_TRAP_BRKPT;
-                    info._sifields._sigfault._addr = env->eip;
-                } else {
-                    info.si_code = TARGET_SI_KERNEL;
-                    info._sifields._sigfault._addr = 0;
-                }
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        case EXCP04_INTO:
-        case EXCP05_BOUND:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
-            } else
-#endif
-            {
-                info.si_signo = SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SI_KERNEL;
-                info._sifields._sigfault._addr = 0;
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        case EXCP06_ILLOP:
-            info.si_signo = SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->eip;
-            queue_signal(env, info.si_signo, &info);
-            break;
 #endif
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-#if 0
-        case EXCP_DEBUG:
-            {
-                int sig;
-
-                sig = gdb_handlesig(env, TARGET_SIGTRAP);
-                if (sig)
-                  {
-                    info.si_signo = sig;
-                    info.si_errno = 0;
-                    info.si_code = TARGET_TRAP_BRKPT;
-                    queue_signal(env, info.si_signo, &info);
-                  }
-            }
-            break;
-#endif
         default:
             pc = env->segs[R_CS].base + env->eip;
             fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
@@ -589,16 +481,6 @@ void cpu_loop(CPUSPARCState *env)
             break;
         case TT_TFAULT:
         case TT_DFAULT:
-#if 0
-            {
-                info.si_signo = SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmuregs[4];
-                queue_signal(env, info.si_signo, &info);
-            }
-#endif
             break;
 #else
         case TT_SPILL: /* window overflow */
@@ -609,19 +491,6 @@ void cpu_loop(CPUSPARCState *env)
             break;
         case TT_TFAULT:
         case TT_DFAULT:
-#if 0
-            {
-                info.si_signo = SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                if (trapnr == TT_DFAULT)
-                    info._sifields._sigfault._addr = env->dmmuregs[4];
-                else
-                    info._sifields._sigfault._addr = env->tsptr->tpc;
-                /* queue_signal(env, info.si_signo, &info); */
-            }
-#endif
             break;
 #endif
         case EXCP_INTERRUPT:
@@ -629,19 +498,7 @@ void cpu_loop(CPUSPARCState *env)
             break;
         case EXCP_DEBUG:
             {
-#if 0
-                int sig =
-#endif
                 gdb_handlesig(cs, TARGET_SIGTRAP);
-#if 0
-                if (sig)
-                  {
-                    info.si_signo = sig;
-                    info.si_errno = 0;
-                    info.si_code = TARGET_TRAP_BRKPT;
-                    /* queue_signal(env, info.si_signo, &info); */
-                  }
-#endif
             }
             break;
         default:
-- 
2.22.1


