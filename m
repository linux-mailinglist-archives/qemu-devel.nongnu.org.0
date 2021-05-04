Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC937289F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:16:59 +0200 (CEST)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds6s-0002Cb-IB
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzh-0002TA-8a
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzd-0006kn-5i
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:31 -0400
Received: by mail-wr1-x435.google.com with SMTP id d4so8734053wru.7
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPMh6kmt7DZA6FRYiUkJHikUFQXem/GBwsoB4cM/qp0=;
 b=DSplFXlBz7FUAmdLpbM9ccGwwZDRC+ewlR9yUcn1RTR2yD44E3Z+WHqu5MDBsKrvh6
 ajW9wphWd37A4fqsaFT6i/B1v9d1vYFHtjUnCmP/vIHS4f+88aR6D3g89CiYN/pjuSDY
 smTU8sn4W6PEF+Qu5M2mlScBGMLMO4pF4nHznxxDMdMAq3asoJg8Eewyr6nv16ZaUmmy
 Qec3h/ECyOhkuUDSi2aQbdGA/fanaPoBLBEfar8j/uHA74an9ft6FQ6THIBYvDElzIfn
 /ElxWITHn+4y5S84fBBUCZyz+Am2fUxpWyjcw8/r0ABnU9aLF+bD6ZdKXF2Mo/oXQsfa
 BRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPMh6kmt7DZA6FRYiUkJHikUFQXem/GBwsoB4cM/qp0=;
 b=gWdAIQ6UXO7PxVffrBBEByrr16TKN2nbqHzaIUQbP2Wzpj9ZA1SdUnIoiHWGd7uP+2
 TayTwSgo5jKArLLb7zo7CApX4IKprZ42mEua9p42oPQ6jeIZfWdI04HoXp8REPx9xDnY
 e/cfE6N61famhO/ZMlpz+mqAUPbfzgStVOLt+I1A6GY7xzU8HSVTnnghzj/UiYKnZalM
 5X2ctipw5CIN1UEL5MnP5Wa3tckZJawKvYv1lrm3MSfixABWiLNkiVyLPQ04fhKg0sjO
 whDJIRvrHbkiLKA9gNbL8CSt9s4mGOvMs3V2I5FRh1O9vlm6Rkx/DPI9uoJMMkNYgYKt
 u7oQ==
X-Gm-Message-State: AOAM531HuoL/nyouh2B1klNqWAvbT+h08NfyYPWEuCFAHDxHWj6kCjt2
 bcCrRTQFjjGyWr4JJuYcpbLSwg==
X-Google-Smtp-Source: ABdhPJyUIEKF9fppooYpH4NqwL3+mnIeHxDw0HHdipo0slcHcwzA9SAOOOsWbNlnoyxueZnz9XX+aA==
X-Received: by 2002:a05:6000:178c:: with SMTP id
 e12mr30944377wrg.42.1620122967762; 
 Tue, 04 May 2021 03:09:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 6sm2625772wmg.9.2021.05.04.03.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 131EC1FFAC;
 Tue,  4 May 2021 11:02:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 23/30] tests/tcg/tricore: Add madd test
Date: Tue,  4 May 2021 11:02:16 +0100
Message-Id: <20210504100223.25427-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Message-Id: <20210305170045.869437-14-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/macros.h                | 18 ++++++++++++++++++
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/test_madd.S             | 11 +++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 tests/tcg/tricore/test_madd.S

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


