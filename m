Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E003646D7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:14:45 +0200 (CEST)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVbo-0001jh-Df
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQV-0004SB-Ms
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQF-0002uW-LZ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r7so22389780wrm.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6jz8RXeBoyzIpBP7F/m0Op/VYGrWLRUn+isRjGAQV8=;
 b=SPFlB0VOD0xAeyuVs6YV8ndOKjrb+w43ekiXuVT7e8FAwxvRTDE/4okTJMfDItW39F
 SSQXsS7GsPTUylNiRkLHEq3oif+RqR/3k7XIHw/4NXtP7XySRjAiKGEIOGonZxgVnETJ
 zgrutOiYdaWk6t7eOlODai5+wcdZDIPu8lgsPv7h7SbFDFHi7QEUdpVjHbdtGzreVkFJ
 h2RXQ/tSuVUfUid9q0yVkVD/mhT1fV5DRlrn5by+23ZVmLtvq1A2nilWrxu3U+99ggPy
 tGqSDL039HNRpFXcbdElwnOMDNGu7oKBonD4n4JdcuRi+jJGK3cqvs6zGMvlq1z5Exdp
 leGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6jz8RXeBoyzIpBP7F/m0Op/VYGrWLRUn+isRjGAQV8=;
 b=DKwjKSUqVflj577wvXHCguopl7XhdsZEivQ6cr+aYJdAPXNdONBgteXAzMYqiGBkfC
 lpNSTEWaEXUUL2Z19aosP7hLt+H0osgSFMNgYdI2r8cRcEk/AcFGBmxIAxRPuvCLIiSV
 +DxYyDWv+u/+4n39TgM2QMry3orA7C8FBZY2k/S2OAo2+rowFlY+CCA6YFoD4PaPOu4x
 m4uJvHO8KOBf4x//1nlhdD5YvPzja1KV5lBN4Z5BLL05JAxNJ2Y9ZXpSOGEux/bt10zL
 aqE3GW2ItPTU1TutqS8qeFyFI0Wq0l+h1JLJj8YWr4UF3b5OK1RC2RFfexmZ4bYv5Gdh
 ttvQ==
X-Gm-Message-State: AOAM5339cv5nOP3bBWMyLatPXUskUrcvjxnSGch/aGbBcgg0ZObtsic1
 8H7Im3k1UN52ti0GMWZkMVhPpg==
X-Google-Smtp-Source: ABdhPJzUAne4evCRi9h3rCiq/Jn896RfYtK4Y1R1c+j1QOP50Mq4xt2bS39b6gAM5EYj7S8FWu3XEw==
X-Received: by 2002:a5d:640e:: with SMTP id z14mr15098158wru.258.1618844565612; 
 Mon, 19 Apr 2021 08:02:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm23161727wmb.32.2021.04.19.08.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:02:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA7B11FFAB;
 Mon, 19 Apr 2021 15:54:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 22/25] tests/tcg/tricore: Add ftoi test
Date: Mon, 19 Apr 2021 15:54:32 +0100
Message-Id: <20210419145435.14083-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-Id: <20210305170045.869437-13-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/macros.h                     |  7 +++++++
 tests/tcg/tricore/Makefile.softmmu-target      |  1 +
 tests/tcg/tricore/Makefile.softmmu-target.orig |  1 +
 tests/tcg/tricore/test_ftoi.S                  | 10 ++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 tests/tcg/tricore/test_ftoi.S

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 59b4b9a352..e6a41cd1a2 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -70,6 +70,13 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1;          \
     )
 
+#define TEST_D_D_PSW(insn, num, result, psw, rs1)     \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw, \
+    LI(DREG_RS1, rs1);                                \
+    rstv;                                             \
+    insn DREG_CORRECT_RESULT, DREG_RS1;               \
+    )
+
 #define TEST_D_DD_PSW(insn, num, result, psw, rs1, rs2) \
     TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,   \
     LI(DREG_RS1, rs1);                                  \
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 34da1f37de..fcc7b6c1c9 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -9,6 +9,7 @@ TESTS += test_clz.tst
 TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
+TESTS += test_ftoi.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index e7adb16af9..34da1f37de 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -8,6 +8,7 @@ TESTS += test_bmerge.tst
 TESTS += test_clz.tst
 TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
+TESTS += test_fmul.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_ftoi.S b/tests/tcg/tricore/test_ftoi.S
new file mode 100644
index 0000000000..fb4af6b5aa
--- /dev/null
+++ b/tests/tcg/tricore/test_ftoi.S
@@ -0,0 +1,10 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D_PSW(ftoi, 1, 0x0, 0x84000b80, 0x05f6e605)
+    TEST_D_D_PSW(ftoi, 2, 0x0, 0x04000b80, 0x00012200)
+    TEST_D_D_PSW(ftoi, 3, 0x0, 0xc4000b80, 0xffffffff)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


