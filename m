Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF75EDA48
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:43:31 +0200 (CEST)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUXK-0006c6-Sk
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE4-00085w-Fz
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:28 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE1-00089G-Az
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:27 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8yoa-1oYWXU1OiM-0066vZ; Wed, 28
 Sep 2022 10:15:22 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/38] linux-user/hppa: Use EXCP_DUMP() to show enhanced debug
 info
Date: Wed, 28 Sep 2022 10:14:46 +0200
Message-Id: <20220928081517.734954-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dcozIl1eKKzdXmr6gojm9kew86deK7bmN6zH/PznQTo7Vj/US0L
 Q96IVymaJFYzM8T0g0CfyIZaW0RvvFqhEQ+40nx5q8ahtWQBd7q0Dtu6CpAicUia/nyjaTs
 zI5BRi3H+kFlpUDmN14HPQgO3ERekKzY9IyTjjgglNgw1sKxdEpb6Xyx5Mufai5/3fu4xki
 wlHwalPbuQQPuFs0AKO5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5d2J+cT4hdk=:6+SbzBzyO2CcjH0lOD60YN
 g9aDGV8MpZZPS0b3ViVzK3+iwaeExtC7IoFvt7w49VI8D2Ln3g7Clfx6ZR66cuO6jWvQNXPVz
 uiHXonrpwqsKl9gMIkWoitGPRiuBcvctffMLmy6iUFboInQv8df81wB7X/rRrOJu/PSE6tRAo
 SQFAtjcuv99zi6GwB9yF1CWNhTE0L7HbM+QCifSvz4ybuaGQzPqgtdElhfrCWeoG3DTZIj2z4
 ljKxKbSedYHxxo3OXHQYvyXItm7Nm8cltifoANjg/hxg//ZaROPDc8cB8/V+2xhXzHTIpM3mz
 NgMdIc/6xOcBxKomBwuORVAldD2o61RWjWS3zQyZcd3BsgWrnm1uqzp8dWJnOQy3JVzE3CK8A
 ytsL3VwhTzYusNW4AVb7dxgEvpUSSZ066YRTtE3UL437W3iFADC8aL2JYYdBAJth84NSxrvuX
 FopcjHp/bTdtGGYqR6DzCN8yvTdQc9UOEYRga8JXhfQVWsqhZ7UzLTTOeE9cz7IUnoKrvKgjF
 rbseWki1Sgoz1+nOfgB/JWl2MVjCthCOqEAYeV0qtnr8AwgGQkXz/hZzQ+uJKv70S+8t5Outb
 5DUweBXtG2J4kT9oQiOBkkbiJUjOMc1bVitXq11ToMPx3PqroaFiBZVQVHtUkHzV046/GCSAC
 LWjzxngXh0aGnJN4zFqLcO2kOgRyg8oHRa1hTz/sUhawBBe5XzBb/Qg7aCgh245dv0aKuKwqo
 te43M6eCuWuaGkaU0/Nb9CKtsz7dqIUzJn9X+kQMHEEpERHn/GgvHIXKKq4yHazsN+MOzZRfP
 /j3Q5sB
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

Enhance the hppa linux-user cpu_loop() to show more debugging info
on hard errors.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220918194555.83535-6-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/cpu_loop.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 64263c3dc406..1ef3b461911c 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -147,12 +147,15 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
             break;
         case EXCP_ILL:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
         case EXCP_PRIV_OPR:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
             break;
         case EXCP_PRIV_REG:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
@@ -171,7 +174,8 @@ void cpu_loop(CPUHPPAState *env)
             /* just indicate that signals should be handled asap */
             break;
         default:
-            g_assert_not_reached();
+            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n", trapnr);
+            abort();
         }
         process_pending_signals(env);
     }
-- 
2.37.3


