Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECDA37BB4B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:49:58 +0200 (CEST)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmRB-0003f2-VG
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmI2-0004Ir-An
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:40:30 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmI0-0006P4-Ft
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:40:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 p14-20020a05600c358eb029015c01f207d7so2777291wmq.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPMh6kmt7DZA6FRYiUkJHikUFQXem/GBwsoB4cM/qp0=;
 b=TxAt6bM3DG/yw34WLeg5x5h+6dpqihOK3CXfPxo+eWRMrK2yE2YhWfcBcD6n+7vZYe
 L5spwSuo9vsZ4Wv5IZSVwb5BHnrBzv33GdRakivzqnRtjAz2NNQ7ZiuOrsApjWSrYo9z
 5xhRcYlEpzGExq+1gKejSJ1c9IJALo7CSc7iH5WGnkKDw/cqOV8bEuIYiwfBEHZ7Qntn
 1ew6bGsytsLHKxLqB+BlcxxEbgath+AK5pCyw673ysgoPyG93y8KF6M83OMURZEDNaLA
 4hlvRe96omJgKeG+CeOXkTeLJLOnshZ82e7o/9Gg+9G49hIk9Fxgi76lhTz40eb3Ax+V
 bKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPMh6kmt7DZA6FRYiUkJHikUFQXem/GBwsoB4cM/qp0=;
 b=Y1Ehfu01z3uTF9m+Owj1k2UOY+YbUxwIO1c/czqPZWXgr0aHQ1o94mEGAdIVVk9AAs
 wsWS5lQ2slyByh+0dqu/Rd5zqtSsBzuN9ebJeG0HNF0nIkZUYZehb/mzCQ+2lWsIuW1G
 8aGXgOV6h4m3MEryxNWioudDhlE7RIV51pbm4AfEzpVYVQFQIFtJkS1uPm/KH6B2amx1
 UvBQzreI6mZlF0FtwnsKCBtUMjlbYGFxT5Lhwe0f3v0kq+9R1iyKZUPO7HI73T6TuFsf
 ZS47lBn1yIvXn6AhrYu/m3fy56L1ecJk8g8oTAePnRmCFmWxiDHIhtlIQW0ldhAttpm2
 ON6g==
X-Gm-Message-State: AOAM531Xd6Aisie8hbIPznImOwt1x6NIhr6OBdsCUl4vQxJ3QC27TkHH
 HbB4HtZy3vYYq5/0LEVE9T+oGw==
X-Google-Smtp-Source: ABdhPJw/Qt7eR4I3VxvEaAbuxoXkc1J3P9okInl+AHY0Tj2vF0G3lkkn6+gGtRJKFAhVK7lYrPFflg==
X-Received: by 2002:a1c:b7c4:: with SMTP id
 h187mr37759056wmf.178.1620816027180; 
 Wed, 12 May 2021 03:40:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g19sm25088411wme.48.2021.05.12.03.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:40:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BB761FFAE;
 Wed, 12 May 2021 11:20:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 23/31] tests/tcg/tricore: Add madd test
Date: Wed, 12 May 2021 11:20:43 +0100
Message-Id: <20210512102051.12134-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Message-Id: <20210305170045.869437-14-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/macros.h                | 18 ++++++++++++++++++
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/test_madd.S             | 11 +++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 tests/tcg/tricore/test_madd.S

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index e6a41cd1a2..0d76fc403a 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -9,6 +9,7 @@
 /* Register definitions */
 #define DREG_RS1 %d0
 #define DREG_RS2 %d1
+#define DREG_RS3 %d4
 #define DREG_CALC_RESULT %d1
 #define DREG_CALC_PSW %d2
 #define DREG_CORRECT_PSW %d3
@@ -85,6 +86,23 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2;          \
     )
 
+#define TEST_D_DDD_PSW(insn, num, result, psw, rs1, rs2, rs3) \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,         \
+    LI(DREG_RS1, rs1);                                        \
+    LI(DREG_RS2, rs2);                                        \
+    LI(DREG_RS3, rs3);                                        \
+    rstv;                                                     \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, DREG_RS3;      \
+    )
+
+#define TEST_D_DDI_PSW(insn, num, result, psw, rs1, rs2, imm) \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,         \
+    LI(DREG_RS1, rs1);                                        \
+    LI(DREG_RS2, rs2);                                        \
+    rstv;                                                     \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, imm;           \
+    )
+
 #define TEST_E_ED(insn, num, res_hi, res_lo, rs1_hi, rs1_lo, rs2) \
     TEST_CASE_E(num, res_lo, res_hi,                              \
     LI(EREG_RS1_LO, rs1_lo);                                      \
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index fcc7b6c1c9..8de005523e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -10,6 +10,7 @@ TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
+TESTS += test_madd.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_madd.S b/tests/tcg/tricore/test_madd.S
new file mode 100644
index 0000000000..5d839772bb
--- /dev/null
+++ b/tests/tcg/tricore/test_madd.S
@@ -0,0 +1,11 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DDI_PSW(madd,    1, 0x0000fffd, 0x60000b80, 0x0000ffff, 0x7fffffff,2)
+    TEST_D_DDI_PSW(madd,    2, 0xffff7fff, 0x60000b80, 0xffff8001, 0x7fffffff,2)
+    TEST_D_DDD_PSW(madds.u, 3, 0xffffffff, 0x60000b80, 0x00000000, 0x80000000, \
+                             0x80000000)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


