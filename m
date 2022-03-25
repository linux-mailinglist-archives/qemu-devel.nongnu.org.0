Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE504E7A38
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 19:26:13 +0100 (CET)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXodY-0007a6-1K
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 14:26:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nXobi-0006pn-2z
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:24:18 -0400
Received: from [2607:f8b0:4864:20::635] (port=45802
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nXobg-0002sM-K7
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:24:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id k6so8928134plg.12
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 11:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cP1IyIcL9YwJud5iDxCE0fvjEYIWyEZ7UQllFEjGvs0=;
 b=chdCBa0Xb8fKiatImCfDk0/CaM10i8nkjym3ZFXin5EQY/xqAKk6A9zRllY8ydCPmA
 hXWkWYc/N/DvViOFZgdqTi0DkgdQsMGNva2gtz0vEjW+Usem9SAn8JNgNAKLtLlZPMIe
 UVG3OwQS8sVzXSUv9JbKrH9Do1roZAYSCeBaUEdy2oKemSVyJNtH/i1vZfDXXHmTMoZZ
 BwcbCcCjrnJ8JSsHDIBstHtxaZJt9ECnWrjfMKtWLlCPmsnZRIumVYQLh5Sw/0tilFcw
 BfEKEPED358RKObW07bNIhNKCykI2D30iB5l1wFc3Glsy0CYloYo6aoCQNXH6JvRNVxy
 SZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cP1IyIcL9YwJud5iDxCE0fvjEYIWyEZ7UQllFEjGvs0=;
 b=32LVRNhHXdjmkQjemQn+TiyqEtsfKX5f6biEOIPpqmNrAJshCASjcit8JLXOVoUCtY
 H/cV0QYGkfgu2sBV/7Fmg0s0XCn8HJXFbrLYKTcbjBjxX1M6+59wEVB96FcjNNwktcrm
 u/SH7g8oearrfYsZjurXCrf8n92YPFRbSNOi2rth91PJx+pFzuKmummydCUBgynCzfG/
 aDgwOW+Cn2QLQrkAcgyxrrFbrOQTv4MePLS2O05KixGmzCYUec16sPygYX4u8pqSnQw3
 tnecnzmsHExQUgWCtPJpbN8GFSul8pAWJ8jBvHUd6CGOFSVA2k1OKFybujF010FNTZzC
 Kfng==
X-Gm-Message-State: AOAM530pppIRnlNIySHpSUY7EOiCLOFu35KagzXOYTidEyKRMs6LDjXj
 NhkmCIJAH965fKxlb0QV7jTJgAifrKAtMQ==
X-Google-Smtp-Source: ABdhPJyJ5A7J6dpXxjUeuoYj7eXCB9tiv65rXj62DR6qv1c6vxvF3Fr1iOMov+aQc10Gq6kwuCBd+w==
X-Received: by 2002:a17:902:e742:b0:154:3e6a:21c0 with SMTP id
 p2-20020a170902e74200b001543e6a21c0mr13145386plf.117.1648232654604; 
 Fri, 25 Mar 2022 11:24:14 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:7734:79fa:d15c:6089])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a056a001a4a00b004f7c76f29c3sm7750529pfv.24.2022.03.25.11.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 11:24:13 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg/xtensa: allow testing big-endian cores
Date: Fri, 25 Mar 2022 11:23:52 -0700
Message-Id: <20220325182352.113975-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't disable all big-endian tests, instead check whether $(CORE) is
supported by the configured $(QEMU) and enable tests if it is.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 MAINTAINERS                                | 1 +
 tests/tcg/xtensa/Makefile.softmmu-target   | 4 ++--
 tests/tcg/xtensaeb/Makefile.softmmu-target | 5 +++++
 3 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/xtensaeb/Makefile.softmmu-target

diff --git a/MAINTAINERS b/MAINTAINERS
index 9aed5f3e04e4..e16585b073a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -347,6 +347,7 @@ S: Maintained
 F: target/xtensa/
 F: hw/xtensa/
 F: tests/tcg/xtensa/
+F: tests/tcg/xtensaeb/
 F: disas/xtensa.c
 F: include/hw/xtensa/xtensa-isa.h
 F: configs/devices/xtensa*/default.mak
diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
index 9530cac2ad95..f1cf2a6496d2 100644
--- a/tests/tcg/xtensa/Makefile.softmmu-target
+++ b/tests/tcg/xtensa/Makefile.softmmu-target
@@ -2,7 +2,8 @@
 # Xtensa softmmu tests
 #
 
-ifneq ($(TARGET_WORDS_BIGENDIAN),y)
+CORE=dc232b
+ifneq ($(shell $(QEMU) -cpu help | grep -w $(CORE)),)
 
 XTENSA_SRC = $(SRC_PATH)/tests/tcg/xtensa
 XTENSA_ALL = $(filter-out $(XTENSA_SRC)/linker.ld.S,$(wildcard $(XTENSA_SRC)/*.S))
@@ -15,7 +16,6 @@ XTENSA_USABLE_TESTS = $(filter-out $(XTENSA_BROKEN_TESTS), $(XTENSA_TESTS))
 TESTS += $(XTENSA_USABLE_TESTS)
 VPATH += $(XTENSA_SRC)
 
-CORE=dc232b
 QEMU_OPTS+=-M sim -cpu $(CORE) -nographic -semihosting -icount 6 $(EXTFLAGS) -kernel
 
 INCLUDE_DIRS = $(SRC_PATH)/target/xtensa/core-$(CORE)
diff --git a/tests/tcg/xtensaeb/Makefile.softmmu-target b/tests/tcg/xtensaeb/Makefile.softmmu-target
new file mode 100644
index 000000000000..4204a96d53c0
--- /dev/null
+++ b/tests/tcg/xtensaeb/Makefile.softmmu-target
@@ -0,0 +1,5 @@
+#
+# Xtensa softmmu tests
+#
+
+include $(SRC_PATH)/tests/tcg/xtensa/Makefile.softmmu-target
-- 
2.30.2


