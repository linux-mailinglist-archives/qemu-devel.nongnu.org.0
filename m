Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D73338FB0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:20:09 +0100 (CET)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKie8-0006q6-1M
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDH-00035j-KF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:25 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD0-00024C-En
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:23 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so15838835wmy.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t+BHMTYpiWc0hss9xRKIs92B9zD3/7xEsIAhOg1RbKo=;
 b=xYJlmityPT0fg6G8MOwaiey4H0jSzTua/MnNn0d2Vjw7sigwOH7tplEqoLtzxZcX0X
 p6xofDsytlLwSkXCvxmSk235OCB6npaNKjBP1N8ldmdsB9d05BFp0kON6vg1h0GXscVY
 LEpdknM6qGypUP5ddQlx3KAVu/d9oFHJ8SG9V5X+qtvseChlIHOsJXBXkZVTN7gUAVew
 JNT+J3Kt19Vm5t+ubqaPsUkT+gzfvnbW0W/KrS+6M6S+40uQYsPhfugudyYrgAPOufSA
 8+HfEN1Lwr8fXQRjBqpzv5s7I3oq6/WXzofky6DTwizP+bEAf+8yXyE3JWJ81o7o60gO
 ssLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t+BHMTYpiWc0hss9xRKIs92B9zD3/7xEsIAhOg1RbKo=;
 b=HrA9pB0JJwrI9qdQc2sifKflJjmXpmtTYkMg+ftjyH7FU5u6vFNdgDn8mcOI5hm6EB
 CGLgt5v758iLWkYNyXYEIjDkPmGrvXPyGpTOr/MNxeS0qo1u9C34Q8+lykXIwiwlV92s
 VsLok+5BcV9TcSpO0XzPnvkkABsTuILE00q+ZPxhvDpC3wpC3XnKshobx4cku09yuuJ9
 pEbkAJHFkiX1clfOU6nmGKEpjmm/1iHtMnugwDwJWJemo1lIWVizDQZITVUqe5liJ5EM
 WwZ+zHD+0RzJA9B66Uc9AMwQsRJZQAHcU6R8hRcj9mnVR9dfAkpm0Btul2k12JpT3jUx
 XFtQ==
X-Gm-Message-State: AOAM53309tk6WavhdFEESsEaJoKd4gvHMUEwU83igNNfAlm7GWcmz0z1
 Oo6QAQXYT6DrwQbPO7p7bzepSlPeajUy7uyY
X-Google-Smtp-Source: ABdhPJy0vouH5cXZSSIPjZ0i55M5apcNAR7oYWVLHqTHMSvpHbZpDOJgEzWTm8K5njGIEbiNci4yfg==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr13469229wmb.134.1615557125005; 
 Fri, 12 Mar 2021 05:52:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/39] hw/display/pl110: Pull included-once parts of template
 header into pl110.c
Date: Fri, 12 Mar 2021 13:51:33 +0000
Message-Id: <20210312135140.1099-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

The pl110_template.h header has a doubly-nested multiple-include pattern:
 * pl110.c includes it once for each host bit depth (now always 32)
 * every time it is included, it includes itself 6 times, to account
   for multiple guest device pixel and byte orders

Now we only have to deal with 32-bit host bit depths, we can move the
code corresponding to the outer layer of this double-nesting to be
directly in pl110.c and reduce the template header to a single layer
of nesting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210211141515.8755-3-peter.maydell@linaro.org
---
 hw/display/pl110_template.h | 100 +-----------------------------------
 hw/display/pl110.c          |  79 ++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 99 deletions(-)

diff --git a/hw/display/pl110_template.h b/hw/display/pl110_template.h
index 36ba791c6fd..0d8471db636 100644
--- a/hw/display/pl110_template.h
+++ b/hw/display/pl110_template.h
@@ -10,105 +10,9 @@
  */
 
 #ifndef ORDER
-
-#if BITS == 8
-#define COPY_PIXEL(to, from) *(to++) = from
-#elif BITS == 15 || BITS == 16
-#define COPY_PIXEL(to, from) do { *(uint16_t *)to = from; to += 2; } while (0)
-#elif BITS == 24
-#define COPY_PIXEL(to, from)    \
-    do {                        \
-        *(to++) = from;         \
-        *(to++) = (from) >> 8;  \
-        *(to++) = (from) >> 16; \
-    } while (0)
-#elif BITS == 32
-#define COPY_PIXEL(to, from) do { *(uint32_t *)to = from; to += 4; } while (0)
-#else
-#error unknown bit depth
+#error "pl110_template.h is only for inclusion by pl110.c"
 #endif
 
