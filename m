Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA9832F1BD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:51:56 +0100 (CET)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEcE-0007Po-V7
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3P-0006wx-4f
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:55 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE33-0007YZ-Bd
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id h98so2859352wrh.11
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=82LXHxwBBe/MWFU79Su6RDg394WLeix2gBXm5V3aPts=;
 b=r7YgMkFO0EidbByCd3MvOlxAZ3xoAenmudU7DNfcJ4LwEH4MlZ2x+gXOCxrqsWfrPh
 8Lwdce/IM3y+94SjpjGKFBXzO7cd6pEVZKUam9+2JXA2GudeTbiOfwOJ53ImA9Ozz+R2
 etOviEeucAv67r0Ap+HU/ljLNb4gl+o3h8i6eR5Fq48qCMAUmt4GmsX2KiuGFPpy2oh/
 LWbagP6DPbC184GBnU54H2hjQ1SKMbujULJX+iqVZnLW/kb3GmBieQe1mD36MT9yzAbf
 SwX7sQzOkLvH1I1+DMfcRVgzg6aBs/DkHw39Ov9XBn+fS1QU4Nq5VJWAK/hDbxo68YLi
 m/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82LXHxwBBe/MWFU79Su6RDg394WLeix2gBXm5V3aPts=;
 b=CDeiPoSejsVGKZZx/ruRza60iXiy/HSEJ/cqd2x/loNBCthuQpKzbfY0IvpJWs6N/n
 0vT9u+j/JV/4AtW5TeECDBi+jo7lDOCJpAcBYr+sHNq51noYabRJr5+uYc2ZN49jM8y4
 Y08DNzFp4ECQ+rhm5NCTJk6z5gtHDqai/Ktbf20G/Lz3hPLD/kgqpIIGnwfRz4+ycXUV
 LwHR+M2+4iRCO2kyMU0HrMd3XmH3dGYvp3nhjoBF8MGHSAlHmDXctRAd27VnOcJQGHMi
 IyHCLp4u3isNpTdbWPMOgYZ4p6utShWY5ETaNA6AswKZt1gQ4f2I3wbjBsJB5BrbRT6c
 oArA==
X-Gm-Message-State: AOAM5330s3+Sgjo3S1KiDooi/YJV7nlPnaAocZ4pLz1mnojxqj802JX9
 9+zICuYiIsqzZ2o5aM2EoasTeX0kbipl1A==
X-Google-Smtp-Source: ABdhPJzf7Jd31IhvOCemXup0KjA5ieuNMk2p+hnhChQ4AQnHd7ksNDhSC1qWZzzLdNg+TqE+wmUylw==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr10412365wrr.49.1614964532018; 
 Fri, 05 Mar 2021 09:15:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/49] hw/display/omap_lcdc: Expand out macros in template
 header
Date: Fri,  5 Mar 2021 17:14:46 +0000
Message-Id: <20210305171515.1038-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

The omap_lcdc template header is already only included once, for
DEPTH==32, but it still has all the macro-driven parameterization
for other depths. Expand out all the macros in the header.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210215103215.4944-6-peter.maydell@linaro.org
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


