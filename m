Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477473646C9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:11:32 +0200 (CEST)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVYh-00073Q-Aw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQ9-0004D7-Nx
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:45 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQ7-0002rR-OU
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so11383235wma.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHKNBBiZA4Z2Blb5bvuoo5BRzsS+50ZHmKEEPviANKA=;
 b=izUhUH+2X5HWYJjoEp+c8xoWOpSGhmJS0MorHwuGzeSc3OJIdzjFe/E8Fh105DZWsh
 sijLxnO+1pGgPOlJqstWsRk9rp2Ms/dReIb8UYlgTwCSVy9ebZQc98VhN0VgXYAVCbgA
 M4a1VrShQpn+vq7krUxZMJHQYb+cpkHGLRc0yNicU9ybU/ihKxvt3CqCGjae2K/zhwuJ
 +Ld/FcrJFDM+UViqyYvBzrsaTeOwOmPpwKllQy4FC7mzMpL/2uHKBvhNXLMfpNjBIC3T
 +Hjdftu57Itr+5+p4WgFWzIZCKOPsO5zdS/oRb4CMFrthay+hmLN0pS3f5fVGUh+3AmR
 oiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHKNBBiZA4Z2Blb5bvuoo5BRzsS+50ZHmKEEPviANKA=;
 b=WOsyST141hxX8XDGSLSPtGMZfVeIutmi/+JJVghJePrHHvaqEqxbL9KuXcL3cVhWyt
 WtAFEw9VnVwx9eyjMUgqWBMYtBd0vVtDdDj6bseoRZNGT1xp/rMsoujVd5czqaqiR2v3
 QVlQNCTD0RJbk3KzuUXetjtjhmy/afKSczhFOPj4adZtdP24y1yadgR+e5DlKJmMiS89
 SezyDwkdGE/7yeKg9Rh5DujTFyP2EnNhsVw4Up37LP8eoAlg8FlO/G2VoALhmsCZlPaX
 CKMjnAff2r3Y2cZjzP8P4PhqzVZSHQ3CGuIfe5uPkEYGcG+sY7MdHTFRP9HNjj9i8Mi+
 TIdA==
X-Gm-Message-State: AOAM532P6nPJz9nK/F1AzHoxP0BUNjZTP7y/LN2cAlYx5Zw7E12xlR58
 x6BLVqQdaI4RGXmRR+Lm9Uiltg==
X-Google-Smtp-Source: ABdhPJyrEGdPjb0kBe+iImVUUo14QwQen6UhA4s997SvB8QhOSO/Nd5mV6Cjl/A1i0BPspvFxX4A0Q==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr4355745wmq.34.1618844558391; 
 Mon, 19 Apr 2021 08:02:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm3809497wrg.80.2021.04.19.08.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:02:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61A441FF7E;
 Mon, 19 Apr 2021 15:54:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 18/25] tests/tcg/tricore: Add clz test
Date: Mon, 19 Apr 2021 15:54:28 +0100
Message-Id: <20210419145435.14083-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Message-Id: <20210305170045.869437-9-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target      |  1 +
 tests/tcg/tricore/Makefile.softmmu-target.orig | 18 ++++++++++++++++++
 tests/tcg/tricore/test_clz.S                   |  9 +++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 tests/tcg/tricore/Makefile.softmmu-target.orig
 create mode 100644 tests/tcg/tricore/test_clz.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index de6a2cc88e..a9b81545e2 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -5,6 +5,7 @@ ASFLAGS =
 
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
+TESTS += test_clz.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
new file mode 100644
index 0000000000..de6a2cc88e
--- /dev/null
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -0,0 +1,18 @@
+TESTS_PATH = $(SRC_PATH)/tests/tcg/tricore
+
+LDFLAGS = -T$(TESTS_PATH)/link.ld
+ASFLAGS =
+
+TESTS += test_abs.tst
+TESTS += test_bmerge.tst
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
diff --git a/tests/tcg/tricore/test_clz.S b/tests/tcg/tricore/test_clz.S
new file mode 100644
index 0000000000..e03835f123
--- /dev/null
+++ b/tests/tcg/tricore/test_clz.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D(cls.h, 1, 0x0, 0x6db17976)
+    TEST_D_D(cls.h, 2, 0x000f000f, 0x0)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


