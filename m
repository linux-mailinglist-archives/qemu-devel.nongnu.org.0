Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F114F3646DC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:14:57 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVc1-0002FK-0w
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQ9-0004Bg-2F
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQ7-0002qX-5J
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e5so5741892wrg.7
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VIg7qw3G3Wf81cGSwkWP+w1Bj/vvGUaYloDj5g7DKuk=;
 b=He7q4LdeC6t+6lmvBoubDAz9aPaShQlAQO2H385DxtsH4Drmv5SPt+fWPG5nONvgeF
 DMIpS+3OmJw9wi+eBJ9mdtRfgAdpQHhTq8yXUYAlT7Oi1hZ1WwDEKNbdzlLL4xZTLxmH
 i+JkbJFZ+eXfQTFY2yV424aLZz8Zv2G4GbCjK54mbjrwxIyYqgEMOGMHQC1m1i3gJA2j
 EgG3eUMSVn3n4bgTJyQhIo37xnVxCjy75h2LkkMzzFgH9+FVowHkZz1Sc7XJbgu0tJ8B
 V+mQWcUgV3Dwox9Q1SMdNm9u561jJCzUTIqFm60AvVJXNdvm8GTs9Q5LPRXvq8+blwyn
 mdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VIg7qw3G3Wf81cGSwkWP+w1Bj/vvGUaYloDj5g7DKuk=;
 b=b+xOMaqsc6btUbrpdqYPKgr+nFVFBASvk4/xioNqQGeoh2fvbs++fAp8Os3caxhSXe
 y5+dazcMSzQqH2Zx0ImZxsbdfRGRS16f0pynZfIAw2ToZSFzyKd2t8yMtIhFSIXIDGg5
 7DdRH8aFzsslWsjbc1q92GBoBEtNFEO7cp7orFzhpTmtOJuCbzLKpFcWiFoDtraCg13D
 KL6lCoDxNR2JcFK/hK0ehV9kSnVWIH3nLeKfxvs1L7tYFzIl83uzTuOtgw24J5S6+JDc
 AHbUWwhEkVkdqW8wmYIHJhn72e1BxxSst9YH3VETSxnJPejDfafv2ufM4Drw5OaIwOIu
 d64Q==
X-Gm-Message-State: AOAM5318rxmqqHf2ZZEJ2B/Sux0bEB+vAH1dwTRagCQX55RghQ4EWYH2
 muv+Cx61f4sBx4vDbdA+LVe8IA==
X-Google-Smtp-Source: ABdhPJyHvvY8tUPAOmFlxNl6MG/874Oz1OdSciWyVu0F2gAlnB7ls3O2JbudeoFURsDqYtOL/RAgNg==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr15551902wru.146.1618844557494; 
 Mon, 19 Apr 2021 08:02:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g13sm26830772wrr.9.2021.04.19.08.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:02:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 495E61FFA5;
 Mon, 19 Apr 2021 15:54:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 17/25] tests/tcg/tricore: Add bmerge test
Date: Mon, 19 Apr 2021 15:54:27 +0100
Message-Id: <20210419145435.14083-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-8-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/macros.h                | 24 +++++++++++++++++++++++
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/test_bmerge.S           |  8 ++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 tests/tcg/tricore/test_bmerge.S

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


