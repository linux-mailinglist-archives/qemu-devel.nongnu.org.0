Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91143646C8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:11:23 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVYY-0006aR-Rp
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQU-0004QL-Q5
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQH-0002wX-JT
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e7so25431924wrs.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5YDOtSlMUf/IP5eUAnm6kbogOUWUkh0yRXFFH4wtVfw=;
 b=WS5PisynVBsgLwTc3mwjJ472VC82hjJWaIz7OTfZeT8CouccAnPhzb6JybRlbhltOC
 b/HbmKtJ0abPdKZg+G8Fh449b4/aYjKEB6skztAtjPyzsQKDBBgiCgwkZGgKJRZWx9Ed
 1+K/IvdX+BQdsStXNFYvSAJrhn78pxaCC/+9HZuHqpqkfbJHLSjvtqxdfePhR8LA6Pai
 2o4ea2tuyF5TL9K2UUd2oaW8pQEHod/wRFTQuuXv2xI2jjGO40ghBYHGSM/Pqn7xmzsK
 v7Ab1E/98LebgtKREZCsbf6pfWSoUhwH5WXM6cKsiuDjENFV0HyJwexoHNHoR87I4Iga
 V2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5YDOtSlMUf/IP5eUAnm6kbogOUWUkh0yRXFFH4wtVfw=;
 b=oylJWixD9kOl1/69LihxmImz2OxRB8jXbKDggFfzq6oqHxJf5oiZa6SpKfsiOFFakY
 B93Bijm8YqREUx+40xOFsyUAFY+QLZUB1l3oCXy5iPSCPPYXwNbtSS623WYzd++Efoec
 Y+pPrRKhQ0xsygV3If577V+L3YVr729MDq8Vn0DOkP2nC6PDmshwG4YpII08IxrHws8V
 pxp1MEDExUo5FCS3na6DZruG0/RKORiZff/AQj1G7Flwik4DtjWcAbe1zrZPlSXFaK4w
 bjfYScQj5ITc/lsvfA7Gn7kzJ5DZsjqGgYil3LH2R0Fgk22JM8xyA/RqaSa3dcK00kqV
 iWSw==
X-Gm-Message-State: AOAM530Yl2ApRn9aTRAj2L0VtP6Lmz5j5ufcnJKwrNlC0hh+Hm2NJCdl
 nzNIgdJAWcRJbiRLN4AowcAHVg==
X-Google-Smtp-Source: ABdhPJwRRcV9PE9zbQlYNTkkwhs5he0v6h8BdsbNvh6bJlCE8ddQg0o/dPv2W16KZt5pKoYBK1tpUw==
X-Received: by 2002:a5d:628e:: with SMTP id k14mr15074808wru.150.1618844568266; 
 Mon, 19 Apr 2021 08:02:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm27161678wrq.45.2021.04.19.08.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:02:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F0241FF9F;
 Mon, 19 Apr 2021 15:54:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 16/25] tests/tcg/tricore: Add macros to create tests and
 first test 'abs'
Date: Mon, 19 Apr 2021 15:54:26 +0100
Message-Id: <20210419145435.14083-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
---
 tests/tcg/tricore/macros.h                | 53 +++++++++++++++++++++++
 tests/tcg/configure.sh                    |  6 +++
 tests/tcg/tricore/Makefile.softmmu-target |  2 +
 tests/tcg/tricore/test_abs.S              |  7 +++
 4 files changed, 68 insertions(+)
 create mode 100644 tests/tcg/tricore/macros.h
 create mode 100644 tests/tcg/tricore/test_abs.S

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
index 9f304b6c5a..c04d9683ef 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -179,6 +179,12 @@ for target in $target_list; do
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


