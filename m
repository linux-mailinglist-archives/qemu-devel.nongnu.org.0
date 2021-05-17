Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B64F3839D8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:29:57 +0200 (CEST)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig7w-0001JE-1n
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpd-0007d9-Kb
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpa-00066I-0U
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:01 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c4785b0290174b7945d7eso3495717wmo.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kfyD+xyRFhNVltAJ3AwK8fH0Q4t00IkcCwNm6Vrvf38=;
 b=JMkD7NxrH/W1LlwfhXvV8ydJn8DYfs8lCJDO+/rousI3R3LdiLrmWe7NDx/fj6W/JG
 MKxe4mt/sy+TFuTxxTwYZvwJAPfPOVVGG2aOTh+REDkxxP13ICdOqa8H7L6GKpHlZQB4
 t1SHy8bi/nijW/XdnyDfzuGVWtXG6lxulpAv4Zot6kJqjF1zUEkQmS+8MCtD4B1y22Wm
 KB6Dae4NgVTNM7daO1wBa9q6rFuY1GWSn/5wWO/bTTZmNXWnG1oZVWMHaduKmzYCbg7o
 rpkuhYZ8fsll/NRu7wEoEdUOFVpPf2kxJ6cLBMqfIMLEZyLvjXhdfErtVdNLwTswQrOc
 UR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfyD+xyRFhNVltAJ3AwK8fH0Q4t00IkcCwNm6Vrvf38=;
 b=rPZyXwfLU4alB6UGVk8u3uxPhLm3dqUbYoL+LWO8YFVd9suMncCOo+McSAov4zLXFI
 cQhufkx50jYvK+TRZSyqJ+2y5UZTHgevaf0NaSiU+AMlqk6GsIvWt6kISporgM0YeCZ0
 8XRSNzbAmx/srnIqbpvmx5a+CUgEQoE+M9kV1EoX8+ScFf7tIcuZM9Jzmd7QW3hrLNdG
 ac8FVr9xdogrWhc396lxJxP2ssydKhRVZJ4T2QEtguPuBZhrlz2zW7V4ivpPp3V5jLp4
 RdroPzUmioxehMnBkNQ0Nimce8kR0QCVFVxMdiJcyy0zzEl50WprdOuu7WZiNprhqqjJ
 /D5A==
X-Gm-Message-State: AOAM530lOr54PpJy7W6M9/cU9YPHGoyZcv8OaluJFUkPTXA5xCFEx7TF
 qeIViAtF6Sx73RXJRHHFpAb7kg==
X-Google-Smtp-Source: ABdhPJz0d62dfkDFmLJSDY1uALM+JbQHacSsFS3pkob3QLBL0R6st99VYhYgvWEdVcnh5pGGJ64X9g==
X-Received: by 2002:a7b:c742:: with SMTP id w2mr423553wmk.76.1621267844862;
 Mon, 17 May 2021 09:10:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f12sm11567007wre.88.2021.05.17.09.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D87981FFA5;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/29] tests/tcg/tricore: Add ftoi test
Date: Mon, 17 May 2021 17:10:11 +0100
Message-Id: <20210517161022.13984-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-13-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-23-alex.bennee@linaro.org>

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


