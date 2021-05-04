Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347D37291B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:33:19 +0200 (CEST)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsMh-0004UJ-2r
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lds9M-00069m-En
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:19:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lds9J-0003mY-HF
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:19:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id g65so5036553wmg.2
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fPkUtUsZBhQTOVdElvOgFTSd49w6hL06WN6K1JOPhLM=;
 b=Zhbm91dRuDHnr6HbJBE3s//Iy41g4HnJhNYn+e3o054ire1sYqKPpj2uSCJUt7wXQh
 MCZ6bVpvr7ITejXAADv+6mo8LHe7y+BR7Xw/xItAFXZfIwpOyi5jvBILNJraXiEWw8Pt
 LCQFXsQdjqJeO4mRmhu0WX3NOcw9q5wwz4tNioIdhvQ19H4XMq1ovclhCVZUSzYx/SwH
 KiQCYsBJQ5SfCydg/vLWMDiX3mO6WZ7cdltbBUwovDQCo/KZi2vvC3m2iYZzIfftgWyF
 RBkMFF9BO+zCPxoOFcEgkQ98amPCRC4qveHFY1uDoYqOlfwjXhit6PD3SqAJhSMNLdNw
 s0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPkUtUsZBhQTOVdElvOgFTSd49w6hL06WN6K1JOPhLM=;
 b=RB5YoRBfSAlGSY0lU7DLxQ1AAdWpa6Ob9SpwspxvKoRwFts8IFtHlrPUjQpp/XMbqO
 qBLBiUL+0yTuTEju96mX0L8GmUxloXbLFs5RvaO0iMEfI15KBvoY+t0gYFY19+ZyLEc3
 666vF+aUgYPGwtt8mTFmArFqEFDUBL+fl+39dZLO7piAX5Nabc3B1fucd46tcX01+S19
 8fQ7fUrw+/d9MAatKqzsajtmCX6nxdFsCBLBgWA3vonkKBFJwh2IP1vcSiga/DtT7fV5
 6cuS9QQ0vzu0fka0GcgT1NVlJZ54vOBMvPpiLvWv8HYL0XnJ641ZZvHOl2db2IDBRn20
 5jJg==
X-Gm-Message-State: AOAM533u0gDmiVkwQgQa+eZwuAU2nGuV+eG4HZCtNvlfuPlGGrdnjQ7g
 AiWxh3QY1V5pPfIzWWZbq5AjLQ==
X-Google-Smtp-Source: ABdhPJwWrfqeQW9+z7WKt9yXI3cAJ4k8KTKAqFWx8B9dNcTsITG0cWXihEG/KmRwDj/5FEWmh6naRg==
X-Received: by 2002:a1c:988f:: with SMTP id a137mr19805035wme.81.1620123567732; 
 Tue, 04 May 2021 03:19:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j10sm5787303wrt.32.2021.05.04.03.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:19:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B4941FFAE;
 Tue,  4 May 2021 11:02:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 24/30] tests/tcg/tricore: Add msub test
Date: Tue,  4 May 2021 11:02:17 +0100
Message-Id: <20210504100223.25427-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Message-Id: <20210305170045.869437-15-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target | 1 +
 tests/tcg/tricore/test_msub.S             | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 tests/tcg/tricore/test_msub.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 8de005523e..0fe6a86482 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -11,6 +11,7 @@ TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
 TESTS += test_madd.tst
+TESTS += test_msub.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_msub.S b/tests/tcg/tricore/test_msub.S
new file mode 100644
index 0000000000..6dee87d99c
--- /dev/null
+++ b/tests/tcg/tricore/test_msub.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DDI_PSW(msub, 1, 0xd2fbe5e0, 0x00000b80,0x64003300, 0xff5420d4, -216)
+    TEST_D_DDI_PSW(msub, 2, 0xfffffc10, 0x00000b80,0xfffffe68, 0xfffffffd, -200)
+    TEST_D_DDD_PSW(msubs.u, 3, 0x0, 0x60000b80, 0x1, 0xffffffff, 0xffffffdb)
+    TEST_PASSFAIL
+
-- 
2.20.1


