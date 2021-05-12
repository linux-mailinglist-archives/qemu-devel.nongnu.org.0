Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D7537BAC0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:35:45 +0200 (CEST)
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmDQ-0007eB-6I
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8Q-0000U2-T2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8I-0000Xu-MT
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d11so23063857wrw.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fPkUtUsZBhQTOVdElvOgFTSd49w6hL06WN6K1JOPhLM=;
 b=oNuhZdhIZzr3N5P14snybucE4+WV6IK5apAeIzjPTQZIZUKSQ/rpqz9hApnOWAxtbN
 xpsGptUiAblJuAqHQPVoi0VHpUATg3Dlousy/RY2kYRou4oG/Va0xqLJXXHYlTcjjbZ0
 u1cSUk47FRW8Dcli7WjxAzmRYkcRHy1rihuq+qNJRlUVitD9PqKXGOpXCeGK5yNywVs1
 19gZtqemKSsneFLxrVoEX8XZp0+FART/pTttVYNHdlRVgEjweDMhm7arKQzClx6YI3PE
 1tGP9cvQYjkM7r7PEyZf/Mn6+Ep5o2Sf9DJZH75i9gmsuAfMQamrn9JjhrAiI8YDuSCt
 YB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPkUtUsZBhQTOVdElvOgFTSd49w6hL06WN6K1JOPhLM=;
 b=IjG26r1x5OonGU6gXIOGajzljLc7ELSGkEPoBnq4n9FeCl0Lu4/Lxtzp3VxxL3Y6xk
 SrgxtvvbAqNEmQe7KRTFiO1VMC5MrvrNMF6o0ueNZwq1qkzrYqHBzJJ5QY0tvALPc9Lu
 yneFhhhqU+hd1eWVzRqGdRtF4VM4MfdaBSeJ8Vsi1pdnocjaWujD7sVBsDUAKqjzZ5vF
 Ptbj9g0XnqRcoIW4pZ33PFRKyOyrW7QKN45KXf7ffL3el/cDuiCx0Q5K4YPQbeZ0FX7c
 aPJU66aCFEwrS9k36clFn5mmQgeFXIAYhkUzjSDVApxLGAGf4ilteAMqpuJ0fQKGYsmv
 siIQ==
X-Gm-Message-State: AOAM533pyeH+HxhDPo95rxl4VtPiQ2cIbzppLLRcwG2YVkaa+d4lY3hb
 rqwt0WpP0i8yyAeNc9Lb/b3kkQ==
X-Google-Smtp-Source: ABdhPJzhT/5fZ/vONKE6vuoJ8X1WXi0+pKRBajX5NtYKG3JiSHgr3DXoLnceP3M6+aFJG8aIbyRhtQ==
X-Received: by 2002:adf:f78d:: with SMTP id q13mr9452921wrp.405.1620815423845; 
 Wed, 12 May 2021 03:30:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f1sm3377088wrr.63.2021.05.12.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 946331FFAF;
 Wed, 12 May 2021 11:20:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 24/31] tests/tcg/tricore: Add msub test
Date: Wed, 12 May 2021 11:20:44 +0100
Message-Id: <20210512102051.12134-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
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


