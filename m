Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91996322FF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6S9-00055V-NZ; Mon, 21 Nov 2022 08:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Ri-0004sy-FF
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Rg-0007R5-7y
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id l14so865912wrw.13
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 05:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/fy3otxZw6ZE+oTlIk3wvPM0q4nusXxE65lb2YK8oD0=;
 b=yqOc0S5cXBvQgEkH+qa96NPz8VTW8MFBRWUibWYM8XCUAwqZVKfENnZacduBbPKv1y
 n2ck2Hnh1QdeshJtmWd5202qqJEq0CkxkCMAdHls0mWSrMgppDW9mbOBJDuPiQZOsvW+
 Z2rz0PWFYnp5fe0Te6QL2kQ/iMNf8xPNJClrF9r8U7QItt4dGKs+aR+B/ChGPAs2rh+4
 533XB44av4IeLtc4nT28t3uB4TwKMUdueTW2pN946hpiqPFg22/oONUfm3piee2R94iw
 F1iM0LkwU0EwYg1QDWy3Tr9xJ5ikLboVPtJgWbfYzCRDwskiY311lPvhqNuZoDHozKk4
 XhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fy3otxZw6ZE+oTlIk3wvPM0q4nusXxE65lb2YK8oD0=;
 b=kdPMaWmyIoBsQagvkdEeuZV3a+pRVl4+kBPHt2aZumezXtqUZGC7Xbkd0fkEp7G3sJ
 S22Qv+l8YS0w3FuixZxLF+iyiimxVrn/EuMoWOacd5LK8EXnDdk2cLsQt0+HS22Ap9zo
 QoN61iepOO2mOCzjp0XP+tmKAwzcq+4Qq7ZTYwU0tQUXni0bsgMN7PDrAvInOk4ro/yo
 S7khCKrIu/MN4o2uDm+EHwiK1LfMqMifS5yn0y5Eacw9R0IZGHwqqRjl081IdgL3bPrz
 GhVNU01LhJFMlACDyCrXh4zUM3aLfDGKBK5eJEmsKhUHx6Ft9QDkni0M6HRiUUAHK6R/
 cmGg==
X-Gm-Message-State: ANoB5pnq2zYNpm5bXJ0731YHHAFG/03ko9JK93P9Fm9VgxvCzNM8d8SO
 lZr4112prsqEyiRvhb+p9IJf8OAm9yo3/w==
X-Google-Smtp-Source: AA0mqf6piFIrdde/YFJww6y2vOGslrCLlnzBkQAKF+s5Cyga2kiSTA2PNjfA9KQebnNrjM3j4GGCZA==
X-Received: by 2002:a5d:624c:0:b0:241:c4d2:259 with SMTP id
 m12-20020a5d624c000000b00241c4d20259mr3206772wrv.539.1669035761997; 
 Mon, 21 Nov 2022 05:02:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003cf4d99fd2asm13296725wmi.6.2022.11.21.05.02.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 05:02:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/sd: Fix sun4i allwinner-sdhost for U-Boot
Date: Mon, 21 Nov 2022 13:02:35 +0000
Message-Id: <20221121130239.1138631-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121130239.1138631-1-peter.maydell@linaro.org>
References: <20221121130239.1138631-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

Trying to run U-Boot for Cubieboard (Allwinner A10) fails because it cannot
access SD card. The problem is that FIFO register in current
allwinner-sdhost implementation is at the address corresponding to
Allwinner H3, but not A10.
Linux kernel is not affected since Linux driver uses DMA access and does
not use FIFO register for reading/writing.

This patch adds new class parameter `is_sun4i` and based on that
parameter uses register at offset 0x100 either as FIFO register (if
sun4i) or as threshold register (if not sun4i; in this case register at
0x200 is FIFO register).

Tested with U-Boot and Linux kernel image built for Cubieboard and
OrangePi PC.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221112214900.24152-1-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/sd/allwinner-sdhost.h |  1 +
 hw/sd/allwinner-sdhost.c         | 67 ++++++++++++++++++++++----------
 2 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/include/hw/sd/allwinner-sdhost.h b/include/hw/sd/allwinner-sdhost.h
index bfe08ff4ef2..30c1e604041 100644
--- a/include/hw/sd/allwinner-sdhost.h
+++ b/include/hw/sd/allwinner-sdhost.h
@@ -130,6 +130,7 @@ struct AwSdHostClass {
 
     /** Maximum buffer size in bytes per DMA descriptor */
     size_t max_desc_size;
+    bool   is_sun4i;
 
 };
 
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 455d6eabf64..51e5e908307 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -65,7 +65,7 @@ enum {
     REG_SD_DLBA       = 0x84,  /* Descriptor List Base Address */
     REG_SD_IDST       = 0x88,  /* Internal DMA Controller Status */
     REG_SD_IDIE       = 0x8C,  /* Internal DMA Controller IRQ Enable */
-    REG_SD_THLDC      = 0x100, /* Card Threshold Control */
+    REG_SD_THLDC      = 0x100, /* Card Threshold Control / FIFO (sun4i only)*/
     REG_SD_DSBD       = 0x10C, /* eMMC DDR Start Bit Detection Control */
     REG_SD_RES_CRC    = 0x110, /* Response CRC from card/eMMC */
     REG_SD_DATA7_CRC  = 0x114, /* CRC Data 7 from card/eMMC */
@@ -415,10 +415,29 @@ static void allwinner_sdhost_dma(AwSdHostState *s)
     }
 }
 
