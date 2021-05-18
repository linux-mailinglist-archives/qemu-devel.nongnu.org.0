Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B9D3875B5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:51:35 +0200 (CEST)
Received: from localhost ([::1]:45252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwNy-0000ah-LR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livyY-00066y-MO
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:25:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livyV-0006OV-Cp
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:25:18 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1077429wmh.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aNUdS1dWgsWlgWbZA5C7g7zNJF/kpztMMPeqJW24014=;
 b=NldA/rvLL2v+DvbvGGf+HlPpkSdYMH1OkvExgNFpY+hIwMW0jq22Siy+yLt6DHITqw
 80L4CfXacKJhErId4gemtPEiKOuPA6yGR/2bwJuqJ+NgY54PFKP26PNzbxNFff+fZTBg
 yMZNWVkP2rF1f6oOutpbW8sA/tneq9uxtNiiIftGRtdgI1HyGyj6ilz4/4RiQ1ep/BZW
 XNmyMUSw0pHkJ4iXZnMsbFUU2jikppondPcNf4t7IQlhcRCLpgRUYk3PkIchUUiCvcTH
 ECA7yWwxKiuABElM7YjO1VK2mb9iRKnm7a01L3QoKYz4LTNz6knC7j93RfmJc9SHlma+
 b2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aNUdS1dWgsWlgWbZA5C7g7zNJF/kpztMMPeqJW24014=;
 b=UWrA9b+2p0ed/zx23TzdA0B5Q5dWD48A2cYEoEHd5iz2ocLoUVsu+GrYAfKIAjd73Q
 +HN6iesNNj02qFJWCQzXpFnhzIKyFOcYRe22a4/9isYi+JecasTpRjWCA1/Y/B7RHP1y
 M73bVGOURmleLgIKFw/cnjHsmnvkIugGglUUCRaCtPPl962pkm4byTPQAeOI5nWQZYMN
 VPRQrpMAMA4aT6T+uGrAn3cTQvwgS69X7zFpGOALJQYfo0ywVI1ZP1seNxeX/Vxq0UuK
 Ugplq8qjsojyoSfpSsRHbaRvyCBOlenpZBCG6+8k0hayuvnelkLIYdEfDq5WKPcQ1/lc
 OTmw==
X-Gm-Message-State: AOAM531Vf67xJDmWw5RFrKiUhk8zdD56qY9iMJ3DfX8X62gN4S08Flt7
 TgNyEn6pCoRl8SmyQVXiko2JwA==
X-Google-Smtp-Source: ABdhPJyYbO3E9vWBhSYXDTYDFuz3wFmvOBDCWgQSjNx3K62K3infXZhkvKZWoyNBvsPb0ApTfk4hLw==
X-Received: by 2002:a1c:f614:: with SMTP id w20mr4379490wmc.70.1621329913376; 
 Tue, 18 May 2021 02:25:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f12sm14386049wre.88.2021.05.18.02.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:25:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E38AA1FFAA;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 21/29] tests/tcg/tricore: Add ftoi test
Date: Tue, 18 May 2021 10:07:12 +0100
Message-Id: <20210518090720.21915-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


