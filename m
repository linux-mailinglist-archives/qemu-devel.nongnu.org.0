Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482F338FE2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:24:48 +0100 (CET)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiic-0004at-Mn
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDM-0003EB-Vs
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:29 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD5-00027b-Nv
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:28 -0500
Received: by mail-wm1-x329.google.com with SMTP id d191so3836254wmd.2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XL5HmNJOhd2SwhFb55GTsaTTVbmPxfkPffJBwrXFGek=;
 b=zZScC142RDGviZQl/uCfOXiYjJ6kvwLIZ7WWOkNE4+Ze4WZikMm2L/OfB23WJd7Pk9
 NbqXCUgiOsDv/RgZR4gbl104FlSfVegNAPVZAM62pNvw7eJRzE042FvqiDvDNxn+6Xjo
 AGnRSS28HQr+9vTspN7f1jLarUxS1odHirXEDbagDwsptiftf577fQM5STid1E3vfMPh
 lnkUNZxOHHlKEnN7rRTHflWa5MFeL01KPx5mdV1SI4NB7i91bkAezmPUh/nsa64nLccc
 z/zBPRVduI/U6YDGb0/s6ze727Vvbu7bIi3dawHxSIzqytGPJrjbjBz4KbOjRiCHuoQp
 1Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XL5HmNJOhd2SwhFb55GTsaTTVbmPxfkPffJBwrXFGek=;
 b=hmm2/eorlhs5ArFnVoFu4bcaFxlw3zWJokuwd/wNa2UwDHtJIYJJ7sSblOf9PxiRfw
 NywFLtvmuPCnwJtdu8aQrLeCEf+bAYD85c0PgbGh7JUPBc0E1/AFik6Y482kqA+huZTv
 o4HgDt/gxbPTzuzqZQdfJEVuwNAIMV2phCJ42epsg71yicZ+YXTLAUXpZUJFhHk+D1Vx
 2PnNJ5Y1SjDg5QErFIWrXq+V8LJkAixGavWQ2BtcsPIuNNoZ7iywAS07yxEL4voPeql/
 mIIG7aXfXAr5m6BCzMlD4GCXJFSxiBYvgNd0WNCkv+P7al+yesjQD/uGVZ7LXE9TXxd0
 ZxBw==
X-Gm-Message-State: AOAM5308PN0E8zuX6pdekJf46dmto8NdhIchXjhX8DOeEfmW20dCge+l
 Qa2V2b5rgqX7Gh1XEZGLnojpCHpywdmIW/j0
X-Google-Smtp-Source: ABdhPJxFTFaQyE9W8lGXM1jUOG22mEtaR+UCvY60f/ZjhIsIO1bl/ttKwzkH90dLb3WRzj2X0S+JIw==
X-Received: by 2002:a1c:e383:: with SMTP id
 a125mr13246901wmh.125.1615557129131; 
 Fri, 12 Mar 2021 05:52:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/39] hw/display/pxa2xx: Apply whitespace-only coding style
 fixes to template header
Date: Fri, 12 Mar 2021 13:51:39 +0000
Message-Id: <20210312135140.1099-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

We're about to move code from the template header into pxa2xx_lcd.c.
Before doing that, make coding style fixes so checkpatch doesn't
complain about the patch which moves the code. This commit is
whitespace changes only:
 * avoid hard-coded tabs
 * fix ident on function prototypes
 * no newline before open brace on array definitions

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210211141515.8755-9-peter.maydell@linaro.org
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


