Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47668369B79
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:44:47 +0200 (CEST)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2fO-00027s-9Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2af-0005Fn-Fd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:53 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:42857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ad-0007yT-G0
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:53 -0400
Received: by mail-oi1-x230.google.com with SMTP id n140so50356072oig.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1r5gMywxPv+UStonAWMLzTWtbbS/dkPWtKuXpNHgwU=;
 b=K1snjMOa0EWqurvx2ZI42thSxBX0K4HitCKJUNkX8Oc8ApNiKklf/Q8R8w+MM7/p1p
 LzzuvljepkWp7YUosQUOFh2N7tGlNYZ0XOwCOJKPb69gK16KxKMT7Io3zr4hVmbt7LSJ
 pCkrXGqZMgJ8LNFu3xJKv8ZCS7Dc0FUD3NBjFIPrRqIB0yxWs3DuhAiIDL+PJGdX6joR
 ttw89SFoPCgiWa5qmxQ/ZlVdWQTv+eh1YQruis6ap0qE2TLDbOhkj8wZqyZ82H8GX3Nh
 EMK4Xi4oXXakrgga1JU8/UbG0vNQ4+bje5i/SF8foREOTNHtAj0JviLFDjyIfjbPe2BK
 4v6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1r5gMywxPv+UStonAWMLzTWtbbS/dkPWtKuXpNHgwU=;
 b=tYatP1suL9cOkeiKwccdEee3MBDzaYumIUlz1tB20RgxN9RSA0hGpie0yfNqfBCi+1
 nm0o+LaOfvxWd6ZwFOhK4VBnGKDs65SQ7vTBl3ajz2MTheyXY7fRncXkk4sNn7yju5zn
 Ad/0HnfhwDwzz1pQwmLULSrZbhr9SWxzp+ctEBPRcvuB9Wx60XGi0Tz0RXyspPHrcJNK
 iCVEnmaUadgcCjcogD0WtrQ64I9TMsR9vryds65t4r1wUtoP0lP7CRd0aFPRMV0whUNY
 Ssq6hTlIV0NiPvIrtr7Gke6rp2Kkyk3gN3RrEurX7WTJAMoG4NbRgXu4l9tYXtH+A3Ne
 z3HA==
X-Gm-Message-State: AOAM532kUbviN52DEuEtI8U+v+y0t+zSZ6zdr2NRbdb36ajMT4jJ7F5Y
 B2Xz/TU9vTjvfQS+frePGsf5f4pHNBDpuMuE
X-Google-Smtp-Source: ABdhPJxV+wy2HeZ+PAQTOF8na6WNy6j8tQT7jlI73A8egspyQHAS8yYoOcB8zSVU+sqteRWCKXGglg==
X-Received: by 2002:aca:ef84:: with SMTP id n126mr5416623oih.84.1619210390067; 
 Fri, 23 Apr 2021 13:39:50 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m127sm1511911oib.32.2021.04.23.13.39.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:49 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 09/24] bsd-user: style tweak: use C not C++ comments
Date: Fri, 23 Apr 2021 14:39:35 -0600
Message-Id: <20210423203935.78225-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203935.78225-1-imp@bsdimp.com>
References: <20210423203935.78225-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::230;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x230.google.com
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
 bsd-user/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 455b8eddab..ff886de98e 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -148,7 +148,7 @@ void cpu_loop(CPUX86State *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_ulong pc;
-    //target_siginfo_t info;
+    /* target_siginfo_t info; */
 
     for (;;) {
         cpu_exec_start(cs);
@@ -197,7 +197,7 @@ void cpu_loop(CPUX86State *env)
                                                       arg6,
                                                       arg7,
                                                       arg8);
-            } else { //if (bsd_type == target_openbsd)
+            } else { /* if (bsd_type == target_openbsd) */
                 env->regs[R_EAX] = do_openbsd_syscall(env,
                                                       env->regs[R_EAX],
                                                       env->regs[R_EBX],
@@ -226,7 +226,7 @@ void cpu_loop(CPUX86State *env)
                                                       env->regs[R_ECX],
                                                       env->regs[8],
                                                       env->regs[9], 0, 0);
-            else { //if (bsd_type == target_openbsd)
+            else { /* if (bsd_type == target_openbsd) */
                 env->regs[R_EAX] = do_openbsd_syscall(env,
                                                       env->regs[R_EAX],
                                                       env->regs[R_EDI],
@@ -370,7 +370,7 @@ void cpu_loop(CPUX86State *env)
 #ifdef TARGET_SPARC
 #define SPARC64_STACK_BIAS 2047
 
-//#define DEBUG_WIN
+/* #define DEBUG_WIN */
 /* WARNING: dealing with register windows _is_ complicated. More info
    can be found at http://www.sics.se/~psm/sparcstack.html */
 static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
@@ -497,7 +497,7 @@ void cpu_loop(CPUSPARCState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret, syscall_nr;
-    //target_siginfo_t info;
+    /* target_siginfo_t info; */
 
     while (1) {
         cpu_exec_start(cs);
@@ -527,7 +527,7 @@ void cpu_loop(CPUSPARCState *env)
                                         env->regwptr[0], env->regwptr[1],
                                         env->regwptr[2], env->regwptr[3],
                                         env->regwptr[4], env->regwptr[5]);
-            else { //if (bsd_type == target_openbsd)
+            else { /* if (bsd_type == target_openbsd) */
 #if defined(TARGET_SPARC64)
                 syscall_nr &= ~(TARGET_OPENBSD_SYSCALL_G7RFLAG |
                                 TARGET_OPENBSD_SYSCALL_G2RFLAG);
@@ -619,7 +619,7 @@ void cpu_loop(CPUSPARCState *env)
                     info._sifields._sigfault._addr = env->dmmuregs[4];
                 else
                     info._sifields._sigfault._addr = env->tsptr->tpc;
-                //queue_signal(env, info.si_signo, &info);
+                /* queue_signal(env, info.si_signo, &info); */
             }
 #endif
             break;
@@ -639,7 +639,7 @@ void cpu_loop(CPUSPARCState *env)
                     info.si_signo = sig;
                     info.si_errno = 0;
                     info.si_code = TARGET_TRAP_BRKPT;
-                    //queue_signal(env, info.si_signo, &info);
+                    /* queue_signal(env, info.si_signo, &info); */
                   }
 #endif
             }
-- 
2.22.1


