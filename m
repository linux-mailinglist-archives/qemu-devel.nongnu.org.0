Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB168EADF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:16:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgXT-0003T5-LY; Wed, 08 Feb 2023 04:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXP-0003QR-T2
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:49 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXN-0007pg-W0
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xH/3OrC9/XInzN93exAhF+8EHALY8LbDYpWfnQXiVDY=; b=IWxGBY1nWZYnL44l9fvL0AUpcu
 6JAAQdyPqk0elbGTsmjEJxowxcwF52mrOyQcrX7IKAkMmWL9+8Hif21apncshlTfRFy9GNTDzmJD4
 2Ea2epb0ACW07rDEak6u3DyHuoUWT00pY/tAlYRE1vyM03t1nWjBbympBODV57auFPmE=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 10/12] tests/tcg/tricore: Add LD.BU tests
Date: Wed,  8 Feb 2023 10:14:20 +0100
Message-Id: <20230208091422.1243084-11-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
References: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.8.90317, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-Sophos-SenderHistory: ip=84.154.177.181, fs=778832, da=163456748, mc=21, sc=0,
 hc=21, sp=0, fso=778832, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20230202120432.1268-11-kbastian@mail.uni-paderborn.de>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/macros.h                | 23 +++++++++++++++++++++++
 tests/tcg/tricore/test_ld_bu.S            | 15 +++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 tests/tcg/tricore/test_ld_bu.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index e83cc4b7cd..b6c19dbecd 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -13,6 +13,7 @@ TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
 TESTS += test_imask.tst
 TESTS += test_insert.tst
+TESTS += test_ld_bu.tst
 TESTS += test_madd.tst
 TESTS += test_msub.tst
 TESTS += test_muls.tst
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 06bdbf83cb..109ef62a4d 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -4,6 +4,10 @@
     movh DREG_TEMP_LI, up:val; \
     or reg, reg, DREG_TEMP_LI; \
 
+#define LIA(reg, val)        \
+    LI(DREG_TEMP, val)       \
+    mov.a reg, DREG_TEMP;
+
 /* Address definitions */
 #define TESTDEV_ADDR 0xf0000000
 /* Register definitions */
@@ -18,6 +22,10 @@
 #define DREG_TEST_NUM %d14
 #define DREG_CORRECT_RESULT %d15
 
+#define AREG_ADDR %a0
+#define AREG_CORRECT_RESULT %a3
+#define MEM_BASE_ADDR 0xd0000000
+
 #define DREG_DEV_ADDR %a15
 
 #define EREG_RS1 %e6
@@ -60,11 +68,24 @@ test_ ## num:                                                      \
     mov DREG_TEST_NUM, num;                                        \
     jne DREG_CALC_PSW, DREG_CORRECT_PSW, fail;
 
+#define TEST_LD(insn, num, result, addr_result, ld_pattern) \
+test_ ## num:                                               \
+    LIA(AREG_ADDR, test_data)                               \
+    insn DREG_CALC_RESULT, ld_pattern;                      \
+    LI(DREG_CORRECT_RESULT, result)                         \
+    mov DREG_TEST_NUM, num;                                 \
+    jne DREG_CALC_RESULT, DREG_CORRECT_RESULT, fail;        \
+    mov.d DREG_CALC_RESULT, AREG_ADDR;                      \
+    LI(DREG_CORRECT_RESULT, addr_result)                    \
+    jne DREG_CALC_RESULT, DREG_CORRECT_RESULT, fail;
+
 /* Actual test case type
  * e.g inst %dX, %dY      -> TEST_D_D
  *     inst %dX, %dY, %dZ -> TEST_D_DD
  *     inst %eX, %dY, %dZ -> TEST_E_DD
  */
+
+
 #define TEST_D_D(insn, num, result, rs1)      \
     TEST_CASE(num, DREG_CALC_RESULT, result,  \
     LI(DREG_RS1, rs1);                        \
@@ -143,6 +164,8 @@ test_ ## num:                                                      \
     insn EREG_CALC_RESULT, imm1, DREG_RS1, imm2);              \
     )
 
+
+
 /* Pass/Fail handling part */
 #define TEST_PASSFAIL                       \
         j pass;                             \
diff --git a/tests/tcg/tricore/test_ld_bu.S b/tests/tcg/tricore/test_ld_bu.S
new file mode 100644
index 0000000000..ff9dac128b
--- /dev/null
+++ b/tests/tcg/tricore/test_ld_bu.S
@@ -0,0 +1,15 @@
+#include "macros.h"
+.data
+test_data:
+    .word 0xaffedead
+    .word 0x001122ff
+.text
+.global _start
+_start:
+#                            expect. addr reg val after load
+#           insn  num  expect. load value |          pattern for loading
+#             |    |     |                |              |
+    TEST_LD(ld.bu, 1, 0xff, MEM_BASE_ADDR + 4, [+AREG_ADDR]4) # pre_inc
+    TEST_LD(ld.bu, 2, 0xad, MEM_BASE_ADDR + 4, [AREG_ADDR+]4) # post_inc
+
+    TEST_PASSFAIL
-- 
2.39.1


