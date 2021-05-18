Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CFE3874F6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:21:19 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livug-0003Jq-0g
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhe-0008Nf-Mi
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:50 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhc-0005Zh-6c
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:50 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j14so7588536wrq.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXn6aPVAVt/bVyPUARbsnNGDxpKekSthuNr53hK5qyQ=;
 b=GyoWwF+XO8HTInltMoa+RABt6hmJD9fHppPCM0KbM/6f/aMAEfZaF0pfuVdMjrjpSe
 XZhEmk8zt0CagbqAyOjWaZRaQgpfIozjB43NIMMhWGHtnrJkaVpdFXcUzRwyZcpDRgWu
 w307TqAmrVa5EqVJfWjNbDILgjKfg/nsoY1jxCHX5jfGBAAWRfME92XCnL0Z2koVA+TA
 qhWjdzPHPF7u8ni0b8naYZEtRvn+EYOaXHciRQEDsPSoVkBV/whfL8mFVj5A/RDsYGbQ
 f1anmNpCyPr1IU0Ah11BEeQl+BZCnE3rv/KPOdd5Ybf3sm4VqnlxmPm8liw0vXaQeEM/
 6hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXn6aPVAVt/bVyPUARbsnNGDxpKekSthuNr53hK5qyQ=;
 b=HTBlXztVrgmpXxq9TiST3J7W61hagvYo5Xp4BA/tS+8D31EamyazsXm3S2V3e9I1hU
 Rypjau3kboXKuwIr6pXjC4uNW7DX+/QkQgmDvb43V4QC2VuIZ6m/PXYL/xxRrSIMlU/A
 z1jhQU9p+kgk04W8dEXOFGVm4R9plHUsUBbcbj2cWu4HzRTlDzBXikVo9zYymQFWT4Iq
 QxYaim9LNei1M2UQijhdhRsiz8dDPRHb1ORnPYdWwN2iNJUcc49ncY0VLxLiqzzEf8rg
 JInbPaH1PvgZD8S6qZpNoWleFfXm+w4bhPBM+H29OhUUBFEsodMZWVgkhcuY6KUtKRS5
 49bA==
X-Gm-Message-State: AOAM532+OwtDf6TZlEJuLhe8kOd5V4hwJy3NTbGcxD6NMM+JnHk31sNV
 x2dp1Ymx4yIDIHNuDgSNeBuGVA==
X-Google-Smtp-Source: ABdhPJzwigjKAyOEJ6iB6JXLA49Ee6rNWImUQnH2VQLdr4bqAMgMywJuur40NA/FGlmZcObUrYKuMQ==
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr5508455wrw.263.1621328864591; 
 Tue, 18 May 2021 02:07:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v18sm24759598wro.18.2021.05.18.02.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B64041FF7E;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 19/29] tests/tcg/tricore: Add fadd test
Date: Tue, 18 May 2021 10:07:10 +0100
Message-Id: <20210518090720.21915-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-Id: <20210305170045.869437-11-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-21-alex.bennee@linaro.org>

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


