Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B21383A8D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:54:52 +0200 (CEST)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligW3-0007rW-6v
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyq-0001ns-R9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:32 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifye-00028i-Pj
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k5-20020a05600c4785b0290174b7945d7eso3512769wmo.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecrJ8Yrx6ZRJ+fACPN+MlJLK85SE+W/xoTVC0N/qwc0=;
 b=Qt+U7dja5K02eYNlzpW0xIuVoXvMerwBhJ/RDvx/U17ezrvlejAtRNjweya/bBgRfe
 i52IqbRU8EwoIWwIBeOKQDfp6rEukpqp5UVM4UXcCOjJrGjL7RHNifN6xCxCcW+1+Rwh
 aM9kcgEze8vDIySx3+HudzUrP+3IRYf3SP42RHf1+O5cFbnd/ettp+gYcv1DPOMPu/9Y
 o9w+gecw5kQCj8Fh1otp5P2/YZFZpRqt2E7XpSoRRC6yETHGevZU0Ovae5ayPc2CkKmH
 mynrv3twjsIJd3kieEXwiXV6+QvD4pLwscyeKTBQZXvzd/obqx6mj61cYn1I7isFoDFS
 Fkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecrJ8Yrx6ZRJ+fACPN+MlJLK85SE+W/xoTVC0N/qwc0=;
 b=SrFYBNnUxgmnyBSCPp0tHBjxt5Shjzd8FbW4uXy7X3UoLDTNzrngWG67ceQ1jmwVR3
 xbzzhx1uqBi8GtK8fIrwUYdbUYZBo62umajYe7HRqH/qVG8Eqx/4auHPN0D6eqbvi2qJ
 npvpmaimT7FNeQtt5/QVls7DqXj54VIvo5Ls90+TgSdDr/3b8W0KyZcjodrkgpO6xqez
 gZsKBGCCzDctxgAGYUgvgQSFvJRo8Yj+9bFq4/yhXSNt58FpQ+evj5fIHOl20ElBLPrt
 4C4/xMRCsX88wEkEKv6CIV8cympfgwdgwVKB48WqwLEjZvdOnkDLFeuF5W1H9RKWXyMY
 9Seg==
X-Gm-Message-State: AOAM532jIrDXWFNm1LOT6kG5tth6yp6eOXxgIr2kygYN00GEmAgVawWL
 k93gjxNQAB+Wtx7la3sWisA+ew==
X-Google-Smtp-Source: ABdhPJzY8AD9LCs0VT5TPWglwCc0BiTqNS6QDXCKEFL0nOZw2Y4PJnH51hEJQURmdihSWPvLq5zoRw==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr487457wmi.36.1621268417035;
 Mon, 17 May 2021 09:20:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c7sm8796478wrs.23.2021.05.17.09.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A0F01FFAB;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 22/29] tests/tcg/ppc64le: tests for brh/brw/brd
Date: Mon, 17 May 2021 17:10:15 +0100
Message-Id: <20210517161022.13984-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

[AJB: tweak to make rules for skip/plugins]

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Fabiano Rosas <farosas@linux.ibm.com>
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


