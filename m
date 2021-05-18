Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C5738750B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:26:36 +0200 (CEST)
Received: from localhost ([::1]:50974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livzn-0005nk-IP
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhe-0008LO-6t
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhX-0005Yk-TX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:49 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d11so9318037wrw.8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzXXbVWjMVcY3zDKSvBfL0opTxc0lCuHUosFONzdvYg=;
 b=zAAyE9BuOhhQrlGNhClzR8plVrO6rWdx2iTBDAfoHendAqYmcept4Q2GHw0G4D/JJY
 ZLwHyGxaScivHLdlQ7s0mI4Bl6JstBrfqDPJ2C/1hwZ4vDo5uSwYQzibwn6DQ1zmGYRY
 L7wZ96vYxWug6hbGvORVqVQZYvnPUSPlziFYu1Lyju7CWXA/mqyn5MwJlpWkhYzwI6lP
 AVkMPv6mO9F+eviden0UXuQYZcSeXh5I7Nu7evDIhz5NCtctebAGcb4AnNo9wpnfk7ow
 eS0dgIOXtRDr/77ddC4FVda7J9SH3JN6/HS+AlG1RU1J55SIdhmishp9DJs3aWXNkYzQ
 GaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzXXbVWjMVcY3zDKSvBfL0opTxc0lCuHUosFONzdvYg=;
 b=I0gxbpSaWoNxlhJ7L0pm1/sR7qsXW8sHV/qHkfMH74gODpIVi2kkCKazisCk/f38/U
 zNeSZYVIw67HJVicdjBFaBQrzDmTXs84yODqPqyJZQ0nKi1BfM2k1SKTyBGvC3xpCpGP
 w+HNJauOpsDW+MyxGVtSDKNGpLz2pekxzC09lwzDzyl6SHCoXWIbCEwK01GwfaD1xBNa
 XE5z/lwNmg/3NPaKiByvaDULCwfrvx5HFT7GFAzy1qmbi/LNUPxr4TlfmEvXiJQsSVpC
 c+eMn9fxxEjvQ47hNyNzLK9p9mbghBa9zXWV2HrNrympTi6n3ENBbU4dt0ShJ9RsKTJl
 NETw==
X-Gm-Message-State: AOAM532IvUtMbBzaEEOOKFrPb7anS9+yNME1GYNPea/QxTrzzyMjRORs
 B0czQ0uRWdmvNXOZDmSf7SsyzDrgSj/akg==
X-Google-Smtp-Source: ABdhPJzen+D5aFR4WGNZuzDJQI9C1hbHHpOhTAV3k0Ry+sHZt/+yy8xqPPgXsx+Sq3nx5Ig39Ys1Vw==
X-Received: by 2002:adf:fa45:: with SMTP id y5mr5578439wrr.311.1621328860939; 
 Tue, 18 May 2021 02:07:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v15sm1924726wmj.39.2021.05.18.02.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56EA81FF9E;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 15/29] tests/tcg/tricore: Add macros to create tests and
 first test 'abs'
Date: Tue, 18 May 2021 10:07:06 +0100
Message-Id: <20210518090720.21915-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20210305170045.869437-7-kbastian@mail.uni-paderborn.de>
[AJB: add container_hosts]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
index ed378e7840..11009fe433 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -180,6 +180,12 @@ for target in $target_list; do
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


