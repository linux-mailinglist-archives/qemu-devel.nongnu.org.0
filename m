Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFCB3646B6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:08:08 +0200 (CEST)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVVP-0001JW-4x
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQH-0004I7-RY
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVQD-0002u9-NJ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:02:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso6512268wmq.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yq6sLawdnNUtIztNCbXZW8HT4K2dCStLDrZocc29Kks=;
 b=ioKvt+TxTTKG8QrI3kwdJBGYuOPmqYodiCjDux8t5gZjGq5qNaL0BcctKZk48Mk/XH
 nubHvKmopE0+UPuIcTFoN+IOU6hHuutx8lUDLKu3u7yAZDe/BVAXhqY0Y6Tnd3qAVBLA
 QGkFwnXj+hD7TtIpoqRJlLFmq492ZkDc2R8BH+fNIRxPZh4YQsXV+ek1Qe3FgDIL9ac+
 MBwiQ+5NcAltgZQiSIbsj82l7pmBnuWvFplV0i4fnqlzHTl9qUKmjXZxX9sEA4aC7Qom
 UVBOGzN1m0DAlVPWdUkZO65MGjud0elxonLfXWjHnxK4gFr2PxXTZOc2oqtwvj6i5WmQ
 VhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yq6sLawdnNUtIztNCbXZW8HT4K2dCStLDrZocc29Kks=;
 b=IWNpW9hdHMoSA5IPIMOIHZrLKw61WNtzYanYwsV4IEc3fk1HK7Mb9KmUnRsHBotB0+
 zyAm+viAOg/26kxk74bqKdMQyoyCGpzcVMlQVyIpnugU0kq8yeKbOiyVzKbPs0O0ROrg
 DYc3wX5BT/FBU2Ngq/21joJ4rPNY2CRhPFIhyR3GXcFatjCUDUkSz4GZc1UOfOilgro2
 9XN7sOI/V9xInnGwe0D67nkRwVPMatpXdzjoJKxhPxkOlRh/B1PkRTXaaroJxh/gsw9y
 DVZ73NRtJq57NaH1ULGEZLVpa3tvvF655JPeRXYqkuGmcxRCYr6b/A+hQZ2OvGJrQf21
 Bisg==
X-Gm-Message-State: AOAM532TMYBj79NCekPMowadIKW/yN+ak6BUDZk8oHJX1ojI9BsJr562
 VX/vM1w+5O9VplEiNgcNMb1i3A==
X-Google-Smtp-Source: ABdhPJzdFVyV648lYxdRgeu+socrhqK6vdtouUKuGEBHWj3GmtR1rWmDmVLnJImlSBzaBApGQBT2VQ==
X-Received: by 2002:a1c:7f4a:: with SMTP id a71mr22121931wmd.1.1618844563043; 
 Mon, 19 Apr 2021 08:02:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm23137678wrt.83.2021.04.19.08.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:02:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A9561FF87;
 Mon, 19 Apr 2021 15:54:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 24/25] tests/tcg/tricore: Add msub test
Date: Mon, 19 Apr 2021 15:54:34 +0100
Message-Id: <20210419145435.14083-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
 tests/tcg/tricore/Makefile.softmmu-target      | 1 +
 tests/tcg/tricore/Makefile.softmmu-target.orig | 1 +
 tests/tcg/tricore/test_msub.S                  | 9 +++++++++
 3 files changed, 11 insertions(+)
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
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index fcc7b6c1c9..8de005523e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -10,6 +10,7 @@ TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
+TESTS += test_madd.tst
 
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


