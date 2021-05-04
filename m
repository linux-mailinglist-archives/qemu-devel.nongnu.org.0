Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D7D37291C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:33:58 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsNJ-0005sI-FN
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lds9I-00066m-0U
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:19:28 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lds9G-0003kJ-0i
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:19:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n84so5046074wma.0
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N52YWnuZLlPx8wUlhZrUjpPfF72LihVfzT4a0wPQRGQ=;
 b=ml4+k5nhIAix7ewW6kyv9Y8HfQr2iO8dH+3b2Faqc7tCX2BPR41R6a06f0cXps5DUv
 byzKcAm/HT7pxW+tdq+ZVdy6kqU7GHuQy/d+9KiIQucKSdNvkPrWxYb2NP7NQdODBiBQ
 q9+Lc7DidHmZ1YB12JsFzLL0I4nWJa3nv9jcC/vRNTwUwLiGudd/LhDVfvl/f8AVtj1f
 9MnCk5wBexPoqAh5+GXC0Z2gkAyUgS7tK7spivThoEbab1UCDnYl4mBZvwtx4UTK24d8
 6z0u9Mg5Jjg2FX3V3nw02fC1HX6Zt4NM2Qrd5w38B/mVBq7E98GTMDlfJa1q7pLZeYfw
 uNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N52YWnuZLlPx8wUlhZrUjpPfF72LihVfzT4a0wPQRGQ=;
 b=GechnXRZCcwB1Bl5c/Jw5kXiaQvAzUMh+F854whNBC3N1/u2hYSmxw4U6vdBbkkbHo
 4BjBEExgElVEAiZvnwoA+ZFWiOmtEqsupdQjqhZOJqACrUjOuJZjrtvHQDQb9xiF57Bo
 /Ail/nVIEqiw2tKkr8Qazu6BHpxJ4vOhYvdx4JtdCgvnlIYbRMTTGV500kY6EGxnSbK8
 93h7G/GuO8TwISMKoBCCLkqajnlvB+W91KJdKH+D+98qAw9p3CHV/ApC3Yh1xpDXpfED
 FbOE0AYY3HNHlop6uz5NY/00fAnXW8kw/OcgPEuHRxbykSh3yYiIISx6/T2sq4ixbuqg
 eIXg==
X-Gm-Message-State: AOAM532EpUpPnvRvzvn9T7VhYtaWGxnFJB68H01+5SJZnB51HZQ2TBzO
 pmuKU5R9gnxzsRiKSu+m9eDOzQ==
X-Google-Smtp-Source: ABdhPJx7u40jGNLc/LO0xD9jtre82nxuKU+/oUuUMZcglBC5ydAfsQ2nxRX/rubBI7Z3WM2zpJ1zyw==
X-Received: by 2002:a05:600c:b4c:: with SMTP id
 k12mr3165039wmr.186.1620123564591; 
 Tue, 04 May 2021 03:19:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm11234319wrx.31.2021.05.04.03.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:19:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E70731FFAB;
 Tue,  4 May 2021 11:02:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 22/30] tests/tcg/tricore: Add ftoi test
Date: Tue,  4 May 2021 11:02:15 +0100
Message-Id: <20210504100223.25427-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
 tests/tcg/tricore/macros.h                |  7 +++++++
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/test_ftoi.S             | 10 ++++++++++
 3 files changed, 18 insertions(+)
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


