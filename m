Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E421429C7A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 06:36:01 +0200 (CEST)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma9WB-0000Nx-WE
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 00:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ma9U4-0007ks-W4
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 00:33:49 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ma9U3-00050G-Dm
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 00:33:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so1604136pjb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CQbaNe6aj0xbKRlEs32OQhErI+4t+xvuDfmcY1XqKS4=;
 b=geoUBCS6vIaHIXR4G9U69Cd+UbZpSLvKzrSxrW9gHYu3jdspvt/V3o+LEkCjeOW74T
 14cO/ZdBjsnn1UxyXW/9YlI6ITi6vcRx8ASXhhVBE6SnuWQxQ7JK5jd0d6krH0lGqqw+
 z2ul3ue1OsOPhGHxiZOHsaEazQyd6BuWz2BdlTfL3DX+oDKK49iek5wgjEvT5SIgNog7
 8zZwiQPqZcoM+ytNVDN2GNWSdJsUxGcmDh2yqEpsOiVBA6Pp9bQ+flQmkswAKtQDiP+U
 96FqdhE9UuYS7SzIZl1Dkepc0QaKFKY5AwNGjulJKYG9bofgMregVCENV4xoDkLrWukz
 ibEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CQbaNe6aj0xbKRlEs32OQhErI+4t+xvuDfmcY1XqKS4=;
 b=uSiXHYR89vmoxUB+QqiB72LoJHYjt1uDNeWarzRGrCZAIsX9RJXk4QGMtg6SEUohTu
 KDYww1g7RUGu07P5EuWnH42wiSSXQiP6CTXaXagJQNllBsD6yDvNmGkg+975GvJRKTTV
 gR1wgz0vyULhqUfoQZ0Mef4jouGWeCgZ0JjHnRFkR4UgpMuqedLZdmxSncHxC9UhLQzM
 shgJIySyTbalBUy10Zbi2iSb/Y3lBtNpRwz16lCOMtpsfdUGfo+6gg+d/D5auwPa70wy
 WZ3nfA7Uh0inYVktYNKZQrgHULwM6Nbg1+3EBfodVawwv31CbFO5UGMCsZv8EJL1k2Zn
 Hg8A==
X-Gm-Message-State: AOAM5330GJdHyTRZLoUMHHdTv9J153aBW3nS2ONNk2nfr3NhwzLyiue1
 YJ4lnDLOS7FZRx0btGIef9K+1YtFhxw=
X-Google-Smtp-Source: ABdhPJwzfbSl1T6I5tH56qArSTJwHr5Ixi19xNNMBafuvkzLsILg0OvnssBZUNX3Bq1mDIrFWaLtEw==
X-Received: by 2002:a17:902:868d:b0:13d:dfa7:f3f2 with SMTP id
 g13-20020a170902868d00b0013ddfa7f3f2mr28304760plo.30.1634013225619; 
 Mon, 11 Oct 2021 21:33:45 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:401:1d20:ecea:c8ec:ff7b:52])
 by smtp.gmail.com with ESMTPSA id c8sm981781pjr.38.2021.10.11.21.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 21:33:44 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg/xtensa: allow testing big-endian cores
Date: Mon, 11 Oct 2021 21:33:24 -0700
Message-Id: <20211012043324.24045-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
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
index 50435b8d2f50..8b5ed46a5f1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -343,6 +343,7 @@ S: Maintained
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
2.20.1


