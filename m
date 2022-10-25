Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2BE60D1EB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:49:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzg-0007WY-JA; Tue, 25 Oct 2022 12:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz1-0006e7-A4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyf-0001iS-IK
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id h9so10988009wrt.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iSSkQIh++VAD6z3sAniBXAoaqSqq2v9dCC5ucK7zVik=;
 b=WY2UWz9Ui/HSu4rOGVPKPZ7zaygWHXpXns0P/KqqYCudZjvgGWNCI81ugQe9HtAb1/
 7oKsB7IGrN4aKC+C7QeEkc7CGVuY9e7Nkkc96R1xHCMD7Bs9lPOtPWW0fMY2aBX3pLnp
 dDcDQ2QwNjbnUGH+kND5XqzEF12m76/At/2DsA9+t6T17xX+S3YmTeK+i3UTCP1xo3GG
 9Lzk1C+CG2F/UXcLLRAOEA1+S4wYEwHUGNX7agOig4oAOcuYIc1uo2aKudDDik+tOp/i
 BLocyur9e1RYyDYyNsg61lSzjZXkUklTBg2ZWUvJw40ljQ/lZFePnIv0evYASl7lWa+7
 OJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iSSkQIh++VAD6z3sAniBXAoaqSqq2v9dCC5ucK7zVik=;
 b=RlsoQsCL9OeqKgWb0At5HZ3ClOjrGejGHVcPB/+BWjLmKkn/jFiFRjyzVz6gDmKnh3
 QmzJOClmIfZnhP6neO3HlOHJSptIA5YZkGlva2brviw3fUs1pE6pnMUO3RhLM1OsUlTi
 GP7IcJKGCassd8t4vlrR550L/NlbM1KXhpjEDZ0jhK3UZTNnwmFkXMypWhCKR7zR8ILT
 jmNILuKQE5tGHZahCUyJNfi3+AGWQOWBOJix1nQ1kFrNbbw+pCKPefVCCCXpeyyAzGdg
 /DKN6XIcvEp1dw3KsoFcKnX5BF8spTbB2SkpwGoLoLsvZ0ALSB2wTND+SlCLk2om6zNt
 UnmQ==
X-Gm-Message-State: ACrzQf1XDkXGrsz3OWvJQC8hSJSUI4s04hqyG9wBmkh3Z0r2HZobujX4
 QE6YdcG8S9RHIBl1A9ZKmSPZd9+Dc8jNIA==
X-Google-Smtp-Source: AMsMyM4I8PQxPGtwwv7+oh91TwU2ISIZjVWT2L3Cb2TE58HDX5gChAC0N2Lxt4T5CIYc3qL7oWrc6g==
X-Received: by 2002:a05:6000:1887:b0:236:7b1a:b14c with SMTP id
 a7-20020a056000188700b002367b1ab14cmr4648162wri.173.1666716020725; 
 Tue, 25 Oct 2022 09:40:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] device-tree: add re-randomization helper function
Date: Tue, 25 Oct 2022 17:39:44 +0100
Message-Id: <20221025163952.4131046-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Several
architectures require this functionality, so export a function for
injecting a new seed into the given FDT.

Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20221025004327.568476-3-Jason@zx2c4.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/device_tree.h |  9 +++++++++
 softmmu/device_tree.c        | 21 +++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index e7c5441f564..ca5339beae8 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -197,6 +197,15 @@ int qemu_fdt_setprop_sized_cells_from_array(void *fdt,
                                                 qdt_tmp);                 \
     })
 
+
+/**
+ * qemu_fdt_randomize_seeds:
+ * @fdt: device tree blob
+ *
+ * Re-randomize all "rng-seed" properties with new seeds.
+ */
+void qemu_fdt_randomize_seeds(void *fdt);
+
 #define FDT_PCI_RANGE_RELOCATABLE          0x80000000
 #define FDT_PCI_RANGE_PREFETCHABLE         0x40000000
 #define FDT_PCI_RANGE_ALIASED              0x20000000
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index ce74f3d48d7..30aa3aea9fa 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -22,6 +22,7 @@
 #include "qemu/option.h"
 #include "qemu/bswap.h"
 #include "qemu/cutils.h"
+#include "qemu/guest-random.h"
 #include "sysemu/device_tree.h"
 #include "hw/loader.h"
 #include "hw/boards.h"
@@ -680,3 +681,23 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
 
     info_report("dtb dumped to %s", filename);
 }
+
+void qemu_fdt_randomize_seeds(void *fdt)
+{
+    int noffset, poffset, len;
+    const char *name;
+    uint8_t *data;
+
+    for (noffset = fdt_next_node(fdt, 0, NULL);
+         noffset >= 0;
+         noffset = fdt_next_node(fdt, noffset, NULL)) {
+        for (poffset = fdt_first_property_offset(fdt, noffset);
+             poffset >= 0;
+             poffset = fdt_next_property_offset(fdt, poffset)) {
+            data = (uint8_t *)fdt_getprop_by_offset(fdt, poffset, &name, &len);
+            if (!data || strcmp(name, "rng-seed"))
+                continue;
+            qemu_guest_getrandom_nofail(data, len);
+        }
+    }
+}
-- 
2.25.1


