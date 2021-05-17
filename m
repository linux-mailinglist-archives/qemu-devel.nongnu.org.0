Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DAE3839C1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:26:06 +0200 (CEST)
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig4D-0001kT-K0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpf-0007iL-0N
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpU-00065v-39
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z17so7005449wrq.7
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8fhgplKrAIwPeJiS0d/uA6DCmsrrVSQ43uYZZyDSgQE=;
 b=NHnK492dnNSD6JoyPAdMvNzn4LBbBCwjkWVSUOoKJm6PenZpY6BPvaAOdtviOzUHAN
 PQgt4RiuzEWbNBEL14dB9UXbkHpoTe0NktMrTyN9HyY4riA8frWLHHRD6qvJRbNg9shE
 nT5F9B2XeQ3tYKzrhMM7uJmw5x9jh8WGAGK8E8sI7APX0OguF9/pbaHpdjD6N8Exm8gE
 LisSI3+EnoFdhLr6xdDNXiUkBOUtibcJTWGvQiotj+Ed5My+T40ZsTDAU/78nfLGNTtf
 8p6c9tvw48eaz1WSJyt20KClxpwf30lQd1ywL2FTuY4l3NguG+uf425T4wXAI5p3+zWc
 JuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8fhgplKrAIwPeJiS0d/uA6DCmsrrVSQ43uYZZyDSgQE=;
 b=iYvu03dK8HDB6UfWaMsWytaMBBJXoIB7kXtlxO93zNnEk2jZORhtLUVx0Tl3DXdcQn
 iSKfaC6W45a9lrwQwkR+xRY6FGrqHoKW+baiXAp9hjt6n0qxJmLMNzL7xAOaBJXGM3G0
 7G4PF6FRTe6OXlJ17xyZWvogQM7EVpd3gHoIW1dg/eVmHgT0HFRyXc5otZXFPx5XAac+
 Je1EPqAAG74kXfDJpLbgHYKXYdtxGvi7D120iRszm1BRyThxXadSAmzfieIDCEwb9tYc
 PPQYYqGFxlr+HojgzQfP409HKnRoDDquGrAxCST6ZYz15sQXnKG9tcfibNKFGLZOr4IJ
 tAew==
X-Gm-Message-State: AOAM530xr8ixGHZUtIEdLFyQ+wVExBUVS9FBW6i7BrZ6UX95xEKeCcOQ
 kUvg4d0ixQ+Chz+s8H7un2XXMQ==
X-Google-Smtp-Source: ABdhPJx7QDztDi0PFPdazRwlPkmDn7QTEpUg88ASSoRrGBv2quCQT4BnIllqQDDthLE8LbdjVi3jIg==
X-Received: by 2002:adf:e944:: with SMTP id m4mr545940wrn.10.1621267842028;
 Mon, 17 May 2021 09:10:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c194sm19327185wme.46.2021.05.17.09.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11BE81FF99;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/29] tests/tcg/tricore: Add build infrastructure
Date: Mon, 17 May 2021 17:10:03 +0100
Message-Id: <20210517161022.13984-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this includes the Makefile and linker script to build all the tests.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-5-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-15-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 7572859317..40bba0fc4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -349,6 +349,7 @@ S: Maintained
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


