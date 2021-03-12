Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767133393C5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:42:57 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKksK-0007D6-Ba
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkb3-0006NT-Mx
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:25:05 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkb2-0005EN-6h
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:25:05 -0500
Received: by mail-wm1-x32e.google.com with SMTP id g8so4156744wmd.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GQh/zfw0tX8VbwPqMPWjJGI3OryT5w1ZtpEuLj1m4jk=;
 b=Lt+3P8k3njHzwB1jiNQNTmD9dgiMJUP9Dg49EsKeVKeDDrVsuX34D0mP8dFNyLSdcB
 Tg/ZIHDW8vnTLuq54gQtcliyC5jB5MuoOVozbE+ci0vHzqbBjsiMP/b3eXpdrw65XnT/
 mkp4YtwyeYvdTxWcmnhmNa8gHYqce8i7itO+IdJatHboXn6sGveZmrndMX3spamSeVLR
 TECMI4GCmjYiXU2fVYZes5qDmLjkv2mI7+sS9phps99YqJG5NJgNv7ZLm+ppMIqWMYCX
 kPtP6VPsEI13M4vEyneM5mr4w9oSuJ0bFJ3Piru26nBD1xf3Wd8zuMmsa2cqfNOlsfsf
 Mh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GQh/zfw0tX8VbwPqMPWjJGI3OryT5w1ZtpEuLj1m4jk=;
 b=fybj8LV0WaJ4gOEQrHM1TtWaiyLSm8Xgz8WCg/e/8YXlTFBhHuTnKM3jCnBZM7QDcn
 ztBb36cg/03ZiMQ7deInBNFYqw8fcHRNLuVtC41Fz/5lYgDYGd/35Lz2glgWlvEfXcju
 aRM1ahBzr55mlSa/lYodTL7W+iKw7MEYgCbmEZiwcf9aU5g6RN9KHnVDqouuhJtZNeYi
 qz/B6a1EDflEOm2vVcuVCcbYQ8cEbKxHtJrn1yA6LG4TAwaMjaFghVkjGkOPyA8yiw0s
 1I9KCmJCGwg7Q0riWGpKPZu0xVccMPKxZwbqH+E0ZYbRCcfNh2FIVNzEKLE1cjZZYPWx
 vGZg==
X-Gm-Message-State: AOAM5304sLwahg0mzOomCIWjk6VVIn0qaoyAP7LUqgLr0hHMfc5gkxbp
 JQdWgLMWivLH8eVwF1G77AjzpSD2G+0=
X-Google-Smtp-Source: ABdhPJxu/csLzVDVYbu5QhvMwllm0HWWWss4VZt/kPTbcmGCC9vDfsU1qFvWajmPeln3Ohzd3yC0mg==
X-Received: by 2002:a05:600c:203:: with SMTP id
 3mr13797403wmi.88.1615566302365; 
 Fri, 12 Mar 2021 08:25:02 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b15sm3072688wmd.41.2021.03.12.08.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 08:25:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] tests/tcg/mips: Test user mode DMULT for the R5900
Date: Fri, 12 Mar 2021 17:24:34 +0100
Message-Id: <20210312162434.1869129-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312162434.1869129-1-f4bug@amsat.org>
References: <20210312162434.1869129-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fredrik Noring <noring@nocrew.org>

The R5900 reports itself as MIPS III but does not implement DMULT.
Verify that DMULT is emulated properly in user mode by multiplying
two 64-bit numbers to produce a 128-bit number.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
Message-Id: <b04427024562b10c852a5519b57033e094fcdc3b.1541701393.git.noring@nocrew.org>
[PMD: Moved to tests/tcg/mips/]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/mips/test-r5900-dmult.c | 40 +++++++++++++++++++++++++++++++
 tests/tcg/mips/Makefile.target    | 11 ++++++---
 2 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/mips/test-r5900-dmult.c

diff --git a/tests/tcg/mips/test-r5900-dmult.c b/tests/tcg/mips/test-r5900-dmult.c
new file mode 100644
index 00000000000..2827ab5358f
--- /dev/null
+++ b/tests/tcg/mips/test-r5900-dmult.c
@@ -0,0 +1,40 @@
+/*
+ * Test DMULT.
+ */
+
+#include <stdio.h>
+#include <inttypes.h>
+#include <assert.h>
+
+struct hi_lo { int64_t hi; uint64_t lo; };
+
+static struct hi_lo dmult(int64_t rs, int64_t rt)
+{
+    int64_t hi;
+    uint64_t lo;
+
+    /*
+     * The R5900 reports itself as MIPS III but does not implement DMULT.
+     * Verify that DMULT is emulated properly in user mode.
+     */
+    __asm__ __volatile__ (
+            "    .set  mips3\n"
+            "    dmult %2, %3\n"
+            "    mfhi  %0\n"
+            "    mflo  %1\n"
+            : "=r" (hi), "=r" (lo)
+            : "r" (rs), "r" (rt));
+
+    return (struct hi_lo) { .hi = hi, .lo = lo };
+}
+
+int main()
+{
+    /* Verify that multiplying two 64-bit numbers yields a 128-bit number. */
+    struct hi_lo r = dmult(2760727302517, 5665449960167);
+
+    assert(r.hi == 847887);
+    assert(r.lo == 7893651516417804947);
+
+    return 0;
+}
diff --git a/tests/tcg/mips/Makefile.target b/tests/tcg/mips/Makefile.target
index 1a994d5525e..59e9d6fb76a 100644
--- a/tests/tcg/mips/Makefile.target
+++ b/tests/tcg/mips/Makefile.target
@@ -11,9 +11,14 @@ VPATH 		+= $(MIPS_SRC)
 # hello-mips is 32 bit only
 ifeq ($(findstring 64,$(TARGET_NAME)),)
 MIPS_TESTS=hello-mips
-
-TESTS += $(MIPS_TESTS)
-
 hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -mabi=32
 hello-mips: LDFLAGS+=-nostdlib
 endif
+
+# r5900 is only 64 bit little-endian
+ifneq ($(findstring 64el,$(TARGET_NAME)),)
+MIPS_TESTS += test-r5900-dmult
+test-r5900-dmult: CFLAGS += -mabi=n32 -march=r5900
+endif
+
+TESTS += $(MIPS_TESTS)
-- 
2.26.2


