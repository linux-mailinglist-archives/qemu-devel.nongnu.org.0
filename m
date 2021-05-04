Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6D13728B6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:20:25 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsAC-0006Bz-Kc
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrtD-0002pT-8s
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrtB-0003Ii-Fg
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id m9so8724762wrx.3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkuvcu0WvoFkCO6R6g7fnkEZFEV/3ybgOm0lAYLlrqw=;
 b=KRpXslWK1iTNAtJa6YcmhrqYkJvVLV7m8t3tsmp/wPJYtkFpFS71s1+ZrmpVkw5YyB
 POs+kP+E78V5ivEaWrNi0F3xen7l6l2fdJyVjEHj5R9eEqd2qUWmRZ8zRnl+IRU8Aq+8
 6RiFPE+GipkkKEKdGNi/IrN1J/TN4rEMIF7A53/t3ZDLXOe4hZqssz6HezJVbRqyyfUg
 buz48Y6Yf93+RW2J/LMILQ/KHCQzkY66kxqgytRpIlk4Wl+kCCW854sPcHdN4f2S03JP
 BZ0aE4x7PRFmLkPkPx/WH2FutETtEHiqeP1slDB9quXI/0WdUXxE789cFVuDnEoWGoWW
 5x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkuvcu0WvoFkCO6R6g7fnkEZFEV/3ybgOm0lAYLlrqw=;
 b=sZd2WHSdLhoFFRBsxffEd8ajFBp7JYhIRbFsCpocAwHumAxZA+XP45OWJ45F7UA+5s
 1oPpEtIDoCar8zGhBHqf1CAwbCzEZcswgfsBlvLIB5B01sYDoOLlFYr51qHxSOggko95
 liFyQTo0TkkG00PXoFOJ7kDmqWv/XVJMA5ER+4qIOtm88qVujE4GZYOq4Rz3N2827wkg
 VpT0zHRis2cY2GJtJT9DymZV5LVw0wEolPd12/DM45477zkocV7yPobLxrlcNEWrEG8+
 mLkpky/wFj4uS8gyz2Trl9reBk31IOWurPxNzP5LbVykBhcfg6BKMlOgLz3jKC6LrVj2
 464Q==
X-Gm-Message-State: AOAM531Ks74fjRFOMBToxyWcIMXdmUT1SbYvWsbuqZ+cz5AM0evLS/Cu
 Sjah2cxXuF3pJUl1Aozpj8dBVQ==
X-Google-Smtp-Source: ABdhPJwBGlqy8ehUnQTQ7uJdv+A3+b84lbzMgNvj/a9fX9TdWu/qmOb322t5w6N7ottT6P+f7xD3rA==
X-Received: by 2002:adf:9bd0:: with SMTP id e16mr16167579wrc.346.1620122568086; 
 Tue, 04 May 2021 03:02:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v20sm2080568wmj.15.2021.05.04.03.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C96401FFAA;
 Tue,  4 May 2021 11:02:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 21/30] tests/tcg/tricore: Add fmul test
Date: Tue,  4 May 2021 11:02:14 +0100
Message-Id: <20210504100223.25427-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
 tests/tcg/tricore/Makefile.softmmu-target | 1 +
 tests/tcg/tricore/test_fmul.S             | 8 ++++++++
 2 files changed, 9 insertions(+)
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


