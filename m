Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F4F2DE0FF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:29:50 +0100 (CET)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD1B-0002Wn-47
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvr-0002u5-Mr
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:19 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:42643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvo-00073h-Jo
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:19 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N0G5h-1jugbD2rnr-00xOCZ; Fri, 18 Dec 2020 11:24:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] linux-user/elfload: Introduce MIPS GET_FEATURE_REG_EQU()
 macro
Date: Fri, 18 Dec 2020 11:23:58 +0100
Message-Id: <20201218102407.597566-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zezIeuqzhi3r8oWSXvmkGfZsJCySwYvgoG/Rw2ognH5UPj8egU3
 Rw1xWWOh2puACTv6E+w5uDMfxhrFs6P5XxNCAHSQQfU1/43xvm9nA1sh7jnonBpnIFeiTqv
 Ui0K96DqtKJmX9P3SojvoRYMiK6GQd6xxkUZFLPl98vrIRIM97PTsrUbQt0BexzyVzCyzMC
 Y1J8bQKRCgmwf/R4JAfrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/FpwHOKjJnc=:Oqohn0N3AiigjbfUD2qv+h
 lQ8oa7UAww5uLndh08dypWOOl/+WD1pGSeM/tvnRimxOrsNOArqWrkanEvQUguPPdZHfVdpzr
 sHDG0GEkEN179kzzxJblR09pjvowqagCYPdmuH+VlqiVTGt3KqtFU7ehElIzVLCSq/foVj/Ll
 ly/QvhlV67B1vT9c3IDtk0UvZgip0Td+DvKYmyI1RidwsL1V7r1Puykn/iDupNCX4Tz/5uQOf
 RlYOimvuh5aMDK3rr59NvqsO+ItFJ6eEAQ0+kj/UOOsQPjd2tl/JgJkijAcqXST3Tnxvsm2Wi
 iX9swera29D6P4gp6xIH56fSXzW/papRempX3xwN/0vG60ItXOjmGCnFB6ruoQP77OgTCEfPp
 JL9nbPqqZrvXe2AtQZDcCWLp7Bp4n7VvBA79vXQoeTTYQqJ8cfL4JQBJljCsxCTafDH5Xyzwa
 XnAgosalbw==
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_EQU() macro which
checks if a CPU register has bits set to a specific value.

Use the macro to check the 'Architecture Revision' level
of the Config0 register, which is '2' when the Release 6
ISA is implemented.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214003215.344522-5-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 12 +++++++++++-
 target/mips/cpu.h    |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b7c6d30723a3..8f943f93ba75 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "disas/disas.h"
+#include "qemu/bitops.h"
 #include "qemu/path.h"
 #include "qemu/queue.h"
 #include "qemu/guest-random.h"
@@ -995,17 +996,26 @@ enum {
 #define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
     do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
 
+#define GET_FEATURE_REG_EQU(_reg, _start, _length, _val, _hwcap) \
+    do { \
+        if (extract32(cpu->env._reg, (_start), (_length)) == (_val)) { \
+            hwcaps |= _hwcap; \
+        } \
+    } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, CP0C0_AR_LENGTH,
+                        2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_REG_EQU
 #undef GET_FEATURE_REG_SET
 #undef GET_FEATURE_INSN
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 3ac21d0e9c07..4cbc31c3e8d2 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -844,6 +844,7 @@ struct CPUMIPSState {
 #define CP0C0_MT   7     /*  9..7  */
 #define CP0C0_VI   3
 #define CP0C0_K0   0     /*  2..0  */
+#define CP0C0_AR_LENGTH 3
     int32_t CP0_Config1;
 #define CP0C1_M    31
 #define CP0C1_MMU  25    /* 30..25 */
-- 
2.29.2


