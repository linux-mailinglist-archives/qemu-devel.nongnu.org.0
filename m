Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B783646BA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:08:39 +0200 (CEST)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVVu-0002sf-IR
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQE-0004EL-3B
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQ9-0002s3-Kc
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id g9so18377120wrx.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6z30FN3XkBuTD2knxnhrmW33PNORrJPZruve7DI1Z20=;
 b=Zv5ZkP5XiocJYqdv8YxM0JI4mxL906PPDBgnMJNkMjajFzy/MXizykwzpbHUxCos3O
 EAeSUiADPZEsRpnxX9KAk7+RnWgbv5I4OEEuHkJAlPIsgnwoo51XC+ZieM1+hIFbiln/
 /Aw0nRNlVsfrX1ZVuvlAVCxipRLKZQzC9xz0Z/MMkgWnfs33bZ1Edj2++p/hV7o8XKTt
 46rF3zAu20Zk/7PN3t6jAkboVkn8bFE/tbWJ8cXTMgl8EKLJkCH7zRDpawADsTMbjUlo
 U35cstWXuParKqFkGF6qocEIlDdidq5U1nag3zV0lBCgsupoGQ87hISwk3i58plJ/ewa
 r4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6z30FN3XkBuTD2knxnhrmW33PNORrJPZruve7DI1Z20=;
 b=HMnc8R5ccF33L1ZlVjEl3+rFQmlhAX+XrmyiaOPEUhBFPZePeR3BmZFsz8aFO2VQZt
 bzTVXtP8UYrUICsoqNICeGlVv3xty0sWDNqn0HKEK96SGAHhhwbW78o9iqftpQdvfcSq
 jM9BmwgT1zzI8myimX3UtP3xHSX0NJ3A5umxDnjEfauX/dj9DlHdU6BXn9ayjm6Yu4b4
 xMV+C2KeAnRl56D6FM4Vm5KG3mgZhNY7pjfOgXd1viYJDx4hAc7HQ3elEFg58+VhR1RW
 iYZYklWdGDGxYo5WXVZM9COKewImgp0k8aOMXXkpOBj0Jfpuy58YZcJeuIIWIsn4Xocm
 C1Sg==
X-Gm-Message-State: AOAM532up6DIOK9eMKNBZi1U+6XKEsmRcW33tk/1AprZ2qdzd0VF4f7C
 VVPptKK1YaNMlfIYEZB5y7sfSQ==
X-Google-Smtp-Source: ABdhPJyZuMmBfxX7/L+kogTOEkZ8UpedyahmbWjhxDQ3jciTGupTfmtqgLbv+z9fwWBxCMVdrbXAXA==
X-Received: by 2002:a05:6000:1204:: with SMTP id
 e4mr14896716wrx.424.1618844560341; 
 Mon, 19 Apr 2021 08:02:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q5sm23831364wrv.17.2021.04.19.08.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:02:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADE8E1FFAA;
 Mon, 19 Apr 2021 15:54:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 21/25] tests/tcg/tricore: Add fmul test
Date: Mon, 19 Apr 2021 15:54:31 +0100
Message-Id: <20210419145435.14083-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 tests/tcg/tricore/Makefile.softmmu-target      | 1 +
 tests/tcg/tricore/Makefile.softmmu-target.orig | 1 +
 tests/tcg/tricore/test_fmul.S                  | 8 ++++++++
 3 files changed, 10 insertions(+)
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
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index 799b51191e..e7adb16af9 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -7,6 +7,7 @@ TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
 TESTS += test_dvstep.tst
+TESTS += test_fadd.tst
 
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


