Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5554AB622
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:11:11 +0100 (CET)
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGz78-0000mm-HY
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrK-0005lH-OK
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:51 -0500
Received: from [2a00:1450:4864:20::436] (port=41980
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrI-0001sE-EX
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:50 -0500
Received: by mail-wr1-x436.google.com with SMTP id k1so6597055wrd.8
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcmG4IJ1yLpI5b/+S7s8QOjnnOsTRxndw2MozSO6LEU=;
 b=Ql6OiBq4eP17Zg1ewj9LIPLhAEPNyTpglQQuQYdEJEK4N5cFAHVSopLErepeZtVELP
 d374bfI7flFzhre61vaa7iZFTJBIA7jyTPhPtvJAiGTloeUIZkogasO8BHrYCkbK6w+N
 gurXbm8ArTceZ8TLvmCUA1lkeSQuTZ4AH8fsT56mJ4YapO/aYz9fRrhdpgbkEG+HM0L1
 X/032Ra0pmjNTC2XBBNHvH8p0z9QKwe72pg5plJ5w0uPrwX8lBrxRqBblbtCR/Hk0QTs
 WdAJU+MzGXKM22bLYTO5cpzQh71gJj+pgTh2CWp2U4hZo5YRvVuOIrXTYxLgquIO3MA1
 hn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AcmG4IJ1yLpI5b/+S7s8QOjnnOsTRxndw2MozSO6LEU=;
 b=qANiFFYE93M+iMCNlpS2Jbljn9YbgIAhhjnXmmzcfsIYLblHB4dH2/34s2QKijFakf
 cnrga+CNMfh1BiduPOV18yYH7MtmUjhHossAgP3ZufUhQeSG8ICRNDrPS3ERy+CTpIM1
 HaCIMfC5dkoaWuaXTNWk2VAsFlyLqs51c5CeeQtBCXp6Vn/VaDgLkRIAqrK7t9j1dWZ/
 0zE5L+F7bMqCzoEwH/NGvuyE8WV5wr7NA+jn8dq4jq0KZjstR67wAylFpH1aAvSPX2kv
 OXLVlSZICKDkoeujQrBXA1sXdTWOWR4dx93b5mJ4Ztzm91lO48vxAemUCTDRVh8nUAYO
 eNVw==
X-Gm-Message-State: AOAM530kB1QKkAU4K5LLzifzFqyQR7LMk6TLVsTHzcWA5KizIAtZ1+Oi
 VevRHn00690mUUbSX1UjwRjLPvqfdaI=
X-Google-Smtp-Source: ABdhPJx8/dqishgkIhvpUBMgJxru7Pwu8Inh7U0Td64m5hLSRH2LejLh0OTotVvmYFmDkJ0vBt8P/A==
X-Received: by 2002:a5d:4888:: with SMTP id g8mr8850175wrq.65.1644220481965;
 Sun, 06 Feb 2022 23:54:41 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y14sm9888636wrd.91.2022.02.06.23.54.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:54:41 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 03/21] exec: Declare vaddr as a generic target-agnostic type
Date: Mon,  7 Feb 2022 08:54:08 +0100
Message-Id: <20220207075426.81934-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Move vaddr type declaration to the generic "exec/cpu-common.h" header.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-common.h | 12 ++++++++++++
 include/hw/core/cpu.h     | 13 +------------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index de5f444b19..cd1d7328a1 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -7,6 +7,18 @@
 #include "exec/hwaddr.h"
 #endif
 
+/**
+ * vaddr:
+ * Type wide enough to contain any #target_ulong virtual address.
+ */
+typedef uint64_t vaddr;
+#define VADDR_PRId PRId64
+#define VADDR_PRIu PRIu64
+#define VADDR_PRIo PRIo64
+#define VADDR_PRIx PRIx64
+#define VADDR_PRIX PRIX64
+#define VADDR_MAX UINT64_MAX
+
 /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
  * when intptr_t is 32-bit and we are aligning a long long.
  */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 76ab3b851c..3f2b681281 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -22,6 +22,7 @@
 
 #include "hw/qdev-core.h"
 #include "disas/dis-asm.h"
+#include "exec/cpu-common.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
 #include "qapi/qapi-types-run-state.h"
@@ -35,18 +36,6 @@
 typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
                                      void *opaque);
 
-/**
- * vaddr:
- * Type wide enough to contain any #target_ulong virtual address.
- */
-typedef uint64_t vaddr;
-#define VADDR_PRId PRId64
-#define VADDR_PRIu PRIu64
-#define VADDR_PRIo PRIo64
-#define VADDR_PRIx PRIx64
-#define VADDR_PRIX PRIX64
-#define VADDR_MAX UINT64_MAX
-
 /**
  * SECTION:cpu
  * @section_id: QEMU-cpu
-- 
2.34.1


