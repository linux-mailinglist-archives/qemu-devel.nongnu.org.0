Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CB13646C7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:10:51 +0200 (CEST)
Received: from localhost ([::1]:36208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVY2-0005R8-El
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQR-0004N5-P5
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:00 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQA-0002sm-Mp
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so20764863wmy.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=np1gaZVZhTNvKxm8FNo3UyxZzlTNbaBL/YyqUBHfOqM=;
 b=SxQkKmejjrh82xAAnnveYZbNZp2etX6wmRTgjfujuuYpKU6bM7RJewQlYnvrQbuoIu
 x+t0f3JnATfhUjc5eBev8A1CcC8QGhI9A3wezovENS90ZgFMCv42IJQjeFZ5j01zo3zu
 xqE2YZbIbf3gdAcsgQq4UV1+F+mEkuP3apPWigWerFbJtLnSfHs2G0oLh2t/iiWlnlY0
 TdmRXMr0WBQ5y1DpTgsVt2zb4ych0LLUFvhiWJgLTAAt6y5eydB2DZPtRnoRFiTvmH47
 XR8ULJmfBcUNgn9KTlcsQ89hFXmGCespSsL14oHdGgPjE20cc/r15ovsUEbwb+8KZFW2
 sDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=np1gaZVZhTNvKxm8FNo3UyxZzlTNbaBL/YyqUBHfOqM=;
 b=MKt0GXtY2+Rb9SGnqTumggWvmYkB8pmtIYmDu16sLbu75ESax3MT0cehJjZ9q3hsjs
 voi4LCR8GqUTTtMHYDLZPlEraVW43Axi5OGfRjrRCD49ePNH3C7nM4mNnujF5lBwjywd
 usxfAT4l4kv7jbSlZT99gdstoYd+n6LU3xMHdkD891Nl3u7CjZr/7GMUUIISrbGhV2Ca
 +3rKmphvPxWwb8nucBA6FHtQ1wOPPMDSKB7yFb+kOnLgOmMOpkiW5/yqa+8KYu9NU2Z0
 ks1d1Nkj4GHBxn93PLsX96jjiv7eutsLGoUkgtZHoJdT9ae3S0ayiojVnm+Oo2yDqne1
 TMKQ==
X-Gm-Message-State: AOAM533VLQ/QAD2vAodaLfzDJCnCHlOSeNAAvKjkFMSbWpYPdvf07IJR
 KANt6au0X9Ya6kCflNivAImraw==
X-Google-Smtp-Source: ABdhPJxLpJh8e9dfL2LoIN6D4GGkMqQJnFa7+8RS+yDwHpLTBbqTNOEAOaGDedF91Sfw/SFMJgtuLA==
X-Received: by 2002:a05:600c:4f54:: with SMTP id
 m20mr21632058wmq.58.1618844561317; 
 Mon, 19 Apr 2021 08:02:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i4sm24076195wrx.56.2021.04.19.08.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:02:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9573C1FFA9;
 Mon, 19 Apr 2021 15:54:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 20/25] tests/tcg/tricore: Add fadd test
Date: Mon, 19 Apr 2021 15:54:30 +0100
Message-Id: <20210419145435.14083-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-11-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target      |  1 +
 tests/tcg/tricore/Makefile.softmmu-target.orig |  1 +
 tests/tcg/tricore/test_fadd.S                  | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 tests/tcg/tricore/test_fadd.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 799b51191e..e7adb16af9 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -7,6 +7,7 @@ TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
 TESTS += test_dvstep.tst
+TESTS += test_fadd.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index a9b81545e2..799b51191e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -6,6 +6,7 @@ ASFLAGS =
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
+TESTS += test_dvstep.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_fadd.S b/tests/tcg/tricore/test_fadd.S
new file mode 100644
index 0000000000..1a65054803
--- /dev/null
+++ b/tests/tcg/tricore/test_fadd.S
@@ -0,0 +1,16 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DD_PSW(add.f, 1, 0x7fc00000, 0x00000b80, 0xffffff85, 0x00001234)
+    TEST_D_DD_PSW(add.f, 2, 0xf9c00000, 0x00000b80, 0xf9400000, 0xf9400000)
+    TEST_D_DD_PSW(add.f, 3, 0x8bb858ca, 0x00000b80, 0x8b3858ca, 0x8b3858ca)
+    TEST_D_DD_PSW(add.f, 4, 0x00000000, 0x00000b80, 0x000000ff, 0x00000000)
+    TEST_D_DD_PSW(add.f, 5, 0x7fc00000, 0x00000b80, 0xfffffe52, 0x0a4cf70c)
+    TEST_D_DD_PSW(add.f, 6, 0x9e6d5076, 0x84000b80, 0x9ded50ec, 0x9ded4fff)
+    TEST_D_DD_PSW(add.f, 7, 0x00000000, 0x04000b80, 0x0000e8bd, 0x00000000)
+    TEST_D_DD_PSW(add.f, 8, 0x7fc00000, 0xc4000b80, 0xffad546e, 0xffad546e)
+    TEST_D_DD_PSW(add.f, 9, 0x7fc00000, 0x04000b80, 0xfffe0000, 0x08130000)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


