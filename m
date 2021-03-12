Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311A338FD2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:23:51 +0100 (CET)
Received: from localhost ([::1]:48256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKihi-0002RY-0n
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDL-0003AW-5O
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:27 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD1-00025R-6B
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g25so3845554wmh.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fHr1vpuOMQOTQ65QYZu8B1aN6w62p2KHVZrXV6qd1+Y=;
 b=w16PGqBBloQSWItVndBRq78oUfBQTXhQsyOx7pDUZnP3ra+x6OigPdfz0nml3eN7mL
 Sg/irrbYekmZlNRSe/Xkde/OY3fzSv1pBDp5bc8VXR11BXQbUQLSLE3+3y7yK+Ay5X56
 una6qZfK9QpbMNTDXaPuMm6ZXQK342SPA+KTWUnc3itgzGpzmPcDbEzJ6b2TO43ljCre
 Ggcdt+qHNWaRY3jIWspUbsB9g88xZPRjyFU+Rp61Sq7yPEOpkl1hDHop3XtgcbWA4LtC
 bXH5O2UXYWOM+HWb+pVAJdMbR6hbeJgt35zstsxgXBVBKpHZGnCGT8SluQbjTB2AQ9q1
 Gt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHr1vpuOMQOTQ65QYZu8B1aN6w62p2KHVZrXV6qd1+Y=;
 b=p7/z2Nw442T8cNIblsx9CQ1HBP2kW9AQevDYhvfSUGHJ+5lAsL3X7V2njBIPyWqRwN
 52Rp0gquy8metF08xM7FJlco0fabPLrM3YVgi8DuXYxnVimJ6YiBmC2Mr4GYivhiB5XW
 /gT9bTL2qNvOMhh4x0jvwdhXodRsXMjMU70/I79Gx4iPQ3njsa6Q7I0RU4aZSFxUiHMv
 L4pmQvPTsishwQhP4XRMMxo6JFJG1EV+pfsuRZ9cuGWN8UfS2S8Iq3SPCm1HGIphQPcS
 X7BXmqWdRBnsKQ1Y84GcK7ge6UepI9GW1steQvwZE1SvJN1QU1CNzAUhV41mN2vM8VFe
 FtIw==
X-Gm-Message-State: AOAM531MyoelsOruWK43MpcSAAquSHR6xM8KkchhReNMJ9YSYKHOOCO0
 nrrvGQA8NzbYIwua4XkD4ED9vTKccTmv27aS
X-Google-Smtp-Source: ABdhPJyCM09OlKUREX4KjpFilceUmxVpeSMT/EKGtrgZmxCNRmMwfdhVmxIyfYj3vRxwWliDOYK7Fw==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr13262558wmk.101.1615557125710; 
 Fri, 12 Mar 2021 05:52:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/39] hw/display/pl110: Remove use of BITS from
 pl110_template.h
Date: Fri, 12 Mar 2021 13:51:34 +0000
Message-Id: <20210312135140.1099-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

BITS is always 32, so remove all uses of it from the template header,
by dropping the trailing '32' from the draw function names and
not constructing the name of rgb_to_pixel32() via the glue() macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210211141515.8755-4-peter.maydell@linaro.org
---
 hw/display/pl110_template.h |  20 +++----
 hw/display/pl110.c          | 113 ++++++++++++++++++------------------
 2 files changed, 65 insertions(+), 68 deletions(-)

diff --git a/hw/display/pl110_template.h b/hw/display/pl110_template.h
index 0d8471db636..877419aa817 100644
--- a/hw/display/pl110_template.h
+++ b/hw/display/pl110_template.h
@@ -14,18 +14,18 @@
 #endif
 
 #if ORDER == 0
-#define NAME glue(glue(lblp_, BORDER), BITS)
+#define NAME glue(lblp_, BORDER)
 #ifdef HOST_WORDS_BIGENDIAN
 #define SWAP_WORDS 1
 #endif
 #elif ORDER == 1
-#define NAME glue(glue(bbbp_, BORDER), BITS)
+#define NAME glue(bbbp_, BORDER)
 #ifndef HOST_WORDS_BIGENDIAN
 #define SWAP_WORDS 1
 #endif
 #else
 #define SWAP_PIXELS 1
