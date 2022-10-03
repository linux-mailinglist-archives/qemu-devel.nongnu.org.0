Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD855F3821
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:53:20 +0200 (CEST)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTNH-0004ss-QK
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7x-00024P-0E; Mon, 03 Oct 2022 16:33:27 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7r-000450-VI; Mon, 03 Oct 2022 16:33:22 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w10so3291460edd.4;
 Mon, 03 Oct 2022 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=EzS6/XM3DGYtgGvNF7vg6yDSK7k3KL9MXj83OgaGTio=;
 b=oowOfjoSAOHwvP9P+TRYQReAm28l++QEcsPcvQLBGTZk0ouZzn+uQGctXx4qXGVlAs
 yLaplmUx/1Hm3b9Hov+APczDxaGuL32aknNU7wEDCJdnZCFfJzkGNvKRDwDYJPKk6xnS
 sKKS1NEbtOwa+36L12UhKEiJZcHLI4eL9w9TSDQZ7yiJaKWPofRkBCA97fUIGPK21u0P
 UZSn5sTQIRqQIv+i18fmiVKt+dqYpLoIG4MDFzTw/XInK3NwutmxbCnmeK2NSHCCxQeB
 7DCS+7xAjrO2AREMF6tKEVAuMoHcSKHizbB2TqzbkFH5yXsB01CfI43Yr/RZCgxUQJIe
 ogeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EzS6/XM3DGYtgGvNF7vg6yDSK7k3KL9MXj83OgaGTio=;
 b=ojRKwYvd0vaJMDZ+aPKeqWZaxiLPZp9ZYq3vKMkjAnIaDwzD6vvcR2tvAsBmyRYIwb
 sJqCs0QOdxAcQxjPchecAYzFxjDIfv5/KN/8BgbJ4V2Q3NisTlMM7eCzP0kM3jZR6ScT
 1b6RHRl0Fep0YQm258DPxwqYwJJQcfGyxy3YtliuhGfhJKQtLtQ6BHCY8nztH/A6AeIU
 oWYkcOZg3tJZK7vnoMniyQQVjLt14ZXTqweACwexPEiLNMPfRsR98xkxlG5KvAQVfqBq
 lGIWJh4EH6bH+rY1+SWaUeZ3Nj9bY1s0V1M713gjSldfU+p5gHqdvdBRLH3PpQCyk2Tb
 zwuA==
X-Gm-Message-State: ACrzQf0ClNECQJjFxj7UAKU/tqda9f8kipGR8dQ/MgmofrP/OQw0g0y6
 ax4JoPDqgqinH2Gbc0+XbdtB8Ijg/SQ=
X-Google-Smtp-Source: AMsMyM4vB8+SIB8WZ8Tjhd8OC1CeoGdmmDdKy3/jLCocPX36An0C4JwuKUING/Zss0RWb8i+OKrIQA==
X-Received: by 2002:a05:6402:220e:b0:458:b857:85b3 with SMTP id
 cq14-20020a056402220e00b00458b85785b3mr11140973edb.379.1664829196209; 
 Mon, 03 Oct 2022 13:33:16 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:15 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 11/13] hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
