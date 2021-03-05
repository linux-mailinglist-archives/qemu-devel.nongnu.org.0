Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071232F234
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:12:53 +0100 (CET)
Received: from localhost ([::1]:35520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEwW-0001rj-Jj
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3Q-000702-Ag
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:56 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE35-0007a6-My
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:56 -0500
Received: by mail-wr1-x429.google.com with SMTP id u16so2901839wrt.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+q9e0i9GC/OP2UobMPPkkYRWXah3OTP+drH6/Buys24=;
 b=fH6ys/Oyh8qKAeSEGBox71vCOP1MMt8d9CmipXQXVj94qGQTXeKG93IDmrvi5oPCNR
 e4ygdfSZrD9GrhhExdGYrQxN8U3qXdH069xGHBXkYztlAJAo99GYrWQ1Gm7WhlmElRS9
 JJkYYzqiNLrO2yVkblY4o0rnwqPf8zxDdEaMCYUsxm9a3UxSdvr/pn0M+ertri7ph8GY
 72Q83919C7rLWDW/aJLWfaNjcY2qaMMvY4ZgcF1N0LQazWl4o4yXYGLhx7RjVZt46Pm5
 JE+COL4n+fe6lcHn1TF1EryMNkJ/kVEzrB6WVDLkAkm3sH6NfBt0dXrKozYtfz5X3HoH
 6fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+q9e0i9GC/OP2UobMPPkkYRWXah3OTP+drH6/Buys24=;
 b=t6nu6kbyRO/6aiUElhm6B8AHUWydMexJhy2P6QxAQFpdO2LNkJUCn6hHBvsO0R3mM+
 Yw32Nrhp/4QOfXlxDZfRz8rpSggjJmOzBNh0DKggt4TTmp5FyFiOELy+Ac4mOlC9sGyM
 zKbAUNKF3HGA+QD+kLLcAZsR3vQqSIgLXgw2kdvXgjfhu7a/u+7JeRa3JEMnrZC/+iZq
 LhZesFbs7ufzo1eLgdvsHdy/hXGXzX/33VYKpuD1sS0vqVlA0/ik30gGz+XuOnX3KoUN
 TNoGBCVpPHW3rX//g8iaSRnXTTNzZpyprWB6jO1HqV6C4q4Mj0Go6PnQlfo3RF3cUJtW
 4HNQ==
X-Gm-Message-State: AOAM532fQ71/1KScA2/gXk5Guh8yhw6L6PtaB/3A6MLFNSzT5UypvGz6
 rk02gzVhJg/FoeoGJWxpy/zmy1N/fjjlRg==
X-Google-Smtp-Source: ABdhPJzhm5T6VoLGtryLUjAY96aQQ8+UNFLWZdOS9amH2ePFHgSjz2NwdHMZamSWtS+ThbjB4JUCEg==
X-Received: by 2002:adf:f78f:: with SMTP id q15mr10062521wrp.383.1614964534010; 
 Fri, 05 Mar 2021 09:15:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/49] hw/display/omap_lcdc: Inline template header into C file
Date: Fri,  5 Mar 2021 17:14:49 +0000
Message-Id: <20210305171515.1038-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

We only include the template header once, so just inline it into the
source file for the device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210215103215.4944-9-peter.maydell@linaro.org
---
 hw/display/omap_lcd_template.h | 154 ---------------------------------
 hw/display/omap_lcdc.c         | 127 ++++++++++++++++++++++++++-
 2 files changed, 125 insertions(+), 156 deletions(-)
 delete mode 100644 hw/display/omap_lcd_template.h

