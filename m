Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A513B8059
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 19:47:14 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB0WP-0001P0-1g
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 13:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iB07M-0008UJ-I8
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:21:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iAzwm-0004O4-6i
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:10:25 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42016)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iAzwm-0004NQ-0G
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:10:24 -0400
Received: by mail-wr1-x442.google.com with SMTP id n14so3894124wrw.9
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rlSvkcXczqc1cNe9s/EmLRGBxbkZT67vdQCCwyIuOR0=;
 b=Gn6s6O/Uaw8zCiEq1a4MYOCWlQzr4i/kjdjcv5EulhSPMJlIIAx6W/TDJF3v7hadn7
 4hSdkgSv/CTLvyU9kdZYSmkmHShbtYyVzsmS68zM4F2RSyTgBlqwCchl+4Gj5NrAj0QY
 IE60JJNRnkD9bmJaUKNsjb7q3yCutTn3xDMM4ttsi0Og+z3R/Gkvpmz73CuOUh1grRyY
 N/UTETTJ2R8LFFFACW8nJjtMGGodRdpg6cMHXtMTdMSuTPtHUSmE+iJyJfJnhx4Q4HOZ
 jITBqe9jdTH3tcq5NMiqYjV2teVEPLQjRhDEIs5p2ZAhisO0lp2L/soY8A9SfdKiqYYb
 gF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rlSvkcXczqc1cNe9s/EmLRGBxbkZT67vdQCCwyIuOR0=;
 b=XfXAqcTng91MwG262CBaTpmVeb9jKajwnsR7ptLnuNcqq5Omur2dtUYgF6WbCCvkZN
 q4PwRY05dz0twIM0BBiv1L62UfU1I+Feuqz6ue/qv6U7wbFCR8U510pSPIAbQ2fC7C/E
 o+LKxkuPJQPZYh1wuOaey0dLkEOtIiz6wRNHMwaco5nykkuxGe/OiNHFT/ey8EHPXQVB
 fp8GMUzl1PY822CMnfwEB1RkAnVHITtNdsWM66klOq9JEEqMyplyHKgxctEr0iKYxZuH
 Ssl6Ll3BQF/LT1/xTexnuoEfa+7XjRgfD3sMxCo5xqr0UYhQ6Vb9hJPVfgOltJgLEwWB
 QmPQ==
X-Gm-Message-State: APjAAAWN+XC8ss8Fj531eHa3l50HAgxqTRTsEaoQZVzeg8qx0qkT3Gja
 Mfv2iViVzY98S8pNikJvmi5VBA==
X-Google-Smtp-Source: APXvYqxL3Xr8sX4HQAfgu7Rm9V9PlIAu51t8jikbQiZfaeItxvo9SE4r+fW7m7scgVN0ZmKQAjqjjA==
X-Received: by 2002:adf:a415:: with SMTP id d21mr8909155wra.94.1568913022770; 
 Thu, 19 Sep 2019 10:10:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r12sm7991654wrq.88.2019.09.19.10.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 10:10:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 624FE1FF98;
 Thu, 19 Sep 2019 18:10:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 08/16] tests/tcg: re-enable linux-test for ppc64abi32
Date: Thu, 19 Sep 2019 18:10:07 +0100
Message-Id: <20190919171015.12681-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have fixed the signal delivary bug we can remove this horrible
hack from the system.

Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh              |  1 +
 tests/tcg/multiarch/Makefile.target | 11 +++--------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 6c4a471aeae..e8a1a1495fc 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -54,6 +54,7 @@ fi
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc64="-m64"}
+: ${cross_cc_cflags_ppc64abi32="-mcpu=power8"}
 : ${cross_cc_ppc64le="powerpc64le-linux-gnu-gcc"}
 : ${cross_cc_cflags_s390x="-m64"}
 : ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 6b1e30e2fec..657a04f802d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -12,14 +12,6 @@ VPATH 		+= $(MULTIARCH_SRC)
 MULTIARCH_SRCS   =$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
 MULTIARCH_TESTS  =$(MULTIARCH_SRCS:.c=)
 
-# FIXME: ppc64abi32 linux-test seems to have issues but the other basic tests work
-ifeq ($(TARGET_NAME),ppc64abi32)
-BROKEN_TESTS = linux-test
-endif
-
-# Update TESTS
-TESTS		+= $(filter-out $(BROKEN_TESTS), $(MULTIARCH_TESTS))
-
 #
 # The following are any additional rules needed to build things
 #
@@ -39,3 +31,6 @@ run-test-mmap: test-mmap
 run-test-mmap-%: test-mmap
 	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<,\
 		"$< ($* byte pages) on $(TARGET_NAME)")
+
+# Update TESTS
+TESTS += $(MULTIARCH_TESTS)
-- 
2.20.1


