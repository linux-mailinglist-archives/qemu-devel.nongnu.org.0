Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07AF31B759
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:40:23 +0100 (CET)
Received: from localhost ([::1]:50948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbIk-0005dP-Ve
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB8-0004Pk-C7
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:30 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB1-0001iP-Lp
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t15so8181719wrx.13
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wqQuNSScfV3wYUHwareGGzMG2kJiGR91GYUzreZvQc=;
 b=S2vPhc/W8Bj086kHqYFUFE6pOvKHqXBAhdl0iuxV/+svZQEYnRAKMMiux5RnJZeJq4
 Lmt1ufZ+n5fyBxA7/sN6SPf2qhLi90/09djJjGBjPpIQriNGBRSoTXMR4Deh3af+IWSV
 cFHlQipZ101EeZdwkhnGynXz+kX+JIV3VqyC5m1W7xDRK2Cr59XRjJ2HN4Qy5jd/3Odd
 d+U8Qb8eSNUTB8JQ438myy+4eZY3Pqd7/4JCG4Vs5ohXRvqx4VAlWye+g9r5ZY4uqsa8
 G8OQY8bnYFNSxD6oDamRRHUmfHXKFkRv/CceGF5Mr/L+mgmXLyWExnaPo2aLMEwwW94N
 REfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wqQuNSScfV3wYUHwareGGzMG2kJiGR91GYUzreZvQc=;
 b=g7vJdmNmkW1fFHrEeCklHINCzL66RJkQk4W0MVG91SSb5onDR8GUli5w2Co+72hNS0
 VAWEHa+NpLwXXedt1d+UV3D5xv4CoKUtCSjIl44XAcoxyHG2+9H4Z/3xfVeBeP9rYqyQ
 DKUDqYYBcwvua/ia1TcpRoQEUajvJJLwdPnUYcA3vioerH0UI8HoRgMVgF7VvPU0Ytkc
 NNzh2Sa6xeQh7RyvMpKb1CvT625IEshK6Aziv0pggonYXb58BZMIX8VqeW06N/2bjxVC
 KN2zELpfmCCWcvvjpwXo1LEZu2/8+f/j7G6qKJlbsMXuoKMBGTSqkLJMpEDpGVqwnzZ/
 tlfA==
X-Gm-Message-State: AOAM532m0B7ClPGNwJ6i6DcIN6dDAhHgRu5pYfzUWaTcDS/mDOCB65w9
 9ubYzkoVr3OaKq4mnB1UwU1U7w==
X-Google-Smtp-Source: ABdhPJzCklrTgz9jh0sBt5HUFzb3Rv6hr6Wrrgt2DXTB/iwAj4dsKdwG0Y/2KtpYsdB5tRqEddn/5w==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr15517254wrn.374.1613385141569; 
 Mon, 15 Feb 2021 02:32:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/9] hw/display/omap_lcdc: Expand out macros in template header
Date: Mon, 15 Feb 2021 10:32:11 +0000
Message-Id: <20210215103215.4944-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

The omap_lcdc template header is already only included once, for
DEPTH==32, but it still has all the macro-driven parameterization
for other depths. Expand out all the macros in the header.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/omap_lcd_template.h | 67 ++++++++++++++--------------------
 1 file changed, 28 insertions(+), 39 deletions(-)

diff --git a/hw/display/omap_lcd_template.h b/hw/display/omap_lcd_template.h
index 1025ff3825d..c7c5025fb04 100644
--- a/hw/display/omap_lcd_template.h
+++ b/hw/display/omap_lcd_template.h
@@ -27,18 +27,11 @@
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#if DEPTH == 32
-# define BPP 4
-# define PIXEL_TYPE uint32_t
-#else
-# error unsupport depth
-#endif
-
 /*
  * 2-bit colour
  */
-static void glue(draw_line2_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line2_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
 {
     uint16_t *pal = opaque;
     uint8_t v, r, g, b;
@@ -48,26 +41,26 @@ static void glue(draw_line2_, DEPTH)(void *opaque,
         r = (pal[v & 3] >> 4) & 0xf0;
         g = pal[v & 3] & 0xf0;
         b = (pal[v & 3] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         v >>= 2;
         r = (pal[v & 3] >> 4) & 0xf0;
         g = pal[v & 3] & 0xf0;
         b = (pal[v & 3] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         v >>= 2;
         r = (pal[v & 3] >> 4) & 0xf0;
         g = pal[v & 3] & 0xf0;
         b = (pal[v & 3] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         v >>= 2;
         r = (pal[v & 3] >> 4) & 0xf0;
         g = pal[v & 3] & 0xf0;
         b = (pal[v & 3] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         s ++;
         width -= 4;
     } while (width > 0);
@@ -76,8 +69,8 @@ static void glue(draw_line2_, DEPTH)(void *opaque,
 /*
  * 4-bit colour
  */
-static void glue(draw_line4_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line4_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
 {
     uint16_t *pal = opaque;
     uint8_t v, r, g, b;
@@ -87,14 +80,14 @@ static void glue(draw_line4_, DEPTH)(void *opaque,
         r = (pal[v & 0xf] >> 4) & 0xf0;
         g = pal[v & 0xf] & 0xf0;
         b = (pal[v & 0xf] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         v >>= 4;
         r = (pal[v & 0xf] >> 4) & 0xf0;
         g = pal[v & 0xf] & 0xf0;
         b = (pal[v & 0xf] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         s ++;
         width -= 2;
     } while (width > 0);
@@ -103,8 +96,8 @@ static void glue(draw_line4_, DEPTH)(void *opaque,
 /*
  * 8-bit colour
  */
-static void glue(draw_line8_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line8_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
 {
     uint16_t *pal = opaque;
     uint8_t v, r, g, b;
@@ -114,17 +107,17 @@ static void glue(draw_line8_, DEPTH)(void *opaque,
         r = (pal[v] >> 4) & 0xf0;
         g = pal[v] & 0xf0;
         b = (pal[v] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         s ++;
-        d += BPP;
+        d += 4;
     } while (-- width != 0);
 }
 
 /*
  * 12-bit colour
  */
-static void glue(draw_line12_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line12_32(void *opaque, uint8_t *d, const uint8_t *s,
+                           int width, int deststep)
 {
     uint16_t v;
     uint8_t r, g, b;
@@ -134,17 +127,17 @@ static void glue(draw_line12_, DEPTH)(void *opaque,
         r = (v >> 4) & 0xf0;
         g = v & 0xf0;
         b = (v << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         s += 2;
-        d += BPP;
+        d += 4;
     } while (-- width != 0);
 }
 
 /*
  * 16-bit colour
  */
-static void glue(draw_line16_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
+                           int width, int deststep)
 {
 #if defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
     memcpy(d, s, width * 2);
@@ -157,13 +150,9 @@ static void glue(draw_line16_, DEPTH)(void *opaque,
         r = (v >> 8) & 0xf8;
         g = (v >> 3) & 0xfc;
         b = (v << 3) & 0xf8;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         s += 2;
-        d += BPP;
+        d += 4;
     } while (-- width != 0);
 #endif
 }
-
-#undef DEPTH
-#undef BPP
-#undef PIXEL_TYPE
-- 
2.20.1


