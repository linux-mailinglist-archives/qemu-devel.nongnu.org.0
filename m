Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC41EE062
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 11:00:06 +0200 (CEST)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgljJ-0007NT-St
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 05:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jglem-0000Pj-1T
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 04:55:24 -0400
Received: from shirlock.uni-paderborn.de ([2001:638:502:c003::15]:42460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jglek-0002FV-RJ
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 04:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=npYhjsJMTKQ6Eh0AkH5c2ywI8cDtryefsW9Yukj9Ba8=; b=YAsLRrYuY4uBoZV/JtWbndMYYK
 RnY6biUdwgYSm99FUiWX3/aIhnqw0WlKO6jOlbL/FLa1HYmegDvjcxWIWU/BrfgMfZj1xFQb4X29+
 2UL0kEWT67h+LwGFNKB8Ko8kh7X7Oc+x6fi0kEWWzbjR9RFO70RVCCSxos/3yk36FyD0=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] tests/tcg/tricore: Add ftoi test
Date: Thu,  4 Jun 2020 10:54:38 +0200
Message-Id: <20200604085441.103087-13-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604085441.103087-1-kbastian@mail.uni-paderborn.de>
References: <20200604085441.103087-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=6898294, da=78869975,
 mc=183, sc=3, hc=180, sp=1, fso=6898294, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.6.4.84518, AntiVirus-Engine: 5.74.0,
 AntiVirus-Data: 2020.6.4.5740000
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::15;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=shirlock.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/macros.h                |  7 +++++++
 tests/tcg/tricore/test_ftoi.S             | 10 ++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 tests/tcg/tricore/test_ftoi.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 21a7017f07..a4eebbccb4 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -13,6 +13,7 @@ TESTS += test_clz.tst
 TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
+TESTS += test_ftoi.tst
 
 %.pS: $(TESTS_PATH)/%.S
 	$(HOST_CC) -E -o $@ $<
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 59b4b9a352..e6a41cd1a2 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -70,6 +70,13 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1;          \
     )
 
+#define TEST_D_D_PSW(insn, num, result, psw, rs1)     \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw, \
+    LI(DREG_RS1, rs1);                                \
+    rstv;                                             \
+    insn DREG_CORRECT_RESULT, DREG_RS1;               \
+    )
+
 #define TEST_D_DD_PSW(insn, num, result, psw, rs1, rs2) \
     TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,   \
     LI(DREG_RS1, rs1);                                  \
diff --git a/tests/tcg/tricore/test_ftoi.S b/tests/tcg/tricore/test_ftoi.S
new file mode 100644
index 0000000000..fb4af6b5aa
--- /dev/null
+++ b/tests/tcg/tricore/test_ftoi.S
@@ -0,0 +1,10 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D_PSW(ftoi, 1, 0x0, 0x84000b80, 0x05f6e605)
+    TEST_D_D_PSW(ftoi, 2, 0x0, 0x04000b80, 0x00012200)
+    TEST_D_D_PSW(ftoi, 3, 0x0, 0xc4000b80, 0xffffffff)
+
+    TEST_PASSFAIL
+
-- 
2.26.2


