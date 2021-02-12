Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C863C31A6A6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:18:16 +0100 (CET)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfpP-0003oq-Su
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmI-00020Q-Os
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:02 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:58791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmG-0003UA-U1
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:02 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MuUvS-1m0i681Sks-00rVmI; Fri, 12 Feb 2021 22:14:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] m68k: add missing BUSCR/PCR CR defines,
 and BUSCR/PCR/CAAR CR to m68k_move_to/from
Date: Fri, 12 Feb 2021 22:14:45 +0100
Message-Id: <20210212211448.413489-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210212211448.413489-1-laurent@vivier.eu>
References: <20210212211448.413489-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WeYo1MYK+l+qL5Uxbha8GIc3P6rgK/vz3MqsT/h0lyOGQGd0vrF
 ePcVt5vraZSf9Z6n48SDy/IzC6pehoBP3lmOQXOWluKOF55utRp4kC3t9epoBwevTv9aTNg
 lRrBKNhCPFfJYGlb1xbu8fevK9JB3k/c87BYS7NJL/gclH5CoSbGNnEAJBcehVmZgBCSsza
 NzViCV/3UUKQdnOs9pBKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sNQulsOmDZ4=:6UyNkTZ7BBOd1oyGJ19oDZ
 BggdxQ4d1z+mkerHF8P31T4laaaELaRYXglxxQctt5uJcwtXR1sYRz8HV8dtwkcRQ5Iz4Pjbb
 AjafWGkFHjgHQUyG8eEpItI1/cpoFy6v028Gs1NoUKbonw1QHs0PE7C9qLpQcF7meYFExytGs
 23icg11wCFZRCpqPJJS63++NjptLOj9Upqnfi79Wxx4tTb0xh9ielpeoFDnK+cSXy19ztVv4Y
 w+MZmlk7Dzxt4P6lkouxm5Q0exMJwINm1pJNa+EwzWjFtpo/xxJQM9iSdbJCREJlO1X36pouR
 WKAgfa18PNsAOUf+r40wPQF4bGmOtSsPmUOvbUvM/D21UkIPL/zZ9NbI3/bD8KX52M60Xok0x
 irUSJq+yth4n6ABhBmUpEk2dx2Tdbj2tYquPOZrIP1dz2RTx/7OZwG10hfP9hYI7rKityfzTG
 jcZzj+1a4A==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>

The BUSCR/PCR CR defines were missing for 68060, and the move_to/from helper
functions were also missing a decode for the 68060 M68K_CR_CAAR CR register.

Added missing defines, and respective decodes for all three CR registers to
the helpers.

Although this patch defines them, the implementation is empty in this patch
and these registers will result in a cpu abort - which is the default prior
to this patch.

This patch aims to reach full coverage of all CR registers within the helpers.

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <19e5c0fa8baed6479ed0502fd3deb132d19457fb.1612137712.git.balaton@eik.bme.hu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h    |  4 ++++
 target/m68k/helper.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 2b1cdf241bab..ae34c9461503 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -393,6 +393,10 @@ typedef enum {
 #define M68K_CR_DACR0    0x006
 #define M68K_CR_DACR1    0x007
 
+/* MC68060 */
+#define M68K_CR_BUSCR    0x008
+#define M68K_CR_PCR      0x808
+
 #define M68K_FPIAR_SHIFT  0
 #define M68K_FPIAR        (1 << M68K_FPIAR_SHIFT)
 #define M68K_FPSR_SHIFT   1
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 9e81ee53ad8b..69acdc3b353c 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -255,6 +255,11 @@ void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
     case M68K_CR_DTT1:
         env->mmu.ttr[M68K_DTTR1] = val;
         return;
+    /* Unimplemented Registers */
+    case M68K_CR_CAAR:
+    case M68K_CR_PCR:
+    case M68K_CR_BUSCR:
+        break;
     }
     cpu_abort(env_cpu(env),
               "Unimplemented control register write 0x%x = 0x%x\n",
@@ -309,6 +314,11 @@ uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
     /* MC68040/MC68LC040 */
     case M68K_CR_DTT1: /* MC68EC040 only: M68K_CR_DACR1 */
         return env->mmu.ttr[M68K_DTTR1];
+    /* Unimplemented Registers */
+    case M68K_CR_CAAR:
+    case M68K_CR_PCR:
+    case M68K_CR_BUSCR:
+        break;
     }
     cpu_abort(env_cpu(env), "Unimplemented control register read 0x%x\n",
               reg);
-- 
2.29.2


