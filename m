Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4601C3728C0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:23:08 +0200 (CEST)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsCp-0001Q2-89
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzq-0002Wy-Rw
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzm-0006n2-KX
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:42 -0400
Received: by mail-wm1-x32d.google.com with SMTP id o127so894230wmo.4
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Itxy1UuOFf0gEK0SQVLvvq83zvWvNXRtoyv+3j/ePs=;
 b=AXd7kgK0YzZVDR7sz42FfynpiVDCoP/liwlnrHIUPFtKiuJ7EpQC7rfIVJF8eHr+Sb
 rq9L7WxnUHu6nBlZVhX/MZPOLb1aIYPZBgLdE2YhtB18BG38sVPrQd+M3HTofdXGgtJZ
 2Np3pzeGDYN6EfoP7Wg7wHdqB3Q8JvQWye1n1bfkWm+m44Hs1RDDXbsU5byNT1gd4+uf
 huiYm9fu1VwRC/PKwV4So/+b0q0zXgixqZJl59Sue92Dg00IKjRIw8d/tHKuVydozvgJ
 rIDNMVyzMhJZknb2W9Aae9xARxfIusdPUaTPfFv6k6BONIbyMxqwJ7Z9fWfWZnWpMeFy
 avpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Itxy1UuOFf0gEK0SQVLvvq83zvWvNXRtoyv+3j/ePs=;
 b=o5hBHzQvHPs2GFxuJh/IDkWa0NZy8sqdiVyT2jgTRn5dIbstVNd/5tXEb+yRzGSqnT
 L6ryo/Fyl69XZC3L43wggcc6t38XF+/x3zwVJtfKggg+LYRTW6sbgidMZPmi9KDHaMPe
 GKOmA6l1F8M5zBk7wwR+a0aegGuy8XH89wqymZgk+au9hNyAgH0fSipFpjeNY9azEd85
 RI6GBTmLPM7fD+SyGhmtdN0WfUQbiNpktpzivLrvLjFzU/4JIdDu1JORSMqoi0IIAo5K
 HAQQOcS34rNHCLFl/Ik7MDSoPF68ujmEB0Ca7zAnEgy/jE4OYznRQpoZwr73borvMboi
 7peg==
X-Gm-Message-State: AOAM531+yqr/XViPBVwm2vFJgMdTXhRmeFjgpI49qvnZXGvvEiehvDCX
 JmSCTkIv7jkKWSBdt9Ff1ON2Sg==
X-Google-Smtp-Source: ABdhPJyH50B2PhiDtfAUKYXCFO4TSDoToTdX7oiLli8Ss7lzPXkq+ql5lGFGWRLXrjEBNUb1WhrCOQ==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr26488061wmg.85.1620122976362; 
 Tue, 04 May 2021 03:09:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm2171882wmf.9.2021.05.04.03.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F1981FFB3;
 Tue,  4 May 2021 11:02:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 27/30] tests/tcg/ppc64le: tests for brh/brw/brd
Date: Tue,  4 May 2021 11:02:20 +0100
Message-Id: <20210504100223.25427-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Tests for Byte-Reverse Halfword, Word and Doubleword

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Tested-by: Fabiano Rosas <farosas@linux.ibm.com>
[AJB: tweak to make rules for skip/plugins]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210423205757.1752480-3-matheus.ferst@eldorado.org.br>
---
 tests/tcg/ppc64le/byte_reverse.c  | 21 +++++++++++++++++++++
 tests/tcg/ppc64/Makefile.target   | 13 +++++++++++++
 tests/tcg/ppc64le/Makefile.target | 13 +++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 tests/tcg/ppc64le/byte_reverse.c

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


