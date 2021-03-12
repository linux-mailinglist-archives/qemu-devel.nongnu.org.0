Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F7339004
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:28:43 +0100 (CET)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKimQ-0001F1-No
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDN-0003Fr-PT
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:29 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD5-00028C-NX
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:29 -0500
Received: by mail-wm1-x332.google.com with SMTP id g25so3845676wmh.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gEo54Rb57KSYOsKnLnKmzgLqdNteIHRAl1Lgg94drZM=;
 b=MrUH9ldZ1IEahO+dTsuO8h4/Wcu44/w66pACHDZHMItt/TG9o9S+yY33OYcCRw1S2W
 D9m32mF/3vOhK3r6Gz3uCNJ+XIEbXIi2b14yIAjCtbxp042ZgHnuzWxZ0u7RhykYax/R
 euH3JVyBUQ8gJoyayfjVJxGQODXTpmYFPLH9QBckuxA6+Qao93Vwi/WEEoUTGk2gfmCD
 dBS8MA6CwJgh5pwHmZqc1WeFXP2VofaRmMzezTwblhdzgeRUniaKBhLpNAaUnCVvoVhi
 CcuexvtidAb6XOjhSxVEFmJ3SIWMkjjGwXaOc40QBMBk8bypPTHS1LBbXPLLzH5hjjUD
 Cnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gEo54Rb57KSYOsKnLnKmzgLqdNteIHRAl1Lgg94drZM=;
 b=pO9UD7JLGDLd4S/B+6zbiMZWM2FBY4glFJU3mOLVHreJMFRxNjeUAr4Ufgmd5azDLP
 C6PCvXmlqI4Dj8tKWkjgtZAHrIv0i3DTup6XxfxEjQdvkdS980lhIRCNn5pMQLapebgz
 ye+FLQoBUZ+386LdQVqM28vqCFhGdl4CLToyCJx9dZ4zacwVL6e7t4H/0t7Y0xB/bi+i
 cUA/SmGr8dENEEzJzyFFe/z+B9SO1rvAu4E+bS4WcQhGjnSE2DDSjP+GD4csHyDLV3Nk
 wVlfoP0Fup+oDi7/tuVdJAIpYG6XvL5voGrwr0yVFkWI8eHP9Dn/CVdOS/n02Yq71TXR
 JReA==
X-Gm-Message-State: AOAM530/0A1HTWcQCC3pvg5RybRLV2YX8OTFpMcMZvlkgbbRfgxBoizx
 OA0zzNRsLffrPsmGW1CKdcStVfbpjpeifnG8
X-Google-Smtp-Source: ABdhPJw5OYp+bqI+3mclafzxTWKbBx7V2GQ7e4r+CN0lSveBt5ZWj1/32ZlgNroVPRGtviShNBxWqQ==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr13084217wmj.109.1615557130120; 
 Fri, 12 Mar 2021 05:52:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/39] hw/display/pxa2xx: Inline template header
Date: Fri, 12 Mar 2021 13:51:40 +0000
Message-Id: <20210312135140.1099-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

The template header is now included only once; just inline its contents
in hw/display/pxa2xx_lcd.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210211141515.8755-10-peter.maydell@linaro.org
---
 hw/display/pxa2xx_template.h | 434 -----------------------------------
 hw/display/pxa2xx_lcd.c      | 427 +++++++++++++++++++++++++++++++++-
 2 files changed, 425 insertions(+), 436 deletions(-)
 delete mode 100644 hw/display/pxa2xx_template.h

