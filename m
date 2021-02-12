Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973031A444
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:10:42 +0100 (CET)
Received: from localhost ([::1]:52248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lActt-0006md-9f
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAcqM-0003cj-M0
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:07:02 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAcqJ-0006oR-H1
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:07:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id r21so207926wrr.9
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ai+Nv00G+UkxOY0NuQZOVchZP4AMA4mKhBPSbBzlfiQ=;
 b=muOQCRcQSUz/QFn1BxZvOmFen+/DjGVFzudX0GaTISOsl95vblJNTCxS9sE/tRXjwh
 GT+8WPgmbAHBUioU/4d3SshS8eP3quD+AhYs3iudgCfzg1RwCyqpDRuxFxkT6IBcK8Ov
 uTsZPY1qqHSk3Jo8lo9xpNuJ0TmJ/4W1X64yIlVJSGm7EzFq7o/EHYL0JBYyhPbgBu4e
 Zb5qqxpnfDyVPdE3GjtAe7FEK6PZIhtXjX6jhVtgwy0icdXT5JDLUNnTMOgd5M67RbEO
 slw6J6/SRegIIS2HMpKFuOAbAFPVojUgdbZXq0mFN75KVqJPJy1MQbF29u1mjsABSahB
 tooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ai+Nv00G+UkxOY0NuQZOVchZP4AMA4mKhBPSbBzlfiQ=;
 b=Q3dHLe8wPOEGz2zDLMy6vBcUcPs3KjaV1PrYfrVgfkHus5q0+SMa8cvjYS8yiF0Bj/
 YtsyHmAHqlJsG89q0JQKpfT1/h2VB3j20jsJ5iS8TMoc029Yn1jzRgLqN5nqRRlrl5Pv
 Vmb71v7c9JPXRGCmGYqUXi7ak1dTuxCJJcUYkynrLhhI6NlwB9fuGR6ss1Vs47LbqPK6
 XO3MWJ8G4hU7kw/2rJhwgU/bujnRiZXts0QFnnuPiCDQKIufu2zeFuuj50DN3LUZaTu1
 zq5JcyQ87JRfxXCSLXL4T10oBmSfHoaf3DYEZcvw/G2kEWN4i8jMjgiUGjQz+yDkUk5c
 uqYQ==
X-Gm-Message-State: AOAM530NABC2fzEhb2QTpkPVV7QfXFyFnSETRPJKJUr7auka4Csc5038
 QSEZNpNfY2sFolgXz9eF10ZFwyU8dJP3jA==
X-Google-Smtp-Source: ABdhPJxdlttTnI7BxdwilfJUA/LBuRMNR2AZpumw2rjwzB1k9+8tM2wp93ykeIdKfKO8RDpFxoVUnQ==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr4776936wrt.365.1613153218176; 
 Fri, 12 Feb 2021 10:06:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f6sm14022372wmq.33.2021.02.12.10.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:06:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/display/sm501: Inline template header into C file
Date: Fri, 12 Feb 2021 18:06:53 +0000
Message-Id: <20210212180653.27588-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210212180653.27588-1-peter.maydell@linaro.org>
References: <20210212180653.27588-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We no longer need to include sm501_template.h multiple times, so
we can simply inline its contents into sm501.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/sm501_template.h | 105 ------------------------------------
 hw/display/sm501.c          |  83 +++++++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 107 deletions(-)
 delete mode 100644 hw/display/sm501_template.h

diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
deleted file mode 100644
index 28537a05d95..00000000000
--- a/hw/display/sm501_template.h
+++ /dev/null
@@ -1,105 +0,0 @@
-/*
- * Pixel drawing function templates for QEMU SM501 Device
- *
- * Copyright (c) 2008 Shin-ichiro KAWASAKI
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-static void draw_line8_32(uint8_t *d, const uint8_t *s, int width,
-                          const uint32_t *pal)
-{
-    uint8_t v, r, g, b;
-    do {
-        v = ldub_p(s);
-        r = (pal[v] >> 16) & 0xff;
-        g = (pal[v] >>  8) & 0xff;
-        b = (pal[v] >>  0) & 0xff;
-        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-        s++;
-        d += 4;
-    } while (--width != 0);
-}
-
-static void draw_line16_32(uint8_t *d, const uint8_t *s, int width,
-                           const uint32_t *pal)
-{
-    uint16_t rgb565;
-    uint8_t r, g, b;
-
-    do {
-        rgb565 = lduw_le_p(s);
-        r = (rgb565 >> 8) & 0xf8;
-        g = (rgb565 >> 3) & 0xfc;
-        b = (rgb565 << 3) & 0xf8;
-        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-        s += 2;
-        d += 4;
-    } while (--width != 0);
-}
-
-static void draw_line32_32(uint8_t *d, const uint8_t *s, int width,
-                           const uint32_t *pal)
-{
-    uint8_t r, g, b;
-
-    do {
-        r = s[2];
-        g = s[1];
-        b = s[0];
-        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-        s += 4;
-        d += 4;
-    } while (--width != 0);
-}
-
-/**
- * Draw hardware cursor image on the given line.
- */
-static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
-                             const uint8_t *palette, int c_x, int c_y)
-{
-    int i;
-    uint8_t r, g, b, v, bitset = 0;
-
-    /* get cursor position */
-    assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
-    s += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
-    d += c_x * 4;
-
-    for (i = 0; i < SM501_HWC_WIDTH && c_x + i < width; i++) {
-        /* get pixel value */
-        if (i % 4 == 0) {
-            bitset = ldub_p(s);
-            s++;
-        }
-        v = bitset & 3;
-        bitset >>= 2;
-
-        /* write pixel */
-        if (v) {
-            v--;
-            r = palette[v * 3 + 0];
-            g = palette[v * 3 + 1];
-            b = palette[v * 3 + 2];
-            *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-        }
-        d += 4;
-    }
-}
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index aba447c18b3..8789722ef27 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1558,8 +1558,87 @@ typedef void draw_hwc_line_func(uint8_t *d, const uint8_t *s,
                                 int width, const uint8_t *palette,
                                 int c_x, int c_y);
 
