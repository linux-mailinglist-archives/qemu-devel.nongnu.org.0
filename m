Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CEF38398F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:23:17 +0200 (CEST)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig1T-0004Dj-MI
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpb-0007bf-LS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpS-00066B-5N
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id r12so7033402wrp.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLXv4miOw85rWayN8jZNBHnPaB/MX2m95N1aF2nNELo=;
 b=s9P0915K7rmHVynL2x7SXPJY9Qf93+ZvL+qQ0lAoH7x4Oyt2MveVHPT8zQnX9sOxnC
 TTs5uBn/Ee7+ziTdwMmmJiuL6MVQ1+OxNOUZ6ZcUXuyaD7+YnCHyEMud5fegZEDKY5oh
 rWkWwgKV3E/z6UCBW6mVASkUCDYQ+vgm1id52eTRhkR3UX7auHXCTfmxVs7yBA9B4Kmq
 bAMTbdZZ0FTZwudmnnketrIyTzNTJ4KFVL+B7zDAokBnuPL4D+yC2DskFnp27yhf0hhc
 0+6rMV4wl1P6otNi2IdPQGeVY1BJtVi05+wuJsFUlajviKdQYHWq1oYQ71Qsh4FgLy1j
 whHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLXv4miOw85rWayN8jZNBHnPaB/MX2m95N1aF2nNELo=;
 b=enVP+DqSR1r/5sPxIGKX38dX8o0mb1J6wnJInO6bNT2a45D+b5SrwL5tCOLtnB+eAV
 0NG+WVYNZjElcdeXBq/Ias7PC8kldEPYjXb39fM7k3RzYCCtF3NMPhSY03mLE6ElSATK
 9FEkrzfzcP6GYgqLv8IAb5xX0jU4ZS1yL3AJ+YTUTWJX+2MIrUAWqZoTLsbtiMyfgsMS
 zoyqB9U1hd4RFCp8ef/tA4iIMZssL/Lk2uj/QIkS82uThkEr8Buo6N1xWl1NUl+Utsso
 NLreRDvg3r8lDc5XTU7Mnfy9/4J8RnhrWO3r+3309Jj8oaTyRDJ90KIguv4oWfaQHivU
 YfuQ==
X-Gm-Message-State: AOAM5327r0Pr8YaG9xylKddEdST2VoctGc2n29UX3XAgwu7RRC6tvJ6x
 TFS9ZMm1rzKGuGN9dUgnXZz8zOkpA69rUQ==
X-Google-Smtp-Source: ABdhPJyzhnYnrb0ivcZi6JhR98/uS3zE8pfB7lc6o4KUSJI4KysoPtq9M88+ascZnC7COa+7OhJTEQ==
X-Received: by 2002:a5d:4f03:: with SMTP id c3mr534880wru.158.1621267843758;
 Mon, 17 May 2021 09:10:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y20sm456005wmi.0.2021.05.17.09.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4340E1FF9B;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/29] tests/tcg/tricore: Add macros to create tests and first
 test 'abs'
Date: Mon, 17 May 2021 17:10:05 +0100
Message-Id: <20210517161022.13984-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

This kind of tests is inspired by the riscv-tests repository. This adds
macros that makes it easy to create single instruction self containing
tests.

It is achieved by macros that create a test sequence for an
instruction and check for a supplied correct value. If the value is correct the
next instruction is tested. Otherwise we jump to fail handler that writes is
test number as a status code back to qemu that then exits on that status code.
If all tests pass we write back 0 as a status code and exit.

[AJB: add container_hosts]

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-7-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-17-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
new file mode 100644
index 0000000000..76c133132a
--- /dev/null
+++ b/tests/tcg/tricore/macros.h
@@ -0,0 +1,53 @@
+/* Helpers */
+#define LI(reg, val)           \
+    mov.u reg, lo:val;         \
+    movh DREG_TEMP_LI, up:val; \
+    or reg, reg, DREG_TEMP_LI; \
+
+/* Address definitions */
+#define TESTDEV_ADDR 0xf0000000
+/* Register definitions */
+#define DREG_RS1 %d0
+#define DREG_CALC_RESULT %d1
+#define DREG_TEMP_LI %d10
+#define DREG_TEMP %d11
+#define DREG_TEST_NUM %d14
+#define DREG_CORRECT_RESULT %d15
+
+#define DREG_DEV_ADDR %a15
+
+/* Test case wrappers */
+#define TEST_CASE(num, testreg, correct, code...) \
+test_ ## num:                                     \
+    code;                                         \
+    LI(DREG_CORRECT_RESULT, correct)              \
+    mov DREG_TEST_NUM, num;                       \
+    jne testreg, DREG_CORRECT_RESULT, fail        \
+
+/* Actual test case type
+ * e.g inst %dX, %dY      -> TEST_D_D
+ *     inst %dX, %dY, %dZ -> TEST_D_DD
+ *     inst %eX, %dY, %dZ -> TEST_E_DD
+ */
+#define TEST_D_D(insn, num, result, rs1)      \
+    TEST_CASE(num, DREG_CALC_RESULT, result,  \
+    LI(DREG_RS1, rs1);                        \
+    insn DREG_CALC_RESULT, DREG_RS1;          \
+    )
+
+/* Pass/Fail handling part */
+#define TEST_PASSFAIL                       \
+        j pass;                             \
+fail:                                       \
+        LI(DREG_TEMP, TESTDEV_ADDR)         \
+        mov.a DREG_DEV_ADDR, DREG_TEMP;     \
+        st.w [DREG_DEV_ADDR], DREG_TEST_NUM;\
+        debug;                              \
+        j fail;                             \
+pass:                                       \
+        LI(DREG_TEMP, TESTDEV_ADDR)         \
+        mov.a DREG_DEV_ADDR, DREG_TEMP;     \
+        mov DREG_TEST_NUM, 0;               \
+        st.w [DREG_DEV_ADDR], DREG_TEST_NUM;\
+        debug;                              \
+        j pass;
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index cf6062a15f..d13d2bb388 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -203,6 +203,12 @@ for target in $target_list; do
       container_image=debian-sparc64-cross
       container_cross_cc=sparc64-linux-gnu-gcc
       ;;
+    tricore-softmmu)
+      container_hosts=x86_64
+      container_image=debian-tricore-cross
+      container_cross_as=tricore-as
+      container_cross_ld=tricore-ld
+      ;;
     x86_64-*)
       container_hosts="aarch64 ppc64el x86_64"
       container_image=debian-amd64-cross
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index d64a99b95f..3b048e49fa 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -3,6 +3,8 @@ TESTS_PATH = $(SRC_PATH)/tests/tcg/tricore
 LDFLAGS = -T$(TESTS_PATH)/link.ld
 ASFLAGS =
 
+TESTS += test_abs.tst
+
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
 %.pS: $(TESTS_PATH)/%.S
diff --git a/tests/tcg/tricore/test_abs.S b/tests/tcg/tricore/test_abs.S
new file mode 100644
index 0000000000..e42240159a
--- /dev/null
+++ b/tests/tcg/tricore/test_abs.S
@@ -0,0 +1,7 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D(abs, 1, 0, 0)
+
+    TEST_PASSFAIL
-- 
2.20.1


