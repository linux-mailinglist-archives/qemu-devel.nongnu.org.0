Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1AB37BB42
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:48:13 +0200 (CEST)
Received: from localhost ([::1]:51866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmPU-0000qa-Rc
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8Z-0000gi-O8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:43 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8U-0000bR-Is
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id s82so12661611wmf.3
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Itxy1UuOFf0gEK0SQVLvvq83zvWvNXRtoyv+3j/ePs=;
 b=MJ+IDoYks9PGUhuL+aQM/Xvyh3RijiSLapj9kR4clPgke6HETH+yh9/JK4AgGLu8jC
 9jBZEYERU/VkVmrE9/5EiKTN/8OgoBS1lH+ntMMRXSQZMO0XunhuCCOOmg3N7hO5I2Nu
 XiU7Sd2euXsVhQ538n36kSWWVb8ImVO4icsWEjO39SXpeQl6i5F2W1iQNM8fpOP8kZWE
 dxMkgqRph3by2FngOhccw0vIS3AU3MmX3tRT9+uqO7aGIUPdlqDiHNiuNfJl6ofDH2GZ
 KoJ8pG1BsUWr3UtzO6kYpoH+YcPrEp4UGSHeZ5b6uJsuZml5QxKHvgGaWMEU6irXllAu
 0Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Itxy1UuOFf0gEK0SQVLvvq83zvWvNXRtoyv+3j/ePs=;
 b=B3nK+yoeOvif6HKDgT7k/saNYmKSKJFIcqYNRbA4j8Sr1KamBb+RCJZ5P6WPibihSu
 2h02H1ZNbbBoJtGQMyoahGim9dwoKmxznSkLOuruHSMiZssyYMpBGCLbrJhFr5ONCgu3
 Q0vP6OenEyXf3+1kAE/RI9IUB3NlNTfmtYOY4m7b2z4XLqT39pfMAUGCC6jvpWOoe+hj
 gzSBTHLqMvGLfc8r7IFyE7ZqYWq3/yK3aDsYKF2xHAF4prGcq2js9TZlTZjWntS+dr2/
 E/Px0jss+PMXhCZz1U/eZr1l241K3XGerljYV76zUGZpN3bbLJG36+gkfeWsy46Ufzv1
 BGKg==
X-Gm-Message-State: AOAM531f0iOS2IAPRW8F3v+12JdVbDmUiPEdbNK3+bv47P5bjb8117rg
 qPLgSzJ2MLzx5Y/Im6sznxpO6w==
X-Google-Smtp-Source: ABdhPJxzu8nXzEPL01hazJbb6ppH57uWBorPy75paaXymWLl/J6AQvcjB2A7yCrD4tJynACMgapo5Q==
X-Received: by 2002:a05:600c:4a19:: with SMTP id
 c25mr37725345wmp.94.1620815436822; 
 Wed, 12 May 2021 03:30:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm29420707wrw.26.2021.05.12.03.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E59E21FFB3;
 Wed, 12 May 2021 11:20:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 27/31] tests/tcg/ppc64le: tests for brh/brw/brd
Date: Wed, 12 May 2021 11:20:47 +0100
Message-Id: <20210512102051.12134-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