-#define DEPTH 32
-#include "sm501_template.h"
+static void draw_line8_32(uint8_t *d, const uint8_t *s, int width,
+                          const uint32_t *pal)
+{
+    uint8_t v, r, g, b;
+    do {
+        v = ldub_p(s);
+        r = (pal[v] >> 16) & 0xff;
+        g = (pal[v] >>  8) & 0xff;
+        b = (pal[v] >>  0) & 0xff;
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
+        s++;
+        d += 4;
+    } while (--width != 0);
+}
+
+static void draw_line16_32(uint8_t *d, const uint8_t *s, int width,
+                           const uint32_t *pal)
+{
+    uint16_t rgb565;
+    uint8_t r, g, b;
+
+    do {
+        rgb565 = lduw_le_p(s);
+        r = (rgb565 >> 8) & 0xf8;
+        g = (rgb565 >> 3) & 0xfc;
+        b = (rgb565 << 3) & 0xf8;
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
+        s += 2;
+        d += 4;
+    } while (--width != 0);
+}
+
+static void draw_line32_32(uint8_t *d, const uint8_t *s, int width,
+                           const uint32_t *pal)
+{
+    uint8_t r, g, b;
+
+    do {
+        r = s[2];
+        g = s[1];
+        b = s[0];
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
+        s += 4;
+        d += 4;
+    } while (--width != 0);
+}
+
+/**
+ * Draw hardware cursor image on the given line.
+ */
+static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
+                             const uint8_t *palette, int c_x, int c_y)
+{
+    int i;
+    uint8_t r, g, b, v, bitset = 0;
+
+    /* get cursor position */
+    assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
+    s += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
+    d += c_x * 4;
+
+    for (i = 0; i < SM501_HWC_WIDTH && c_x + i < width; i++) {
+        /* get pixel value */
+        if (i % 4 == 0) {
+            bitset = ldub_p(s);
+            s++;
+        }
+        v = bitset & 3;
+        bitset >>= 2;
+
+        /* write pixel */
+        if (v) {
+            v--;
+            r = palette[v * 3 + 0];
+            g = palette[v * 3 + 1];
+            b = palette[v * 3 + 2];
+            *(uint32_t *)d = rgb_to_pixel32(r, g, b);
+        }
+        d += 4;
+    }
+}
 
 static void sm501_update_display(void *opaque)
 {
-- 
2.20.1


