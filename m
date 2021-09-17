Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12040FDEE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:30:45 +0200 (CEST)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGlA-0004vi-QW
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeM-0003Ua-Q7
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeK-0005Ru-0X
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u18so14342325wrg.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLy3JwK0ppKXnHHIzD0bw9+kzczMVllLeYg1SGrrrRE=;
 b=GsgiXVwNNcrb9njFsGN/7AelnxVTWrg7GaalHcM9Cmq3feoyrr5oPFha0hcG/Aineg
 nQ7QCU1Mk0oe+iFOXrzXFrmCqLxVG6l2uGJfNJ9RM/XHqIR9l+AB0NY88+un32LcsShf
 j77ovHhuR0i72lvGtnSZk0oPA2QbuaOK3uFBkYP1seGdbOrFpeZnZjciyKKPhtWC0Gdv
 FxcWrWxq74vkDhs/YGGaIcmWgnAJP4uQbsShYN1qdzUv1LocWwjWftmnDBkdJ/qfn4JV
 wBB9yaaAYOyTPQ9nemQxIZP4QtjGIZl4BxVdtnmKsfHMUOOue//NHwT9OlKZQ3+SyLRk
 IEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLy3JwK0ppKXnHHIzD0bw9+kzczMVllLeYg1SGrrrRE=;
 b=6LFX9aUGKCP7jQu5EOh6mOLd1MNRpgmYIf9AJ3IByS+G5rWZyvns6obLhSF0tL+/xH
 YOkPLs3p5IAB4ByP1e7/m0tMHE1suk1ladZ54ShMzicZBkXlU4KKh0BrNZ0NQm0T0g71
 3rl99d4IXoaLp4Vnu5b0bCHeZtmwYLmJCDQthzp2WkbN3jgrzwh3uS9+RhNefuXZTgK6
 52twP8weKelG2qb8fo8ZviaXnO2DSReXnOYwyOEtg5k4YI7QbrDXt9d5N6znysPVPZ3W
 oEukM7jLK5gEj64v0H2h+sIp4LfjaVbOI3LJfmLcPdzBfRDC5dGKrh2pHLG1I9L0pRzw
 Y/9g==
X-Gm-Message-State: AOAM533OQJnYAEf6I89CL8geyZljPeqn2Pr9gjLT4zEvH+uW8PVT3fxm
 4WkdExDC+nb9rvCNFOiYEJ6IaQ==
X-Google-Smtp-Source: ABdhPJxrPD1rM9uQqi0bP0g6h8szZ5eXa33I4C5VJ/U00WGcdsiUe5+l+UkID/gbHr7XhLpBZNFloQ==
X-Received: by 2002:a5d:6307:: with SMTP id i7mr13244611wru.395.1631895817767; 
 Fri, 17 Sep 2021 09:23:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 4sm6434433wmv.42.2021.09.17.09.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 791AC1FF9A;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/11] tests/tcg: move some multiarch files and make
 conditional
Date: Fri, 17 Sep 2021 17:23:24 +0100
Message-Id: <20210917162332.3511179-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had some messy code to filter out stuff we can't build. Lets junk
that and simplify the logic by pushing some stuff into subdirs. In
particular we move:

  float_helpers into libs - not a standalone test
  linux-test into linux - so we only build on Linux hosts

This allows for at least some of the tests to be nominally usable
by *BSD user builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>
---
 tests/tcg/multiarch/{ => libs}/float_helpers.c |  2 +-
 tests/tcg/multiarch/{ => linux}/linux-test.c   |  0
 tests/tcg/multiarch/Makefile.target            | 15 ++++++++++-----
 tests/tcg/x86_64/Makefile.target               |  4 ++++
 4 files changed, 15 insertions(+), 6 deletions(-)
 rename tests/tcg/multiarch/{ => libs}/float_helpers.c (99%)
 rename tests/tcg/multiarch/{ => linux}/linux-test.c (100%)

diff --git a/tests/tcg/multiarch/float_helpers.c b/tests/tcg/multiarch/libs/float_helpers.c
similarity index 99%
rename from tests/tcg/multiarch/float_helpers.c
rename to tests/tcg/multiarch/libs/float_helpers.c
index bc530e5732..4e68d2b659 100644
--- a/tests/tcg/multiarch/float_helpers.c
+++ b/tests/tcg/multiarch/libs/float_helpers.c
@@ -22,7 +22,7 @@
 #include <float.h>
 #include <fenv.h>
 
-#include "float_helpers.h"
+#include "../float_helpers.h"
 
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
similarity index 100%
rename from tests/tcg/multiarch/linux-test.c
rename to tests/tcg/multiarch/linux/linux-test.c
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 85a6fb7a2e..3763df2019 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -8,18 +8,23 @@
 MULTIARCH_SRC=$(SRC_PATH)/tests/tcg/multiarch
 
 # Set search path for all sources
-VPATH 		+= $(MULTIARCH_SRC)
-MULTIARCH_SRCS   =$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
-MULTIARCH_TESTS  =$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=))
+VPATH 	       += $(MULTIARCH_SRC)
+MULTIARCH_SRCS =  $(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
+ifneq ($(CONFIG_LINUX),)
+VPATH 	       += $(MULTIARCH_SRC)/linux
+MULTIARCH_SRCS += $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
+endif
+MULTIARCH_TESTS = $(MULTIARCH_SRCS:.c=)
 
+$(info SRCS=${MULTIARCH_SRCS} and ${MULTIARCH_TESTS})
 #
 # The following are any additional rules needed to build things
 #
 
 
 float_%: LDFLAGS+=-lm
-float_%: float_%.c float_helpers.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< $(MULTIARCH_SRC)/float_helpers.c -o $@ $(LDFLAGS)
+float_%: float_%.c libs/float_helpers.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< $(MULTIARCH_SRC)/libs/float_helpers.c -o $@ $(LDFLAGS)
 
 run-float_%: float_%
 	$(call run-test,$<, $(QEMU) $(QEMU_OPTS) $<,"$< on $(TARGET_NAME)")
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 2151ea6302..d7a7385583 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -8,8 +8,12 @@
 
 include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
+ifneq ($(CONFIG_LINUX),)
 X86_64_TESTS += vsyscall
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
+else
+TESTS=$(MULTIARCH_TESTS)
+endif
 QEMU_OPTS += -cpu max
 
 test-x86_64: LDFLAGS+=-lm -lc
-- 
2.30.2


