Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA3438753D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:35:16 +0200 (CEST)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw8B-0004YZ-4I
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp6-00055g-Iz
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livot-00011P-69
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so1075273wmk.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlStNeaFvQ478PYv8M76ZBXcwfFSAnqrSyKXAIim/UE=;
 b=M5qpUg/MLcgPNsOqoT27fE+HBVx92emyYubvG7m6o3782oEEDUrgJLEOXDEXENA5jf
 dOMpIb9Rbs5PgVQ7Uj272YLfEXQ4XyzGUXI3pVF4VIf1Xucwzs4aeRKVMv3sZCVu5wbP
 vfjpJwWYVSqHLuu9rkHLCmeqAC2YKdeTlHqGD2DRwTfSxo0znmoK5mm3z/mA/C0zJ11v
 YOkbgkTbJEJHzN1S4WmK2LuYuT3bfsTVnM4XV0jS4gRGccAN1lkuZ1qD5AocYC/8nWsH
 6s8YdcKt5zNB221i7ib/7H0AyOxpIXkDylab614aMqdzPXcuszlrE3BpYT41rKhnSTdu
 Wk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlStNeaFvQ478PYv8M76ZBXcwfFSAnqrSyKXAIim/UE=;
 b=dSBPpVxy/l7RMpodj/LPZTy2I8C24K1ViimqcGIDDEbI+qloSaGcN922C/aH5FtGm5
 Q5uM9LFT+Ux511tSZOyaOdCKJMuC3FAkaLrdsmmOtEiuZSBo+wL/UB1v3oclWuvEcvYD
 Y+1QoYEfXtPVBl+Odd06qDIQEsNBcRRrYEvwUGyyYiciH3vluxVXe7x2xdrVOyofrZAB
 OayMXDhi3B+qHfl0QXlWhxhFyJKaHuCdOhSodU/yFoigRrOb+QYIHJHrY0RDJtKlX807
 g5+1rRxNWJaKEfFtFS6UbVn3qS8fr9MrwucHbqwYOFqsBT7R5CxZFoGTIw+PfyoCxJPv
 IFSg==
X-Gm-Message-State: AOAM532ETKzuLeW5QF4ZJOxFT+YhV7sqtMz0RjRluvRjqWbMWg1/5kDo
 7Y+2RWmmQedTwkQa4VwT+jcj5qr5SSAltw==
X-Google-Smtp-Source: ABdhPJxc6PaHvwuBzwvtRFAuXF7acQXp9BzgjgjJu+nn3IafuwupBKerUs6WdkdSCXGIJ+SKrLS5Yg==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr3801125wmj.63.1621329316576;
 Tue, 18 May 2021 02:15:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p7sm20526800wrt.24.2021.05.18.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37C191FFAE;
 Tue, 18 May 2021 10:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 24/29] tests/tcg/tricore: Add muls test
Date: Tue, 18 May 2021 10:07:15 +0100
Message-Id: <20210518090720.21915-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Message-Id: <20210305170045.869437-16-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-26-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 0fe6a86482..5007c60ce8 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -12,6 +12,7 @@ TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
 TESTS += test_madd.tst
 TESTS += test_msub.tst
+TESTS += test_muls.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_muls.S b/tests/tcg/tricore/test_muls.S
new file mode 100644
index 0000000000..ca517556bc
--- /dev/null
+++ b/tests/tcg/tricore/test_muls.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DD_PSW(muls.u, 1, 0xffffffff, 0x78000b80, 0x80000001, 0xffffffff)
+    TEST_D_DD_PSW(muls.u, 2, 0xffffffff, 0x60000b80, 0xfffffffe, 0xffffffff)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


