Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C0F16C2AF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 14:46:42 +0100 (CET)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6aXp-0003oJ-Oh
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 08:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j6ZkT-0003j4-Ty
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:55:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j6ZkS-00043n-GY
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:55:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44370)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j6ZkS-00042i-9a
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:55:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m16so14574800wrx.11
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 04:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Fr7X3j1hpA17dyvd8eW/tzfRhUBtEPlEUDx8NRA9zY=;
 b=J/84oZbG2Axvm00DFoiAsb4XK0PZIZA+n1YJeb44E4JP0Y/vYDJ4AtA31HmbYwk+L3
 CpNsQYUxm6ceCiMShd9AcCSMSOrA6oWIOA5KGmEpPEc8ZTIz9IZy9MW2jQEwLVchhw7h
 a0CLXAlMNbq9IDLbanVf8v3WMr3ITikrGgHM+sf/4MfDkVUaJW/qz+ratAjIpJhwoBKz
 B4IuSqOl84Bcukh8nmN8ffWCaFBQoT8o1HAWtB7cS4Wl0t5Fkx8pZMPChNIEycBXnGUO
 8jmcXDLWZy3jNF9qKMgg0KkAoP1QFpsDaqbrP2dLjzYkkGLUmpq7o3AnIAIIXN0uS/na
 oN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Fr7X3j1hpA17dyvd8eW/tzfRhUBtEPlEUDx8NRA9zY=;
 b=RgDuF2w3/R04bk4R8Tiz5hzU8/EIVDAxmYfwFE+AvF17Lv+Wk97vh1qY4QM+AdnTRR
 3Pxg8xFcNEuf+4fNMLDvIwO6ovWsueMo5xPut+VU0kHBqsmTYop9i/YeUmSrzyl+aL5U
 N5mUunBr2VUVg6euXOX7Om6jdRAWAYePKBiE3w6WzHCO1UfSFcMYXZpOtxiUZzwwaMAD
 QSJWlsibC5B/rljZeio2Wk41PpPi5gnOpulRZ9sXpLaxxL+iJb3PWueUkOSM0sMygYCA
 qpKex3YrlnJkFNEqDv4syEHouPFSxn6c76VNhha7cMM+rs+T6elriVhmPuOeRwz8E3LC
 74Gg==
X-Gm-Message-State: APjAAAUPQvm+LUzYAasag/ASnf04CnKrJ9egkHw1UMpM7xW5K0S2PSCN
 7kJpkereDV7hhOshhMK/PlMoqA==
X-Google-Smtp-Source: APXvYqy89havUkUXYKD4Fzs2eTo5aT5w/GJcjIs2Xtz0CQko5zCeENCjATPL9Ohk8vTUOYFseU8uKg==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr73622902wrq.206.1582635339066; 
 Tue, 25 Feb 2020 04:55:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm22988584wrx.11.2020.02.25.04.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 04:55:37 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 049FF1FFAA;
 Tue, 25 Feb 2020 12:47:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] tests/tcg: take into account expected clashes pauth-4
Date: Tue, 25 Feb 2020 12:47:10 +0000
Message-Id: <20200225124710.14152-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225124710.14152-1-alex.bennee@linaro.org>
References: <20200225124710.14152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, robert.foley@linaro.org, pbonzini@redhat.com,
 stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, robhenry@microsoft.com,
 marcandre.lureau@redhat.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, kuhn.chenqun@huawei.com, peter.puhov@linaro.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pointer authentication isn't perfect so measure the percentage of
failed checks. As we want to vary the pointer we work through a bunch
of different addresses.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/pauth-4.c | 54 +++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/tests/tcg/aarch64/pauth-4.c b/tests/tcg/aarch64/pauth-4.c
index 1040e92aec3..24a639e36ca 100644
--- a/tests/tcg/aarch64/pauth-4.c
+++ b/tests/tcg/aarch64/pauth-4.c
@@ -1,25 +1,45 @@
 #include <stdint.h>
 #include <assert.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#define TESTS 1000
 
 int main()
 {
-  uintptr_t x, y;
+    int i, count = 0;
+    float perc;
+    void *base = malloc(TESTS);
+
+    for (i = 0; i < TESTS; i++) {
+        uintptr_t in, x, y;
+
+        in = i + (uintptr_t) base;
+
+        asm("mov %0, %[in]\n\t"
+            "pacia %0, sp\n\t"        /* sigill if pauth not supported */
+            "eor %0, %0, #4\n\t"      /* corrupt single bit */
+            "mov %1, %0\n\t"
+            "autia %1, sp\n\t"        /* validate corrupted pointer */
+            "xpaci %0\n\t"            /* strip pac from corrupted pointer */
+            : /* out */ "=r"(x), "=r"(y)
+            : /* in */ [in] "r" (in)
+            : /* clobbers */);
 
-  asm("mov %0, lr\n\t"
-      "pacia %0, sp\n\t"        /* sigill if pauth not supported */
-      "eor %0, %0, #4\n\t"      /* corrupt single bit */
-      "mov %1, %0\n\t"
-      "autia %1, sp\n\t"        /* validate corrupted pointer */
-      "xpaci %0\n\t"            /* strip pac from corrupted pointer */
-      : "=r"(x), "=r"(y));
+        /*
+         * Once stripped, the corrupted pointer is of the form 0x0000...wxyz.
+         * We expect the autia to indicate failure, producing a pointer of the
+         * form 0x000e....wxyz.  Use xpaci and != for the test, rather than
+         * extracting explicit bits from the top, because the location of the
+         * error code "e" depends on the configuration of virtual memory.
+         */
+        if (x != y) {
+            count++;
+        }
 
-  /*
-   * Once stripped, the corrupted pointer is of the form 0x0000...wxyz.
-   * We expect the autia to indicate failure, producing a pointer of the
-   * form 0x000e....wxyz.  Use xpaci and != for the test, rather than
-   * extracting explicit bits from the top, because the location of the
-   * error code "e" depends on the configuration of virtual memory.
-   */
-  assert(x != y);
-  return 0;
+    }
+    perc = (float) count / (float) TESTS;
+    printf("Checks Passed: %0.2f%%", perc * 100.0);
+    assert(perc > 0.95);
+    return 0;
 }
-- 
2.20.1