-#undef RGB
-#define BORDER bgr
-#define ORDER 0
-#include "pl110_template.h"
-#define ORDER 1
-#include "pl110_template.h"
-#define ORDER 2
-#include "pl110_template.h"
-#undef BORDER
-#define RGB
-#define BORDER rgb
-#define ORDER 0
-#include "pl110_template.h"
-#define ORDER 1
-#include "pl110_template.h"
-#define ORDER 2
-#include "pl110_template.h"
-#undef BORDER
-
-static drawfn glue(pl110_draw_fn_,BITS)[48] =
-{
-    glue(pl110_draw_line1_lblp_bgr,BITS),
-    glue(pl110_draw_line2_lblp_bgr,BITS),
-    glue(pl110_draw_line4_lblp_bgr,BITS),
-    glue(pl110_draw_line8_lblp_bgr,BITS),
-    glue(pl110_draw_line16_555_lblp_bgr,BITS),
-    glue(pl110_draw_line32_lblp_bgr,BITS),
-    glue(pl110_draw_line16_lblp_bgr,BITS),
-    glue(pl110_draw_line12_lblp_bgr,BITS),
-
-    glue(pl110_draw_line1_bbbp_bgr,BITS),
-    glue(pl110_draw_line2_bbbp_bgr,BITS),
-    glue(pl110_draw_line4_bbbp_bgr,BITS),
-    glue(pl110_draw_line8_bbbp_bgr,BITS),
-    glue(pl110_draw_line16_555_bbbp_bgr,BITS),
-    glue(pl110_draw_line32_bbbp_bgr,BITS),
-    glue(pl110_draw_line16_bbbp_bgr,BITS),
-    glue(pl110_draw_line12_bbbp_bgr,BITS),
-
-    glue(pl110_draw_line1_lbbp_bgr,BITS),
-    glue(pl110_draw_line2_lbbp_bgr,BITS),
-    glue(pl110_draw_line4_lbbp_bgr,BITS),
-    glue(pl110_draw_line8_lbbp_bgr,BITS),
-    glue(pl110_draw_line16_555_lbbp_bgr,BITS),
-    glue(pl110_draw_line32_lbbp_bgr,BITS),
-    glue(pl110_draw_line16_lbbp_bgr,BITS),
-    glue(pl110_draw_line12_lbbp_bgr,BITS),
-
-    glue(pl110_draw_line1_lblp_rgb,BITS),
-    glue(pl110_draw_line2_lblp_rgb,BITS),
-    glue(pl110_draw_line4_lblp_rgb,BITS),
-    glue(pl110_draw_line8_lblp_rgb,BITS),
-    glue(pl110_draw_line16_555_lblp_rgb,BITS),
-    glue(pl110_draw_line32_lblp_rgb,BITS),
-    glue(pl110_draw_line16_lblp_rgb,BITS),
-    glue(pl110_draw_line12_lblp_rgb,BITS),
-
-    glue(pl110_draw_line1_bbbp_rgb,BITS),
-    glue(pl110_draw_line2_bbbp_rgb,BITS),
-    glue(pl110_draw_line4_bbbp_rgb,BITS),
-    glue(pl110_draw_line8_bbbp_rgb,BITS),
-    glue(pl110_draw_line16_555_bbbp_rgb,BITS),
-    glue(pl110_draw_line32_bbbp_rgb,BITS),
-    glue(pl110_draw_line16_bbbp_rgb,BITS),
-    glue(pl110_draw_line12_bbbp_rgb,BITS),
-
-    glue(pl110_draw_line1_lbbp_rgb,BITS),
-    glue(pl110_draw_line2_lbbp_rgb,BITS),
-    glue(pl110_draw_line4_lbbp_rgb,BITS),
-    glue(pl110_draw_line8_lbbp_rgb,BITS),
-    glue(pl110_draw_line16_555_lbbp_rgb,BITS),
-    glue(pl110_draw_line32_lbbp_rgb,BITS),
-    glue(pl110_draw_line16_lbbp_rgb,BITS),
-    glue(pl110_draw_line12_lbbp_rgb,BITS),
-};
-
-#undef BITS
-#undef COPY_PIXEL
-
-#else
-
 #if ORDER == 0
 #define NAME glue(glue(lblp_, BORDER), BITS)
 #ifdef HOST_WORDS_BIGENDIAN
