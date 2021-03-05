Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A121732F1AE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:49:09 +0100 (CET)
Received: from localhost ([::1]:45806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEZY-0003eY-2H
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3O-0006uy-BP
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:54 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE32-0007Y2-53
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:54 -0500
Received: by mail-wm1-x342.google.com with SMTP id u187so2098910wmg.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=07pM0WOVehXF9gW5Sle5gcNFxq7woJZm5ufwglvBDn8=;
 b=pK6Zi4eId/SAycAggwrM2tCudXpC+1TXhSY1U1VLopoS/3SSEIOywNB3o/dsNsc8g2
 L+tcGcWjrGcvYNlK1p3PC95TG+HddDp9a8BeVtaBgda6JKAgiD9hyRAyLTe3h95hTUm3
 ntGgMbxTtefLQSu9pY2dup6FOz1liZEQVlk/BBoUb+15UPHAglyi56SBes8Y8fwn4r7W
 MEgyCFsXP/G48t17Fd0CsEVhC8V4rue4QuJe0ZKyVP/9IZijl9JRjSxTKW0NGTr4bDAg
 MQnS8BbEvJZA77m6TxPgHSBbyPURKw41MrYewrBD2P5NhY5Q8FytTCbAR9BqzJI8LocA
 W2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07pM0WOVehXF9gW5Sle5gcNFxq7woJZm5ufwglvBDn8=;
 b=XGSPGOCDbSndqymOINj086bV+N7nSjeovW4rS3BPTsbgsbXFzhJkGumgW7QYftj6Dg
 WAlPNQDmB0iV8h3O+ikarWyMbCbSyVXl4kp3knQue+RTwzJlX2JhDfdsGyInu89tSrhb
 mnSwPUDzAkfv4GZpOoScCt7MGICQPf0dx8svf+CAlx8+eK/uPntogwDIsUiDIHyRfqbu
 vsMAH8OGbdXQczwfrjFZxgpuDNl7Utu+72D31gPn4BbyHmtkpCSJ1bIr5OW0TIVIlC0b
 jaCk8+nxuFWu12rOWUJ41SrE32w5boVHftHZns+dy7tdlzVxDbPtvWT/e8XsEPM8ZxnA
 gQ3g==
X-Gm-Message-State: AOAM533DdRwA1Nggh4612W1cLNEF7m2rgTMh9rzn/E/1n46PXJLN7m61
 XkXiXho3fLn8W1WP/0zFhMCmksXVYGd39w==
X-Google-Smtp-Source: ABdhPJyXs6T/uNIO7usfrJJ9TwlNH7vN2Lng7D3PIXhQeLTFFVLIsY9BoGUQXL3DqoWOWcbt38Nvgg==
X-Received: by 2002:a1c:3c02:: with SMTP id j2mr9902686wma.92.1614964530649;
 Fri, 05 Mar 2021 09:15:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/49] hw/display/tc6393xb: Expand out macros in template header
Date: Fri,  5 Mar 2021 17:14:44 +0000
Message-Id: <20210305171515.1038-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

Now the template header is included only for BITS==32, expand
out all the macros that depended on the BITS setting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215103215.4944-4-peter.maydell@linaro.org
---
 hw/display/tc6393xb_template.h | 35 ++++------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/hw/display/tc6393xb_template.h b/hw/display/tc6393xb_template.h
index 78629c07f97..7789ffc4399 100644
--- a/hw/display/tc6393xb_template.h
+++ b/hw/display/tc6393xb_template.h
@@ -21,25 +21,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#if BITS == 8
-# define SET_PIXEL(addr, color)  (*(uint8_t *)addr = color)
-#elif BITS == 15 || BITS == 16
-# define SET_PIXEL(addr, color)  (*(uint16_t *)addr = color)
-#elif BITS == 24
-# define SET_PIXEL(addr, color)  \
-    do {                         \
-        addr[0] = color;         \
-        addr[1] = (color) >> 8;  \
-        addr[2] = (color) >> 16; \
-    } while (0)
-#elif BITS == 32
-# define SET_PIXEL(addr, color)  (*(uint32_t *)addr = color)
-#else
-# error unknown bit depth
-#endif
-
-
-static void glue(tc6393xb_draw_graphic, BITS)(TC6393xbState *s)
+static void tc6393xb_draw_graphic32(TC6393xbState *s)
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int i;
@@ -49,24 +31,15 @@ static void glue(tc6393xb_draw_graphic, BITS)(TC6393xbState *s)
     data_buffer = s->vram_ptr;
     data_display = surface_data(surface);
     for(i = 0; i < s->scr_height; i++) {
-#if (BITS == 16)
-        memcpy(data_display, data_buffer, s->scr_width * 2);
-        data_buffer += s->scr_width;
-        data_display += surface_stride(surface);
-#else
         int j;
-        for (j = 0; j < s->scr_width; j++, data_display += BITS / 8, data_buffer++) {
+        for (j = 0; j < s->scr_width; j++, data_display += 4, data_buffer++) {
             uint16_t color = *data_buffer;
-            uint32_t dest_color = glue(rgb_to_pixel, BITS)(
+            uint32_t dest_color = rgb_to_pixel32(
                            ((color & 0xf800) * 0x108) >> 11,
                            ((color & 0x7e0) * 0x41) >> 9,
                            ((color & 0x1f) * 0x21) >> 2
                            );
-            SET_PIXEL(data_display, dest_color);
+            *(uint32_t *)data_display = dest_color;
         }
-#endif
     }
 }
-
-#undef BITS
-#undef SET_PIXEL
-- 
2.20.1


