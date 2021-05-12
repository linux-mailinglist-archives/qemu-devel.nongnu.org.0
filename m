Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B5437BAF1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:41:02 +0200 (CEST)
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmIX-0003fd-5M
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8b-0000nN-Eb
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8X-0000ch-QS
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x8so785377wrq.9
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l97rhLDxO0XNq5HQNG4JIIr2ozVY5tElcdl90wPdeI0=;
 b=s0+5H6cPoS6XRe3FxBqZqEc0tMsB9Yw2D63FY8kNmf8shpVwszLz3x1ZvUpXlvLi+t
 HlxujfHwbUNnBXRcdpqRH45vQ4lrMbPOS0N2LeQaI/q8+ZOHi0CfP7dytxLFJJTybC9y
 75dNr9gc5G3PglSC2kEz318irdroAOsQ9zj8IizxwZN5yhWRJodtWil4ZjX0w2OjAbRv
 CUNZ4Pk7K8X3lKAMeY17bqFrI0yUfYntIVTQw3GLMeidWH1HC6qXFiyu4zeGPTe9fifD
 2IoISIbVP/U9MYYfQtkMy10pjnI/9LwnDmMPPCXSdLAuUjWYM01ZPflPBKOSMV6slFNS
 M/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l97rhLDxO0XNq5HQNG4JIIr2ozVY5tElcdl90wPdeI0=;
 b=MSdDwKsbSM8SdMkqnNROZqudDOFZTNIbyNhzZz57fU34VYs6fyLvf3vYMx+NRs8VcK
 PZdqJjz01x69mGE7MO1JGeilSkz/tgD+dPoFme3gK/AGLMmqfFJp5dxy0x6EB+ARV5/K
 0GBjS+IonarWRXt5VtSKdMwWVIPihFAO5uyC4y1ZGA4veZ7pY2MAiSaemWW7/oGfwsWS
 bqp/UhcSJ0ipG0x0pNCyNqbW9+FwiPNEFh+cCbLiJBCr/K1wXi8pyURa01ZFqaFnXz6M
 WHZ3meW2q/CyOkhVEplU7dnq+6DARfyvrfG3H6xJvWCHGcoK8xTLnIbQI2/4MLizCyBl
 W5dw==
X-Gm-Message-State: AOAM5337w9GUVeyw8EjdEWuEnKD1NVRZUYdsooQiu4lwvhc+V7tR3c1r
 abIaTHc5vMwD6lBirzSB2c5TYcl7SH810g==
X-Google-Smtp-Source: ABdhPJxm9Vqt1s+UTMLpM0sckW4UbUP4sY58qjwUB48sq8jYOkklk9d9Op8iBOcjboE4fMOE84wAMw==
X-Received: by 2002:a05:6000:12cc:: with SMTP id
 l12mr6301489wrx.91.1620815440446; 
 Wed, 12 May 2021 03:30:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w22sm5415169wmc.13.2021.05.12.03.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 870601FF9D;
 Wed, 12 May 2021 11:20:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 14/31] tests/tcg/tricore: Add build infrastructure
Date: Wed, 12 May 2021 11:20:34 +0100
Message-Id: <20210512102051.12134-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
index 30f1e7d4e4..a3da27843b 100644
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


