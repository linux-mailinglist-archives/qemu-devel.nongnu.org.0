Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5483839C3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:26:36 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig4h-0002UQ-QD
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyk-0001k4-S8
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyZ-000269-2n
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:25 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n2so7120305wrm.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/hNpOL3LseeGhFSjqXSpkvVGbd/+PpFDw4qT/V6I3k=;
 b=tPcvegta0anouMbL3EvCXBbW1M8ZzJZh7Cdl+qwJxAOjZHmJW4wGO8XuiFS+vYi84P
 fmXEFrFI5Oex7tOrOJG8pWMx000O8hS6d4Zn8k6zoYOnTSEZ6cUOhjxSDzy1yBFBjsDo
 Nv+ctVaE5JjlMcLTIvn97y+EXGy8zgIuFCArwGigvS2aqalhh5g50x/V+ANlcQrPlrQv
 EWHK4i3bP2nee/6Jwo9x/DwfzfJNBU1HNlU5jIbcZJhQo95TtxWM5SCr6amgfji9sDTp
 qgdKoDng1X2wFQ8OPArm1qgsSyatORqFs4KG+QwcLRbV9PYlPnPmTARMMux31lOWh4nz
 epkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/hNpOL3LseeGhFSjqXSpkvVGbd/+PpFDw4qT/V6I3k=;
 b=TJVuV8V120GeDEweFf3yJXH4h61nDlmQj6TQW+7Cy6TxmhEg+VYw7FX7d+hH/kfq1O
 8h7C8rm1A1y+GgzBOrZCu7lFFburb+/Y0PJG2/0yDqIhNldCwYZOYx1uex+J2jBx1/vs
 FoFdk5O5IDPdJjhwbEqnqeq7532vsKpcs0iTbf+y9Pa4vkbPL3Ze8JOulVNBvOZx9hF6
 GcAUrInJdobX14ghgunN4CNE3b9exqkSI+mjtfdK30fZ0rfDrbUnY4SVL/X9liKOXYoN
 tMroaeTnVFCsB4x3InNPPrvYb46QQcQtkzjKqfgCWYJMRqcg/QAMOL7A5VqDvQFeqe0P
 jPbQ==
X-Gm-Message-State: AOAM533WWiRXWR/1dvvog3uV67etUFbCww2RZmt8i6aeIxnr5yx42hDD
 aoSIv/TeL+SpW8ttHoYbaL2rOg==
X-Google-Smtp-Source: ABdhPJwg5MDPVuaTn8AkV7hzxNPEbhfn10iUOUv0vYKvBtf0mw0NQN9t3+6fsWNFeOV5lw6SFjLomg==
X-Received: by 2002:adf:f142:: with SMTP id y2mr558277wro.426.1621268413820;
 Mon, 17 May 2021 09:20:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q13sm16397627wrw.56.2021.05.17.09.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91C5A1FF9E;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/29] tests/tcg/tricore: Add dvstep test
Date: Mon, 17 May 2021 17:10:08 +0100
Message-Id: <20210517161022.13984-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-10-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-20-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 52aa936c56..59b4b9a352 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -19,6 +19,18 @@
 
 #define DREG_DEV_ADDR %a15
 
+#define EREG_RS1 %e6
+#define EREG_RS1_LO %d6
+#define EREG_RS1_HI %d7
+#define EREG_RS2 %e8
+#define EREG_RS2_LO %d8
+#define EREG_RS2_HI %d9
+#define EREG_CALC_RESULT %e8
+#define EREG_CALC_RESULT_HI %d9
+#define EREG_CALC_RESULT_LO %d8
+#define EREG_CORRECT_RESULT_LO %d0
+#define EREG_CORRECT_RESULT_HI %d1
+
 /* Test case wrappers */
 #define TEST_CASE(num, testreg, correct, code...) \
 test_ ## num:                                     \
@@ -27,6 +39,15 @@ test_ ## num:                                     \
     mov DREG_TEST_NUM, num;                       \
     jne testreg, DREG_CORRECT_RESULT, fail        \
 
+#define TEST_CASE_E(num, correct_lo, correct_hi, code...)  \
+test_ ## num:                                              \
+    code;                                                  \
+    mov DREG_TEST_NUM, num;                                \
+    LI(EREG_CORRECT_RESULT_LO, correct_lo)                 \
+    jne EREG_CALC_RESULT_LO, EREG_CORRECT_RESULT_LO, fail; \
+    LI(EREG_CORRECT_RESULT_HI, correct_hi)                 \
+    jne EREG_CALC_RESULT_HI, EREG_CORRECT_RESULT_HI, fail;
+
 #define TEST_CASE_PSW(num, testreg, correct, correct_psw, code...) \
 test_ ## num:                                                      \
     code;                                                          \
@@ -57,7 +78,13 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2;          \
     )
 
-
+#define TEST_E_ED(insn, num, res_hi, res_lo, rs1_hi, rs1_lo, rs2) \
+    TEST_CASE_E(num, res_lo, res_hi,                              \
+    LI(EREG_RS1_LO, rs1_lo);                                      \
+    LI(EREG_RS1_HI, rs1_hi);                                      \
+    LI(DREG_RS2, rs2);                                            \
+    insn EREG_CALC_RESULT, EREG_RS1, DREG_RS2;                    \
+    )
 
 /* Pass/Fail handling part */
 #define TEST_PASSFAIL                       \
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index a9b81545e2..799b51191e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -6,6 +6,7 @@ ASFLAGS =
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
+TESTS += test_dvstep.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_dvstep.S b/tests/tcg/tricore/test_dvstep.S
new file mode 100644
index 0000000000..858dbc62dd
--- /dev/null
+++ b/tests/tcg/tricore/test_dvstep.S
@@ -0,0 +1,15 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    #                              Result                   RS1            RS2
+    TEST_E_ED(dvstep,   1, 0x000001ff, 0xfffe5cff, 0x00000001, 0xfffffe5c, 0x0)
+    TEST_E_ED(dvstep,   2, 0x00000000, 0x000000ff, 0x00000000, 0x00000000, 0x0)
+    TEST_E_ED(dvstep,   3, 0x0000f000, 0x000000fd, 0x010000f0, 0x00000000, 0x0)
+    TEST_E_ED(dvstep,   4, 0xfffff000, 0x00000000, 0x7ffffff0, 0x00000000, 0x0)
+    TEST_E_ED(dvstep.u, 5, 0xffffff00, 0x100008ff, 0xffffffff, 0x00100008, 0x0)
+    TEST_E_ED(dvstep.u, 6, 0x00000100, 0x00000000, 0x08000001, 0x00000000, \
+                           0xffffff2d)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