diff --git a/hw/display/omap_lcd_template.h b/hw/display/omap_lcd_template.h
deleted file mode 100644
index a2f86eee3c8..00000000000
--- a/hw/display/omap_lcd_template.h
+++ /dev/null
@@ -1,154 +0,0 @@
-/*
- * QEMU OMAP LCD Emulator templates
- *
- * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in
- *    the documentation and/or other materials provided with the
- *    distribution.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
- * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
- * PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
- * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
- * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-/*
- * 2-bit colour
- */
-static void draw_line2_32(void *opaque, uint8_t *d, const uint8_t *s,
-                          int width, int deststep)
-{
-    uint16_t *pal = opaque;
-    uint8_t v, r, g, b;
-
-    do {
-        v = ldub_p((void *) s);
-        r = (pal[v & 3] >> 4) & 0xf0;
-        g = pal[v & 3] & 0xf0;
-        b = (pal[v & 3] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        v >>= 2;
-        r = (pal[v & 3] >> 4) & 0xf0;
-        g = pal[v & 3] & 0xf0;
-        b = (pal[v & 3] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        v >>= 2;
-        r = (pal[v & 3] >> 4) & 0xf0;
-        g = pal[v & 3] & 0xf0;
-        b = (pal[v & 3] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        v >>= 2;
-        r = (pal[v & 3] >> 4) & 0xf0;
-        g = pal[v & 3] & 0xf0;
-        b = (pal[v & 3] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        s++;
-        width -= 4;
-    } while (width > 0);
-}
-
-/*
- * 4-bit colour
- */
-static void draw_line4_32(void *opaque, uint8_t *d, const uint8_t *s,
-                          int width, int deststep)
-{
-    uint16_t *pal = opaque;
-    uint8_t v, r, g, b;
-
-    do {
-        v = ldub_p((void *) s);
-        r = (pal[v & 0xf] >> 4) & 0xf0;
-        g = pal[v & 0xf] & 0xf0;
-        b = (pal[v & 0xf] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        v >>= 4;
-        r = (pal[v & 0xf] >> 4) & 0xf0;
-        g = pal[v & 0xf] & 0xf0;
-        b = (pal[v & 0xf] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        s++;
-        width -= 2;
-    } while (width > 0);
-}
-
-/*
- * 8-bit colour
- */
-static void draw_line8_32(void *opaque, uint8_t *d, const uint8_t *s,
-                          int width, int deststep)
-{
-    uint16_t *pal = opaque;
-    uint8_t v, r, g, b;
-
-    do {
-        v = ldub_p((void *) s);
-        r = (pal[v] >> 4) & 0xf0;
-        g = pal[v] & 0xf0;
-        b = (pal[v] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        s++;
-        d += 4;
-    } while (-- width != 0);
-}
-
-/*
- * 12-bit colour
- */
-static void draw_line12_32(void *opaque, uint8_t *d, const uint8_t *s,
-                           int width, int deststep)
-{
-    uint16_t v;
-    uint8_t r, g, b;
-
-    do {
-        v = lduw_le_p((void *) s);
-        r = (v >> 4) & 0xf0;
-        g = v & 0xf0;
-        b = (v << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        s += 2;
-        d += 4;
-    } while (-- width != 0);
-}
-
-/*
- * 16-bit colour
- */
-static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
-                           int width, int deststep)
-{
-    uint16_t v;
-    uint8_t r, g, b;
-
-    do {
-        v = lduw_le_p((void *) s);
-        r = (v >> 8) & 0xf8;
-        g = (v >> 3) & 0xfc;
-        b = (v << 3) & 0xf8;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        s += 2;
-        d += 4;
-    } while (-- width != 0);
-}
diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 58e659c94ff..2db04fad2fc 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -72,8 +72,131 @@ static void omap_lcd_interrupts(struct omap_lcd_panel_s *s)
 
 #define draw_line_func drawfn
 
-#define DEPTH 32
-#include "omap_lcd_template.h"
+/*
+ * 2-bit colour
+ */
+static void draw_line2_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
+{
+    uint16_t *pal = opaque;
+    uint8_t v, r, g, b;
+
+    do {
+        v = ldub_p((void *) s);
+        r = (pal[v & 3] >> 4) & 0xf0;
+        g = pal[v & 3] & 0xf0;
+        b = (pal[v & 3] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        v >>= 2;
+        r = (pal[v & 3] >> 4) & 0xf0;
+        g = pal[v & 3] & 0xf0;
+        b = (pal[v & 3] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        v >>= 2;
+        r = (pal[v & 3] >> 4) & 0xf0;
+        g = pal[v & 3] & 0xf0;
+        b = (pal[v & 3] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        v >>= 2;
+        r = (pal[v & 3] >> 4) & 0xf0;
+        g = pal[v & 3] & 0xf0;
+        b = (pal[v & 3] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        s++;
+        width -= 4;
+    } while (width > 0);
+}
+
+/*
+ * 4-bit colour
+ */
+static void draw_line4_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
+{
+    uint16_t *pal = opaque;
+    uint8_t v, r, g, b;
+
+    do {
+        v = ldub_p((void *) s);
+        r = (pal[v & 0xf] >> 4) & 0xf0;
+        g = pal[v & 0xf] & 0xf0;
+        b = (pal[v & 0xf] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        v >>= 4;
+        r = (pal[v & 0xf] >> 4) & 0xf0;
+        g = pal[v & 0xf] & 0xf0;
+        b = (pal[v & 0xf] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        s++;
+        width -= 2;
+    } while (width > 0);
+}
+
+/*
+ * 8-bit colour
+ */
+static void draw_line8_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
+{
+    uint16_t *pal = opaque;
+    uint8_t v, r, g, b;
+
+    do {
+        v = ldub_p((void *) s);
+        r = (pal[v] >> 4) & 0xf0;
+        g = pal[v] & 0xf0;
+        b = (pal[v] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        s++;
+        d += 4;
+    } while (-- width != 0);
+}
+
+/*
+ * 12-bit colour
+ */
+static void draw_line12_32(void *opaque, uint8_t *d, const uint8_t *s,
+                           int width, int deststep)
+{
+    uint16_t v;
+    uint8_t r, g, b;
+
+    do {
+        v = lduw_le_p((void *) s);
+        r = (v >> 4) & 0xf0;
+        g = v & 0xf0;
+        b = (v << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        s += 2;
+        d += 4;
+    } while (-- width != 0);
+}
+
+/*
+ * 16-bit colour
+ */
+static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
+                           int width, int deststep)
+{
+    uint16_t v;
+    uint8_t r, g, b;
+
+    do {
+        v = lduw_le_p((void *) s);
+        r = (v >> 8) & 0xf8;
+        g = (v >> 3) & 0xfc;
+        b = (v << 3) & 0xf8;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        s += 2;
+        d += 4;
+    } while (-- width != 0);
+}
 
 static void omap_update_display(void *opaque)
 {
-- 
2.20.1


