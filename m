Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3911EFD0E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 17:55:25 +0200 (CEST)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhEgm-0003MK-8G
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 11:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jhEbS-00049n-N2
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:49:54 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jhEbR-0004MZ-MU
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:49:54 -0400
Received: by mail-wr1-x442.google.com with SMTP id p5so10242363wrw.9
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o205Gy4dIq94JtyORDq4ueHvgsS7WKPATaza+gEBGrc=;
 b=Dwe/XF/StfZvDDrtiiBItgKpQT9C9bsDkFPMkSYUGKNAy3jRPnEP1VbG3RhC/NWVav
 8hAVExW4vcccya0D7NaxfD1vmvcFK/QTx33/RlN/U63w1Y8+AOoR4d9ET5G+oZc3Fqc7
 3L1B6suRV0o2r5TchQQr4i/8ES22SUgph082cihOOPMi+sbqoG9aKHtWbhHXXhgXiW10
 9bnYWoKQZSIaG7ph6w6KHiM9CZmR6+fMmloiat3hzkFdyGdlhhoorw9cemuZ28qr8Fuw
 S/O1tkRAVnXEiuIPramsLxUY9KzaawPK6bZFDQVCWVeGV3diNw2f7K1ytsR0mHTfMbqB
 PuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o205Gy4dIq94JtyORDq4ueHvgsS7WKPATaza+gEBGrc=;
 b=YV0ImS7w5oIBwtzp5GcvV19v75qn3+iPt+4+H8U4M2ak2wviAOJaYTF81qN1O34Xbn
 7XbaQaZJQ+WiEgLkThE30wXR032aUTw/rBYH89oU1Q/JyqdQOp8v193Rf7qak9beyQXW
 Ntl5BApXhWOv+QfSSJ84k/AekmGEPgtxVuJuRD41983TPDefO79YOZ71RwAz0gjELVlg
 w9jhf0MA56qDT1FNUgShlpIndJW7Ya67zfW3vSWlg93bhycAl7fwOHisqb4gqJXjVih3
 d6U+rAjSO3gKFmWSaNi7A+x20Ml8bWjN2U+xgC8vCQbpwrcHPg+tcgInUHFE9VZwsiq1
 FnMg==
X-Gm-Message-State: AOAM531W8R0kJHk2jjo3OvjOkcxxHOuQ1dXt7l+fD0z0tobAu+GyzqIw
 b9M+k5bN1eZMNnoIGr6RajQjOQ==
X-Google-Smtp-Source: ABdhPJz5WtfsM8XCA8XZXxmlqxDM4J1ooBn7EUOMyXz6RSV67z8sWyCXg/OqNjuVyIBBq1hDR4IpHw==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr10390298wrs.356.1591372192284; 
 Fri, 05 Jun 2020 08:49:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k17sm11284426wmj.15.2020.06.05.08.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 08:49:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 483E71FF9C;
 Fri,  5 Jun 2020 16:49:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 13/14] tests/tcg: add simple commpage test case
Date: Fri,  5 Jun 2020 16:49:28 +0100
Message-Id: <20200605154929.26910-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200605154929.26910-1-alex.bennee@linaro.org>
References: <20200605154929.26910-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The COMMPAGE are a number of kernel provided user-space routines for
32 bit ARM systems. Add a basic series of smoke tests to ensure it is
working as it should.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200527100546.29297-4-alex.bennee@linaro.org>
---
 tests/tcg/arm/commpage.c      | 61 +++++++++++++++++++++++++++++++++++
 tests/tcg/arm/Makefile.target |  2 ++
 2 files changed, 63 insertions(+)
 create mode 100644 tests/tcg/arm/commpage.c

diff --git a/tests/tcg/arm/commpage.c b/tests/tcg/arm/commpage.c
new file mode 100644
index 00000000000..c76e70cb8bd
--- /dev/null
+++ b/tests/tcg/arm/commpage.c
@@ -0,0 +1,61 @@
+/*
+ * Verify the COMMPAGE emulation
+ *
+ * The ARM commpage is a set of user space helper functions provided
+ * by the kernel in an effort to ease portability of user space code
+ * between different CPUs with potentially different capabilities. It
+ * is a 32 bit invention and similar to the vdso segment in many ways.
+ *
+ * The ABI is documented in the Linux kernel:
+ *     Documentation/arm/kernel_userspace_helpers.rst
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <stdint.h>
+
+#define ARM_COMMPAGE      (0xffff0f00u)
+#define ARM_KUSER_VERSION (*(int32_t *)(ARM_COMMPAGE + 0xfc))
+typedef void * (get_tls_fn)(void);
+#define ARM_KUSER_GET_TLS (*(get_tls_fn *)(ARM_COMMPAGE + 0xe0))
+typedef int (cmpxchg_fn)(int oldval, int newval, volatile int *ptr);
+#define ARM_KUSER_CMPXCHG (*(cmpxchg_fn *)(ARM_COMMPAGE + 0xc0))
+typedef void (dmb_fn)(void);
+#define ARM_KUSER_DMB (*(dmb_fn *)(ARM_COMMPAGE + 0xa0))
+typedef int (cmpxchg64_fn)(const int64_t *oldval,
+                           const int64_t *newval,
+                           volatile int64_t *ptr);
+#define ARM_KUSER_CMPXCHG64 (*(cmpxchg64_fn *)(ARM_COMMPAGE + 0x60))
+
+#define fail_unless(x)                                                  \
+    do {                                                                \
+        if (!(x)) {                                                     \
+            fprintf(stderr, "FAILED at %s:%d\n", __FILE__, __LINE__);   \
+            exit(EXIT_FAILURE);                                         \
+        }                                                               \
+    } while (0)
+
+
+int main(int argc, char *argv[argc])
+{
+    void *kuser_tls;
+    int val = 1;
+    const int64_t oldval = 1, newval = 2;
+    int64_t val64 = 1;
+
+    fail_unless(ARM_KUSER_VERSION == 0x5);
+    kuser_tls = ARM_KUSER_GET_TLS();
+    printf("TLS = %p\n", kuser_tls);
+    fail_unless(kuser_tls != 0);
+    fail_unless(ARM_KUSER_CMPXCHG(1, 2, &val) == 0);
+    printf("val = %d\n", val);
+    /* this is a crash test, not checking an actual barrier occurs */
+    ARM_KUSER_DMB();
+    fail_unless(ARM_KUSER_CMPXCHG64(&oldval, &newval, &val64) == 0);
+    printf("val64 = %lld\n", val64);
+    return 0;
+}
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 11c39c601ea..3da09a38be7 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -68,6 +68,8 @@ run-semiconsole-arm: semiconsole-arm
 run-plugin-semiconsole-arm-with-%:
 	$(call skip-test, $<, "MANUAL ONLY")
 
+ARM_TESTS += commpage
+
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.20.1


