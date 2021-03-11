Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C22338034
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 23:21:11 +0100 (CET)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKTg5-0005iC-OK
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 17:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTdg-0004It-T7
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:18:40 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:34483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTda-00049u-J6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:18:40 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MCGag-1lSl5u2nUg-009N7j; Thu, 11 Mar 2021 23:18:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature
Date: Thu, 11 Mar 2021 23:18:27 +0100
Message-Id: <20210311221827.2595898-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311221827.2595898-1-laurent@vivier.eu>
References: <20210311221827.2595898-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f79WPSjOAQ80XqI9L5dQ9ViAvJYgUdiNiwrIKakiqAoxbgzxg9h
 hoqJH9MRM7hQt4oonDaU5lyj8iXFo2/HFFbwL4akxliWvaFuGmFZxmLuLA1jVY97eqU6q79
 1kAYuSBvqME4shk/kmln7X6WtV6X7XnnhXMxeNx4WNirhMyejH8U+YLsM3uLpO1iG0EIU43
 pJ2ny4qV14c7dQAuhRF3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KHCm7O6N578=:bPVWizxVK1Aab9+7uy4ynR
 0gNDEkzKLO7WPH0zEatVUOJALR16Y2r0kb8oxaiAVGSpfi0Q0QGfWmOOsV7VhqKd2m00JkN4l
 atCovNa+KpTPwmLHFvC59FBnHn9IQ7PQOp7kEPXjrqNFmDz1M9F79zkc2MZqwixkyuc8AcwhW
 AbgAtt/J1P9wFpcBtv99laW7Ek2c6hHZ1ue3mEIawwhbiEUjjO0woEe6i8vMeOqzz0bovJkhp
 Ua5wOsBsmS127mUm2htXmF1tF59LaLtfk3lvW4Y3M+dlpJAlTM+8gQ1UtM/pD9nwe/iKlt6ol
 xjMrb0kMaPRySz6DWgcixYlid9nzil/d9DsNS6oTNlBSpI9W4/o8wN/CzyuBQOYCFRJGuT1TO
 EtVnQje99oUrew82TkUlPb3z8WAXJagfs/xahGFTKdcKHjNeqFZphp4I55IPOGGH3nJIGfBUy
 2QOnTCII3A==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

According to the M68040UM Appendix D the requirement for data accesses to be
word aligned is only for the 68000, 68008 and 68010 CPUs. Later CPUs from the
68020 onwards will allow unaligned data accesses but at the cost of being less
efficient.

Add a new M68K_FEATURE_UNALIGNED_DATA feature to specify that data accesses are
not required to be word aligned, and don't perform the alignment on the stack
pointer when taking an exception if this feature is not selected.

This is required because the MacOS DAFB driver attempts to call an A-trap
with a byte-aligned stack pointer during initialisation and without this the
stack pointer is off by one when the A-trap returns.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210308121155.2476-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h       | 2 ++
 target/m68k/cpu.c       | 1 +
 target/m68k/op_helper.c | 5 ++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index ce558e9b03e7..402c86c8769e 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -527,6 +527,8 @@ enum m68k_features {
     M68K_FEATURE_MOVEP,
     /* MOVEC insn. (from 68010) */
     M68K_FEATURE_MOVEC,
+    /* Unaligned data accesses (680[2346]0) */
+    M68K_FEATURE_UNALIGNED_DATA,
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 37d2ed9dc79c..a14874b4da28 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -161,6 +161,7 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CAS);
     m68k_set_feature(env, M68K_FEATURE_CHK2);
     m68k_set_feature(env, M68K_FEATURE_MSP);
+    m68k_set_feature(env, M68K_FEATURE_UNALIGNED_DATA);
 }
 
 /*
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 5f981e5bf628..46ff81acc9f5 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -348,7 +348,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
     cpu_m68k_set_sr(env, sr);
     sp = env->aregs[7];
 
-    sp &= ~1;
+    if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
+        sp &= ~1;
+    }
+
     if (cs->exception_index == EXCP_ACCESS) {
         if (env->mmu.fault) {
             cpu_abort(cs, "DOUBLE MMU FAULT\n");
-- 
2.29.2


