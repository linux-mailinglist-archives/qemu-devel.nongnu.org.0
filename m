Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCEA387547
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:37:42 +0200 (CEST)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwAX-0001nr-VX
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livpE-00059G-9M
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp0-00012U-Qb
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x8so9345190wrq.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jcmdAYe0KwSyd2gVv/xFHxAZ2fE+u7+DYM1mPJLmcY8=;
 b=NCUfcYSJFkk8Depp/8l85q6h2DiYVdhtrudpmslvVsYOI3te5XlzU+nh4Tphy2JPMS
 gfzX8iNER/jW0wPUfinOLbEJMefyqPOPw0TxT7st1giEHI+AJiwy83tDWG84kx+T60GC
 PQClv1jDzmK25v4gd96n3lifzTb9FSSpwkyKHtD8I/wx7vBgs97VKN7YEvFy89mJxvAL
 Moe173RPiM5GiiA9bkHX3ISOye0rzp0AXYIiU9qhKo4CT7icaqEQgsUcOxD/+S3hLG/w
 VvVDRL8FPaJObQ7dx7DMiC3xWQ4XfkEUJbMK6yCw793/dpphr1F7A+gf7td4NPHclwJv
 w+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcmdAYe0KwSyd2gVv/xFHxAZ2fE+u7+DYM1mPJLmcY8=;
 b=FXeusEVEDJuD8niG08GE1uSFualVz4OqLGzGxsiwP+/zTMFeTdEA1nfhpw1LUQ8est
 NYwHN6eRvAcJ7sjbmA7LR3mWB5RQOoB2GTTct1a1U8cw/dQH+4pElBR25vOQtOcPpwdB
 /DLqSfEC2Tn/zslvr5uCPhOv49jeAs5boMnBlW0GssdV7/7X+XxaBOEndCcaIns+Fu7A
 iX4XZCzpoEugBgxXblVtImBmNN09r5m1Hj/DsOI8ZLcRURpjRsOj+A+4LApAe56I9vvt
 7z91sVO5dLUF+ArQQpwSrtrLvomoTXJZcSD9Wyc+We++L3wLSNcJVdbMKCKe3NGLUD46
 KmlQ==
X-Gm-Message-State: AOAM533qtMiHK6yZYye7z5+BhZUCe9PiG5nVBp38loHio/qC16XqwDp7
 grrc8RclCiVsAaR0QyH9oXKIe/jxcV5Aww==
X-Google-Smtp-Source: ABdhPJyKITUxemROFjFvCDAs9UU0YaZ4iVPaoiXWS+hG76W6TOWSzClpR4t8JHmOQnDRQDixR97HeQ==
X-Received: by 2002:adf:d081:: with SMTP id y1mr5428333wrh.179.1621329320689; 
 Tue, 18 May 2021 02:15:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm1838716wry.55.2021.05.18.02.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F9F01FFAC;
 Tue, 18 May 2021 10:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 23/29] tests/tcg/tricore: Add msub test
Date: Tue, 18 May 2021 10:07:14 +0100
Message-Id: <20210518090720.21915-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-15-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-25-alex.bennee@linaro.org>

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


