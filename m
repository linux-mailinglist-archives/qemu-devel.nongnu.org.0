Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1237BB0B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:43:34 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmKz-00015k-2t
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmI2-0004Hx-0D
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:40:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmHy-0006Ms-LI
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:40:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id u133so1254030wmg.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ZxifPNhE6akX9+XYZwzCV/eA4ZYz798fnoOHTBKs+o=;
 b=vYm3n9aIbWkvu5NCQnLit2T0Y3CL5USOGhRjKitlcjDhzcssmcJykxGCOpAbx088sJ
 e366noke9rJI7rhnHyx4pGTbGCL3s+kbNnzrjqayLNH+01dky2TCvhATyk67Vi0EGO+g
 JiHQVi4Oh10C1AB9BpJdtL6tBAP9/myJTZACXI0lCng5Y5SIQrHljnpALv8+gDA5vtIs
 jhP6EDElhZle5qLEWxQS6s2Z2LtnF3/Eze49J1lqvhAksl+Q3cO/TDZGHERwlzZyucQs
 RI/ENIqFnSNWnIO5cHprS6Cy+flBjN+eT6G+cmDmOr9p4Q9k1I77MvqTU/aZLs6MJi9S
 GQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ZxifPNhE6akX9+XYZwzCV/eA4ZYz798fnoOHTBKs+o=;
 b=h2stgih6s9HtWtb0/8Uayk9T0ZVT3IdQ5Vr6D/mSaDlmhjkfyIbAfjeagh1zp9rP2U
 1Q8v2W4jvwNZkHZO/xxzYn0Bc3+PyeWfSVi8ZJ6LYDJzkyenDCOhnFbam+hB5mR0s6j1
 X4S2wzx885l/MwKbi54mua+w5N2fklL5k+pc/AOSU/eRFEjTtprULX0Xvz6u8s3w4yWn
 Voh9TAaEbGUdWpxA8WQ4X00bgTbnAj52QwBo5Sfqn6EzlSXn1iEztk78MnPkC09ARxSq
 BK0iDuxFHG+5aSQ6PP6VNUZIdW4B2f668jNNp6D2O/DkLEPbs53X58aPM/i6t+ayh+t/
 ZxUA==
X-Gm-Message-State: AOAM530skbNpgYy7k79vWwFGduXiO/SGRM7JHN6bZKRkCL3RAo1NzF6M
 TsXd5tAhXSEPtisVnd2BZzvnxg==
X-Google-Smtp-Source: ABdhPJwCI6sICGT2jgkNTRgrimqiNa2aBD8r0GPgj2Duqrs/XbzBYsmMIot8uK5WCOm65XE/KKxQvQ==
X-Received: by 2002:a05:600c:190f:: with SMTP id
 j15mr10662282wmq.57.1620816025220; 
 Wed, 12 May 2021 03:40:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d127sm5720416wmd.14.2021.05.12.03.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:40:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB64A1FFA6;
 Wed, 12 May 2021 11:20:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 18/31] tests/tcg/tricore: Add clz test
Date: Wed, 12 May 2021 11:20:38 +0100
Message-Id: <20210512102051.12134-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
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