@@ -395,5 +299,3 @@ static void glue(pl110_draw_line12_,NAME)(void *opaque, uint8_t *d, const uint8_
 #undef NAME
 #undef SWAP_WORDS
 #undef ORDER
-
-#endif
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index a0d4126ce7f..ce300662e8b 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -124,7 +124,86 @@ static const unsigned char *idregs[] = {
 };
 
 #define BITS 32
+#define COPY_PIXEL(to, from) do { *(uint32_t *)to = from; to += 4; } while (0)
+
+#undef RGB
+#define BORDER bgr
+#define ORDER 0
 #include "pl110_template.h"
+#define ORDER 1
+#include "pl110_template.h"
+#define ORDER 2
+#include "pl110_template.h"
+#undef BORDER
+#define RGB
+#define BORDER rgb
+#define ORDER 0
+#include "pl110_template.h"
+#define ORDER 1
+#include "pl110_template.h"
+#define ORDER 2
+#include "pl110_template.h"
+#undef BORDER
+
+static drawfn pl110_draw_fn_32[48] = {
+    pl110_draw_line1_lblp_bgr32,
+    pl110_draw_line2_lblp_bgr32,
+    pl110_draw_line4_lblp_bgr32,
+    pl110_draw_line8_lblp_bgr32,
+    pl110_draw_line16_555_lblp_bgr32,
+    pl110_draw_line32_lblp_bgr32,
+    pl110_draw_line16_lblp_bgr32,
+    pl110_draw_line12_lblp_bgr32,
+
+    pl110_draw_line1_bbbp_bgr32,
+    pl110_draw_line2_bbbp_bgr32,
+    pl110_draw_line4_bbbp_bgr32,
+    pl110_draw_line8_bbbp_bgr32,
+    pl110_draw_line16_555_bbbp_bgr32,
+    pl110_draw_line32_bbbp_bgr32,
+    pl110_draw_line16_bbbp_bgr32,
+    pl110_draw_line12_bbbp_bgr32,
+
+    pl110_draw_line1_lbbp_bgr32,
+    pl110_draw_line2_lbbp_bgr32,
+    pl110_draw_line4_lbbp_bgr32,
+    pl110_draw_line8_lbbp_bgr32,
+    pl110_draw_line16_555_lbbp_bgr32,
+    pl110_draw_line32_lbbp_bgr32,
+    pl110_draw_line16_lbbp_bgr32,
+    pl110_draw_line12_lbbp_bgr32,
+
+    pl110_draw_line1_lblp_rgb32,
+    pl110_draw_line2_lblp_rgb32,
+    pl110_draw_line4_lblp_rgb32,
+    pl110_draw_line8_lblp_rgb32,
+    pl110_draw_line16_555_lblp_rgb32,
+    pl110_draw_line32_lblp_rgb32,
+    pl110_draw_line16_lblp_rgb32,
+    pl110_draw_line12_lblp_rgb32,
+
+    pl110_draw_line1_bbbp_rgb32,
+    pl110_draw_line2_bbbp_rgb32,
+    pl110_draw_line4_bbbp_rgb32,
+    pl110_draw_line8_bbbp_rgb32,
+    pl110_draw_line16_555_bbbp_rgb32,
+    pl110_draw_line32_bbbp_rgb32,
+    pl110_draw_line16_bbbp_rgb32,
+    pl110_draw_line12_bbbp_rgb32,
+
+    pl110_draw_line1_lbbp_rgb32,
+    pl110_draw_line2_lbbp_rgb32,
+    pl110_draw_line4_lbbp_rgb32,
+    pl110_draw_line8_lbbp_rgb32,
+    pl110_draw_line16_555_lbbp_rgb32,
+    pl110_draw_line32_lbbp_rgb32,
+    pl110_draw_line16_lbbp_rgb32,
+    pl110_draw_line12_lbbp_rgb32,
+};
+
+#undef BITS
+#undef COPY_PIXEL
+
 
 static int pl110_enabled(PL110State *s)
 {
-- 
2.20.1


