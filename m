Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67143646BB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:08:46 +0200 (CEST)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVW1-0003FP-No
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIh-0003fW-Mz
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:59 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIf-00072z-IE
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id x7so34343624wrw.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiVgs9/+iJ3i0DlYql/VgFCWa4s85pzlKekXIccHrI4=;
 b=BBbsJudpBjGS2geH6Muv8QJ+qBQT4hTv5TlDUZzAjkexUKwzbduVZZ5SrfjrgMX641
 KsReGPdVI9dsUcbJTyy7PLYEiISSDgXGdi8I6mKVu+ybhP7+ixmMXIYt/oUdVgoVrmKD
 uU9k/yQeRU6WHpvQ7Qw/53UHdQHuy0RwbxKzJGyQ/6P88Khw6y8eqj+5tfEZFLPdcbWn
 V2x5vgm9HbO4Ia2PCEJhKcYM/Y9nxAKQ0pPforZizWNJnnK4VsYxEKMj5/gXrGiiJa21
 TA1BdzVW4SlvA1zhgEbpNCkgMbAwfJNYHhZ8OmFSc0w0m48AtKqmZYOWhdzFn7RQ9eFM
 bzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiVgs9/+iJ3i0DlYql/VgFCWa4s85pzlKekXIccHrI4=;
 b=pSJBeTXhb5c4fa/MozQZiYG6wrwEqbeUdAJ/hKQ+gpd+oNpGsKeYHBxQUonrRXYrdU
 wCB5s5AsVCPX2KlrJJ97Fb/iVaKxLdRFKUlHRGvjNT6kovLXqK/NM4VMHYNF1VbYNd3l
 GFe8Uves3uloD/38z2hPwoNoHAfdRHpGgox1OGLhAhR1UBdvseexE6qr6DV2VUqBIorq
 wvriYSmfhZlP5oH/WOBcPmuEtaXU/OIvRt6YQ+ihdbN5uIn/8y3bv6MxwURHV9LNb9KE
 s3Ch/hj4zqzSiNE1osfhA3SbE4bGb0VN8y84KN5nRZPb4LkjojpktiblU/fVk7OBhxQU
 OH3Q==
X-Gm-Message-State: AOAM532Ut10/V7HxB8NuQqzClZHq9n10rDSuRa9geTpopox6+LuH0lDo
 eeEnV70LyKK4jdEb449+zojLdQ==
X-Google-Smtp-Source: ABdhPJxeyRkj5yJaEJtpW92vFT5Ras8EtYmSYa4V2c4CU8gD0fVJi6c1RtsHB2SK91KG1VMQHk8+Ag==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr15075002wrp.368.1618844096138; 
 Mon, 19 Apr 2021 07:54:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g84sm16346637wmg.42.2021.04.19.07.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1BBA1FF9D;
 Mon, 19 Apr 2021 15:54:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/25] tests/tcg/tricore: Add build infrastructure
Date: Mon, 19 Apr 2021 15:54:24 +0100
Message-Id: <20210419145435.14083-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
index 26c901527e..cf1119bd8e 100644
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


