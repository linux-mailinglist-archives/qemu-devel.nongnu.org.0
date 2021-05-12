Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9B37CF03
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:28:40 +0200 (CEST)
Received: from localhost ([::1]:51350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsf1-0000GY-JM
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUK-00074e-HA
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:38 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:37736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUF-0008H1-Jl
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:36 -0400
Received: by mail-io1-xd35.google.com with SMTP id n40so6641844ioz.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xcbvTyE06GsbXZ6wscH4ReU21BuFqy0VwV1NpioIp6Q=;
 b=BxgvKa8s0JoQNp16hlC1E+oKtnbiv1ag7aDWoONLREF9MSyAyXJ8UNpa1sVBkkTsfR
 db9W2HsBxx46Xn+KhF9EuwIVXDz/f3ojrtsa9OabkJZ2vqHP8TgEQrj61Y/McSB4hdKN
 pgBinujBVWEyVNvNO2L4cDgHYQ87ooK2qSexCQFCFcrWlZKJRNZHhcgB0Jd/Z383LCBe
 AuqUkidNbb6AP5u6WL3XjgOVger81raXpR2ZUP/13SGYuYjsA+lTqThvA2j8VQe0nIOa
 FZWbnEl29+ou4TonBVHU5tlqoVqfS/hiCFPaHmfCzSwMYLhq4UI2UDI8s4v1TLRFF9yb
 ZzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcbvTyE06GsbXZ6wscH4ReU21BuFqy0VwV1NpioIp6Q=;
 b=K82D4LrVDedP+mcDtuYtUdTJKBXJOVITyIRTP+BOY8JpHzoNUcSf95o07u4HMmna+4
 fI2bjWyo0rxo5y05APxR5/PB9krEH+4DhQn2lGjDx2WyX9liGcEmHdLO5fpdlzH6LcTS
 6o4KqInOqBOLUFDKhPmGOlVbXfCxFkgL+cMi/SRiqoX7QFPSOLFcqXj4nu5PDny2UzWw
 LbTArgsDSkXYE0OPIID0LFhAf8pm3+PApYEEy4hvbR4NIeyYq5G2ZxO++MuAivTEmRkT
 xBmDKFZZeboarlV91VpLDFUoDYlg5Uk+LXhQbZ0Lhw5lwr5TBvIUaFRr3XMbKhz9sLbZ
 y+0w==
X-Gm-Message-State: AOAM530Bj1Mfr2GqRijrCB659+pxopvtiFuP6Obo55FqWWJDmP7NezMD
 JfiXUtlYxuFA3zLH+bkj449Q23S39VJdhg==
X-Google-Smtp-Source: ABdhPJzMF3SklwvqjvsuEV0Z1FBh46RKpTsu5n3z9oacNDC68C9KOSDrHuE4NJivT95NowlWVD02Sw==
X-Received: by 2002:a5e:c202:: with SMTP id v2mr5207323iop.89.1620839850262;
 Wed, 12 May 2021 10:17:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] bsd-user: style tweak: Remove #if 0'd code
Date: Wed, 12 May 2021 11:17:03 -0600
Message-Id: <20210512171720.46744-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 143 ------------------------------------------------
 1 file changed, 143 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 5253ceb24b..c342dd7829 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -243,118 +243,10 @@ void cpu_loop(CPUX86State *env)
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
@@ -588,16 +480,6 @@ void cpu_loop(CPUSPARCState *env)
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
@@ -608,19 +490,6 @@ void cpu_loop(CPUSPARCState *env)
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
@@ -628,19 +497,7 @@ void cpu_loop(CPUSPARCState *env)
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


