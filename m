Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BA148B7A8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:55:14 +0100 (CET)
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NEc-000212-R8
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCO-0007hP-RY
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:52 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:36301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCN-0008DV-5o
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:52 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mhl0I-1mTej23Kkq-00djif; Tue, 11
 Jan 2022 20:52:48 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/30] linux-user/alpha: Set TRAP_UNK for bugchk and unknown
 gentrap
Date: Tue, 11 Jan 2022 20:52:18 +0100
Message-Id: <20220111195247.1737641-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ibdZVCnju50Z4Kf2kGgfuz4SoeL8wxiyjlA9EHuvc6TtQ30xsRV
 vJmSGhPvTqRWv4yMpH3Lqsq30Mani5Vd+VeJ38DE3m6ut4BcH/miaTjRFL5gNqXJl/h5giO
 V2Cq0aVcpxropoS7Pxr4ezCEWYrrrtpMIwjoJw7ygaxCKBvkHkDLKfSYMb2E62+UjYjcKPz
 FtmDr/3CMqhZ9W5lPKsBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VRU4QkP+I4o=:JfkPtJtMOfi5nHCntIYBV9
 QY2kfmhqfwZUQYU9B3kqUZ70i2dep532kPgeMVuUJ1KXjGGR5BVgSp2LgLuM3g3ErNg9a9X4i
 /5CCRGGui20Rsjg0n4nUVXNPR2i9bOdCcDVc7CgXFG+2hgUWskfL8IKROxapPAl9bjgT1KtLz
 GsRNLqjRM7jQJg14+Qy6QBTSN6Qwir1NvphTS6MI0OpJQP/+wr9IXa32zV5NnRoSH8cVZO+wH
 YfjHqrvfcCPf/5wHEpuyW5DkWH2QS229riSlWCMxpv0iK7UGL2I+Mahi0H2OiPOs6+A6DTZVo
 yREPsRw0ao95KYRLWAa8J/euuKHKdaeA00KMxcOfzpLwc9AfAfIXJWXjufMvQIuFMdfdX3bgf
 D7o8iGTd/Ew7rsdoyI4++LaxOWN6INRsYt5iBQBc6gQ4pAzzB2witL7s4PGQgfulhXUAcC0Dd
 qeJy8D08VGDgsThyINupPRK5dpvTAhY0LoHFFEPMW77lpp4L3XWGskcWAhDn7Asl195zFpkw0
 ttwhb58edYeDl8hSwz2MtUDSQEM7h57hsnl6QZOX3DyLPqD31VxmoyXdOyn9kRJ3j2ca5MlJO
 MgKpg0bkNQZDOvCKDr4bcrvtZgugBib22wMZIWd5m7eP5O0iw1X8RkYyqnG+sH/60QYrwoqIS
 p41IptSZAkE4MaCs0eJLq2CR/m8Dhy6wX9+o10s6BcGZeJUoIU5EvDh0dCZSEMGRcUmE=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These si_codes were changed in 535906c684fca, for linux 4.17.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/cpu_loop.c | 4 ++--
 linux-user/syscall_defs.h   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 37c33f0ccd07..96466b23f969 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -86,7 +86,7 @@ void cpu_loop(CPUAlphaState *env)
                 /* BUGCHK */
                 info.si_signo = TARGET_SIGTRAP;
                 info.si_errno = 0;
-                info.si_code = 0;
+                info.si_code = TARGET_TRAP_UNK;
                 info._sifields._sigfault._addr = env->pc;
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
                 break;
@@ -155,7 +155,7 @@ void cpu_loop(CPUAlphaState *env)
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-                    info.si_code = 0;
+                    info.si_code = TARGET_TRAP_UNK;
                     break;
                 }
                 info.si_errno = 0;
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index cca561f62268..18bed558fe6b 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -715,6 +715,7 @@ typedef struct target_siginfo {
 #define TARGET_TRAP_TRACE	(2)	/* process trace trap */
 #define TARGET_TRAP_BRANCH      (3)     /* process taken branch trap */
 #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
+#define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
 
 struct target_rlimit {
         abi_ulong   rlim_cur;
-- 
2.33.1