+static uint32_t allwinner_sdhost_fifo_read(AwSdHostState *s)
+{
+    uint32_t res = 0;
+
+    if (sdbus_data_ready(&s->sdbus)) {
+        sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
+        le32_to_cpus(&res);
+        allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
+        allwinner_sdhost_auto_stop(s);
+        allwinner_sdhost_update_irq(s);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
+                      __func__);
+    }
+
+    return res;
+}
+
 static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
                                       unsigned size)
 {
     AwSdHostState *s = AW_SDHOST(opaque);
+    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
     uint32_t res = 0;
 
     switch (offset) {
@@ -508,8 +527,12 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
     case REG_SD_IDIE:      /* Internal DMA Controller Interrupt Enable */
         res = s->dmac_irq;
         break;
-    case REG_SD_THLDC:     /* Card Threshold Control */
-        res = s->card_threshold;
+    case REG_SD_THLDC:     /* Card Threshold Control or FIFO register (sun4i) */
+        if (sc->is_sun4i) {
+            res = allwinner_sdhost_fifo_read(s);
+        } else {
+            res = s->card_threshold;
+        }
         break;
     case REG_SD_DSBD:      /* eMMC DDR Start Bit Detection Control */
         res = s->startbit_detect;
@@ -531,16 +554,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
         res = s->status_crc;
         break;
     case REG_SD_FIFO:      /* Read/Write FIFO */
-        if (sdbus_data_ready(&s->sdbus)) {
-            sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
-            le32_to_cpus(&res);
-            allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
-            allwinner_sdhost_auto_stop(s);
-            allwinner_sdhost_update_irq(s);
-        } else {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
-                          __func__);
-        }
+        res = allwinner_sdhost_fifo_read(s);
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
@@ -553,11 +567,20 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
     return res;
 }
 
+static void allwinner_sdhost_fifo_write(AwSdHostState *s, uint64_t value)
+{
+    uint32_t u32 = cpu_to_le32(value);
+    sdbus_write_data(&s->sdbus, &u32, sizeof(u32));
+    allwinner_sdhost_update_transfer_cnt(s, sizeof(u32));
+    allwinner_sdhost_auto_stop(s);
+    allwinner_sdhost_update_irq(s);
+}
+
 static void allwinner_sdhost_write(void *opaque, hwaddr offset,
                                    uint64_t value, unsigned size)
 {
     AwSdHostState *s = AW_SDHOST(opaque);
-    uint32_t u32;
+    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
 
     trace_allwinner_sdhost_write(offset, value, size);
 
@@ -657,18 +680,18 @@ static void allwinner_sdhost_write(void *opaque, hwaddr offset,
         s->dmac_irq = value;
         allwinner_sdhost_update_irq(s);
         break;
-    case REG_SD_THLDC:     /* Card Threshold Control */
-        s->card_threshold = value;
+    case REG_SD_THLDC:     /* Card Threshold Control or FIFO (sun4i) */
+        if (sc->is_sun4i) {
+            allwinner_sdhost_fifo_write(s, value);
+        } else {
+            s->card_threshold = value;
+        }
         break;
     case REG_SD_DSBD:      /* eMMC DDR Start Bit Detection Control */
         s->startbit_detect = value;
         break;
     case REG_SD_FIFO:      /* Read/Write FIFO */
-        u32 = cpu_to_le32(value);
-        sdbus_write_data(&s->sdbus, &u32, sizeof(u32));
-        allwinner_sdhost_update_transfer_cnt(s, sizeof(u32));
-        allwinner_sdhost_auto_stop(s);
-        allwinner_sdhost_update_irq(s);
+        allwinner_sdhost_fifo_write(s, value);
         break;
     case REG_SD_RES_CRC:   /* Response CRC from card/eMMC */
     case REG_SD_DATA7_CRC: /* CRC Data 7 from card/eMMC */
@@ -834,12 +857,14 @@ static void allwinner_sdhost_sun4i_class_init(ObjectClass *klass, void *data)
 {
     AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
     sc->max_desc_size = 8 * KiB;
+    sc->is_sun4i = true;
 }
 
 static void allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
 {
     AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
     sc->max_desc_size = 64 * KiB;
+    sc->is_sun4i = false;
 }
 
 static const TypeInfo allwinner_sdhost_info = {
-- 
2.25.1


