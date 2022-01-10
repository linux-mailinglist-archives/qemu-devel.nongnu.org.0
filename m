Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC9489EB7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:59:17 +0100 (CET)
Received: from localhost ([::1]:59628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ywu-0006ks-BG
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:59:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6ypA-0007JK-LE
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:18 -0500
Received: from [2a00:1450:4864:20::535] (port=33374
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp9-000674-0j
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:16 -0500
Received: by mail-ed1-x535.google.com with SMTP id b13so3407988edn.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTKy8siX3ZvEgK7yJV+OZiBUEaj+t2LkaHStLMhE7OE=;
 b=Uz1FE/rJfxHoK3FIhcQiaDABKgRm4LnBMaochAjNlogvfhMhqAUslBwYbwtysmJ4A8
 VgQ2tOiyyyc9wVGvmPMdeZFWzAQqITeBJkJJvTHB6fH0tbFZV1qV0vidLNB+iSZO8fIj
 y0z8HKRIgIGbT8yPUocMXYMgH/XwYGIEKy0UTn7iO244nfyDDB83Sy979ucuUJpSy+md
 qMUD2sZbw+u0H82INGGhU/1P1sNoFGbSadVLDbSFrTa0bxCLpstEE38n6BkaBfh2r2Y4
 fvA/TDQeIl+fhRSV3vUAi31IAtCDT8GTlG/D5r7hcJYYgC//zQXHgIgNM5qTdc9kG/ff
 w+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTKy8siX3ZvEgK7yJV+OZiBUEaj+t2LkaHStLMhE7OE=;
 b=nGMr7LVbDin3Zrx5PhuS5AE6ZWhUQq+1gchLSSLkTWWx46aABsEgntMbC31NxhG5i+
 +9WW+at1UOSuf6PnRcqXbh3yhiDu0kAE+bqU1DllQ4pm9cHarF5kueMqCLkwgllCfJ4k
 PMWN4JvcByDj/5JmVPppp73XB8bDIslBu8UuuifRmHd6yh/o0oGlsMtVFOz86AmLgP+a
 0dG4ZeGlqhwoAFMyGo13XAnL5X9VdPQxKJwYYk/jzTewLPTV5iFg1B0I9f/e61GSrt4u
 fWSgnMi8t6MObZp8NmA9BW1s5HGi33C1h8uyr6sXC0Vn80/y+OuqzQjV69wAiTefummL
 S6SA==
X-Gm-Message-State: AOAM533OhwXW1UyVuHaLDNOCHBxcAQ82w2O11wZTCrUcoF1LEnZSdaiv
 3Vz+xFZynyIGzw0AqBI+YEnT8+jIWM/0iw==
X-Google-Smtp-Source: ABdhPJze2QQvtxOfZjTgqk9AHmAuQxsWGTabsA9wJ0iLN4qNnzwWHjmCSzEsBP0wpnuHnydRZgiBCg==
X-Received: by 2002:aa7:ccc7:: with SMTP id y7mr774786edt.96.1641837073706;
 Mon, 10 Jan 2022 09:51:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h10sm2686797ejx.115.2022.01.10.09.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:51:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC7141FFBD;
 Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  5/6] hw/arm: add mask boot ROM logic
Date: Mon, 10 Jan 2022 17:51:03 +0000
Message-Id: <20220110175104.2908956-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mask ROM contains the initial boot code to start the RP2040. It
also contains some common sub-routines as well as the flash
programming code for drag and drop programming. As a result we need to
ensure the full version is available to any user supplied programs we
might want to run.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/rp2040.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/arm/rp2040.c b/hw/arm/rp2040.c
index c6cc9b7165..9a5bc20159 100644
--- a/hw/arm/rp2040.c
+++ b/hw/arm/rp2040.c
@@ -8,10 +8,12 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/arm/armv7m.h"
 #include "hw/arm/rp2040.h"
 #include "hw/misc/unimp.h"
+#include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-properties.h"
 
@@ -33,6 +35,8 @@ typedef struct RP2040Class {
 #define RP2040_SRAM4_BASE 0x20040000
 #define RP2040_SRAM5_BASE 0x20041000
 
+#define RP2040_MASK_ROM   "pipico.rom"
+
 static void rp2040_init(Object *obj)
 {
     RP2040State *s = RP2040(obj);
@@ -61,6 +65,8 @@ static void rp2040_realize(DeviceState *dev, Error **errp)
     RP2040State *s = RP2040(dev);
     Object *obj = OBJECT(dev);
     int n;
+    g_autofree char *mask_rom = qemu_find_file(QEMU_FILE_TYPE_BIOS,
+                                               RP2040_MASK_ROM);
 
     if (!s->memory) {
         error_setg(errp, "%s: memory property was not set", __func__);
@@ -68,9 +74,20 @@ static void rp2040_realize(DeviceState *dev, Error **errp)
     }
 
     /* initialize internal 16 KB internal ROM */
-    memory_region_init_rom(&s->rom, obj, "rp2040.rom0", 16 * KiB, errp);
+    memory_region_init_rom(&s->rom, obj, "rp2040.rom", 16 * KiB, errp);
     memory_region_add_subregion(s->memory, 0, &s->rom);
 
+    if (!mask_rom) {
+        error_setg(errp, "%s: unable to find mask_rom %s",
+                   __func__, RP2040_MASK_ROM);
+        return;
+    }
+    n = load_image_targphys(mask_rom, 0x0, 16 * KiB);
+    if (n <= 0) {
+        error_setg(errp, "%s: failed to load mask rom image: %s",
+                   __func__, RP2040_MASK_ROM);
+    }
+
     /* SRAM (Main 256k bank + two 4k banks)*/
     memory_region_init_ram(&s->sram03, obj, "rp2040.sram03", 256 * KiB, errp);
     memory_region_add_subregion(s->memory, RP2040_SRAM_BASE, &s->sram03);
-- 
2.30.2


