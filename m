Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC97E6034D8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 23:21:48 +0200 (CEST)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oku1w-0002aU-D9
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 17:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjZ-00022K-B1; Tue, 18 Oct 2022 17:02:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjW-0003vo-Jy; Tue, 18 Oct 2022 17:02:44 -0400
Received: by mail-ej1-x62e.google.com with SMTP id ot12so35445289ejb.1;
 Tue, 18 Oct 2022 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XB8LzA+Xf7kj44ENBLw+h7JO3RpBY2E4p+/JbUGhS6k=;
 b=KSXtDaz1yKtQ6OhJgvLcHjDewmAO4KqUGF3L+43Aosae9yy86R5BQ4KzlYdw5vOBC5
 S45fjv3Sh2UA4HY6BCCoXfQ5P+T6BvyRLgUoNC/Su5m/kQBJ+dNSOuCjCYsw62KPSLo0
 15hAjkjavcnuWkL6jCNNuMsn28kuBC88yoImFBJ/7H2a+wgtUsJ87n/euoypV5QniMll
 3U3dXEU6rG58qtGxZX9WUMY5R52Za6CjiviQZxUT58XoDuCPYZlGbRk5YqLMm5ndJoqy
 ql7zfw8BWP+OE4VKsQGLSWBvDvPYZZVYVLH0ZCATyXjT0aNuBbvdEMxxWc5NAg2DVu1r
 9izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XB8LzA+Xf7kj44ENBLw+h7JO3RpBY2E4p+/JbUGhS6k=;
 b=gw42FUthNLWi5JTYo9UhELQE2lfhjfC90vJj/Tb7Op7uB3uvIxl08sTYCPOASc6YVM
 UbN/qn8UR3H4Rg7vg7KLGo3zGxX/qijIEHeVJICwU3kYxuzJeuxp5rPCaIiRGkMLeZVS
 rIrse8DWxt52LV6/VL5PU/OVqr7QsAcHqw0PnkB30sVA00v2ylCxnjGRpYa1O8ZqbsTQ
 AsCzfzay25/wjOi4NCMsCOgSEvCMQk7WMStjwnb2gbnBybfvgXIaUFZ4g/AgstU2wdg6
 7nS9Az1HK3z6l33XblnttcGYiXcAQibXYIzpnbDNAd+kgBLJIOWG86FukMHOeoFMtXZp
 7crw==
X-Gm-Message-State: ACrzQf15zaRnoOopELGaHMhLlCQlbjY9RAOMn7SGX1vizf8EFus6eFlb
 RnEHOecxtEIoKL7Vs94H8HrGtMFPtAg=
X-Google-Smtp-Source: AMsMyM47kWrAlHuh8bcJO6Onp1yxGULzN3lNOnUlf4u6MwSvsHEzBIJVKu2RqNcjubL/KFLf3vaTtQ==
X-Received: by 2002:a17:907:6288:b0:78d:ab30:c374 with SMTP id
 nd8-20020a170907628800b0078dab30c374mr4044804ejc.266.1666126959590; 
 Tue, 18 Oct 2022 14:02:39 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-012-048.78.54.pool.telefonica.de. [78.54.12.48])
 by smtp.gmail.com with ESMTPSA id
 fe7-20020a056402390700b004587c2b5048sm9407951edb.52.2022.10.18.14.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:02:39 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 4/7] hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
Date: Tue, 18 Oct 2022 23:01:43 +0200
Message-Id: <20221018210146.193159-5-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018210146.193159-1-shentey@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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
2.38.0


