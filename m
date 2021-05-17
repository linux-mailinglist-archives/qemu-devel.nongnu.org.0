Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40477383A1C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:37:25 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligF8-0003I2-Ia
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyl-0001kK-0o
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyc-00027B-4k
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:26 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so231171wmc.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WvhMIJ7db8pZDvDIWrYxGMRIUJdWESbF5FwiwPU2Dbg=;
 b=dHT60kNd+SVrjduazssJnDHHQw7a3MDrC+3FLcujw+d5kyQ8dX+/x9AdTCm0qOx7rV
 i2A8FzqPoOomMRYRDfBiWwBcdrdGy/F3J1lxB8DuASJg5mVkE28XVo7vQNd5/YDewK/T
 +hVto37RCFEynoJP8Beu1KGjadqzt5v471UZqCtkTXOmRVaDwXtKzCwmUVWzX49Xmgtj
 es/vllJGDZScYZGSqTMV/6RClu9pSEt65bT3lzdzI6Z2GSFhB9tn/EpJxdpygMpHLxFB
 ggK90665csrg+XrEeA/PYEa7SFWiUM5xnNj3vCOT5Omqszj2wbAX+dD58RhnD3copJnr
 VrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WvhMIJ7db8pZDvDIWrYxGMRIUJdWESbF5FwiwPU2Dbg=;
 b=YLuSnz/0embZbG3mtlClQ5CV7i6Ydxm2zz0MQmVHHQIbrRWQWD2L6P9m844ub5e+TH
 19l4dRgu+uDvfvXEZHL9TsbPbiJLtfKM+C1B/hG1cVJl/OgYt9l6GaKmTtpFuiCqKT4t
 ykIhYUiIhRTMvaBid68BC7kfHYWlJISaV1coTzHMSZkyNZH009A0sJdI4dV4kbaKpv0S
 t6hQ3MwpeQpNuxEuC3a/ppjJrjy5/CnIVkd1PHXhZjOQKk/9drBamZA3dWUVnQxshSup
 NWEmk3x8cOomSyVqU3k2iPOfVX6YE3BeIFFSqWSb4j25p2SDq7geRl8YsT6A3rG27PiJ
 TmzA==
X-Gm-Message-State: AOAM5327g9GQ9glQNbUnfbU9BYnr6JwYUfPXK6bkXpoQ1qYFbZYspt8f
 DEaLgDAk8yh1KqemnRbzoz43LA==
X-Google-Smtp-Source: ABdhPJxGoABR3pnNOD9mEgQfjfn188CkF88EB1hIHedNC0OU8arKwmjpm8FywavLdwAeeftcHh6LCQ==
X-Received: by 2002:a1c:9d43:: with SMTP id g64mr424019wme.181.1621268416322; 
 Mon, 17 May 2021 09:20:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s5sm16964991wrw.95.2021.05.17.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9AF81FF7E;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/29] tests/tcg/tricore: Add fadd test
Date: Mon, 17 May 2021 17:10:09 +0100
Message-Id: <20210517161022.13984-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