Date: Mon,  3 Oct 2022 22:31:40 +0200
Message-Id: <20221003203142.24355-12-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The device model's functions start with "usdhc_", so rename the defines
accordingly for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/sd/sdhci.c | 66 +++++++++++++++++++++++++--------------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 6da5e2c781..306070c872 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1577,24 +1577,24 @@ static const TypeInfo sdhci_bus_info = {
 
 /* --- qdev i.MX eSDHC --- */
 
-#define ESDHC_MIX_CTRL                  0x48
+#define USDHC_MIX_CTRL                  0x48
 
-#define ESDHC_VENDOR_SPEC               0xc0
-#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
+#define USDHC_VENDOR_SPEC               0xc0
+#define USDHC_IMX_FRC_SDCLK_ON          (1 << 8)
 
-#define ESDHC_DLL_CTRL                  0x60
+#define USDHC_DLL_CTRL                  0x60
 
-#define ESDHC_TUNING_CTRL               0xcc
-#define ESDHC_TUNE_CTRL_STATUS          0x68
-#define ESDHC_WTMK_LVL                  0x44
+#define USDHC_TUNING_CTRL               0xcc
+#define USDHC_TUNE_CTRL_STATUS          0x68
+#define USDHC_WTMK_LVL                  0x44
 
 /* Undocumented register used by guests working around erratum ERR004536 */
-#define ESDHC_UNDOCUMENTED_REG27        0x6c
+#define USDHC_UNDOCUMENTED_REG27        0x6c
 
-#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
-#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
+#define USDHC_CTRL_4BITBUS              (0x1 << 1)
+#define USDHC_CTRL_8BITBUS              (0x2 << 1)
 
-#define ESDHC_PRNSTS_SDSTB              (1 << 3)
+#define USDHC_PRNSTS_SDSTB              (1 << 3)
 
 static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 {
@@ -1615,11 +1615,11 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
         hostctl1 = SDHC_DMA_TYPE(s->hostctl1) << (8 - 3);
 
         if (s->hostctl1 & SDHC_CTRL_8BITBUS) {
-            hostctl1 |= ESDHC_CTRL_8BITBUS;
+            hostctl1 |= USDHC_CTRL_8BITBUS;
         }
 
         if (s->hostctl1 & SDHC_CTRL_4BITBUS) {
-            hostctl1 |= ESDHC_CTRL_4BITBUS;
+            hostctl1 |= USDHC_CTRL_4BITBUS;
         }
 
         ret  = hostctl1;
@@ -1630,21 +1630,21 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 
     case SDHC_PRNSTS:
         /* Add SDSTB (SD Clock Stable) bit to PRNSTS */
-        ret = sdhci_read(opaque, offset, size) & ~ESDHC_PRNSTS_SDSTB;
+        ret = sdhci_read(opaque, offset, size) & ~USDHC_PRNSTS_SDSTB;
         if (s->clkcon & SDHC_CLOCK_INT_STABLE) {
-            ret |= ESDHC_PRNSTS_SDSTB;
+            ret |= USDHC_PRNSTS_SDSTB;
         }
         break;
 
-    case ESDHC_VENDOR_SPEC:
+    case USDHC_VENDOR_SPEC:
         ret = s->vendor_spec;
         break;
-    case ESDHC_DLL_CTRL:
-    case ESDHC_TUNE_CTRL_STATUS:
-    case ESDHC_UNDOCUMENTED_REG27:
-    case ESDHC_TUNING_CTRL:
-    case ESDHC_MIX_CTRL:
-    case ESDHC_WTMK_LVL:
+    case USDHC_DLL_CTRL:
+    case USDHC_TUNE_CTRL_STATUS:
+    case USDHC_UNDOCUMENTED_REG27:
+    case USDHC_TUNING_CTRL:
+    case USDHC_MIX_CTRL:
+    case USDHC_WTMK_LVL:
         ret = 0;
         break;
     }
@@ -1660,18 +1660,18 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
     uint32_t value = (uint32_t)val;
 
     switch (offset) {
-    case ESDHC_DLL_CTRL:
-    case ESDHC_TUNE_CTRL_STATUS:
-    case ESDHC_UNDOCUMENTED_REG27:
-    case ESDHC_TUNING_CTRL:
-    case ESDHC_WTMK_LVL:
+    case USDHC_DLL_CTRL:
+    case USDHC_TUNE_CTRL_STATUS:
+    case USDHC_UNDOCUMENTED_REG27:
+    case USDHC_TUNING_CTRL:
+    case USDHC_WTMK_LVL:
         break;
 
-    case ESDHC_VENDOR_SPEC:
+    case USDHC_VENDOR_SPEC:
         s->vendor_spec = value;
         switch (s->vendor) {
         case SDHCI_VENDOR_IMX:
-            if (value & ESDHC_IMX_FRC_SDCLK_ON) {
+            if (value & USDHC_IMX_FRC_SDCLK_ON) {
                 s->prnsts &= ~SDHC_IMX_CLOCK_GATE_OFF;
             } else {
                 s->prnsts |= SDHC_IMX_CLOCK_GATE_OFF;
@@ -1740,12 +1740,12 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
          * Second, split "Data Transfer Width" from bits 2 and 1 in to
          * bits 5 and 1
          */
-        if (value & ESDHC_CTRL_8BITBUS) {
+        if (value & USDHC_CTRL_8BITBUS) {
             hostctl1 |= SDHC_CTRL_8BITBUS;
         }
 
-        if (value & ESDHC_CTRL_4BITBUS) {
-            hostctl1 |= ESDHC_CTRL_4BITBUS;
+        if (value & USDHC_CTRL_4BITBUS) {
+            hostctl1 |= USDHC_CTRL_4BITBUS;
         }
 
         /*
@@ -1768,7 +1768,7 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         sdhci_write(opaque, offset, value, size);
         break;
 
-    case ESDHC_MIX_CTRL:
+    case USDHC_MIX_CTRL:
         /*
          * So, when SD/MMC stack in Linux tries to write to "Transfer
          * Mode Register", ESDHC i.MX quirk code will translate it
-- 
2.37.3


