Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDFE31A43C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:08:49 +0100 (CET)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcs4-0004re-Nz
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAcqL-0003ZA-7W
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:07:01 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAcqI-0006nu-I2
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:07:00 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so271293wry.2
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2l9dgSgtUlgDBBjn+Oogyt/oRX3z8AEyaWXXJBCSvg=;
 b=sCS93HUErnihU8YG/K5LbHZcC+ELByaLXCvynayIuOxKmYc3z6Z1SSzJco+MWUZ7jG
 QppTLNjFzD2oWDSZmuvTovvpJEIGF6L4qhrV3djte/X9Gwbis6WC7zNBhyqpph9eYmKD
 bkhGQApVWU6WpplPvPbZZ5naVJcdLUABmWw0AnWVUd/YdpXZbEdzVIMajzFidNDN/nB+
 vEc8mvgSxuXZxI4289u5MgpwMcrEY/FaQHU4CkYL8VV1HWzlYUtmJFuN2Ev167aWSvDV
 879DGZ4yz1SgYb9R3XoL/cmG/O4COjQJ/94OeHEv0YInko0Zq7HZ5QZdYW9jXx285vos
 74pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2l9dgSgtUlgDBBjn+Oogyt/oRX3z8AEyaWXXJBCSvg=;
 b=gBW5mHMF0XynURkKpV0kXD4sdd2yPsLg5X2AZzcISV7YaecxHqKh8Ax5SddgMzaRk/
 YvFPWyxdM00NWk9aUhos29aUizYPib+Ln3LA/exep87Acs5cTWJ5QpeSNqM3yv6OO+jx
 +3lfMTjcg3pjlDhlr0+KZ2oTJNZgg4yGcOyy4dEBiOHeRDbLaBcHZbvb34BFzLeGSAwc
 eq+ttXjGfLiIXBw/i+M8yagbAiUepe80z+O2LKe2vqX3a46u414sqq/5I0z0jyLGwfTE
 0lJbZFh2Xy6qKyLQfYKSiP+GfwiTkYShEHYij4+EQnEwBOX5gcRlYVlGdrbJUmvSc7xI
 DRaQ==
X-Gm-Message-State: AOAM5311AotTLrt1xhXhv7ZhtGkHnGnnDXZGNjd4rLEBQ/PYBKyZuRDS
 BYX47Y3+wYyH7egzd1VjFSNFj+EYqUyQyw==
X-Google-Smtp-Source: ABdhPJyiKEmDPJItLUSTXMVnpoJtWxR+pIEt5j44E5H/UHRLDFZt+5CVwL226f9BNr38vkRFVMza7g==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr4893769wrw.52.1613153217261; 
 Fri, 12 Feb 2021 10:06:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f6sm14022372wmq.33.2021.02.12.10.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:06:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/display/sm501: Expand out macros in template header
Date: Fri, 12 Feb 2021 18:06:52 +0000
Message-Id: <20210212180653.27588-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210212180653.27588-1-peter.maydell@linaro.org>
References: <20210212180653.27588-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we only include sm501_template.h for the DEPTH==32 case, we
can expand out the uses of the BPP, PIXEL_TYPE and PIXEL_NAME macros
in that header.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/sm501_template.h | 60 +++++++++++--------------------------
 1 file changed, 17 insertions(+), 43 deletions(-)

diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
index a60abad019c..28537a05d95 100644
--- a/hw/display/sm501_template.h
+++ b/hw/display/sm501_template.h
@@ -22,28 +22,8 @@
  * THE SOFTWARE.
  */
 
-#if DEPTH == 8
-#define BPP 1
-#define PIXEL_TYPE uint8_t
-#elif DEPTH == 15 || DEPTH == 16
-#define BPP 2
-#define PIXEL_TYPE uint16_t
-#elif DEPTH == 32
-#define BPP 4
-#define PIXEL_TYPE uint32_t
-#else
-#error unsupport depth
-#endif
-
-#ifdef BGR_FORMAT
-#define PIXEL_NAME glue(DEPTH, bgr)
-#else
-#define PIXEL_NAME DEPTH
-#endif /* BGR_FORMAT */
-
-
-static void glue(draw_line8_, PIXEL_NAME)(
-                 uint8_t *d, const uint8_t *s, int width, const uint32_t *pal)
+static void draw_line8_32(uint8_t *d, const uint8_t *s, int width,
+                          const uint32_t *pal)
 {
     uint8_t v, r, g, b;
     do {
@@ -51,14 +31,14 @@ static void glue(draw_line8_, PIXEL_NAME)(
         r = (pal[v] >> 16) & 0xff;
         g = (pal[v] >>  8) & 0xff;
         b = (pal[v] >>  0) & 0xff;
-        *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         s++;
-        d += BPP;
+        d += 4;
     } while (--width != 0);
 }
 
-static void glue(draw_line16_, PIXEL_NAME)(
-                 uint8_t *d, const uint8_t *s, int width, const uint32_t *pal)
+static void draw_line16_32(uint8_t *d, const uint8_t *s, int width,
+                           const uint32_t *pal)
 {
     uint16_t rgb565;
     uint8_t r, g, b;
@@ -68,14 +48,14 @@ static void glue(draw_line16_, PIXEL_NAME)(
         r = (rgb565 >> 8) & 0xf8;
         g = (rgb565 >> 3) & 0xfc;
         b = (rgb565 << 3) & 0xf8;
-        *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         s += 2;
-        d += BPP;
+        d += 4;
     } while (--width != 0);
 }
 
-static void glue(draw_line32_, PIXEL_NAME)(
-                 uint8_t *d, const uint8_t *s, int width, const uint32_t *pal)
+static void draw_line32_32(uint8_t *d, const uint8_t *s, int width,
+                           const uint32_t *pal)
 {
     uint8_t r, g, b;
 
@@ -83,17 +63,17 @@ static void glue(draw_line32_, PIXEL_NAME)(
         r = s[2];
         g = s[1];
         b = s[0];
-        *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         s += 4;
-        d += BPP;
+        d += 4;
     } while (--width != 0);
 }
 
 /**
  * Draw hardware cursor image on the given line.
  */
-static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
-                 int width, const uint8_t *palette, int c_x, int c_y)
+static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
+                             const uint8_t *palette, int c_x, int c_y)
 {
     int i;
     uint8_t r, g, b, v, bitset = 0;
@@ -101,7 +81,7 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
     /* get cursor position */
     assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
     s += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
-    d += c_x * BPP;
+    d += c_x * 4;
 
     for (i = 0; i < SM501_HWC_WIDTH && c_x + i < width; i++) {
         /* get pixel value */
@@ -118,14 +98,8 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
             r = palette[v * 3 + 0];
             g = palette[v * 3 + 1];
             b = palette[v * 3 + 2];
-            *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
+            *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         }
-        d += BPP;
+        d += 4;
     }
 }
-
-#undef DEPTH
-#undef BPP
-#undef PIXEL_TYPE
-#undef PIXEL_NAME
-#undef BGR_FORMAT
-- 
2.20.1


