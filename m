Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF768EAE8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgXh-0003VP-Tg; Wed, 08 Feb 2023 04:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXe-0003UV-4a
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:15:02 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXb-0007q4-6H
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jKObQU9Z5cglN9gU4ODEMzyjf+gD+v9D+U0m4sA0Ydg=; b=p1HyDYR0sE9zLUFYAwQrxVztL7
 F7TvWH7s6xrbrGr/lFvWORhKMeEfvxZpONEfzcPrbBlClDBwUHMylxDvxSvSujll0376/YtdeQQR/
 N1SpAgMZrNUcM7651nv27U47IbQKR3amUz3uydp3Rffptwd9BZmSibEaSyFqEjxyOcug=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 12/12] tests/tcg/tricore: Add test for ld.h
Date: Wed,  8 Feb 2023 10:14:22 +0100
Message-Id: <20230208091422.1243084-13-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
References: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.154.177.181, fs=778835, da=163456751, mc=23, sc=0,
 hc=23, sp=0, fso=778835, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.8.90317, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
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

this exercises the error reported in
https://gitlab.com/qemu-project/qemu/-/issues/652.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20230203132132.511254-1-kbastian@mail.uni-paderborn.de>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/macros.h                | 13 +++++++++++++
 tests/tcg/tricore/test_ld_h.S             | 15 +++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 tests/tcg/tricore/test_ld_h.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index b6c19dbecd..d2446af8b4 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -14,6 +14,7 @@ TESTS += test_ftoi.tst
 TESTS += test_imask.tst
 TESTS += test_insert.tst
 TESTS += test_ld_bu.tst
+TESTS += test_ld_h.tst
 TESTS += test_madd.tst
 TESTS += test_msub.tst
 TESTS += test_muls.tst
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 109ef62a4d..ec4f5bff52 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -21,6 +21,7 @@
 #define DREG_TEMP %d11
 #define DREG_TEST_NUM %d14
 #define DREG_CORRECT_RESULT %d15
+#define DREG_CORRECT_RESULT_2 %d13
 
 #define AREG_ADDR %a0
 #define AREG_CORRECT_RESULT %a3
@@ -79,6 +80,18 @@ test_ ## num:                                               \
     LI(DREG_CORRECT_RESULT, addr_result)                    \
     jne DREG_CALC_RESULT, DREG_CORRECT_RESULT, fail;
 
+#define TEST_LD_SRO(insn, num, result, addr_result, ld_pattern)  \
+test_ ## num:                                                    \
+    LIA(AREG_ADDR, test_data)                                    \
+    insn %d15, ld_pattern;                                       \
+    LI(DREG_CORRECT_RESULT_2, result)                            \
+    mov DREG_TEST_NUM, num;                                      \
+    jne %d15, DREG_CORRECT_RESULT_2, fail;                       \
+    mov.d DREG_CALC_RESULT, AREG_ADDR;                           \
+    LI(DREG_CORRECT_RESULT, addr_result)                         \
+    jne DREG_CALC_RESULT, DREG_CORRECT_RESULT, fail;
+
+
 /* Actual test case type
  * e.g inst %dX, %dY      -> TEST_D_D
  *     inst %dX, %dY, %dZ -> TEST_D_DD
diff --git a/tests/tcg/tricore/test_ld_h.S b/tests/tcg/tricore/test_ld_h.S
new file mode 100644
index 0000000000..d3c157a046
--- /dev/null
+++ b/tests/tcg/tricore/test_ld_h.S
@@ -0,0 +1,15 @@
+#include "macros.h"
+.data
+test_data:
+    .word 0xaffedead
+    .word 0x001122ff
+.text
+.global _start
+_start:
+#                               expect. addr reg val after load
+#              insn  num  expect. load value |          pattern for loading
+#                |    |     |                |              |
+    TEST_LD    (ld.h, 1, 0xffffaffe, MEM_BASE_ADDR, [AREG_ADDR]2)
+    TEST_LD_SRO(ld.h, 2, 0x000022ff, MEM_BASE_ADDR, [AREG_ADDR]4)
+
+    TEST_PASSFAIL
-- 
2.39.1


