Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B651037BB24
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:45:24 +0200 (CEST)
Received: from localhost ([::1]:45710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmMl-00052P-O5
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8a-0000ld-SD
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8W-0000bo-Di
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s8so23085125wrw.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UI/Epk7UI6ih8itVpTT1qnXUK0ABqNU1gp/FWYX6Sdc=;
 b=kds3Ydf1gdEUfk23T9qEr5AZ59Mj5iAj8jP5slOzHYz6yB4nqfnKlZHItdS0FMHDUC
 j1rU03zM0qMPqTUzt30KjkGKYsloRv3WqDt2diL4dWtvQ6wnyW2RSa1jyjc1CcTn2lJj
 OxkRp9zDdJ6C9ShZrpzHU2ITEGtUSEjEIER5l2PVtkbGdbi7wrs8vDACvrC2KdVOn6t1
 yTpx1Q5KJ8Fef1v3nQ/+5x1g/2CKIRIwp038Bl45IzrgwwCJgfT3QB/Uwy/hVIGh7jLm
 XpOzwDTS++FH6RQHdAl9GylET/DKnaWPCRIa8QGg6yFkaSg1+2E1roC36TU1xGMgJyrV
 xDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UI/Epk7UI6ih8itVpTT1qnXUK0ABqNU1gp/FWYX6Sdc=;
 b=id5wVSW6ViWvSjcd2qGIUT7mnDEIhQiXXtpM4b5udpWJTjwpQG5f9S0cTPTfQe9vfs
 K8ypdGKwVqUo1TA7UkDl4u0LhwWFp8cSn5g+M9amC6HVyjmgHr8x80I6UUYKohKrw3MC
 qml/IvW5lI7wgqEvd0mi1WX0R77nh6wTdijpYSEv+I3rbxncbVgIBlBoqum+uLTF1ADr
 tawRZBsOOaLzV6Lsv3s2NyHDsflQn8axKAwn/+DzBJd+ihjkNn+18L+xIRVZliFuDqV6
 G06A3pwTf1dLNry6c6JbWyFj0qnPeczk6lSJkRH97s9GqbHD516FccLwHri7xH8k2n6n
 k6cg==
X-Gm-Message-State: AOAM532jPU2IeOGdE5Z5yTWPZyK8Tajk3Ou7V8j/g/7Tj2+IcQ+xdkO1
 XS1AipaRZ96V7Cq354kLN/GUcA==
X-Google-Smtp-Source: ABdhPJyUc64oX+Lh5MasQf1mQ4LJxINGFtzPoG2+i9tXWi64eAw7Ilwp/bkqLnl8xpnWsflKt+NBVw==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr45348268wrp.242.1620815437622; 
 Wed, 12 May 2021 03:30:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r18sm4011669wmp.0.2021.05.12.03.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE0AC1FF7E;
 Wed, 12 May 2021 11:20:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 25/31] tests/tcg/tricore: Add muls test
Date: Wed, 12 May 2021 11:20:45 +0100
Message-Id: <20210512102051.12134-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
 tests/tcg/tricore/Makefile.softmmu-target | 1 +
 tests/tcg/tricore/test_muls.S             | 9 +++++++++
 2 files changed, 10 insertions(+)
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


