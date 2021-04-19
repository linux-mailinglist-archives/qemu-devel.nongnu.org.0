Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E43646CF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:13:14 +0200 (CEST)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVaL-0000SJ-Me
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQT-0004OM-Rw
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQJ-0002wa-GJ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id w4so30677170wrt.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H5BMN5fje87edw52vYTP9DrRZyXVlghgLd7qxl9nbbg=;
 b=gU4dBrQCkodtcYW+SFpg22MMZLmWM5rKyS1vr7iJuuwLIvKeBYvrWVHQr6OLojeboT
 t+RtDp/tlVSsRx13cK8aUeFrpHUCdMijqfOUcSjDxkRHNtQQfUk2gtYcOqoiAL9Pgzni
 QitBwmiW5dZSxYI2wrnMMCaULUIuVNaGhFeyY41qypSjzWvgAYNlXMr1HC7jtGYZXR/d
 iUKIJ6+0qxvvPlxhr06FJU1kwbV55JgKeUKBNukDZPz/l58DFGPEsNeA1DtHguHNpCOL
 cPywRKkqAeFYXR6gCcJ/f2qbXTg4Q4bcSJn0l/hJ4lIIsu2/Cgsv367gEYYMsS8DcrDn
 c5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5BMN5fje87edw52vYTP9DrRZyXVlghgLd7qxl9nbbg=;
 b=EQYdJiKj9kac0aTSynTFojMPM1GDYkQ8JJb3eZfidC0W4QVSczfkpDjDu8XdMs9P+z
 yTuIMRCG+GwZW9BL7bizSfRRCVYU6QQ7Mmn8BJXrXSS0p7hXdwR5NZya7eScB4uagNV6
 Kbl2qyoj8jwbFJ2NE9sitOnQ9zFZ3Z9Tso+8td273v0/FL0+kYU1OY0erawk/4AUrdU9
 p6zqHOoOZnaiTA8ort7lf3DbklilolM0YL3xh9ueVvjgtgHSrzGzkx8cDlIVQIwFudyQ
 YJXWKVykndrychZRWMxdDhdyM3K2lolS7AnJmEvi08c96yJrR/R1lkHLUZPVGCRZZtw2
 SueA==
X-Gm-Message-State: AOAM531DQ4fPRX6Bx07t9+/1pRh7Bv6h3Sd/VfrAP8PB3tN9wan60Eka
 hEITstFtnySEzZvD+yYcOZv4IQ==
X-Google-Smtp-Source: ABdhPJwKO5ct+j+EugkEfW+ejnz9H08RwqU/OYuKi8CEfGMQulYfPLX8Sq+quDrqkSHLI6c/U3AzUw==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr14995678wrj.328.1618844568880; 
 Mon, 19 Apr 2021 08:02:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o125sm20692488wmo.24.2021.04.19.08.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:02:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 25DAD1FFAE;
 Mon, 19 Apr 2021 15:54:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 25/25] tests/tcg/tricore: Add muls test
Date: Mon, 19 Apr 2021 15:54:35 +0100
Message-Id: <20210419145435.14083-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Message-Id: <20210305170045.869437-16-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target      | 1 +
 tests/tcg/tricore/Makefile.softmmu-target.orig | 1 +
 tests/tcg/tricore/test_muls.S                  | 9 +++++++++
 3 files changed, 11 insertions(+)
 create mode 100644 tests/tcg/tricore/test_muls.S

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
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index 8de005523e..0fe6a86482 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -11,6 +11,7 @@ TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
 TESTS += test_madd.tst
+TESTS += test_msub.tst
 
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


