Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0038397B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:19:14 +0200 (CEST)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifxZ-0006dO-Me
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpa-0007ZR-RT
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpJ-00064X-88
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id h4so6983154wrt.12
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zqqVEkVFFAX35vmalm2I3V2tABfps9c4RcLK3dBbjx4=;
 b=R6l4Og+dx6cpayXEZk0Z2ri5kjCAy3UWqpK0TdkXjCnGANBHk+mFYQQNmXT1I7/WW8
 p1h6V5Y2CrUSr8fJJyXYQu5GK3+wdtIoFSfyvcPPcxvbW61L5jaZH/lQnFLqyW2jnXjP
 Wkhjx2Ec2Ok+ExoX4QHRxuyarzGCAwGpMHPYmYYz64ej0TLVpbBMWtVgeNpGgkXfnJhh
 tpTtpHvFNb5manR6p/jTYJ90GoQOfjgvzfwTXalTREdw/Zwv0gLXNlf6scqvgc3CDbvj
 ZKKd0hnWQ43s6PqDcrd8NG0LP7PzMUnoUmy7m7lLVwBdT0rkD6PiIL/4zCBr10+d0ZQZ
 xJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zqqVEkVFFAX35vmalm2I3V2tABfps9c4RcLK3dBbjx4=;
 b=Pjo6UOHPPTMwjk/kahtzuTaRGBL7izFHEmRL0oVPViP9mQzqyq8Xlh2huD0TL6YHoJ
 X+/l6L4jqmE+OPdbamjle60VQOADKVnQKSgGpriZLfOtnSWlojrX7tYdMSf6UJ2oQ2qm
 /Kloeug9BPllNzy8cWg3M0PvgwsZgMHNfp2fx2Hhf8e2fRbADdPQPtU6EOe3bWnz3qzG
 s70Sjy7BfTJrW/we4nzh+Fq+SjMxI1+PvybIFFIlRqiVg9LrjrVPYZaYBK4jSBj7MVwy
 p1xUwhi9AN62ZDp+rYgqOjbJ7niu49fiqWSEsUbnpyzKzc4WgvWOJ7i7daa4nbwqqls2
 Vnuw==
X-Gm-Message-State: AOAM530GKEQ3hUu/1dt2K62yFXmpVajzRGNIUjxZQy4DvO/4aWKQYtNo
 SwazaY1S2Mc4ooFjifuuHSZtaw==
X-Google-Smtp-Source: ABdhPJygfBGB/mDWSR2mUEaYvnX/DOhd+n/ajPX1s5/YJV71viTJtMVYrbVaLSBjxDV5y4qkxVktqw==
X-Received: by 2002:adf:f043:: with SMTP id t3mr519846wro.344.1621267839391;
 Mon, 17 May 2021 09:10:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f26sm13801807wmj.30.2021.05.17.09.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DA251FF9C;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/29] tests/tcg/tricore: Add bmerge test
Date: Mon, 17 May 2021 17:10:06 +0100
Message-Id: <20210517161022.13984-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Message-Id: <20210305170045.869437-8-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-18-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 76c133132a..52aa936c56 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -8,7 +8,10 @@
 #define TESTDEV_ADDR 0xf0000000
 /* Register definitions */
 #define DREG_RS1 %d0
+#define DREG_RS2 %d1
 #define DREG_CALC_RESULT %d1
+#define DREG_CALC_PSW %d2
+#define DREG_CORRECT_PSW %d3
 #define DREG_TEMP_LI %d10
 #define DREG_TEMP %d11
 #define DREG_TEST_NUM %d14
@@ -24,6 +27,17 @@ test_ ## num:                                     \
     mov DREG_TEST_NUM, num;                       \
     jne testreg, DREG_CORRECT_RESULT, fail        \
 
+#define TEST_CASE_PSW(num, testreg, correct, correct_psw, code...) \
+test_ ## num:                                                      \
+    code;                                                          \
+    LI(DREG_CORRECT_RESULT, correct)                               \
+    mov DREG_TEST_NUM, num;                                        \
+    jne testreg, DREG_CORRECT_RESULT, fail;                        \
+    mfcr DREG_CALC_PSW, $psw;                                      \
+    LI(DREG_CORRECT_PSW, correct_psw)                              \
+    mov DREG_TEST_NUM, num;                                        \
+    jne DREG_CALC_PSW, DREG_CORRECT_PSW, fail;
+
 /* Actual test case type
  * e.g inst %dX, %dY      -> TEST_D_D
  *     inst %dX, %dY, %dZ -> TEST_D_DD
@@ -35,6 +49,16 @@ test_ ## num:                                     \
     insn DREG_CALC_RESULT, DREG_RS1;          \
     )
 
+#define TEST_D_DD_PSW(insn, num, result, psw, rs1, rs2) \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,   \
+    LI(DREG_RS1, rs1);                                  \
+    LI(DREG_RS2, rs2);                                  \
+    rstv;                                               \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2;          \
+    )
+
+
+
 /* Pass/Fail handling part */
 #define TEST_PASSFAIL                       \
         j pass;                             \
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 3b048e49fa..de6a2cc88e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -4,6 +4,7 @@ LDFLAGS = -T$(TESTS_PATH)/link.ld
 ASFLAGS =
 
 TESTS += test_abs.tst
+TESTS += test_bmerge.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_bmerge.S b/tests/tcg/tricore/test_bmerge.S
new file mode 100644
index 0000000000..8a0fa6d3f6
--- /dev/null
+++ b/tests/tcg/tricore/test_bmerge.S
@@ -0,0 +1,8 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DD_PSW(bmerge, 1, 0x555557f7, 0x00000b80, 0x0000001d, 0x0000ffff)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