-#define NAME glue(glue(lbbp_, BORDER), BITS)
+#define NAME glue(lbbp_, BORDER)
 #ifdef HOST_WORDS_BIGENDIAN
 #define SWAP_WORDS 1
 #endif
@@ -174,14 +174,14 @@ static void glue(pl110_draw_line16_,NAME)(void *opaque, uint8_t *d, const uint8_
         MSB = (data & 0x1f) << 3;
         data >>= 5;
 #endif
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
         LSB = (data & 0x1f) << 3;
         data >>= 5;
         g = (data & 0x3f) << 2;
         data >>= 6;
         MSB = (data & 0x1f) << 3;
         data >>= 5;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
 #undef MSB
 #undef LSB
         width -= 2;
@@ -211,7 +211,7 @@ static void glue(pl110_draw_line32_,NAME)(void *opaque, uint8_t *d, const uint8_
         g = (data >> 16) & 0xff;
         MSB = (data >> 8) & 0xff;
 #endif
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
 #undef MSB
 #undef LSB
         width--;
@@ -242,14 +242,14 @@ static void glue(pl110_draw_line16_555_,NAME)(void *opaque, uint8_t *d, const ui
         data >>= 5;
         MSB = (data & 0x1f) << 3;
         data >>= 5;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
         LSB = (data & 0x1f) << 3;
         data >>= 5;
         g = (data & 0x1f) << 3;
         data >>= 5;
         MSB = (data & 0x1f) << 3;
         data >>= 6;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
 #undef MSB
 #undef LSB
         width -= 2;
@@ -280,14 +280,14 @@ static void glue(pl110_draw_line12_,NAME)(void *opaque, uint8_t *d, const uint8_
         data >>= 4;
         MSB = (data & 0xf) << 4;
         data >>= 8;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
         LSB = (data & 0xf) << 4;
         data >>= 4;
         g = (data & 0xf) << 4;
         data >>= 4;
         MSB = (data & 0xf) << 4;
         data >>= 8;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
 #undef MSB
 #undef LSB
         width -= 2;
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index ce300662e8b..4bf15c1da51 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -123,7 +123,6 @@ static const unsigned char *idregs[] = {
     pl111_id
 };
 
-#define BITS 32
 #define COPY_PIXEL(to, from) do { *(uint32_t *)to = from; to += 4; } while (0)
 
 #undef RGB
@@ -145,65 +144,63 @@ static const unsigned char *idregs[] = {
 #include "pl110_template.h"
 #undef BORDER
 
-static drawfn pl110_draw_fn_32[48] = {
-    pl110_draw_line1_lblp_bgr32,
-    pl110_draw_line2_lblp_bgr32,
-    pl110_draw_line4_lblp_bgr32,
-    pl110_draw_line8_lblp_bgr32,
-    pl110_draw_line16_555_lblp_bgr32,
-    pl110_draw_line32_lblp_bgr32,
-    pl110_draw_line16_lblp_bgr32,
-    pl110_draw_line12_lblp_bgr32,
-
-    pl110_draw_line1_bbbp_bgr32,
-    pl110_draw_line2_bbbp_bgr32,
-    pl110_draw_line4_bbbp_bgr32,
-    pl110_draw_line8_bbbp_bgr32,
-    pl110_draw_line16_555_bbbp_bgr32,
-    pl110_draw_line32_bbbp_bgr32,
-    pl110_draw_line16_bbbp_bgr32,
-    pl110_draw_line12_bbbp_bgr32,
-
-    pl110_draw_line1_lbbp_bgr32,
-    pl110_draw_line2_lbbp_bgr32,
-    pl110_draw_line4_lbbp_bgr32,
-    pl110_draw_line8_lbbp_bgr32,
-    pl110_draw_line16_555_lbbp_bgr32,
-    pl110_draw_line32_lbbp_bgr32,
-    pl110_draw_line16_lbbp_bgr32,
-    pl110_draw_line12_lbbp_bgr32,
-
-    pl110_draw_line1_lblp_rgb32,
-    pl110_draw_line2_lblp_rgb32,
-    pl110_draw_line4_lblp_rgb32,
-    pl110_draw_line8_lblp_rgb32,
-    pl110_draw_line16_555_lblp_rgb32,
-    pl110_draw_line32_lblp_rgb32,
-    pl110_draw_line16_lblp_rgb32,
-    pl110_draw_line12_lblp_rgb32,
-
-    pl110_draw_line1_bbbp_rgb32,
-    pl110_draw_line2_bbbp_rgb32,
-    pl110_draw_line4_bbbp_rgb32,
-    pl110_draw_line8_bbbp_rgb32,
-    pl110_draw_line16_555_bbbp_rgb32,
-    pl110_draw_line32_bbbp_rgb32,
-    pl110_draw_line16_bbbp_rgb32,
-    pl110_draw_line12_bbbp_rgb32,
-
-    pl110_draw_line1_lbbp_rgb32,
-    pl110_draw_line2_lbbp_rgb32,
-    pl110_draw_line4_lbbp_rgb32,
-    pl110_draw_line8_lbbp_rgb32,
-    pl110_draw_line16_555_lbbp_rgb32,
-    pl110_draw_line32_lbbp_rgb32,
-    pl110_draw_line16_lbbp_rgb32,
-    pl110_draw_line12_lbbp_rgb32,
-};
-
-#undef BITS
 #undef COPY_PIXEL
 
+static drawfn pl110_draw_fn_32[48] = {
+    pl110_draw_line1_lblp_bgr,
+    pl110_draw_line2_lblp_bgr,
+    pl110_draw_line4_lblp_bgr,
+    pl110_draw_line8_lblp_bgr,
+    pl110_draw_line16_555_lblp_bgr,
+    pl110_draw_line32_lblp_bgr,
+    pl110_draw_line16_lblp_bgr,
+    pl110_draw_line12_lblp_bgr,
+
+    pl110_draw_line1_bbbp_bgr,
+    pl110_draw_line2_bbbp_bgr,
+    pl110_draw_line4_bbbp_bgr,
+    pl110_draw_line8_bbbp_bgr,
+    pl110_draw_line16_555_bbbp_bgr,
+    pl110_draw_line32_bbbp_bgr,
+    pl110_draw_line16_bbbp_bgr,
+    pl110_draw_line12_bbbp_bgr,
+
+    pl110_draw_line1_lbbp_bgr,
+    pl110_draw_line2_lbbp_bgr,
+    pl110_draw_line4_lbbp_bgr,
+    pl110_draw_line8_lbbp_bgr,
+    pl110_draw_line16_555_lbbp_bgr,
+    pl110_draw_line32_lbbp_bgr,
+    pl110_draw_line16_lbbp_bgr,
+    pl110_draw_line12_lbbp_bgr,
+
+    pl110_draw_line1_lblp_rgb,
+    pl110_draw_line2_lblp_rgb,
+    pl110_draw_line4_lblp_rgb,
+    pl110_draw_line8_lblp_rgb,
+    pl110_draw_line16_555_lblp_rgb,
+    pl110_draw_line32_lblp_rgb,
+    pl110_draw_line16_lblp_rgb,
+    pl110_draw_line12_lblp_rgb,
+
+    pl110_draw_line1_bbbp_rgb,
+    pl110_draw_line2_bbbp_rgb,
+    pl110_draw_line4_bbbp_rgb,
+    pl110_draw_line8_bbbp_rgb,
+    pl110_draw_line16_555_bbbp_rgb,
+    pl110_draw_line32_bbbp_rgb,
+    pl110_draw_line16_bbbp_rgb,
+    pl110_draw_line12_bbbp_rgb,
+
+    pl110_draw_line1_lbbp_rgb,
+    pl110_draw_line2_lbbp_rgb,
+    pl110_draw_line4_lbbp_rgb,
+    pl110_draw_line8_lbbp_rgb,
+    pl110_draw_line16_555_lbbp_rgb,
+    pl110_draw_line32_lbbp_rgb,
+    pl110_draw_line16_lbbp_rgb,
+    pl110_draw_line12_lbbp_rgb,
+};
 
 static int pl110_enabled(PL110State *s)
 {
-- 
2.20.1


