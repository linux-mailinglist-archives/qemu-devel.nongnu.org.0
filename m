Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60237387559
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:41:58 +0200 (CEST)
Received: from localhost ([::1]:38386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwEf-0001uo-DN
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livpH-0005IL-BR
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp3-00014f-OC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id d11so9345020wrw.8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdmEAT7DEu3lG1EeiXD5I5CWzOVFj+yeKWzonpH0EaM=;
 b=IrROKLW1x0JEZN6bLLel6CpBS7kYVpeUwgv0wfvxeqjDQVBLLLsljczfv4LU2L5KL+
 4Nvs9IXe0hUjWHARRXjTOLiFMqN99Bxwhonx6Sb+elj8otw+4FC8Ns6HDhNaBuF1T/Gn
 hEgQuKW4Ugr9KBIOyFO4NUFPk2HEC7Kx8r5NYZSZ8e2nfDIaadtICCCOTid1zLh040mI
 zPdf+908qcIG/Ukvm5AX/e1pHBaQKvRoAQ99Ocvl1Zq2D1xOByHUlsmVu5ZXpoPWfLwh
 o6qjAMqW7owDBvs+4fYMIEGRC7r9bvKpF4rOU5SjedukpErIDgzi798VFmSIf/UmVPta
 xgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdmEAT7DEu3lG1EeiXD5I5CWzOVFj+yeKWzonpH0EaM=;
 b=ICN27YyhWPmGs4PehXFORseM5d+wOdKi6U+yUz2eBaK3uZCNWvwgaA8r4CxjBkMHbm
 21AYtznPvCdKnA99YhMaHfSs59Vvao+8BJHqHFUr5+eYameE/VMHY8+w73xlOV+uZiol
 XdPQzoqFG6YkNU6orKUN0+YQN3FS6i/pO6VZAsQBOKQajdDmt1L5LeAQiZVeDcHbr3n+
 UHA6RrISqDiRn81rtmI9EwezDzKS7VQI3OFw1CuUmnVhVmU2v9AB8bpuIBhr15Y4sH1y
 E9sgjIaU0eOip9arDkzfzYsFwPS7rbF8iZGFhXwCfwyCK4515yBv+4ywLh28KdjkTCAL
 0CNA==
X-Gm-Message-State: AOAM532dxCgiNo1sfzrtffO+Yxy3qWtSxyz8ithI0xP1gaMWIwH4o0ou
 US+fwJ8le2lEbda40fyhG21FvkgPGN6Uhg==
X-Google-Smtp-Source: ABdhPJx3WT/W9rty6CoKXZe5egMQitTIVM4PO9cHzTI14metAi0+jTktHuli9viBlE9mLcwk4b9t2Q==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr5612210wrp.291.1621329327329; 
 Tue, 18 May 2021 02:15:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l3sm948363wmh.2.2021.05.18.02.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 850101FFA5;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 17/29] tests/tcg/tricore: Add clz test
Date: Tue, 18 May 2021 10:07:08 +0100
Message-Id: <20210518090720.21915-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
[AJB: dropped duplicate Makefile]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-9-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-19-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index de6a2cc88e..a9b81545e2 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -5,6 +5,7 @@ ASFLAGS =
 
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
+TESTS += test_clz.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_clz.S b/tests/tcg/tricore/test_clz.S
new file mode 100644
index 0000000000..e03835f123
--- /dev/null
+++ b/tests/tcg/tricore/test_clz.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D(cls.h, 1, 0x0, 0x6db17976)
+    TEST_D_D(cls.h, 2, 0x000f000f, 0x0)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