diff --git a/hw/display/pxa2xx_template.h b/hw/display/pxa2xx_template.h
deleted file mode 100644
index d91407592d3..00000000000
--- a/hw/display/pxa2xx_template.h
+++ /dev/null
@@ -1,434 +0,0 @@
-/*
- * Intel XScale PXA255/270 LCDC emulation.
- *
- * Copyright (c) 2006 Openedhand Ltd.
- * Written by Andrzej Zaborowski <balrog@zabor.org>
- *
- * This code is licensed under the GPLv2.
- *
- * Framebuffer format conversion routines.
- */
-
-# define SKIP_PIXEL(to) do { to += deststep; } while (0)
-# define COPY_PIXEL(to, from)    \
-    do {                         \
-        *(uint32_t *) to = from; \
-        SKIP_PIXEL(to);          \
-    } while (0)
-
-#ifdef HOST_WORDS_BIGENDIAN
-# define SWAP_WORDS 1
-#endif
-
-#define FN_2(x) FN(x + 1) FN(x)
-#define FN_4(x) FN_2(x + 2) FN_2(x)
-
-static void pxa2xx_draw_line2(void *opaque, uint8_t *dest, const uint8_t *src,
-                              int width, int deststep)
-{
-    uint32_t *palette = opaque;
-    uint32_t data;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#define FN(x) COPY_PIXEL(dest, palette[(data >> ((x) * 2)) & 3]);
-#ifdef SWAP_WORDS
-        FN_4(12)
-        FN_4(8)
-        FN_4(4)
-        FN_4(0)
-#else
-        FN_4(0)
-        FN_4(4)
-        FN_4(8)
-        FN_4(12)
-#endif
-#undef FN
-        width -= 16;
-        src += 4;
-    }
-}
-
-static void pxa2xx_draw_line4(void *opaque, uint8_t *dest, const uint8_t *src,
-                              int width, int deststep)
-{
-    uint32_t *palette = opaque;
-    uint32_t data;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#define FN(x) COPY_PIXEL(dest, palette[(data >> ((x) * 4)) & 0xf]);
-#ifdef SWAP_WORDS
-        FN_2(6)
-        FN_2(4)
-        FN_2(2)
-        FN_2(0)
-#else
-        FN_2(0)
-        FN_2(2)
-        FN_2(4)
-        FN_2(6)
-#endif
-#undef FN
-        width -= 8;
-        src += 4;
-    }
-}
-
-static void pxa2xx_draw_line8(void *opaque, uint8_t *dest, const uint8_t *src,
-                              int width, int deststep)
-{
-    uint32_t *palette = opaque;
-    uint32_t data;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#define FN(x) COPY_PIXEL(dest, palette[(data >> (x)) & 0xff]);
-#ifdef SWAP_WORDS
-        FN(24)
-        FN(16)
-        FN(8)
-        FN(0)
-#else
-        FN(0)
-        FN(8)
-        FN(16)
-        FN(24)
-#endif
-#undef FN
-        width -= 4;
-        src += 4;
-    }
-}
-
-static void pxa2xx_draw_line16(void *opaque, uint8_t *dest, const uint8_t *src,
-                               int width, int deststep)
-{
-    uint32_t data;
-    unsigned int r, g, b;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#ifdef SWAP_WORDS
-        data = bswap32(data);
-#endif
-        b = (data & 0x1f) << 3;
-        data >>= 5;
-        g = (data & 0x3f) << 2;
-        data >>= 6;
-        r = (data & 0x1f) << 3;
-        data >>= 5;
-        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        b = (data & 0x1f) << 3;
-        data >>= 5;
-        g = (data & 0x3f) << 2;
-        data >>= 6;
-        r = (data & 0x1f) << 3;
-        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        width -= 2;
-        src += 4;
-    }
-}
-
-static void pxa2xx_draw_line16t(void *opaque, uint8_t *dest, const uint8_t *src,
-                                int width, int deststep)
-{
-    uint32_t data;
-    unsigned int r, g, b;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#ifdef SWAP_WORDS
-        data = bswap32(data);
-#endif
-        b = (data & 0x1f) << 3;
-        data >>= 5;
-        g = (data & 0x1f) << 3;
-        data >>= 5;
-        r = (data & 0x1f) << 3;
-        data >>= 5;
-        if (data & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        data >>= 1;
-        b = (data & 0x1f) << 3;
-        data >>= 5;
-        g = (data & 0x1f) << 3;
-        data >>= 5;
-        r = (data & 0x1f) << 3;
-        data >>= 5;
-        if (data & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        width -= 2;
-        src += 4;
-    }
-}
-
-static void pxa2xx_draw_line18(void *opaque, uint8_t *dest, const uint8_t *src,
-                               int width, int deststep)
-{
-    uint32_t data;
-    unsigned int r, g, b;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#ifdef SWAP_WORDS
-        data = bswap32(data);
-#endif
-        b = (data & 0x3f) << 2;
-        data >>= 6;
-        g = (data & 0x3f) << 2;
-        data >>= 6;
-        r = (data & 0x3f) << 2;
-        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        width -= 1;
-        src += 4;
-    }
-}
-
-/* The wicked packed format */
-static void pxa2xx_draw_line18p(void *opaque, uint8_t *dest, const uint8_t *src,
-                                int width, int deststep)
-{
-    uint32_t data[3];
-    unsigned int r, g, b;
-    while (width > 0) {
-        data[0] = *(uint32_t *) src;
-        src += 4;
-        data[1] = *(uint32_t *) src;
-        src += 4;
-        data[2] = *(uint32_t *) src;
-        src += 4;
-#ifdef SWAP_WORDS
-        data[0] = bswap32(data[0]);
-        data[1] = bswap32(data[1]);
-        data[2] = bswap32(data[2]);
-#endif
-        b = (data[0] & 0x3f) << 2;
-        data[0] >>= 6;
-        g = (data[0] & 0x3f) << 2;
-        data[0] >>= 6;
-        r = (data[0] & 0x3f) << 2;
-        data[0] >>= 12;
-        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        b = (data[0] & 0x3f) << 2;
-        data[0] >>= 6;
-        g = ((data[1] & 0xf) << 4) | (data[0] << 2);
-        data[1] >>= 4;
-        r = (data[1] & 0x3f) << 2;
-        data[1] >>= 12;
-        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        b = (data[1] & 0x3f) << 2;
-        data[1] >>= 6;
-        g = (data[1] & 0x3f) << 2;
-        data[1] >>= 6;
-        r = ((data[2] & 0x3) << 6) | (data[1] << 2);
-        data[2] >>= 8;
-        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        b = (data[2] & 0x3f) << 2;
-        data[2] >>= 6;
-        g = (data[2] & 0x3f) << 2;
-        data[2] >>= 6;
-        r = data[2] << 2;
-        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        width -= 4;
-    }
-}
-
-static void pxa2xx_draw_line19(void *opaque, uint8_t *dest, const uint8_t *src,
-                               int width, int deststep)
-{
-    uint32_t data;
-    unsigned int r, g, b;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#ifdef SWAP_WORDS
-        data = bswap32(data);
-#endif
-        b = (data & 0x3f) << 2;
-        data >>= 6;
-        g = (data & 0x3f) << 2;
-        data >>= 6;
-        r = (data & 0x3f) << 2;
-        data >>= 6;
-        if (data & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        width -= 1;
-        src += 4;
-    }
-}
-
-/* The wicked packed format */
-static void pxa2xx_draw_line19p(void *opaque, uint8_t *dest, const uint8_t *src,
-                                int width, int deststep)
-{
-    uint32_t data[3];
-    unsigned int r, g, b;
-    while (width > 0) {
-        data[0] = *(uint32_t *) src;
-        src += 4;
-        data[1] = *(uint32_t *) src;
-        src += 4;
-        data[2] = *(uint32_t *) src;
-        src += 4;
-# ifdef SWAP_WORDS
-        data[0] = bswap32(data[0]);
-        data[1] = bswap32(data[1]);
-        data[2] = bswap32(data[2]);
-# endif
-        b = (data[0] & 0x3f) << 2;
-        data[0] >>= 6;
-        g = (data[0] & 0x3f) << 2;
-        data[0] >>= 6;
-        r = (data[0] & 0x3f) << 2;
-        data[0] >>= 6;
-        if (data[0] & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        data[0] >>= 6;
-        b = (data[0] & 0x3f) << 2;
-        data[0] >>= 6;
-        g = ((data[1] & 0xf) << 4) | (data[0] << 2);
-        data[1] >>= 4;
-        r = (data[1] & 0x3f) << 2;
-        data[1] >>= 6;
-        if (data[1] & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        data[1] >>= 6;
-        b = (data[1] & 0x3f) << 2;
-        data[1] >>= 6;
-        g = (data[1] & 0x3f) << 2;
-        data[1] >>= 6;
-        r = ((data[2] & 0x3) << 6) | (data[1] << 2);
-        data[2] >>= 2;
-        if (data[2] & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        data[2] >>= 6;
-        b = (data[2] & 0x3f) << 2;
-        data[2] >>= 6;
-        g = (data[2] & 0x3f) << 2;
-        data[2] >>= 6;
-        r = data[2] << 2;
-        data[2] >>= 6;
-        if (data[2] & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        width -= 4;
-    }
-}
-
-static void pxa2xx_draw_line24(void *opaque, uint8_t *dest, const uint8_t *src,
-                               int width, int deststep)
-{
-    uint32_t data;
-    unsigned int r, g, b;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#ifdef SWAP_WORDS
-        data = bswap32(data);
-#endif
-        b = data & 0xff;
-        data >>= 8;
-        g = data & 0xff;
-        data >>= 8;
-        r = data & 0xff;
-        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        width -= 1;
-        src += 4;
-    }
-}
-
-static void pxa2xx_draw_line24t(void *opaque, uint8_t *dest, const uint8_t *src,
-                                int width, int deststep)
-{
-    uint32_t data;
-    unsigned int r, g, b;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#ifdef SWAP_WORDS
-        data = bswap32(data);
-#endif
-        b = (data & 0x7f) << 1;
-        data >>= 7;
-        g = data & 0xff;
-        data >>= 8;
-        r = data & 0xff;
-        data >>= 8;
-        if (data & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        width -= 1;
-        src += 4;
-    }
-}
-
-static void pxa2xx_draw_line25(void *opaque, uint8_t *dest, const uint8_t *src,
-                               int width, int deststep)
-{
-    uint32_t data;
-    unsigned int r, g, b;
-    while (width > 0) {
-        data = *(uint32_t *) src;
-#ifdef SWAP_WORDS
-        data = bswap32(data);
-#endif
-        b = data & 0xff;
-        data >>= 8;
-        g = data & 0xff;
-        data >>= 8;
-        r = data & 0xff;
-        data >>= 8;
-        if (data & 1) {
-            SKIP_PIXEL(dest);
-        } else {
-            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
-        }
-        width -= 1;
-        src += 4;
-    }
-}
-
-/* Overlay planes disabled, no transparency */
-static drawfn pxa2xx_draw_fn_32[16] = {
-    [0 ... 0xf]       = NULL,
-    [pxa_lcdc_2bpp]   = pxa2xx_draw_line2,
-    [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
-    [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
-    [pxa_lcdc_16bpp]  = pxa2xx_draw_line16,
-    [pxa_lcdc_18bpp]  = pxa2xx_draw_line18,
-    [pxa_lcdc_18pbpp] = pxa2xx_draw_line18p,
-    [pxa_lcdc_24bpp]  = pxa2xx_draw_line24,
-};
-
-/* Overlay planes enabled, transparency used */
-static drawfn pxa2xx_draw_fn_32t[16] = {
-    [0 ... 0xf]       = NULL,
-    [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
-    [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
-    [pxa_lcdc_16bpp]  = pxa2xx_draw_line16t,
-    [pxa_lcdc_19bpp]  = pxa2xx_draw_line19,
-    [pxa_lcdc_19pbpp] = pxa2xx_draw_line19p,
-    [pxa_lcdc_24bpp]  = pxa2xx_draw_line24t,
-    [pxa_lcdc_25bpp]  = pxa2xx_draw_line25,
-};
-
-#undef COPY_PIXEL
-#undef SKIP_PIXEL
-
-#ifdef SWAP_WORDS
-# undef SWAP_WORDS
-#endif
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 33343832bbc..2887ce496b4 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -190,8 +190,431 @@ typedef struct QEMU_PACKED {
 /* Size of a pixel in the QEMU UI output surface, in bytes */
 #define DEST_PIXEL_WIDTH 4
 
-#define BITS 32
-#include "pxa2xx_template.h"
+/* Line drawing code to handle the various possible guest pixel formats */
+
+# define SKIP_PIXEL(to) do { to += deststep; } while (0)
+# define COPY_PIXEL(to, from)    \
+    do {                         \
+        *(uint32_t *) to = from; \
+        SKIP_PIXEL(to);          \
+    } while (0)
+
+#ifdef HOST_WORDS_BIGENDIAN
+# define SWAP_WORDS 1
+#endif
+
+#define FN_2(x) FN(x + 1) FN(x)
+#define FN_4(x) FN_2(x + 2) FN_2(x)
+
+static void pxa2xx_draw_line2(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
+{
+    uint32_t *palette = opaque;
+    uint32_t data;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#define FN(x) COPY_PIXEL(dest, palette[(data >> ((x) * 2)) & 3]);
+#ifdef SWAP_WORDS
+        FN_4(12)
+        FN_4(8)
+        FN_4(4)
+        FN_4(0)
+#else
+        FN_4(0)
+        FN_4(4)
+        FN_4(8)
+        FN_4(12)
+#endif
+#undef FN
+        width -= 16;
+        src += 4;
+    }
+}
+
+static void pxa2xx_draw_line4(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
+{
+    uint32_t *palette = opaque;
+    uint32_t data;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#define FN(x) COPY_PIXEL(dest, palette[(data >> ((x) * 4)) & 0xf]);
+#ifdef SWAP_WORDS
+        FN_2(6)
+        FN_2(4)
+        FN_2(2)
+        FN_2(0)
+#else
+        FN_2(0)
+        FN_2(2)
+        FN_2(4)
+        FN_2(6)
+#endif
+#undef FN
+        width -= 8;
+        src += 4;
+    }
+}
+
+static void pxa2xx_draw_line8(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
+{
+    uint32_t *palette = opaque;
+    uint32_t data;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#define FN(x) COPY_PIXEL(dest, palette[(data >> (x)) & 0xff]);
+#ifdef SWAP_WORDS
+        FN(24)
+        FN(16)
+        FN(8)
+        FN(0)
+#else
+        FN(0)
+        FN(8)
+        FN(16)
+        FN(24)
+#endif
+#undef FN
+        width -= 4;
+        src += 4;
+    }
+}
+
+static void pxa2xx_draw_line16(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
+{
+    uint32_t data;
+    unsigned int r, g, b;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#ifdef SWAP_WORDS
+        data = bswap32(data);
+#endif
+        b = (data & 0x1f) << 3;
+        data >>= 5;
+        g = (data & 0x3f) << 2;
+        data >>= 6;
+        r = (data & 0x1f) << 3;
+        data >>= 5;
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        b = (data & 0x1f) << 3;
+        data >>= 5;
+        g = (data & 0x3f) << 2;
+        data >>= 6;
+        r = (data & 0x1f) << 3;
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        width -= 2;
+        src += 4;
+    }
+}
+
+static void pxa2xx_draw_line16t(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
+{
+    uint32_t data;
+    unsigned int r, g, b;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#ifdef SWAP_WORDS
+        data = bswap32(data);
+#endif
+        b = (data & 0x1f) << 3;
+        data >>= 5;
+        g = (data & 0x1f) << 3;
+        data >>= 5;
+        r = (data & 0x1f) << 3;
+        data >>= 5;
+        if (data & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        data >>= 1;
+        b = (data & 0x1f) << 3;
+        data >>= 5;
+        g = (data & 0x1f) << 3;
+        data >>= 5;
+        r = (data & 0x1f) << 3;
+        data >>= 5;
+        if (data & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        width -= 2;
+        src += 4;
+    }
+}
+
+static void pxa2xx_draw_line18(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
+{
+    uint32_t data;
+    unsigned int r, g, b;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#ifdef SWAP_WORDS
+        data = bswap32(data);
+#endif
+        b = (data & 0x3f) << 2;
+        data >>= 6;
+        g = (data & 0x3f) << 2;
+        data >>= 6;
+        r = (data & 0x3f) << 2;
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        width -= 1;
+        src += 4;
+    }
+}
+
+/* The wicked packed format */
+static void pxa2xx_draw_line18p(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
+{
+    uint32_t data[3];
+    unsigned int r, g, b;
+    while (width > 0) {
+        data[0] = *(uint32_t *) src;
+        src += 4;
+        data[1] = *(uint32_t *) src;
+        src += 4;
+        data[2] = *(uint32_t *) src;
+        src += 4;
+#ifdef SWAP_WORDS
+        data[0] = bswap32(data[0]);
+        data[1] = bswap32(data[1]);
+        data[2] = bswap32(data[2]);
+#endif
+        b = (data[0] & 0x3f) << 2;
+        data[0] >>= 6;
+        g = (data[0] & 0x3f) << 2;
+        data[0] >>= 6;
+        r = (data[0] & 0x3f) << 2;
+        data[0] >>= 12;
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        b = (data[0] & 0x3f) << 2;
+        data[0] >>= 6;
+        g = ((data[1] & 0xf) << 4) | (data[0] << 2);
+        data[1] >>= 4;
+        r = (data[1] & 0x3f) << 2;
+        data[1] >>= 12;
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        b = (data[1] & 0x3f) << 2;
+        data[1] >>= 6;
+        g = (data[1] & 0x3f) << 2;
+        data[1] >>= 6;
+        r = ((data[2] & 0x3) << 6) | (data[1] << 2);
+        data[2] >>= 8;
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        b = (data[2] & 0x3f) << 2;
+        data[2] >>= 6;
+        g = (data[2] & 0x3f) << 2;
+        data[2] >>= 6;
+        r = data[2] << 2;
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        width -= 4;
+    }
+}
+
+static void pxa2xx_draw_line19(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
+{
+    uint32_t data;
+    unsigned int r, g, b;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#ifdef SWAP_WORDS
+        data = bswap32(data);
+#endif
+        b = (data & 0x3f) << 2;
+        data >>= 6;
+        g = (data & 0x3f) << 2;
+        data >>= 6;
+        r = (data & 0x3f) << 2;
+        data >>= 6;
+        if (data & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        width -= 1;
+        src += 4;
+    }
+}
+
+/* The wicked packed format */
+static void pxa2xx_draw_line19p(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
+{
+    uint32_t data[3];
+    unsigned int r, g, b;
+    while (width > 0) {
+        data[0] = *(uint32_t *) src;
+        src += 4;
+        data[1] = *(uint32_t *) src;
+        src += 4;
+        data[2] = *(uint32_t *) src;
+        src += 4;
+# ifdef SWAP_WORDS
+        data[0] = bswap32(data[0]);
+        data[1] = bswap32(data[1]);
+        data[2] = bswap32(data[2]);
+# endif
+        b = (data[0] & 0x3f) << 2;
+        data[0] >>= 6;
+        g = (data[0] & 0x3f) << 2;
+        data[0] >>= 6;
+        r = (data[0] & 0x3f) << 2;
+        data[0] >>= 6;
+        if (data[0] & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        data[0] >>= 6;
+        b = (data[0] & 0x3f) << 2;
+        data[0] >>= 6;
+        g = ((data[1] & 0xf) << 4) | (data[0] << 2);
+        data[1] >>= 4;
+        r = (data[1] & 0x3f) << 2;
+        data[1] >>= 6;
+        if (data[1] & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        data[1] >>= 6;
+        b = (data[1] & 0x3f) << 2;
+        data[1] >>= 6;
+        g = (data[1] & 0x3f) << 2;
+        data[1] >>= 6;
+        r = ((data[2] & 0x3) << 6) | (data[1] << 2);
+        data[2] >>= 2;
+        if (data[2] & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        data[2] >>= 6;
+        b = (data[2] & 0x3f) << 2;
+        data[2] >>= 6;
+        g = (data[2] & 0x3f) << 2;
+        data[2] >>= 6;
+        r = data[2] << 2;
+        data[2] >>= 6;
+        if (data[2] & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        width -= 4;
+    }
+}
+
+static void pxa2xx_draw_line24(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
+{
+    uint32_t data;
+    unsigned int r, g, b;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#ifdef SWAP_WORDS
+        data = bswap32(data);
+#endif
+        b = data & 0xff;
+        data >>= 8;
+        g = data & 0xff;
+        data >>= 8;
+        r = data & 0xff;
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        width -= 1;
+        src += 4;
+    }
+}
+
+static void pxa2xx_draw_line24t(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
+{
+    uint32_t data;
+    unsigned int r, g, b;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#ifdef SWAP_WORDS
+        data = bswap32(data);
+#endif
+        b = (data & 0x7f) << 1;
+        data >>= 7;
+        g = data & 0xff;
+        data >>= 8;
+        r = data & 0xff;
+        data >>= 8;
+        if (data & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        width -= 1;
+        src += 4;
+    }
+}
+
+static void pxa2xx_draw_line25(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
+{
+    uint32_t data;
+    unsigned int r, g, b;
+    while (width > 0) {
+        data = *(uint32_t *) src;
+#ifdef SWAP_WORDS
+        data = bswap32(data);
+#endif
+        b = data & 0xff;
+        data >>= 8;
+        g = data & 0xff;
+        data >>= 8;
+        r = data & 0xff;
+        data >>= 8;
+        if (data & 1) {
+            SKIP_PIXEL(dest);
+        } else {
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
+        width -= 1;
+        src += 4;
+    }
+}
+
+/* Overlay planes disabled, no transparency */
+static drawfn pxa2xx_draw_fn_32[16] = {
+    [0 ... 0xf]       = NULL,
+    [pxa_lcdc_2bpp]   = pxa2xx_draw_line2,
+    [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
+    [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
+    [pxa_lcdc_16bpp]  = pxa2xx_draw_line16,
+    [pxa_lcdc_18bpp]  = pxa2xx_draw_line18,
+    [pxa_lcdc_18pbpp] = pxa2xx_draw_line18p,
+    [pxa_lcdc_24bpp]  = pxa2xx_draw_line24,
+};
+
+/* Overlay planes enabled, transparency used */
+static drawfn pxa2xx_draw_fn_32t[16] = {
+    [0 ... 0xf]       = NULL,
+    [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
+    [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
+    [pxa_lcdc_16bpp]  = pxa2xx_draw_line16t,
+    [pxa_lcdc_19bpp]  = pxa2xx_draw_line19,
+    [pxa_lcdc_19pbpp] = pxa2xx_draw_line19p,
+    [pxa_lcdc_24bpp]  = pxa2xx_draw_line24t,
+    [pxa_lcdc_25bpp]  = pxa2xx_draw_line25,
+};
+
+#undef COPY_PIXEL
+#undef SKIP_PIXEL
+
+#ifdef SWAP_WORDS
+# undef SWAP_WORDS
+#endif
 
 /* Route internal interrupt lines to the global IC */
 static void pxa2xx_lcdc_int_update(PXA2xxLCDState *s)
-- 
2.20.1


