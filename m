Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBCA37BAFD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:42:05 +0200 (CEST)
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmJY-0006rb-V6
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8X-0000bx-W3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8Q-0000aJ-HK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n2so23138075wrm.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkuvcu0WvoFkCO6R6g7fnkEZFEV/3ybgOm0lAYLlrqw=;
 b=tdVI7L0kfLnLU7hIOJ20IPd/8+xh4NPgLtO6O5Z9uIhg4zTBL6iKFb70ag0cwFqBIc
 MqbVHzTiAU8UWCL2DBttWeRLLU6oF0V+l1t16Vz/ydpf7rS3fOMNi0LKalBb4PfFdkSt
 qEAuyvM4FdiDfvqsdvouQJCQSay+sIpqOJ3Ne6couHt/4H09Qwr311csH4ZdZ4uNF7Za
 zr1EbGER/SmCrQA2zp8PJTcR4TAdBxnOJzB/oOlua6sjRx5CiJX9KgGI0B9sXfzfVZCM
 VwTI4haumziEbJs09Jn0GTxIbJQMFv3TpBhEDj1j9e86sLrBb18mSH3cIvvnne+60r+H
 G8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkuvcu0WvoFkCO6R6g7fnkEZFEV/3ybgOm0lAYLlrqw=;
 b=rE4zy7PhqPGxwbCa9MjUC7ZLMAztk7VqjiPzIMmnWoy7GGgjhC08ChwHvnCk7iZqjk
 abArWfLZ/LH7YgdhhuXL6BfbSKmK5iTodc+FP2FxCEuqChzLa36ioBu9YRTxS/bjt61z
 qlj1ScyxrSVtHZx3J8qkjVtIcFc9f1p+shj1Hhst64BmlQYtl33iRMfRpy9BFl50+bIv
 CS63lTc5juTs7H4GQQYTLMcvwmXIt6LO4mUbL7ibfxmEVCntKygmtKsu3ySDtb6vBXAq
 kHf2BY1xul4ZeOp/92D83f7KcN+FJUwph6UoXWtAANs0peHX1BfHQ/a32wNEfK6JR47Z
 ti9Q==
X-Gm-Message-State: AOAM531K/xTtQMiQrzWA5Pp/lhIvI6AnT7w+rKGgkQ80yFLhvXh5Viro
 QnUzKIKFs+IDzTIATuLocMMnlg==
X-Google-Smtp-Source: ABdhPJyRECCQBHvBEar/WyYWF1WVwOyuxPuuMv1bw6enuWU4+jZRTEgtGt9ImGVQjLsubNhYXybVCQ==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr45372275wrq.307.1620815431172; 
 Wed, 12 May 2021 03:30:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm35246886wrr.27.2021.05.12.03.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45AC21FFAB;
 Wed, 12 May 2021 11:20:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 21/31] tests/tcg/tricore: Add fmul test
Date: Wed, 12 May 2021 11:20:41 +0100
Message-Id: <20210512102051.12134-22-alex.bennee@linaro.org>
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
Message-Id: <20210305170045.869437-12-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target | 1 +
 tests/tcg/tricore/test_fmul.S             | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 tests/tcg/tricore/test_fmul.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index e7adb16af9..34da1f37de 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -8,6 +8,7 @@ TESTS += test_bmerge.tst
 TESTS += test_clz.tst
 TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
+TESTS += test_fmul.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_fmul.S b/tests/tcg/tricore/test_fmul.S
new file mode 100644
index 0000000000..fb1f634b2d
--- /dev/null
+++ b/tests/tcg/tricore/test_fmul.S
@@ -0,0 +1,8 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DD_PSW(mul.f, 1, 0x974f4f0a, 0x84000b80, 0x1a0b1980, 0xbcbec42d)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


