Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC353874FC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:23:51 +0200 (CEST)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livx8-00006d-Ln
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp0-00052x-8l
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livop-0000zx-VL
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id r12so9380152wrp.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yfPAdLfj0mM5DpZOWJa8eVcwUNU1MGcAXsLejhIC64A=;
 b=bBMw+xDT3Ah6nYcYB/dMvR+UQ/MD2FTO+cQNAE/91ZROQ2MZy3CxfeJWA+onRykNjB
 hw6Wr7sFCnxg8H9gr/KsPsiZgQR/x1Xkzx2LbBWeb7jEv6gidxtTyGMpxQZ4FmkYfqCJ
 w0bjGErqfGg36bdNZBHOIuj9MgSWzb6JHpFggrzi6zc+WEIkclJrRmtPzvB68Tik9bnD
 IXfLk5tBXHWxvFdhqc1afjjOgsOJsiu4YNOtoT+7Zhq2G2gZivaUtRlMhoRaGB8gdKJq
 nKios1Ur066HLWrhFeIsY3LHBSC45WrR288jpuKBKk/oe+clS2RaowG/44V+WE5eD4L1
 Pm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yfPAdLfj0mM5DpZOWJa8eVcwUNU1MGcAXsLejhIC64A=;
 b=TDWO0y89mADE5UFZ2ndhtnosuxUUaNHS+2Y4rV6RfW4cKCDsZxd6xsoJChy05V0ogH
 tKe+2Bm9QluoW2Q4s0JKsaf4mDe7wDNERUW+Cr89IHn6xQ/gZXc7BSPEo05GC2EnP3+T
 VGIT3Z847H7q5ykFznpImj2fRS/CYdo5OQhLWb2ubBcw3KFDCRL+51MYhG6+KszCTBeR
 X9Kc7ckxoLU3HeuhpHYKl4jzjP1Km4ZP8InA0N2yC3h1clvrJRDGiAobPtEjzsDzOUjm
 3cOH1WyGMlUlZ3CsNq+LP7nc+iYi49pn9s8YW7vxvazc0cvtEnp0fHY1Njr1YNXdLFKl
 KV1w==
X-Gm-Message-State: AOAM532lqPW1NyJu3bkt3Qu/b+qYG5cYmC/dc4qO4N599OP1N1sDTKJH
 b52+aUohXW1AGoegNqun0Q/NLl9/PB078w==
X-Google-Smtp-Source: ABdhPJynagX1hiNcmIySEhWIVbT3kInL9iZdLxPjz2i1S5cT+xT2D4jRExuoDdERhRLvmpQBuM+AVw==
X-Received: by 2002:adf:f50f:: with SMTP id q15mr5378833wro.279.1621329314027; 
 Tue, 18 May 2021 02:15:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p10sm19063326wrr.58.2021.05.18.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F82D1FFB1;
 Tue, 18 May 2021 10:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 26/29] tests/tcg/ppc64le: tests for brh/brw/brd
Date: Tue, 18 May 2021 10:07:17 +0100
Message-Id: <20210518090720.21915-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Tests for Byte-Reverse Halfword, Word and Doubleword

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Tested-by: Fabiano Rosas <farosas@linux.ibm.com>
[AJB: tweak to make rules for skip/plugins]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210423205757.1752480-3-matheus.ferst@eldorado.org.br>
Message-Id: <20210512102051.12134-28-alex.bennee@linaro.org>

diff --git a/tests/tcg/ppc64le/byte_reverse.c b/tests/tcg/ppc64le/byte_reverse.c
new file mode 100644
index 0000000000..53b76fc2e2
--- /dev/null
+++ b/tests/tcg/ppc64le/byte_reverse.c
@@ -0,0 +1,21 @@
+#include <assert.h>
+
+int main(void)
+{
+    unsigned long var;
+
+    var = 0xFEDCBA9876543210;
+    asm("brh %0, %0" : "+r"(var));
+    assert(var == 0xDCFE98BA54761032);
+
+    var = 0xFEDCBA9876543210;
+    asm("brw %0, %0" : "+r"(var));
+    assert(var == 0x98BADCFE10325476);
+
+    var = 0xFEDCBA9876543210;
+    asm("brd %0, %0" : "+r"(var));
+    assert(var == 0x1032547698BADCFE);
+
+    return 0;
+}
+
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 0c6a4585fc..a6a4ddaeca 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -10,4 +10,17 @@ PPC64_TESTS=bcdsub
 endif
 bcdsub: CFLAGS += -mpower8-vector
 
+PPC64_TESTS += byte_reverse
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+run-byte_reverse: QEMU_OPTS+=-cpu POWER10
+run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
+else
+byte_reverse:
+	$(call skip-test, "BUILD of $@", "missing compiler support")
+run-byte_reverse:
+	$(call skip-test, "RUN of byte_reverse", "not built")
+run-plugin-byte_reverse-with-%:
+	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
+endif
+
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 1acfcff94a..c0c14ffbad 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -9,4 +9,17 @@ PPC64LE_TESTS=bcdsub
 endif
 bcdsub: CFLAGS += -mpower8-vector
 
+PPC64LE_TESTS += byte_reverse
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+run-byte_reverse: QEMU_OPTS+=-cpu POWER10
+run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
+else
+byte_reverse:
+	$(call skip-test, "BUILD of $@", "missing compiler support")
+run-byte_reverse:
+	$(call skip-test, "RUN of byte_reverse", "not built")
+run-plugin-byte_reverse-with-%:
+	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
+endif
+
 TESTS += $(PPC64LE_TESTS)
-- 
2.20.1


