Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C038715C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:39:09 +0200 (CEST)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisRg-0001Bw-39
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKe-0007PV-Tc
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:52 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKb-00075J-Jk
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:52 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MgNQd-1lGgeq0o7b-00hzfn; Tue, 18
 May 2021 07:31:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 28/59] linux-user/sparc: Minor corrections to do_sigreturn
Date: Tue, 18 May 2021 07:31:00 +0200
Message-Id: <20210518053131.87212-29-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BFI5rHXYAIEDrRze942IqTicXNlMq9tNE+BxoP7KZFzabJYepyB
 +brjGrKOoVLssvJr7A/pyNbEF8sRpsmWUr5PB4aFlvTmqVWXRp/VvZGH0i5hg/3J0l3gHmx
 802XSW+Fad/CCd423YjxHXx4moTWnPHqeiMkT18ewpGxAlaDttpkmKSr1bBCpeTSGN7OrId
 HeBvU5aP/jH7phxIQzKeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FRzrQkrgFgQ=:HC5I7Ol2cTI2lrPl0TjZTo
 XfHe5mgFt0aHFGAalVVEj4+febFF6vmpx0T2gM46p6+JPlyhG7md/DbylvjibfTzGzvnPkMu8
 bbTv7yhUDHYhYiesvIfD3/Uw/TgHufj5KCttjBc8KigLbIY+WVBFb3LiEAySCSEfHAkb5iHF2
 hBaX6s6g7lPTI0/auuDNEKQsINL6YtT8hyX6+XgB+zEjW9NcwMRmwwZuQ9hvxLlHi2P0rOKSU
 HHkA2xtZU99yNRKRyCHQpsdSk52B65ayG25eScJkrDLjngoRgCZpT4hoO+IcIqiSxHTxtDoId
 J8zJzi0qbhlnukq5b9gySFvCdaJZxbzDLr+CAmtILFkyAGCHbK4qMxn/sB2Cywz2GIPGLZ8Q5
 HgBu7VxfcHyw3yyvwZ9x8bgrZMQVNpjK+/S+Jg4YMKr1dRy4Kl1EO38RjJ+bwcDjnQbAhm/0q
 Dc+RFMRY0uyUgyc9hA0ZKtclma+QJu1mvEHbARERzQ2ylQAVM+SDjzBIbzy7WhrEReJMAYxxt
 VRORaMds5uaEGfX/zl//uM=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Check that the input sp is 16 byte aligned, not 4.
Do that before the lock_user_struct check.

Validate the saved sp is 8 byte aligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-22-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index f0f614a3af7a..0ff57af43d1e 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -254,7 +254,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
-    struct target_signal_frame *sf;
+    struct target_signal_frame *sf = NULL;
     abi_ulong pc, npc, ptr;
     target_sigset_t set;
     sigset_t host_set;
@@ -262,18 +262,21 @@ long do_sigreturn(CPUSPARCState *env)
 
     sf_addr = env->regwptr[WREG_SP];
     trace_user_do_sigreturn(env, sf_addr);
-    if (!lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
-        goto segv_and_exit;
-    }
 
     /* 1. Make sure we are not getting garbage from the user */
+    if ((sf_addr & 15) || !lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
+        goto segv_and_exit;
+    }
 
-    if (sf_addr & 3)
+    /* Make sure stack pointer is aligned.  */
+    __get_user(ptr, &sf->regs.u_regs[14]);
+    if (ptr & 7) {
         goto segv_and_exit;
+    }
 
-    __get_user(pc,  &sf->regs.pc);
+    /* Make sure instruction pointers are aligned.  */
+    __get_user(pc, &sf->regs.pc);
     __get_user(npc, &sf->regs.npc);
-
     if ((pc | npc) & 3) {
         goto segv_and_exit;
     }
@@ -309,7 +312,7 @@ long do_sigreturn(CPUSPARCState *env)
     unlock_user_struct(sf, sf_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 
-segv_and_exit:
+ segv_and_exit:
     unlock_user_struct(sf, sf_addr, 0);
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
-- 
2.31.1


