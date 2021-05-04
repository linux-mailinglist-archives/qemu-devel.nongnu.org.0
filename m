Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E03728B4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:20:12 +0200 (CEST)
Received: from localhost ([::1]:54526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds9z-0005jG-NP
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzq-0002W8-Dc
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:42 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzk-0006ms-R3
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id h4so8699653wrt.12
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W3QCFg4rZyHqfbRiyHYU4Bw92Jp5yMYeql9KanhH+/E=;
 b=whmSIw4fAYZRObr6jDqtgf9ynUghRQo2Fz1I0nEzYJiw9QWATjEddk14XcblDxH/1c
 ts/GMduiVeyYJ2DUc9WEdBkEXWjQ+Byqiu3rDRMHtoOQ4ynajG7TrA2DqjXUrBGmBYDE
 8lkrrQQM4Kp2uRLPO63tRoT60oXL1+3ZL5zErtOZK+SJC8SBUYSk/v3+KJR3BPLC3xSu
 Ay5t4pYhByrc+U4SkDy4K0/cVEMXkLow62p3tsr+iSN/GfGCVne1zXSiru9ceCkTiXkw
 hLFLhF9gJJAA6TowNF9syLn8A7O4y3WdDk02Ocb0VmuSsydsR6nta6MpdG95kkUCMHcU
 ghIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W3QCFg4rZyHqfbRiyHYU4Bw92Jp5yMYeql9KanhH+/E=;
 b=aZ+tFfnENPqMGeok3ibjff8NBmKY97rGsRvnsyfD/Mql/vY6pdpXGV9yllmi2duR8n
 4bD0AS3slV00ZQoh/qr5JNpy+/cvNTZkgU+5uKe8npk7RDhI+jZ+uUwDrjNiZxSGB4yq
 8bqSj9XPyOa3xDSd7RzMH41oqxsozT6a0E8TCN+C1U7We7CY6secW0I5jQqeDiyze9Zx
 smX2MrXBlvjJH0sze4G4uKQGyamLYm/2kDSLPS60Og5481Ed1RZvOxYT7sdJjmOOrjtR
 +FmFmCSUrCajDZH380sv2NOlF4surIEXs+Os7GblNbw1FSNpD7f/zcwBr99wHcbnjSxi
 zCSQ==
X-Gm-Message-State: AOAM533050e+VEGZctpX+xBq3gMFdQSdVYsl3cRex6F98CqWpgL04kXr
 lXPfRjH5t0tOO1VDl9pXFaUL847ntu93EQ==
X-Google-Smtp-Source: ABdhPJzzAz9xPKmu8SJjUm+cgd3krKfOOKJka5u9vaOteydLVjfNVJDkRPUaGactS9wUUr7d+/SlDA==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr4601523wrq.317.1620122975420; 
 Tue, 04 May 2021 03:09:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m13sm14995471wrw.86.2021.05.04.03.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD2A21FF87;
 Tue,  4 May 2021 11:02:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 20/30] tests/tcg/tricore: Add fadd test
Date: Tue,  4 May 2021 11:02:13 +0100
Message-Id: <20210504100223.25427-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Message-Id: <20210305170045.869437-11-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/test_fadd.S             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 tests/tcg/tricore/test_fadd.S

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


