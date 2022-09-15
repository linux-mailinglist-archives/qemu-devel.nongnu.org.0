Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64C5B9F21
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:45:26 +0200 (CEST)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYr3L-0006Nx-K5
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqki-0008Jq-AG; Thu, 15 Sep 2022 11:26:08 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkg-0007Lp-9f; Thu, 15 Sep 2022 11:26:07 -0400
Received: by mail-ej1-x631.google.com with SMTP id bj12so42886861ejb.13;
 Thu, 15 Sep 2022 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4GXJGtF4gc7oDEAKUu6qf0IozYzFOQ6xbAVhEv/8NJg=;
 b=iVXJjkRvPsJQgMxaiFhEETcZbu3AT9+uqDxvdjbE5j6sKmKgakin6EaNyePBMFhoJ/
 /DNEgY7Wxhq2CyeC8iAFfGtcqKmEuZp8QSGD+9+/ZjkmCtQFTQjIF5O8ghVqreZPbJtK
 vnlcyWk8cDXP7N4ZQpfbl13FIEVqgv7tFGQq+X2/0yUgvaKjubWK6F80V7fX+tiy6OXU
 vW9BdnAj9hGVJCAOx+M/qa5nYGKahUVDlFrqgQ+9QPpkxjmtC3KaphQn5uIZb9BN2VMD
 pvgdkYX6rGpTiiI6OLm1JNxdt1yDOyBnysdXP3JHWUGbwsJ0okbdFq+jyS93D+LQLX2n
 4v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4GXJGtF4gc7oDEAKUu6qf0IozYzFOQ6xbAVhEv/8NJg=;
 b=heCFOs9O39O6eh+2lsO5Je4cQOqRAa1PRGSwlofGDbfiDISoy1k20n/FWYGsWFIugJ
 G1XUFZfRslPkygah3MEDjYZmXKfZqlvutUHH1A+/up3B9k/6UTHZe+ci/akSt+uz7Hr3
 qO1lTitnHcgpQdMdJPRfWPt+H8Fzzuvl5TiUTvZvRWaM2hQZVRV9u4TZEo+DsiJj/sZZ
 HPBraxMTFNckssJOJUPtW0MSiCtjHt3qCejsf8C8vCGp4OKbWClFaZTXKZycRuvgGueh
 jvJpvnIxe1MQDz8NdrQd5QYzoinK8D5XQw2SHM/1eDD3w5F4QdFMmEEAfgErjXH90c7o
 UTCw==
X-Gm-Message-State: ACrzQf3qR4wdUiX9bBBq6Nhd8Bb3hQKNmT/AKV0cnEw8zKMYQ5jSPsZL
 FAr5wn1daCWSVQ6ZXjsdCmKrb9Op0Dk=
X-Google-Smtp-Source: AMsMyM49BSmHuwEpOcmMdpdCS0rNiVo5zlwhLQYAXaHojoxVm5aLLpex2Ft63vv3aFgPu/cUAJhV9g==
X-Received: by 2002:a17:907:2710:b0:773:dd39:6344 with SMTP id
 w16-20020a170907271000b00773dd396344mr341052ejk.411.1663255564070; 
 Thu, 15 Sep 2022 08:26:04 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:26:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 09/11] hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
Date: Thu, 15 Sep 2022 17:25:18 +0200
Message-Id: <20220915152520.21948-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device model's functions start with "usdhc_", so rename the defines
accordingly for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sdhci.c | 68 +++++++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 6da5e2c781..7a5996caad 100644
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
@@ -1768,11 +1768,11 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         sdhci_write(opaque, offset, value, size);
         break;
 
-    case ESDHC_MIX_CTRL:
+    case USDHC_MIX_CTRL:
         /*
          * So, when SD/MMC stack in Linux tries to write to "Transfer
          * Mode Register", ESDHC i.MX quirk code will translate it
-         * into a write to ESDHC_MIX_CTRL, so we do the opposite in
+         * into a write to USDHC_MIX_CTRL, so we do the opposite in
          * order to get where we started
          *
          * Note that Auto CMD23 Enable bit is located in a wrong place
-- 
2.37.3


