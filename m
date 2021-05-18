Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8D3871B3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:17:48 +0200 (CEST)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lit35-0008JF-Sb
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKs-0007oK-0G
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:06 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007Ad-2x
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:05 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MHEPI-1leUd21PzE-00DG9u; Tue, 18
 May 2021 07:31:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 45/59] linux-user/s390x: Add build asserts for sigset sizes
Date: Tue, 18 May 2021 07:31:17 +0200
Message-Id: <20210518053131.87212-46-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:67j5AqJGsbL04czHgkpz4p5+F0BEW+pTridcSZoViXMHLJcRnxS
 HG83q5NBR7IjB/8BWTmQSQRUMUkHMpMEKHyhcyXCYBBMivYv34alENyzlbZbUyZODMD0V4t
 ta0D/F94a+NH0jpoYXbJY+ksiEoPzOGieI1sYqNrv84cxKXU7aEQp0QgiQBCJ9/sqJzt7M5
 lmhOo501069D7FYif0pLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ofUPTZ16NJ8=:FmQsXo5RtrB+NzZA/Cqqx9
 abK6+2y8tJIMNyJ3bH/qwsB5f7B+ouN0KDvsGhNpq77ky7T/+p9B+MjghjlPLXRJ9kXAocRDT
 ZHoQDlJWx2uNyiI2seEC3V2Xzc+583IP3hQAIZgNjG8o8dfTq/KSCPC657+02rRBEFcHdb8CE
 r28D4U32vUXkQ6aRJFa4s4xuZvSDGWpjgDKHGsaJ9RDom8K+alJLCMipeRkSsI3tXrIXPRKuD
 Quh76OibVkl+DT4tZBYaF7culrzB600rB+LzrfSFhxPLOHavpNbsufT5v6OXYGpDY2JQoFx2y
 R5PsYpd5ePGAarhsVBEgnLsvluM7eyVemRsMLOh23FokiUHfNwgd4l4Uiy8FSQaJ1LRuBCuTu
 L+6qm2muolaxz75oW1JWlw1juDBd9CWHF8Ed8inWAGeiqFUezy6S53Gnd3UHfaABDRk7nr5dv
 xoRlgNofFD5oCjJcaiXvhh5qm1auAZ4hMxTtMoIrIU/cw9fFAjSmxOPyv7RelofUGFjponH0g
 Iv2zQ639WLEMS9yOrtPH0g=
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
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

At point of usage, it's not immediately obvious that
we don't need a loop to copy these arrays.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-14-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 81ba59b46af5..839a7ae4b3d6 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -141,6 +141,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
         return;
     }
 
+    /* Make sure that we're initializing all of oldmask. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(frame->sc.oldmask) != 1);
     __put_user(set->sig[0], &frame->sc.oldmask[0]);
 
     save_sigregs(env, &frame->sregs);
@@ -266,6 +268,9 @@ long do_sigreturn(CPUS390XState *env)
         force_sig(TARGET_SIGSEGV);
         return -TARGET_QEMU_ESIGRETURN;
     }
+
+    /* Make sure that we're initializing all of target_set. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(target_set.sig) != 1);
     __get_user(target_set.sig[0], &frame->sc.oldmask[0]);
 
     target_to_host_sigset_internal(&set, &target_set);
-- 
2.31.1


