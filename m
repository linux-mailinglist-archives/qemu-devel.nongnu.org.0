Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C3383A24
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:38:19 +0200 (CEST)
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligG2-0003rR-Jt
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifys-0001vV-NJ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyk-0002FT-Lz
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:34 -0400
Received: by mail-wr1-x429.google.com with SMTP id r12so7066401wrp.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3tnX1FEG5gAj6hH28VBua+UMBDYi0WyGLJaNygRNlzA=;
 b=iwDQkp+ANBvtY24CZ+m3//tIcKvGrYmaSkNSfPTrbEp/fm2t95fybRIwxzL/IH+RZY
 hlWxI9geKc8HILNtLS5tewrIsQjgLxgYBoWHkvpDP4FDmuG8P6Yi/vbQG5ohya5MqL6A
 Pnadjmsp1CLOw8pa5nlQJDQJMaDHRmkyrdRHj3SVL8gbMkEIXM5V8XtegJv3H40Xu7Fb
 nueq4faU1JVIw5hknOkZVYheQnZRF08a6pcwxtkFUeJZtVUYOuHmf58NcRIUa80bChDk
 +EFfxTTK6kuwI4L/0ngnORTx41kHb4r06hDsnnKWNplR+rSpxlzDVIenwc4HKbjI59NA
 vuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tnX1FEG5gAj6hH28VBua+UMBDYi0WyGLJaNygRNlzA=;
 b=o9e2pG0pcoxbb8KZgiRYaDuAjrTvxncBrjNyotKJInVIpvKbaQP+l4Qy1W4OibIiD2
 eM5kffLUSX5cYKDIIl/tkVkNZoIKmjYD+/iNf5/xwtr6IPLTh1CR62B61qpezfZRZl/k
 xZi4Y9cjBehf34YhZIR6Z4eBpDttNeXu8kU/o6ewJCB+jz7DoOivTDke7R9iF8OsoF+x
 7q1oHYBV1vKXhz9hhFFW3J4fX0t4ZJTiSWCqEJA1tKckcscaN441V9MmDYSpLyB6SrFO
 Jf1tNX8Xbqy8NzoCkCp3lR/S1ZALmbNuzHLMcHss+Nz+f8DkHaPhPf7MvZI6tAJZUlAG
 Woyw==
X-Gm-Message-State: AOAM5334V70OQ4H+FGCoks7p9CNLk7eLCI4Mq0FOXb1EIWm+AeTUCci0
 +9XWsof+B+TIlhEB9/ov3SO7Bg==
X-Google-Smtp-Source: ABdhPJwGWtiEFhUmnkGBp2Rxt/lcPT6813KmBXKngx9ykjh3c0h2i66hdbq/r2H8+lMbm97dJsW7RA==
X-Received: by 2002:adf:f60c:: with SMTP id t12mr599221wrp.152.1621268424852; 
 Mon, 17 May 2021 09:20:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f15sm1547426wrs.47.2021.05.17.09.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3D1D1FFA6;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/29] tests/tcg/tricore: Add madd test
Date: Mon, 17 May 2021 17:10:12 +0100
Message-Id: <20210517161022.13984-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20210305170045.869437-14-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-24-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index e6a41cd1a2..0d76fc403a 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -9,6 +9,7 @@
 /* Register definitions */
 #define DREG_RS1 %d0
 #define DREG_RS2 %d1
+#define DREG_RS3 %d4
 #define DREG_CALC_RESULT %d1
 #define DREG_CALC_PSW %d2
 #define DREG_CORRECT_PSW %d3
@@ -85,6 +86,23 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2;          \
     )
 
+#define TEST_D_DDD_PSW(insn, num, result, psw, rs1, rs2, rs3) \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,         \
+    LI(DREG_RS1, rs1);                                        \
+    LI(DREG_RS2, rs2);                                        \
+    LI(DREG_RS3, rs3);                                        \
+    rstv;                                                     \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, DREG_RS3;      \
+    )
+
+#define TEST_D_DDI_PSW(insn, num, result, psw, rs1, rs2, imm) \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,         \
+    LI(DREG_RS1, rs1);                                        \
+    LI(DREG_RS2, rs2);                                        \
+    rstv;                                                     \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, imm;           \
+    )
+
 #define TEST_E_ED(insn, num, res_hi, res_lo, rs1_hi, rs1_lo, rs2) \
     TEST_CASE_E(num, res_lo, res_hi,                              \
     LI(EREG_RS1_LO, rs1_lo);                                      \
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index fcc7b6c1c9..8de005523e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -10,6 +10,7 @@ TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
+TESTS += test_madd.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_madd.S b/tests/tcg/tricore/test_madd.S
new file mode 100644
index 0000000000..5d839772bb
--- /dev/null
+++ b/tests/tcg/tricore/test_madd.S
@@ -0,0 +1,11 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DDI_PSW(madd,    1, 0x0000fffd, 0x60000b80, 0x0000ffff, 0x7fffffff,2)
+    TEST_D_DDI_PSW(madd,    2, 0xffff7fff, 0x60000b80, 0xffff8001, 0x7fffffff,2)
+    TEST_D_DDD_PSW(madds.u, 3, 0xffffffff, 0x60000b80, 0x00000000, 0x80000000, \
+                             0x80000000)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


