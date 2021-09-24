Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523BB41767B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:01:58 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlm0-0002Q2-Ut
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgu-00031v-CA
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:40 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgr-0005AD-Ty
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:40 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M3lLh-1mU2nw3aR1-000uhQ; Fri, 24
 Sep 2021 15:56:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] linux-user/aarch64: Use force_sig_fault()
Date: Fri, 24 Sep 2021 15:56:31 +0200
Message-Id: <20210924135631.2067582-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135631.2067582-1-laurent@vivier.eu>
References: <20210924135631.2067582-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J3ppuy8nfO+aKlVA06tx1O+/lmCpIvulGhaBp63Ja53tzKTkDx/
 lU51QVqlImUxMDgEqZ9CWiZwxxqnYZdOZeMLpoqtf5R1jtbg1FTna6Ny1O1pFtLIuMXrY/n
 JTT+k8T2HuTmlI7udk8CJrRYaGMkg8gYRIldit/FyMMaWFjLc6zSijNqJ3srsDIrs9xvDWN
 SfPkt53kNdp4O6biL/6jA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IVFbgakdjLc=:fcUK1nHhTn8Vazbaf7hreC
 oJLChlIRB5bzP0iXVnzWeSZBGgLLw1rZruTDpgCYKoyg/m3bxU7lOTU01YRUX7pIHYbcYUa3B
 rFUn54Me50TWoSTgdOTaR3ZkYUscCHBAxrGxgBeYj8+Ms7+Eswp6sfQdX8FWWBDDWrk7YN4uf
 7ZspxwEdd3pT2IflHcMDenVvLz1xbxXCv4OMe8nPOXHU624rhWoPgMQR5Cx4lwzgN8sa3zWMZ
 FFpP8WQgDVO9ueNvJSjSfBd3xNSG5DAwCB9JXlmdOzGGb1TcteWRY92olT36JIf/V6AfqQYYe
 vDas0PmujcEO94c9Azo8FR0kTJyjYB/Q2ebE1GrAxsXPdMD9qvEd6yF9pSIJgVBvDREk3jTZ4
 UjdHHb9ufty2TQGIo/y8xp/pBE2ywl8ISCVbD3BPQwIMouNT0aJKyd+gNkLtWo2WNfk7hj6SH
 3YdS2lsRf7nu9acZ28+Z6LknK9UOsW1BedPIaoxq6tGNZlq2GxOsYu1VJy0OHQpIiucB7C2j3
 e/sBBKsfIZ+PRVr54Zw7VLvALlA8Vi6tF7syermrayfgoH0Mn2+2OOoIOHJLLGYWwyPaUlkcP
 emP4mwoxlhAAjWUzrtnBOsy/7joGKIm0uuRKqOLl5PLCstr1vZcJYbYEVNIDQfNkJio8KXzeC
 RE+OB2BLvgpMERQsIS6RmfuTEvD6BFzlv9vlykdu6jaxRD5VRi8oiXbJjQzyRpE8dVF+TaHNz
 kMIUEFuKvsS/N0Jz2w53cHkB8kwKzfed6Is/Gw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Use the new force_sig_fault() function instead of setting up
a target_siginfo_t and calling queue_signal().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210813131809.28655-8-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/cpu_loop.c | 33 ++++++++-------------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 980e734e54f3..034b737435a3 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -79,9 +79,8 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc;
+    int trapnr, ec, fsc, si_code;
     abi_long ret;
-    target_siginfo_t info;
 
     for (;;) {
         cpu_exec_start(cs);
@@ -110,18 +109,10 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info._sifields._sigfault._addr = env->exception.vaddress;
-
             /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
             assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
@@ -130,28 +121,24 @@ void cpu_loop(CPUARMState *env)
             fsc = extract32(env->exception.syndrome, 0, 6);
             switch (fsc) {
             case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                info.si_code = TARGET_SEGV_MAPERR;
+                si_code = TARGET_SEGV_MAPERR;
                 break;
             case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                info.si_code = TARGET_SEGV_ACCERR;
+                si_code = TARGET_SEGV_ACCERR;
                 break;
             case 0x11: /* Synchronous Tag Check Fault */
-                info.si_code = TARGET_SEGV_MTESERR;
+                si_code = TARGET_SEGV_MTESERR;
                 break;
             default:
                 g_assert_not_reached();
             }
 
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_SEMIHOST:
             env->xregs[0] = do_common_semihosting(cs);
@@ -171,11 +158,7 @@ void cpu_loop(CPUARMState *env)
         /* Check for MTE asynchronous faults */
         if (unlikely(env->cp15.tfsr_el[0])) {
             env->cp15.tfsr_el[0] = 0;
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info._sifields._sigfault._addr = 0;
-            info.si_code = TARGET_SEGV_MTEAERR;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MTEAERR, 0);
         }
 
         process_pending_signals(env);
-- 
2.31.1


