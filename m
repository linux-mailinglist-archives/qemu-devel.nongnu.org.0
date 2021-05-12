Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1338B37BACC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:37:24 +0200 (CEST)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmF1-0003kl-4W
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8S-0000Ui-Oa
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8I-0000Y8-Mb
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id s8so23084396wrw.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N52YWnuZLlPx8wUlhZrUjpPfF72LihVfzT4a0wPQRGQ=;
 b=bPdM1aI5o+lER1K/TviJHINzamnzvTCT9sbIm1TQ0Io1q5SFnG8PiZjvt/UGwVAlnL
 0VzG+rMzw3E4vDr5J1XKfUvBcN6noobTObfJJwXgRQje0G4z5tOR4/4KsSv84FOKqojW
 n7HeeCwICXx1Pc+sYL3Q/T5/mz23uPpOB2ZD1iCK0qzO8K0t3V0byz26b4JfvZck+X1j
 65edoq9OWda5GOh6SDGWOgb0+LmdivZYzqj/A1mJuI/pKk7JVDwqwQmO5F1rav9zfAy9
 wVE1BhJYjf09QZQxLtlPcQbT6SSaeS45TK8AXtHHXRazau5ZXMOUzmT8NiSjkt78Z2Oe
 1Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N52YWnuZLlPx8wUlhZrUjpPfF72LihVfzT4a0wPQRGQ=;
 b=U3X0fZGCDM6CHbXhPRmppx9+g6O8ZdH00R1f9bUF5I3dqz1BbM8HxlyHyYgOq2U8lV
 EoE/yG72xFaiM+J227D7yZmFGd2NIlqTugjCxu/yrXiJ8F7YM3bvKVfMl9Melwk4rwy9
 iEtUJwGam2oLZOwKlf94UvkCJLnY6khwgzOH1H0zqWpJWYEb9V1m3PsyWoQ0Xir2xPIa
 65+aBeO91fhXwBXsRYBvSZiH0YnrBWtl/NRxoJB26TV0INNO1/ZuFlSki0XFhoDGMlE0
 B/thN7uACkN5u4pyGSsvlT8T2JDu17GzUtYvcRxB2SyjnYpJC27MPd2JYJup3pPkB7KO
 /79A==
X-Gm-Message-State: AOAM532/FKeHjFWNtwoBG/WxrEdedGr8REei6UmX4Eda5tDwAvQEBk3o
 5CFCWcouMWdSN5R9N+ZtQlYG+g==
X-Google-Smtp-Source: ABdhPJwZmehPYkd2nxxmmHd410Q16t52KXMhBqydYJbI3Pp0jNCwIVbTRsG5C7N/5M+qLJMbvEkc6A==
X-Received: by 2002:a5d:590b:: with SMTP id v11mr43880460wrd.55.1620815424653; 
 Wed, 12 May 2021 03:30:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c187sm5897088wmf.23.2021.05.12.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 608901FFAC;
 Wed, 12 May 2021 11:20:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 22/31] tests/tcg/tricore: Add ftoi test
Date: Wed, 12 May 2021 11:20:42 +0100
Message-Id: <20210512102051.12134-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


