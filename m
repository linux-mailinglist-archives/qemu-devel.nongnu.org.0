Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359B383AAF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:04:07 +0200 (CEST)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligf0-0007mr-GO
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lig8B-00045V-UD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:30:13 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lig8A-0005wu-0l
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:30:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y14so4993770wrm.13
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJRixgwKB4R/8PvCfIqI45wxOthEoZS3ugc5iFFCnVo=;
 b=PN8sbdPzlXbwZvFl69uq2zAZBPXh9fG6DInEihci7gwaH+Y/s978Ji6rsmTpcwcWPj
 7bq4DqMwS5OgpvkTLkn6ms1KXehQTDCxqgj+1KwdHfA9VhqEQ+/Exrd4D96aBDYpixHL
 iALJpTZWIJNfglNIUygYo6/H7m+NNk5fkMYFASizqOV+TEdcaz8OIXyjrURoUjQKA9DF
 E2NoDmwJk2u/pb/GY4AzJVDcoIWkar23nEj/HOA7wLSJY6UioTx+UtPIvV4wFUu+pUWx
 /wziwmxvYnswU7Izo+HGV/5pN3LXxOctBHOqnrDM0HCNn/WlmEzuknns2MJa+OEv29sD
 Oy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJRixgwKB4R/8PvCfIqI45wxOthEoZS3ugc5iFFCnVo=;
 b=j2yWkOasfxAljYIqp17U6KQq5IhC2n0PGuwkjNJ6WMrvZeXUmI/NIdQHRFWoAV7VWQ
 0OSvan6N2KdR5SYqK9c6Mqt2s7Vh/35XebZnNzfMW5STDi6tvnTt4pzPlG3JYwkgn5W9
 4oKBa0xTn1W+YoeM+IV2hCYtOYIqZHLBTe5FgK0wUtT6i/eAe0QXd7A8Dw4qHkEWgKov
 sPU9eHC4/rHi9pwUB4CPPsNXjddjThNhqbtakWI/NwfvxW899sQgOHMrfS/IvLAInq+g
 zxby0Vy4Hv1jX8gmW45u8+6WuuhUz6WvAblNue2SMZeMnXCv0WKk//qDNgk9Se7KSUKH
 aloQ==
X-Gm-Message-State: AOAM530zaOA/r1ooKlv3/Uer1fKwH4eAx+PAvlK09IUhAy84+yYLFO+i
 CfLCo5DMiXd/jqyJT7iTbG2ysg==
X-Google-Smtp-Source: ABdhPJxyopTihD83XM0rNg8HSkaP+xxdgqrRSEN3C5lqm4rNZUofmrSh1U49S8VxupVw4yyEjukw0A==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr635485wri.86.1621269008139; 
 Mon, 17 May 2021 09:30:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k6sm21072059wmi.42.2021.05.17.09.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:30:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C066B1FF9F;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/29] tests/tcg/tricore: Add fmul test
Date: Mon, 17 May 2021 17:10:10 +0100
Message-Id: <20210517161022.13984-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Message-Id: <20210305170045.869437-12-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-22-alex.bennee@linaro.org>

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


