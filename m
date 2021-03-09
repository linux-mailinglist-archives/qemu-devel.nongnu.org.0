Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC7332F02
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:29:43 +0100 (CET)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJi34-000606-7Q
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg33-0003Xz-Hb
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:33 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg31-0003qX-8K
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:33 -0500
Received: by mail-ej1-x62c.google.com with SMTP id dx17so29875234ejb.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOpDSl4PCJAfRmZAM02jJCUO0bme5ak2R8cL4PaIcKc=;
 b=SSpE/De8pF3COUTEilqAPnt0qp7zNMvryjwI3BIMCRyf9Q7lcmAaifdD3KR08VnvNO
 woq5GcfitvYM2N2ofoQB7BF6ZzvCj7RitE+MXhdDB1H1GcgVd+WGACAYYf7OTr7ZtxPO
 U9L+c5iQSC4oCoERWAMsmGerfPlGDUXoC3yUbIeiHLssZDLXqHt974G9phqBbgCmd3F6
 0Yfywg0GYb0U0Q8S3Z1pA65yaR6Z+yMrSHwrhcH++dcCrdcVeY8KUnY/s+ROvG0wMv3o
 87sxS51HK3gHGmwjVALNQxOIBzZaefjIDrOGZPYb5mCVCoKdAbjtvkqXZfGX/OniVrt/
 9gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOpDSl4PCJAfRmZAM02jJCUO0bme5ak2R8cL4PaIcKc=;
 b=JuXDXbSZSBRsRW0sQ59HIhvhESjhesHjwl1RIHC4Fi6Hfxw1/k2DGPGoJMQPyYQFZS
 XqFkKs8m5gm3HLkItWuyM8aJ8iC2b4LwWcBZu16EqQN9dmvcy5PQ4UH5DPPshQy9uQzQ
 25w0FILCrxqsBdTc8NAG6rhqgupZd3kpIu4R6wDU4PWy9+SujWdzgC4j9aw3LciNxf3A
 Yw/1qstIa/pdR/etzmcOsCHdoOPIibJAYLQ5HcZvTxpeyWouxxL2K+XCGaoUBGgDIY6e
 Wi5KSpoUcWnA84iJRp9lkcLqN2IV9dMcT9bFYGOGFa9gMnFTNyrmzyO03RbOn/d7PZcg
 56Ig==
X-Gm-Message-State: AOAM5306sdiEcg9Ln5w3KEdQA3JpwV/zCZ8Wj67LVjvk8RhZAoMpnG6P
 CtZlUUdbTZoZREY7L6NVbc8/zNIR725MCQ==
X-Google-Smtp-Source: ABdhPJy3Yx4NOIBAdniSiKetWYZ+6VitdI3xktXTmq9VBJx8CfafMBeDM+U2LExF6ja2rfzEenG2Eg==
X-Received: by 2002:a17:906:789:: with SMTP id
 l9mr21095455ejc.161.1615310489683; 
 Tue, 09 Mar 2021 09:21:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r24sm9379394edw.11.2021.03.09.09.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:21:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E8711FF87;
 Tue,  9 Mar 2021 17:21:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 1/4] semihosting: move semihosting tests to multiarch
Date: Tue,  9 Mar 2021 17:21:24 +0000
Message-Id: <20210309172127.20470-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309172127.20470-1-alex.bennee@linaro.org>
References: <20210309172127.20470-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It may be arm-compat-semihosting but more than one architecture uses
it so lets move the tests into the multiarch area. We gate it on the
feature and split the semicall.h header between the arches.

Also clean-up a bit of the Makefile messing about to one common set of
runners.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/semicall.h                  | 18 +++++++++++
 tests/tcg/arm/semicall.h                      | 15 +--------
 tests/tcg/riscv64/semicall.h                  | 22 +++++++++++++
 .../arm-compat-semi}/semiconsole.c            |  2 ++
 .../arm-compat-semi}/semihosting.c            |  5 ++-
 tests/tcg/Makefile.target                     |  3 ++
 tests/tcg/aarch64/Makefile.target             | 18 -----------
 tests/tcg/arm/Makefile.target                 | 16 ++--------
 tests/tcg/multiarch/Makefile.target           | 31 +++++++++++++++++++
 9 files changed, 83 insertions(+), 47 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semihosting.c (85%)

