Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D4383A03
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:34:23 +0200 (CEST)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligCE-0005yN-Jo
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyr-0001sN-Uy
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyh-0002C8-Gn
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:33 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so231297wmc.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/GoNt9HHy9fj7GtsQyqbYSYiaxiEhaVdxxiDzDGgum0=;
 b=GCNfcTehREn1MwjgatoRkiVlkWxbEGdqtixlShehgHp9uzreQL0P+X0lxtNQqtK6l+
 YjCTAgh0BasUADdpljs7Q7vlx55dbnfgd5vEw5LSeCKM4408IBqjrnzeaj0mrkcEoxoI
 qYVG7lrEJ3Fv0gfV5met42ZzAA2/w8ymUYc52g2w6ARTkql47J+TQdXOtNfsDItnBsMb
 XmOXw9s8dr7brzvsNZ8a4k4Hl/eCsucTVQdVPfFJ8z465MLnO0hDjpOVpxDCM1JrrLYh
 qvHP7UIySzduaxj2ZHTLZAux6eAYYstKACeUgpCCWAePauI4pBatm4tOp2B8kFyv84uv
 T1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/GoNt9HHy9fj7GtsQyqbYSYiaxiEhaVdxxiDzDGgum0=;
 b=rLmuKuIygIJ5FUihJiGfY767ymr/b0OwosazqoxwbLw09DVl9rSBn9khVWTu31WDQT
 eSmGNB24q/FHOjgE4tzKAwv/uOrVggf7ZzmTZXsFHd3PyCbJoDs2SFkNMa9okbHL7cRp
 JasO5ELqrLK5MHjOKlwOHuNHs+TI3H1l21a5yN6NmwvJDS2x8rSFVP4YFkvYmcYa6Ds3
 wIroG4KB5zeioAFiIFW4+NnrrScNj+6dH6VX9g2bffp5WcTmgbn8oGrrbPWrEVlxOf5n
 tSjFjYW9WJLGmiZ4pIbCVcnCgjP2ApnJEEOHtuBgl4lXlNkZ7OiraaBdr9cO9WpTcTnJ
 LG+Q==
X-Gm-Message-State: AOAM53299Ov6x8+9XqluqYq2iZHZi1EO141abJgzWQMt7529s3WA3y5H
 +9/9X5LWNTohayxHKz4BJVIZwAMPGDn0MA==
X-Google-Smtp-Source: ABdhPJzutZw0p1YJo9C8xcJVswO5nLHlgLq/JEkPKoow4pqdSBjje/ahTVYRhdbFHXnIGkY01igfuQ==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr672587wmj.157.1621268422029; 
 Mon, 17 May 2021 09:20:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm3643109wrq.93.2021.05.17.09.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 764761FF9D;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/29] tests/tcg/tricore: Add clz test
Date: Mon, 17 May 2021 17:10:07 +0100
Message-Id: <20210517161022.13984-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

[AJB: dropped duplicate Makefile]

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-9-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-19-alex.bennee@linaro.org>

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


