Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2C0372880
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:11:13 +0200 (CEST)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds1I-0003MV-5t
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrtC-0002oB-Kz
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrtA-0003Hm-S5
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id l13so7097620wru.11
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NVoblo6bOlZq118cknJIt8N7dip9vFj2ILUd1WjhqJA=;
 b=NTNNnRvxSmMcvk9M7B/yScV3PsisQ47TuyVKYUAtTmcLrxoAP4+ueVKTQGIVIZKEjV
 kBNsVAqd0fjhvlnZcZ9KYylBoW2HJPxcw0khQCzKAXXBFzpmcM2a1EhfzydIKZTvrwXI
 pFCjLj1wJX8NSdYrQfGkPGUjU33zER8eNcwm475J25jk7N7z8Tn2ZPHgyy52TsV2AeM3
 vHz234ShDku4UYWk0zqYbVfANmH2nhoW0VoPMh59e/NcZ30ia0q0UfyEMOTIB9qeDZ0S
 MEVApWqp0vgBJzwUNak0x/LTYn9d2YaVuPIIb3DEZT6V4VBWX+JhJYNah26lzdK4Yr30
 OKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVoblo6bOlZq118cknJIt8N7dip9vFj2ILUd1WjhqJA=;
 b=EPdoWAfOhOt0WdQE6ixuhYXYYAXCA3fIwcv/6Lmi9u0J1idA80tODEwHsnqsKPSdgY
 9uJLTn/5V2bdvXMz1mrJsEN71qOgOVmGmdy5q5AcIQlQbTMabqZ4mq48cBSaB2FOXXPv
 c1ZcMOLK6gApmE8ZucQEdAs2NL1sdSz9r/h6e2I5JDjnCNmnHCprO/g0Y5yNTbzN52sY
 0US3gJJZNXG4l17ZDi7rGzXqp2hBWNz3F6qvrIf/7PWc2o0iYtOGKNevhrOyxNS+Iqwh
 UKLyRmgtuzKlx3nCPiKBWcCHz8eyZ7nqVPZf6wLWBDcSlAei5pB+bJ4QEIXYGPfxl1OH
 diIQ==
X-Gm-Message-State: AOAM530Z0TKUBvewtTm9cG+tdTNl0ZpWnGNLhVfs1mbJEWc+Qu7wL57Y
 UNo2u5rHYc144SgASvmc5GaVJtXVZtxKiA==
X-Google-Smtp-Source: ABdhPJzcUATtHmik7T1ZCuEBevXNerW2b/lD0oahe+jMU/uvhWhHjB5TdjcSpzar7cVVV+lBg2VQQA==
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr31142265wrs.395.1620122567336; 
 Tue, 04 May 2021 03:02:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p10sm15055132wrr.58.2021.05.04.03.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C4A81FF9D;
 Tue,  4 May 2021 11:02:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 14/30] tests/tcg/tricore: Add build infrastructure
Date: Tue,  4 May 2021 11:02:07 +0100
Message-Id: <20210504100223.25427-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

this includes the Makefile and linker script to build all the tests.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-5-kbastian@mail.uni-paderborn.de>
---
 MAINTAINERS                               |  1 +
 tests/tcg/tricore/Makefile.softmmu-target | 15 ++++++
 tests/tcg/tricore/link.ld                 | 60 +++++++++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 tests/tcg/tricore/Makefile.softmmu-target
 create mode 100644 tests/tcg/tricore/link.ld

diff --git a/MAINTAINERS b/MAINTAINERS
index fc0b429b45..4d3727cad5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -378,6 +378,7 @@ S: Maintained
 F: target/tricore/
 F: hw/tricore/
 F: include/hw/tricore/
+F: tests/tcg/tricore/
 
 Multiarch Linux User Tests
 M: Alex Bennée <alex.bennee@linaro.org>
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
new file mode 100644
index 0000000000..d64a99b95f
--- /dev/null
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -0,0 +1,15 @@
+TESTS_PATH = $(SRC_PATH)/tests/tcg/tricore
+
+LDFLAGS = -T$(TESTS_PATH)/link.ld
+ASFLAGS =
+
+QEMU_OPTS += -M tricore_testboard -nographic -kernel
+
+%.pS: $(TESTS_PATH)/%.S
+	$(HOST_CC) -E -o $@ $<
+
+%.o: %.pS
+	$(AS) $(ASFLAGS) -o $@ $<
+
+%.tst: %.o
+	$(LD) $(LDFLAGS) $< -o $@
diff --git a/tests/tcg/tricore/link.ld b/tests/tcg/tricore/link.ld
new file mode 100644
index 0000000000..364bcdc00a
--- /dev/null
+++ b/tests/tcg/tricore/link.ld
@@ -0,0 +1,60 @@
+/* Default linker script, for normal executables */
+OUTPUT_FORMAT("elf32-tricore")
+OUTPUT_ARCH(tricore)
+ENTRY(_start)
+
+/* the internal ram description */
+MEMORY
+{
+  text_ram (rx!p): org = 0x80000000, len = 15K
+  data_ram (w!xp): org = 0xd0000000, len = 130K
+}
+/*
+ * Define the sizes of the user and system stacks.
+ */
+__USTACK_SIZE = DEFINED (__USTACK_SIZE) ? __USTACK_SIZE : 1K ;
+/*
+ * Define the start address and the size of the context save area.
+ */
+__CSA_BEGIN =  0xd0000000 ;
+__CSA_SIZE =  8k ;
+__CSA_END = __CSA_BEGIN + __CSA_SIZE ;
+
+SECTIONS
+{
+  .text  :
+  {
+    *(.text)
+    . = ALIGN(8);
+  } > text_ram
+
+  .rodata :
+  {
+    *(.rodata)
+    *(.rodata1)
+  } > data_ram
+
+  .data :
+  {
+    . = ALIGN(8) ;
+    *(.data)
+    *(.data.*)
+    . = ALIGN(8) ;
+    __USTACK = . + __USTACK_SIZE -768;
+
+  } > data_ram
+  /*
+   * Allocate space for BSS sections.
+   */
+  .bss  :
+  {
+    BSS_BASE = . ;
+    *(.bss)
+    *(COMMON)
+    . = ALIGN(8) ;
+  } > data_ram
+  /* Make sure CSA, stack and heap addresses are properly aligned.  */
+  _. = ASSERT ((__CSA_BEGIN & 0x3f) == 0 , "illegal CSA start address") ;
+  _. = ASSERT ((__CSA_SIZE & 0x3f) == 0 , "illegal CSA size") ;
+
+}
-- 
2.20.1