diff --git a/tests/tcg/aarch64/semicall.h b/tests/tcg/aarch64/semicall.h
new file mode 100644
index 0000000000..8a3fce35c5
--- /dev/null
+++ b/tests/tcg/aarch64/semicall.h
@@ -0,0 +1,18 @@
+/*
+ * Semihosting Tests - AArch64 helper
+ *
+ * Copyright (c) 2019
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+    return t;
+}
diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
index d4f6818192..ad8ac51310 100644
--- a/tests/tcg/arm/semicall.h
+++ b/tests/tcg/arm/semicall.h
@@ -1,5 +1,5 @@
 /*
- * Semihosting Tests
+ * Semihosting Tests - ARM Helper
  *
  * Copyright (c) 2019
  * Written by Alex Bennée <alex.bennee@linaro.org>
@@ -7,13 +7,8 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
-#define SYS_WRITE0      0x04
-#define SYS_READC       0x07
-#define SYS_REPORTEXC   0x18
-
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 {
-#if defined(__arm__)
     register uintptr_t t asm("r0") = type;
     register uintptr_t a0 asm("r1") = arg0;
 #ifdef __thumb__
@@ -23,13 +18,5 @@ uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 #endif
     asm(SVC : "=r" (t)
         : "r" (t), "r" (a0));
-#else
-    register uintptr_t t asm("x0") = type;
-    register uintptr_t a0 asm("x1") = arg0;
-    asm("hlt 0xf000"
-        : "=r" (t)
-        : "r" (t), "r" (a0));
-#endif
-
     return t;
 }
diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
new file mode 100644
index 0000000000..f8c88f32dc
--- /dev/null
+++ b/tests/tcg/riscv64/semicall.h
@@ -0,0 +1,22 @@
+/*
+ * Semihosting Tests - RiscV64 Helper
+ *
+ * Copyright (c) 2021
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("a0") = type;
+    register uintptr_t a0 asm("a1") = arg0;
+    asm(".option norvc\n\t"
+        ".balign 16\n\t"
+        "slli zero, zero, 0x1f\n\t"
+        "ebreak\n\t"
+        "srai zero, zero, 0x7\n\t"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+    return t;
+}
diff --git a/tests/tcg/arm/semiconsole.c b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
similarity index 93%
rename from tests/tcg/arm/semiconsole.c
rename to tests/tcg/multiarch/arm-compat-semi/semiconsole.c
index 6ef0bd2450..1d82efc589 100644
--- a/tests/tcg/arm/semiconsole.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
@@ -7,6 +7,8 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
+#define SYS_READC       0x07
+
 #include <stdio.h>
 #include <stdint.h>
 #include "semicall.h"
diff --git a/tests/tcg/arm/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
similarity index 85%
rename from tests/tcg/arm/semihosting.c
rename to tests/tcg/multiarch/arm-compat-semi/semihosting.c
index 33faac9916..b3fd16cd12 100644
--- a/tests/tcg/arm/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -7,12 +7,15 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
+#define SYS_WRITE0      0x04
+#define SYS_REPORTEXC   0x18
+
 #include <stdint.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
 {
-#if defined(__arm__)
+#if UINTPTR_MAX == UINT32_MAX
     uintptr_t exit_code = 0x20026;
 #else
     uintptr_t exit_block[2] = {0x20026, 0};
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 24d75a5801..cab8c6b3a2 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -32,6 +32,9 @@
 all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
+ifeq ($(CONFIG_USER_ONLY),y)
+-include $(SRC_PATH)/default-configs/targets/$(TARGET).mak
+endif
 
 # for including , in command strings
 COMMA := ,
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index bf53ad0087..56e48f4b34 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -41,24 +41,6 @@ AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-# Semihosting smoke test for linux-user
-AARCH64_TESTS += semihosting
-run-semihosting: semihosting
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
-
-run-plugin-semihosting-with-%:
-	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
-		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
-		 $(call strip-plugin,$<) 2> $<.err, \
-		"$< on $(TARGET_NAME) with $*")
-
-AARCH64_TESTS += semiconsole
-run-semiconsole: semiconsole
-	$(call skip-test, $<, "MANUAL ONLY")
-
-run-plugin-semiconsole-with-%:
-	$(call skip-test, $<, "MANUAL ONLY")
-
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
 # System Registers Tests
 AARCH64_TESTS += sysregs
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index ec95156562..1deda384df 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -30,37 +30,25 @@ run-fcvt: fcvt
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
 # Semihosting smoke test for linux-user
-ARM_TESTS += semihosting
 semihosting: CFLAGS += -mthumb
-run-semihosting: semihosting
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
 ARM_TESTS += semihosting-arm
 semihosting-arm: CFLAGS += -marm
-semihosting-arm: semihosting.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-semihosting-arm: semihosting-arm
 	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
-run-plugin-semihosting-with-%:
+run-plugin-semihosting-arm-with-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 		 $(call strip-plugin,$<) 2> $<.err, \
 		"$< on $(TARGET_NAME) with $*")
 
-ARM_TESTS += semiconsole semiconsole-arm
+ARM_TESTS += semiconsole-arm
 
 semiconsole: CFLAGS += -mthumb
-run-semiconsole: semiconsole
-	$(call skip-test, $<, "MANUAL ONLY")
-
-run-plugin-semiconsole-with-%:
-	$(call skip-test, $<, "MANUAL ONLY")
 
 semiconsole-arm: CFLAGS += -marm
-semiconsole-arm: semiconsole.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-semiconsole-arm: semiconsole-arm
 	$(call skip-test, $<, "MANUAL ONLY")
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index abbdb2e126..a3a751723d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -69,6 +69,37 @@ run-gdbstub-%:
 endif
 EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
 
+# ARM Compatible Semi Hosting Tests
+#
+# Despite having ARM in the name we actually have several
+# architectures that implement it. We gate the tests on the feature
+# appearing in config.
+#
+ifeq ($(CONFIG_ARM_COMPATIBLE_SEMIHOSTING),y)
+VPATH += $(MULTIARCH_SRC)/arm-compat-semi
+
+# Add -I path back to TARGET_NAME for semicall.h
+semihosting: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
+
+run-semihosting: semihosting
+	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+
+run-plugin-semihosting-with-%:
+	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
+		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
+		 $(call strip-plugin,$<) 2> $<.err, \
+		"$< on $(TARGET_NAME) with $*")
+
+semiconsole: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
+
+run-semiconsole: semiconsole
+	$(call skip-test, $<, "MANUAL ONLY")
+
+run-plugin-semiconsole-with-%:
+	$(call skip-test, $<, "MANUAL ONLY")
+
+TESTS += semihosting semiconsole
+endif
 
 # Update TESTS
 TESTS += $(MULTIARCH_TESTS)
-- 
2.20.1


