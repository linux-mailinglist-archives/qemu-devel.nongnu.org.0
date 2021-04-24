Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE04036A1EE
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:09:16 +0200 (CEST)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKqJ-0005wj-Oq
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi4-0005Yw-Gv
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:46 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:34651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhv-0004Cp-Cv
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:44 -0400
Received: by mail-io1-xd2c.google.com with SMTP id l21so8548019iob.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ghN5evOr+lJ1hwh8OcKOBoA6w2BllVvDqUcGoBlbrmE=;
 b=VNnMQk7aIWowbZ10g34EjBuRy1rLI1aSao7lvLSNWV/NW5Tr2gi5eKx7DQBMueUo5s
 Nf291BnrOVu7AujtjaBdXDZz2fWTatGIL+lf6E/Zntv91t9XGtQa+Gh/wzGCg6ir0ir8
 ML2d/Ydgiw+GGeJt9DlnqU263dc9v3eEQT0wkinMVl3vDd0BQYCkqvq08EJFLvhtnhfz
 +dXaxu3xJv0e+X3NACRtotsU23l3h3H9aGrYdEgXIlGF6jWx9JOZwjSH6xVoqe4/0u/b
 VEzRE6YG+PzU3Y2os/NibjiS7KyBhjG3LWwx4vyAubb5NT2wM1piSwvTyDEfqMsBRC2p
 1wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ghN5evOr+lJ1hwh8OcKOBoA6w2BllVvDqUcGoBlbrmE=;
 b=B810+KnXaQE642ZYoP4/eDPKncVJUmnUY46KGedU8PIfvaQ39+wgwXIFwX//kJnulW
 IVyUE8L7VxhnIl5sEEuS65AFx5jtUtKZbbZsqkJeDftziD2ySs/9wtcbk3TIL16xU47i
 KeRWm26dEVgWZ+J82uhNreyV/GrT3nj2LFbH0e+yEXPE/K95AFbAaTnYt9AhqAgo5gpM
 vlDm3hAZOeQ7C81EVg7m15DXpzNv3qxuqB2Tu4w05NxemKAmMvnK7fNUx9zogpv0XU7k
 WomG3CS7HeBNiVky+BX1KBfWsMrzJ5QSR78Rh1mljVcPf1EAL5ONIv+G6FP5RKtiZzVS
 EyVw==
X-Gm-Message-State: AOAM532SKA8L5aNU5IpgObzkMOcMOYbbhcOpwXa/Yho5g0tCSCxgrJmc
 0BWidN3ZdPWAlzBWevFJDKK/XOLa5Wjb7XT9
X-Google-Smtp-Source: ABdhPJz1XNc7R8DOCYpT6lZ3un9rD3q5rbsDtEy14yyuI7+DMnoQI90SVkHBdk74AfkkeXNrr6IgNg==
X-Received: by 2002:a02:5d82:: with SMTP id w124mr8358736jaa.21.1619280034017; 
 Sat, 24 Apr 2021 09:00:34 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:33 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/48] bsd-user: style tweak: use C not C++ comments
Date: Sat, 24 Apr 2021 09:59:37 -0600
Message-Id: <20210424160016.15200-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


