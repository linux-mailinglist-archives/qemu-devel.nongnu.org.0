Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738883728D2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:25:34 +0200 (CEST)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsFB-0004aH-CY
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzv-0002a7-8e
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzo-0006ny-NR
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so971610wmv.1
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ZxifPNhE6akX9+XYZwzCV/eA4ZYz798fnoOHTBKs+o=;
 b=zeA1ZthKV+aDW0ewWfmgVxeLk4ii0s7dRzW1GC+IAjNw1oKTvEysfza2LuJkV+3B4Z
 hDsrlk6xsC+9Zdj+WMVfGYILKUtGzNO75ZyZvSnfo6/m7jK+9ht50R6M3mnYy4FilLfr
 77s2a6pgAxZu4s/b6WF4RsUWYJRVUlUhSWo92ma6BrOTEEDspDf7DMwIAOKK4hOXQkll
 fflo3jpoNrd40Dv4s1iTBWhEFS7bb1dUNWVMPO1/M0KtUHv8JX0Ftj8SyTrm9O1OeBkC
 IGFpBLZUhLINBA80XtNVcju9j3zpAgXnLSijsCl5uofnO7umjeBZ7cBm+6tgm76gKlEm
 F80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ZxifPNhE6akX9+XYZwzCV/eA4ZYz798fnoOHTBKs+o=;
 b=ETMh7hG3Oo0unRNbHHPsKqvaVotj/kpGcL7Gq+C0FUcfEGWWHQjNc+7FbCqP4NAgxL
 pIqkdeM5ysyty03r6KD723SpsqZr9CUZ9PnoDlOnaDeKxBeeVbtwOW4U0iQz57Kq66Ez
 Bi5sfhqMdx0G0O+oZz2L15d1Hd0OZtuHZRnENS4OcO+qdVrnhANb9XRQ9fv2kuQX70Q4
 GNDbHJbtjvMwBerPkGe5dZeOSKcq22QSjQGsBzmw4lJIJ9ykcVgxmZAQDcqdlgdzRcoH
 EhOEvX2KnFZN5nf1yR6LDM+zwvWlVB7WQuVP8FBJxbgiofJoC738Rfg06Bbktw1xxOy5
 GOkQ==
X-Gm-Message-State: AOAM532o1hoBu1b5I9CjXF74xgI88SEvgIceV6XGqC7UYtHJkfFEucv1
 U35iwhoNEb6I8/FWvXKoPnjHW8rPhT04Eg==
X-Google-Smtp-Source: ABdhPJwdr3NrotncnjX3vTjHoJJS0exiSiZTwI35p/HBIK50OyIG2kd3bZQu2ElV6wp/Wy8xRmnvAg==
X-Received: by 2002:a1c:804a:: with SMTP id b71mr26574994wmd.82.1620122979350; 
 Tue, 04 May 2021 03:09:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm2159123wmb.35.2021.05.04.03.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78BAD1FFA6;
 Tue,  4 May 2021 11:02:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 18/30] tests/tcg/tricore: Add clz test
Date: Tue,  4 May 2021 11:02:11 +0100
Message-Id: <20210504100223.25427-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
[AJB: dropped duplicate Makefile]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-9-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target | 1 +
 tests/tcg/tricore/test_clz.S              | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 tests/tcg/tricore/test_clz.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index de6a2cc88e..a9b81545e2 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -5,6 +5,7 @@ ASFLAGS =
 
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
+TESTS += test_clz.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_clz.S b/tests/tcg/tricore/test_clz.S
new file mode 100644
index 0000000000..e03835f123
--- /dev/null
+++ b/tests/tcg/tricore/test_clz.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D(cls.h, 1, 0x0, 0x6db17976)
+    TEST_D_D(cls.h, 2, 0x000f000f, 0x0)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


