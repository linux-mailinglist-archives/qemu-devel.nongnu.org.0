Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D637CEA3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:22:58 +0200 (CEST)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsZV-00051C-8Q
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUK-00074Z-G6
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:38 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUF-0008Gq-DO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:35 -0400
Received: by mail-io1-xd32.google.com with SMTP id k25so22405249iob.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k1upx2HFVOFVN6PSIryAU8yLJ9E9/r17hsSVgOx4tWA=;
 b=ATTacYXN1VijBud8Mu7fzj3Q9jbNCw5Kp2jIOJd9LwF0laQod31rVEoT8EerbS7TcV
 vhpYKcm1Y4sARhmyX1nlvWfBYrHcVNDo5ZuZEh5Zx2IrL7YZWYhtpirj9MLjmr3uldqy
 xHcm1AtD8FysWHS5t3MfDwBKYLpyGVkUbxiSf+vjXmlffzneF/MQyh2g7o3rHftb5rDD
 /yAfqAbdx3yFp8ve4Hh1cw5903v75NGYDK4DlMn+hIpcXqZLncMIyeYkuBlevsTuoMyO
 S+I0PTdYbTDWxcs5LCUm69eTHqVs9ig5zAKUz7FK2f1KIF+A6HcTcktnIWOifb9Am3ea
 NJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k1upx2HFVOFVN6PSIryAU8yLJ9E9/r17hsSVgOx4tWA=;
 b=ErOMB4j5xxDO3nR77RJzz/ORjyr7KdEnjxuCitS3nkyTgG1sDy6y4pSP2/tUKkrWUM
 zjz0obn+MGw078khFsVVUTWgxdXjnD8qJiQ8HkvPiV/9QD166uBcd2Kok3E59HyeHlNI
 drxqeL8cRe9bwMqurIFg0RbpxV9rJHL0RMZoPkiT08AchzQpn1JdZ2ta6pQrExwbUqcO
 FydLdsLZH9zlb9FMq8H0aksEQ79SI1/bzKvPwpm5Mo0UubA99c+uMyQP6vu6NKDjRSEc
 +qSv2W8CwKxQHnGTvTTcpAyNJ5VOJyJWm6o+lsC5ZccLYs3lXwmmrab5czcI/GmzKaLL
 lSmw==
X-Gm-Message-State: AOAM531+gSgnP9uRvLVMk8pwjVwnd0VZJ+R6bj2HEmUJ14R4qv7HFa/7
 wqFBGGL5VkcItJZCU2c+RL1n4dyijxLKXg==
X-Google-Smtp-Source: ABdhPJx0Pft8P9nWYXTnr28ZF56WPLPtwhzqn9SHZ8WMdgNY6jofLmL9ONmpBdkEE7nFds1HUruWOA==
X-Received: by 2002:a5d:8506:: with SMTP id q6mr10927092ion.11.1620839849396; 
 Wed, 12 May 2021 10:17:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] bsd-user: style tweak: use C not C++ comments
Date: Wed, 12 May 2021 11:17:02 -0600
Message-Id: <20210512171720.46744-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 079520737b..5253ceb24b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -147,7 +147,7 @@ void cpu_loop(CPUX86State *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_ulong pc;
-    //target_siginfo_t info;
+    /* target_siginfo_t info; */
 
     for (;;) {
         cpu_exec_start(cs);
@@ -196,7 +196,7 @@ void cpu_loop(CPUX86State *env)
                                                       arg6,
                                                       arg7,
                                                       arg8);
-            } else { //if (bsd_type == target_openbsd)
+            } else { /* if (bsd_type == target_openbsd) */
                 env->regs[R_EAX] = do_openbsd_syscall(env,
                                                       env->regs[R_EAX],
                                                       env->regs[R_EBX],
@@ -225,7 +225,7 @@ void cpu_loop(CPUX86State *env)
                                                       env->regs[R_ECX],
                                                       env->regs[8],
                                                       env->regs[9], 0, 0);
-            else { //if (bsd_type == target_openbsd)
+            else { /* if (bsd_type == target_openbsd) */
                 env->regs[R_EAX] = do_openbsd_syscall(env,
                                                       env->regs[R_EAX],
                                                       env->regs[R_EDI],
@@ -369,7 +369,7 @@ void cpu_loop(CPUX86State *env)
 #ifdef TARGET_SPARC
 #define SPARC64_STACK_BIAS 2047
 
-//#define DEBUG_WIN
+/* #define DEBUG_WIN */
 /* WARNING: dealing with register windows _is_ complicated. More info
    can be found at http://www.sics.se/~psm/sparcstack.html */
 static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
@@ -496,7 +496,7 @@ void cpu_loop(CPUSPARCState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret, syscall_nr;
-    //target_siginfo_t info;
+    /* target_siginfo_t info; */
 
     while (1) {
         cpu_exec_start(cs);
@@ -526,7 +526,7 @@ void cpu_loop(CPUSPARCState *env)
                                         env->regwptr[0], env->regwptr[1],
                                         env->regwptr[2], env->regwptr[3],
                                         env->regwptr[4], env->regwptr[5]);
-            else { //if (bsd_type == target_openbsd)
+            else { /* if (bsd_type == target_openbsd) */
 #if defined(TARGET_SPARC64)
                 syscall_nr &= ~(TARGET_OPENBSD_SYSCALL_G7RFLAG |
                                 TARGET_OPENBSD_SYSCALL_G2RFLAG);
@@ -618,7 +618,7 @@ void cpu_loop(CPUSPARCState *env)
                     info._sifields._sigfault._addr = env->dmmuregs[4];
                 else
                     info._sifields._sigfault._addr = env->tsptr->tpc;
-                //queue_signal(env, info.si_signo, &info);
+                /* queue_signal(env, info.si_signo, &info); */
             }
 #endif
             break;
@@ -638,7 +638,7 @@ void cpu_loop(CPUSPARCState *env)
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


