Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B642DAEFD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:31:32 +0100 (CET)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBMR-0008K4-Am
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4j-0001dF-69
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:14 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4W-0007BM-V5
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:12 -0500
Received: by mail-wm1-x342.google.com with SMTP id e25so18631822wme.0
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V7Ov92RUYFvG6DWeSAUrDBWYIPL7mYHIZYb3185Jc8w=;
 b=u622psWw+Bfq1xhawMyyWg0KgGSktGjkhI6Hpqk5ebOoFXkJVtevuXgmBdWtOaRq49
 ULao6Ey5IrLb6dMKcVKqpcp5CZK4S5bCNhf5xnHDyKvS+VrZJkuxhmVaHLFThsVOGGQG
 9whxAE6h9pmMXuCoGpawKhyh+d+qMQabUOVUgkBvxBoVQDO+uDSwYsiOxiE35/JeYpTP
 w7FeLIUKxbbIRwmI+SfPseVedV/olR00I4aWtP0bpoRjQwvsBX/UJ6k0ZinySh6360gO
 Bsa01Xu1/gb15+CLOZnlOoFVLD1hnJYeLBeZEJWvPLreZVNyV3oSMRyzxBysg9yi3CcN
 knlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7Ov92RUYFvG6DWeSAUrDBWYIPL7mYHIZYb3185Jc8w=;
 b=EL12aH2OFWi4IBS/u7MrEvOKgBET4yeF1PyMXjdmQlmzLdLki2qQBeDV024MY6dPoH
 vEkeHhdsF2Bb8aS7DyynaLM646yK/zwdGU1r3wY+5ZvB5ZSboZGMWUGLcWE3H5sRh8BO
 6IpsVcTt5f80PZGGH9AKqPhvdbnNzYMv7BRNAS0mT8r/N4J7iot9xNyp4JNrgOWX/d5x
 j72eg1upCAesopP0d15IUgK9RjyXct2J8GZqXsK1bWda/Eji4jNlwArFDW9gV4zMQPs4
 HTLW+K+LuH8Gym3ENWxKvnejjV6ei9KWh573epDdHlK9oHlVx8ciGuxvA3SctDXS3pI+
 ek6A==
X-Gm-Message-State: AOAM53320e5x+Z/Rta6zwdFPdKQ/2ccjXBwOwVumMHUmyCiCf8KidWqm
 3V1RTa8W+P7r/7iRJRAjcMRlVCLNB4qTxQ==
X-Google-Smtp-Source: ABdhPJynBDRRmw8Yuv6+BnmyiGFnrJJqpK64ExRGSrk/Asi6lZ3+u0N2F9DEBC4pPdfZmazoEIIioQ==
X-Received: by 2002:a1c:6746:: with SMTP id b67mr32937632wmc.8.1608041579410; 
 Tue, 15 Dec 2020 06:12:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] hw/block/m25p80: Make Numonyx config field names more
 accurate
Date: Tue, 15 Dec 2020 14:12:34 +0000
Message-Id: <20201215141237.17868-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joe Komlodi <joe.komlodi@xilinx.com>

The previous naming of the configuration registers made it sound like that if
the bits were set the settings would be enabled, while the opposite is true.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Message-id: 1605568264-26376-2-git-send-email-komlodi@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/block/m25p80.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index d09a811767a..bad72538386 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -136,7 +136,7 @@ typedef struct FlashPartInfo {
 #define VCFG_WRAP_SEQUENTIAL 0x2
 #define NVCFG_XIP_MODE_DISABLED (7 << 9)
 #define NVCFG_XIP_MODE_MASK (7 << 9)
-#define VCFG_XIP_MODE_ENABLED (1 << 3)
+#define VCFG_XIP_MODE_DISABLED (1 << 3)
 #define CFG_DUMMY_CLK_LEN 4
 #define NVCFG_DUMMY_CLK_POS 12
 #define VCFG_DUMMY_CLK_POS 4
@@ -144,9 +144,9 @@ typedef struct FlashPartInfo {
 #define EVCFG_VPP_ACCELERATOR (1 << 3)
 #define EVCFG_RESET_HOLD_ENABLED (1 << 4)
 #define NVCFG_DUAL_IO_MASK (1 << 2)
-#define EVCFG_DUAL_IO_ENABLED (1 << 6)
+#define EVCFG_DUAL_IO_DISABLED (1 << 6)
 #define NVCFG_QUAD_IO_MASK (1 << 3)
-#define EVCFG_QUAD_IO_ENABLED (1 << 7)
+#define EVCFG_QUAD_IO_DISABLED (1 << 7)
 #define NVCFG_4BYTE_ADDR_MASK (1 << 0)
 #define NVCFG_LOWER_SEGMENT_MASK (1 << 1)
 
@@ -769,7 +769,7 @@ static void reset_memory(Flash *s)
         s->volatile_cfg |= VCFG_WRAP_SEQUENTIAL;
         if ((s->nonvolatile_cfg & NVCFG_XIP_MODE_MASK)
                                 != NVCFG_XIP_MODE_DISABLED) {
-            s->volatile_cfg |= VCFG_XIP_MODE_ENABLED;
+            s->volatile_cfg |= VCFG_XIP_MODE_DISABLED;
         }
         s->volatile_cfg |= deposit32(s->volatile_cfg,
                             VCFG_DUMMY_CLK_POS,
@@ -784,10 +784,10 @@ static void reset_memory(Flash *s)
         s->enh_volatile_cfg |= EVCFG_VPP_ACCELERATOR;
         s->enh_volatile_cfg |= EVCFG_RESET_HOLD_ENABLED;
         if (s->nonvolatile_cfg & NVCFG_DUAL_IO_MASK) {
-            s->enh_volatile_cfg |= EVCFG_DUAL_IO_ENABLED;
+            s->enh_volatile_cfg |= EVCFG_DUAL_IO_DISABLED;
         }
         if (s->nonvolatile_cfg & NVCFG_QUAD_IO_MASK) {
-            s->enh_volatile_cfg |= EVCFG_QUAD_IO_ENABLED;
+            s->enh_volatile_cfg |= EVCFG_QUAD_IO_DISABLED;
         }
         if (!(s->nonvolatile_cfg & NVCFG_4BYTE_ADDR_MASK)) {
             s->four_bytes_address_mode = true;
-- 
2.20.1


