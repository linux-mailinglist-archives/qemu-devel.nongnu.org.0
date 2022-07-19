Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B06957A61E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:10:02 +0200 (CEST)
Received: from localhost ([::1]:48906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrfV-0007eL-Dd
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWl-0006em-6y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:59 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:35806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWi-0006Em-16
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:58 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so31775371fac.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1FuxIXAsVnEQSkEc9NHfGIQK1UUJbDYkHh0qGM/RQJw=;
 b=xHJ9Xo6ZrTif4Z3XmLJZmuU4EIjoI9CQDBAT2r2rN3dyX6V9Lus3hYCtfprXpLV6TN
 Yh1iqMU+t4MWSlldyAcSobToyOwWu2jYH8CVKdrVoPye1OTrdwjaiJShmQuJSn7I7rEX
 nTkGtacsMszf5IR1ht6M6eMaeIO7buh5g/wOBYMeFcuBfS4q2odRTbGuJWfr3J77KUFD
 Azne2I6XoQHehsmB+K2NtwLS2OpQ+QSzZph9lJAuNiSDF9iQF3amiQAddiRNoSgwnvwB
 T0y6BXsmGFC9itRn3OJxnZtMdcPPeg7K7GRBcZFZl6hUx2K/BmsSNL1wZNeJftd+v44b
 9UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1FuxIXAsVnEQSkEc9NHfGIQK1UUJbDYkHh0qGM/RQJw=;
 b=ecgLcQQ4vpdDqrUZDZlqGfl5XxSLaz6dYSlfW76MpAxVNIFv10UhsoEPELXjFOxeZ1
 hKQH/HAdYRSf2oLc3+zfo1Yd3sGixq22a7EVzwe3rmfKEyf+/oyKLVqpvkriEjSnsCjT
 E8t/9dqlknlEVU6BZvZH44SG//gqKo8zjNzsUKdWf400wPXSay1Zzbg0clHqRSzXcJaD
 I3Y3Zg1j4y0yO8118GXP2ZSEsmkZLbMn6XELttpR2Al8CMk0jDcioPXr0KKA13RmyebP
 IIVMkA6rS5cQiY6nWN1cMpSGKjuBGGIyLInMH1YbAMZgqYzFeTEN+Rg3IrCPq8azH9Zs
 WWyQ==
X-Gm-Message-State: AJIora/Qcx8RJ3Fj7jtsbE3qBiNmgdtpMVzzEsDrWvbBX3a/VNLAnbHZ
 g70D+w5oyoYKONhSsjFtSxVqeDp6RE2aWXH7
X-Google-Smtp-Source: AGRyM1sgyoWwVH6hqQQ2/d/f0qPokcOszDVk3gQXcFkjZZfKLiJP11IramX/iIGFGFVRGdZmvvXAaQ==
X-Received: by 2002:a05:6870:4603:b0:101:72f6:ba77 with SMTP id
 z3-20020a056870460300b0010172f6ba77mr362592oao.38.1658253655058; 
 Tue, 19 Jul 2022 11:00:55 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 11/21] tests/tcg/loongarch64: Add clo related instructions test
Date: Tue, 19 Jul 2022 23:29:50 +0530
Message-Id: <20220719180000.378186-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

This includes:
- CL{O/Z}.{W/D}
- CT{O/Z}.{W/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220716085426.3098060-5-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/loongarch64/test_bit.c      | 88 +++++++++++++++++++++++++++
 tests/tcg/loongarch64/Makefile.target | 15 +++++
 2 files changed, 103 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_bit.c
 create mode 100644 tests/tcg/loongarch64/Makefile.target

diff --git a/tests/tcg/loongarch64/test_bit.c b/tests/tcg/loongarch64/test_bit.c
new file mode 100644
index 0000000000..a6d9904909
--- /dev/null
+++ b/tests/tcg/loongarch64/test_bit.c
@@ -0,0 +1,88 @@
+#include <assert.h>
+#include <inttypes.h>
+
+#define ARRAY_SIZE(X) (sizeof(X) / sizeof(*(X)))
+#define TEST_CLO(N)                                     \
+static uint64_t test_clo_##N(uint64_t rj)               \
+{                                                       \
+    uint64_t rd = 0;                                    \
+                                                        \
+    asm volatile("clo."#N" %0, %1\n\t"                  \
+                 : "=r"(rd)                             \
+                 : "r"(rj)                              \
+                 : );                                   \
+    return rd;                                          \
+}
+
+#define TEST_CLZ(N)                                     \
+static uint64_t test_clz_##N(uint64_t rj)               \
+{                                                       \
+    uint64_t rd = 0;                                    \
+                                                        \
+    asm volatile("clz."#N" %0, %1\n\t"                  \
+                 : "=r"(rd)                             \
+                 : "r"(rj)                              \
+                 : );                                   \
+    return rd;                                          \
+}
+
+#define TEST_CTO(N)                                     \
+static uint64_t test_cto_##N(uint64_t rj)               \
+{                                                       \
+    uint64_t rd = 0;                                    \
+                                                        \
+    asm volatile("cto."#N" %0, %1\n\t"                  \
+                 : "=r"(rd)                             \
+                 : "r"(rj)                              \
+                 : );                                   \
+    return rd;                                          \
+}
+
+#define TEST_CTZ(N)                                     \
+static uint64_t test_ctz_##N(uint64_t rj)               \
+{                                                       \
+    uint64_t rd = 0;                                    \
+                                                        \
+    asm volatile("ctz."#N" %0, %1\n\t"                  \
+                 : "=r"(rd)                             \
+                 : "r"(rj)                              \
+                 : );                                   \
+    return rd;                                          \
+}
+
+TEST_CLO(w)
+TEST_CLO(d)
+TEST_CLZ(w)
+TEST_CLZ(d)
+TEST_CTO(w)
+TEST_CTO(d)
+TEST_CTZ(w)
+TEST_CTZ(d)
+
+struct vector {
+    uint64_t (*func)(uint64_t);
+    uint64_t u;
+    uint64_t r;
+};
+
+static struct vector vectors[] = {
+    {test_clo_w, 0xfff11fff392476ab, 0},
+    {test_clo_d, 0xabd28a64000000, 0},
+    {test_clz_w, 0xfaffff42392476ab, 2},
+    {test_clz_d, 0xabd28a64000000, 8},
+    {test_cto_w, 0xfff11fff392476ab, 2},
+    {test_cto_d, 0xabd28a64000000, 0},
+    {test_ctz_w, 0xfaffff42392476ab, 0},
+    {test_ctz_d, 0xabd28a64000000, 26},
+};
+
+int main()
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(vectors); i++) {
+        assert((*vectors[i].func)(vectors[i].u) == vectors[i].r);
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
new file mode 100644
index 0000000000..c0bd8b9b86
--- /dev/null
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -0,0 +1,15 @@
+# -*- Mode: makefile -*-
+#
+# LoongArch64 specific tweaks
+
+# Loongarch64 doesn't support gdb, so skip the EXTRA_RUNS
+EXTRA_RUNS =
+
+LOONGARCH64_SRC=$(SRC_PATH)/tests/tcg/loongarch64
+VPATH += $(LOONGARCH64_SRC)
+
+LDFLAGS+=-lm
+
+LOONGARCH64_TESTS  = test_bit
+
+TESTS += $(LOONGARCH64_TESTS)
-- 
2.34.1


