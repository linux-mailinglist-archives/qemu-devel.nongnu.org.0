Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2291137BAE1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:39:44 +0200 (CEST)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmHH-0001KT-3z
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzU-00047n-Cx
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzP-0003kY-7j
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id x5so23038962wrv.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W3QCFg4rZyHqfbRiyHYU4Bw92Jp5yMYeql9KanhH+/E=;
 b=RfDL8BohfdpYSp2/CNbyobkpF0VqLUPwlAIN4iTZyczT9cna58dZCL0aHUC/XowMew
 npINx01nLcG297XiiKbsbEjPrc30NADsLjjWf23axmPo3GkGfo1pyJ2YirK7ECIZB6tE
 +s4qhdZlhSF8DXkHVIBAWlx2Inp6daWdSBvQj/ZHhPZ4ebhZsI5qbi9aSOqOVotuO6e0
 /1yEBbupSl46Zx86a1SPErLIB/nVkZ8JV7GkVBSmEUdxPyJ1FXLO2HFkP3r/3GeKnP43
 Wby/4fEhTSOcEiIzCjcFjlJpwl1y82A7K3Jlf4rlkqMdWYHvyVkpur+hrc4u4YuIhESk
 4zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W3QCFg4rZyHqfbRiyHYU4Bw92Jp5yMYeql9KanhH+/E=;
 b=aK8iHRa2iV8JOTOkwRgc52dc9hLpzEeVC3VNUTXNLsH4Tksmepwy8fkEyYSWFxTmf4
 pUmvggKopzDYwbkgj5MpIoMD8BjDAdo1NSD4rGaokkJ3dIhaIhXpW42WeGrJ8yU/Y8Jx
 RT8AWGRiGt/RNqyRxdyP34mZbW0tsrdqmLos5cqH6HCKPhoz35/Oy7FpyGnL6NN7laqN
 9zkfIMTfyvbTnEA7sQ/YBPDhSUJat82lH+acGdjXCvmU4xIrdH5BJtY36duwhSUDd7r0
 BwzBNJ9IkQ64AH4sk7J9YhqdWnVkmF8rteg+SDT7gv1HOjTfjA3U4USHS/8uQ5iIM0S3
 Kh5A==
X-Gm-Message-State: AOAM533YWfSFXCEHxgasZHbSMS/gRZsVDw7ub7VyNRriZw7Hfk5PftCt
 0DYQvdPo4scTGJa7m44EZvDCpA==
X-Google-Smtp-Source: ABdhPJxyW6N3USEOgSaQj3MwAbXZS5pfCjDO7I2lO65GWvpDpYC1klF9HaDsbQ5XP6Xah8Id6FpfCw==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr40094132wrp.274.1620814873872; 
 Wed, 12 May 2021 03:21:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f8sm23630982wmg.43.2021.05.12.03.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:21:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C6591FFAA;
 Wed, 12 May 2021 11:20:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 20/31] tests/tcg/tricore: Add fadd test
Date: Wed, 12 May 2021 11:20:40 +0100
Message-Id: <20210512102051.12134-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


