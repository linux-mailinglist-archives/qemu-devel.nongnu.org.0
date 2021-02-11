Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B0318D37
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:24:07 +0100 (CET)
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACt4-00008K-Db
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl6-0006aJ-Dk
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:52 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkg-00076T-6n
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i9so5908851wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6dkaa6KUnyKjpOeBlod62XP865fcAhsz6ScpfQ42eo=;
 b=ayY1H5/EYzGBhDdS7iXct/vc035qJ/xoOQa75hM+9gcJ1KKL31720poDmACQJN+YTD
 nRyg9t1Ch6ypkqVBKHoWMs0GQcJxMwuy2wcZ4XtoR3ulYJCyX+1aipV5XoL4wDZTSPbL
 Yh2KFABYLcgP9kK2dvrthL27sYtR8wlL9qGlmD3sgSQIAEsrN5noAxouzsXvaYF+uy8e
 eOdOSzPR3cspV1zSPhbmc1wZnZlmnvOjDwPbzVJdEelxLE29FUSDpJrmSL1ehGDnRZWR
 OHVzoRT5RgMYv0XdAseQmmx7ArAWzTvRNWq7a0rOkP4eUDMEWP9NfkZeQUBhnLl63i8j
 2dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O6dkaa6KUnyKjpOeBlod62XP865fcAhsz6ScpfQ42eo=;
 b=QrKbmUE9AXpdYgeO8pdGvCKOY2UAPBRdtAasYbCtYPlbgiiKWfuJsgkti3yej8U5IE
 D0HjbBkErlWxnbzGR4QXQkqwvqRA7JsqbRIPNC+C6P3uOfYx7jXAJrbsAlbTS5SQ1dVT
 wikAXjLsqB8M4wgA4rgfShEvSNdB2sfG1wDPb6HmeJGnpljjYkcYZ8dltVvbS7P9E5A7
 isL5IaS01hyMqqbiQL4qxGsLj/QzES/V1zjPSpEi7Fgx7AYx/XAVy/OsGQgp1H4Zjq1X
 fa9//yRbe2kQeBJ67mUUQx3uh69gxvyKD6fVm+R7lHskkFvaqozOZRssQDZtn3nVCgPl
 Y9fQ==
X-Gm-Message-State: AOAM530Sox8NavsN2RpZjdn1IF0ZDVkTpUcjSoTW6jE8U83NvEOGVEjf
 Ve6v/xULI/tvdrpA3ZWUQSCCaw==
X-Google-Smtp-Source: ABdhPJxJXy8+mWy1jkD/eKh4pZjNJn3LW8Zr42uUejam0TmK/9AdStwiksNrhOqd6EBV9hzk9J8NSw==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr5294284wmc.107.1613052924219; 
 Thu, 11 Feb 2021 06:15:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 8/9] hw/display/pxa2xx: Apply whitespace-only coding style
 fixes to template header
Date: Thu, 11 Feb 2021 14:15:14 +0000
Message-Id: <20210211141515.8755-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to move code from the template header into pxa2xx_lcd.c.
Before doing that, make coding style fixes so checkpatch doesn't
complain about the patch which moves the code. This commit is
whitespace changes only:
 * avoid hard-coded tabs
 * fix ident on function prototypes
 * no newline before open brace on array definitions

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/pxa2xx_template.h | 66 +++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/hw/display/pxa2xx_template.h b/hw/display/pxa2xx_template.h
index 1c13d3ac007..d91407592d3 100644
--- a/hw/display/pxa2xx_template.h
+++ b/hw/display/pxa2xx_template.h
@@ -17,20 +17,20 @@
     } while (0)
 
 #ifdef HOST_WORDS_BIGENDIAN
-# define SWAP_WORDS	1
+# define SWAP_WORDS 1
 #endif
 
-#define FN_2(x)		FN(x + 1) FN(x)
-#define FN_4(x)		FN_2(x + 2) FN_2(x)
+#define FN_2(x) FN(x + 1) FN(x)
+#define FN_4(x) FN_2(x + 2) FN_2(x)
 
-static void pxa2xx_draw_line2(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line2(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
 {
     uint32_t *palette = opaque;
     uint32_t data;
     while (width > 0) {
         data = *(uint32_t *) src;
-#define FN(x)		COPY_PIXEL(dest, palette[(data >> ((x) * 2)) & 3]);
+#define FN(x) COPY_PIXEL(dest, palette[(data >> ((x) * 2)) & 3]);
 #ifdef SWAP_WORDS
         FN_4(12)
         FN_4(8)
@@ -48,14 +48,14 @@ static void pxa2xx_draw_line2(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line4(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line4(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
 {
     uint32_t *palette = opaque;
     uint32_t data;
     while (width > 0) {
         data = *(uint32_t *) src;
-#define FN(x)		COPY_PIXEL(dest, palette[(data >> ((x) * 4)) & 0xf]);
+#define FN(x) COPY_PIXEL(dest, palette[(data >> ((x) * 4)) & 0xf]);
 #ifdef SWAP_WORDS
         FN_2(6)
         FN_2(4)
@@ -73,14 +73,14 @@ static void pxa2xx_draw_line4(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line8(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line8(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
 {
     uint32_t *palette = opaque;
     uint32_t data;
     while (width > 0) {
         data = *(uint32_t *) src;
-#define FN(x)		COPY_PIXEL(dest, palette[(data >> (x)) & 0xff]);
+#define FN(x) COPY_PIXEL(dest, palette[(data >> (x)) & 0xff]);
 #ifdef SWAP_WORDS
         FN(24)
         FN(16)
@@ -98,8 +98,8 @@ static void pxa2xx_draw_line8(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line16(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line16(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -126,8 +126,8 @@ static void pxa2xx_draw_line16(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line16t(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line16t(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -164,8 +164,8 @@ static void pxa2xx_draw_line16t(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line18(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line18(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -186,8 +186,8 @@ static void pxa2xx_draw_line18(void *opaque,
 }
 
 /* The wicked packed format */
-static void pxa2xx_draw_line18p(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line18p(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
 {
     uint32_t data[3];
     unsigned int r, g, b;
@@ -234,8 +234,8 @@ static void pxa2xx_draw_line18p(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line19(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line19(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -261,8 +261,8 @@ static void pxa2xx_draw_line19(void *opaque,
 }
 
 /* The wicked packed format */
-static void pxa2xx_draw_line19p(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line19p(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
 {
     uint32_t data[3];
     unsigned int r, g, b;
@@ -329,8 +329,8 @@ static void pxa2xx_draw_line19p(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line24(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line24(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -350,8 +350,8 @@ static void pxa2xx_draw_line24(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line24t(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line24t(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -376,8 +376,8 @@ static void pxa2xx_draw_line24t(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line25(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line25(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -403,8 +403,7 @@ static void pxa2xx_draw_line25(void *opaque,
 }
 
 /* Overlay planes disabled, no transparency */
-static drawfn pxa2xx_draw_fn_32[16] =
-{
+static drawfn pxa2xx_draw_fn_32[16] = {
     [0 ... 0xf]       = NULL,
     [pxa_lcdc_2bpp]   = pxa2xx_draw_line2,
     [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
@@ -416,8 +415,7 @@ static drawfn pxa2xx_draw_fn_32[16] =
 };
 
 /* Overlay planes enabled, transparency used */
-static drawfn pxa2xx_draw_fn_32t[16] =
-{
+static drawfn pxa2xx_draw_fn_32t[16] = {
     [0 ... 0xf]       = NULL,
     [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
     [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
-- 
2.20.1


