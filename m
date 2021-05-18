Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326C38716A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:48:00 +0200 (CEST)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisaF-0004Vl-2T
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKp-0007dZ-1y
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:03 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:59675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKg-00078z-C1
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:02 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLAAs-1lzrDY1NWk-00IBNu; Tue, 18
 May 2021 07:31:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 35/59] linux-user/s390x: Remove PSW_ADDR_AMODE
Date: Tue, 18 May 2021 07:31:07 +0200
Message-Id: <20210518053131.87212-36-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kp4mlryV3qjT5ChB9M9n4ypqcCTW7mv72Ivd7tYnFl2Vfe63iIP
 WU9fWChv77VAwmeaQlv/IahWco/gnu0EfhbM6psPRI/r7N2c/toobM7XYHlID+LVhwWCecb
 4lkJfhzXdIFhLjDSF5yO+gZ1wXktA/SlxSQFC58me4QNYtBQEBZK7WAL2S7zI155C868lzs
 gLd0c32FGPGAP7rHtrAUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ioyMpufQeHc=:N+fi7WRk9lOMnjXmAfFasI
 CoErEZycVZgS3qxgBvFQ08DHazg9ehUey7IN231HzhcvzViale+m5ZaKS6XmHHJzbGf/4sbUh
 1bjzIXjP8AxsjxsHtbipFjzL1hPVFLkNT7oxVTTzUL+FOEDpopPQZ88HEus2+B1goYYRrMsut
 9FXWHFMStwnUWsHs+ypeS8NAd5w0P5WK2UmvAgiNW6wsMEzgT2r4IHrTycwK4jXS86Fy2Kvu2
 7kC0O+8/JFdb/Ieaufe3bRSsgRR1BnAJVZVhlP59DHtH4hJ7GJLFbzmH88/FzqisjbU/r6/Z3
 HgRpyFpsVN9qouQDxFp9nQ8B4Xx4oaLEXDDsFmpeSIPvzortYim7L9E4gQGykX+IpakhJJX08
 ghPCjC+FAmlZrChEc44VDu0uCHiYc6ShjAq5U+p/9TE0JKEyRrdGXhEsOkxwwjFtFQnwtcZdj
 AgAwNSPzety6/WP2NA9wT/QqJgZJJ7dYCWniBEsPQ+BrXDLcLMt6x4rWZYQ9lnZBqc4tdyjRJ
 8X+KKj/7bqHqZm/pAvXEZw=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is an unnecessary complication since we only
support 64-bit mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index fece8ab97b3c..1dfca71fa9b2 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -31,7 +31,6 @@
 #define _SIGCONTEXT_NSIG_BPW    64 /* FIXME: 31-bit mode -> 32 */
 #define _SIGCONTEXT_NSIG_WORDS  (_SIGCONTEXT_NSIG / _SIGCONTEXT_NSIG_BPW)
 #define _SIGMASK_COPY_SIZE    (sizeof(unsigned long)*_SIGCONTEXT_NSIG_WORDS)
-#define PSW_ADDR_AMODE            0x0000000000000000UL /* 0x80000000UL for 31-bit */
 #define S390_SYSCALL_OPCODE ((uint16_t)0x0a00)
 
 typedef struct {
@@ -148,11 +147,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = (unsigned long)
-                ka->sa_restorer | PSW_ADDR_AMODE;
+        env->regs[14] = ka->sa_restorer;
     } else {
-        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
-                        | PSW_ADDR_AMODE;
+        env->regs[14] = frame_addr + offsetof(sigframe, retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
                    &frame->retcode);
     }
@@ -162,7 +159,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
-    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
+    env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
@@ -210,10 +207,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
+        env->regs[14] = ka->sa_restorer;
     } else {
-        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
-                        | PSW_ADDR_AMODE;
+        env->regs[14] = frame_addr + offsetof(typeof(*frame), retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    &frame->retcode);
     }
@@ -223,7 +219,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
-    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
+    env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
@@ -248,7 +244,6 @@ restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
                                      (unsigned long long)env->psw.addr);
     __get_user(env->psw.addr, &sc->regs.psw.addr);
-    /* FIXME: 31-bit -> | PSW_ADDR_AMODE */
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
-- 
2.31.1


