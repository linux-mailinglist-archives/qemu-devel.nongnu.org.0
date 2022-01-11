Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B348B7EA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:13:59 +0100 (CET)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NWo-0007jo-FP
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:13:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCb-000824-1U
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:05 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:41653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCZ-0008HG-5s
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:04 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MEFCF-1nEljF0TFF-00AEXI; Tue, 11
 Jan 2022 20:52:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] linux-user/hppa: Set FPE_CONDTRAP for COND
Date: Tue, 11 Jan 2022 20:52:25 +0100
Message-Id: <20220111195247.1737641-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BmZJDvAlMbr1PxeBCkXpjNQfj2+g4+YW7RS8fi1AdMRnvBIqDew
 NGXh9G2fZso1wocOz/tsWLQjrCX2hChENc6mzitj/qGXGtWQUKrBuVq8jNj4gHj8b/WFKLr
 JNr2jhZSlfjFkJHjBF5cWNZ84R9h2I4YOFrrjhEhpW7Csd9JPPmNINZOYZh6S9oaQy0U80Q
 /el2keqbnncc8AeYfRMzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HpgoP+USiGs=:fkePWf6KtaqvcFRrkotJNM
 g5cY1tm/sUPU1MHwIagtS4I6/+F92nT3oo4bHdlLc3eCVHuTXSWSSczq2FI+H1g+SDsnOkwbt
 EnGLPLJfy5YFp/DUImbC+t+oqJ1SNxQ4dNawyatCJTERaWy2xZneWOx8ERz89SDWOK/6ERKfG
 QyHZbKIFmM5Y541CJu9jZHNYBQFHsDaPr7kIAhMJiGRe+GGpnhke4yiQEMzqyrOyIbxOGPAJl
 VVbIM6YRFU2609w/naVnX5dP1kMuOjv736Kjl7GA4/utUQNPf6NkW/0naeDtgW5QwmcyMf93Q
 jlUPCgLOR7r+soCXVy2nU3P5RSu8w+iamD7sSukCuSkkHkOwJ6nklzF89rUIpPv62p6yBmxL+
 WVMssS35Eq5vHbHfpU2unFn+qmp8McV1sPY2ZNg2XCa4CzTCiEhOF6J8hGksuchzLChh/eRsG
 EegYcmgVLe0co45dXtyVJbxVZhFFFCR9EzJLttRcMsKKG7BCxSoSyc3fuCjiZnEKY/QClt1Gv
 vzmLC25fZM/KqDB8dI5rrxV4UvSF2G3QL/XHsAmWfylmHEk1pTVmgiY3Vt8UyAkmdYojiWC2A
 DCFiCmSwU+v45yQ0uLbyJtRmDSOFIEj/ZzRYJDl/hGdTfuUSJXHxCPWwd4NA6eKhRoh9zmeSa
 jNNzU06dy5hh2djoWKsgFeNw4vlYkphsr44GnSYD0S8qJjxuR6CUJvPjj6YAUkNVV1HM=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This si_code was changed in 75abf64287cab, for linux 4.17.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/cpu_loop.c | 2 ++
 linux-user/syscall_defs.h  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a65e1571a0cf..a576d1a249fd 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -156,6 +156,8 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
             break;
         case EXCP_COND:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_CONDTRAP, env->iaoq_f);
+            break;
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 510a8c1ab585..f23f0a2178f8 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,6 +688,7 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
+#define TARGET_FPE_CONDTRAP    (15) /* trap on condition */
 
 /*
  * SIGSEGV si_codes
-- 
2.33.1


