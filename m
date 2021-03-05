Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C632F1E6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:54:27 +0100 (CET)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEeg-0002ah-6e
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3P-0006yz-T0
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:55 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE35-0007ZN-Mu
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v15so2900880wrx.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z1VRnBcGWOo455ms4VehMbMAOyZArRGSG/VL9ef6/SA=;
 b=D8oCrvj3GSAzIihWOwFYZkrCOOqOrr4noIsCKKy1MSJXX01w3XuRCEIioMEO9oBX+/
 D/HJFs0RlnqhDGm3rL4Qi+Uzb3A3hFcqnx80LytpG+pTSD1xVgfWmsqeFLDjrcOaE854
 V5Yjy1hs36EP2OSmh9UBDA3uhKpVErilfax44/60lkp8Pt7n1o2Ba2t+JSh9QVPKuyDk
 Mzgeyyvl25ioiCgfsouyebsckjuUO0j6/r9XdafwcJOX2JztOTl6gjNGTALuEm0PpYQ1
 fRUtmcEliwTzkdfB+pCgJvkValGApEz7O5nXb190z8xYK9sZw1DgJe+umm95htAXHNJ1
 VF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1VRnBcGWOo455ms4VehMbMAOyZArRGSG/VL9ef6/SA=;
 b=F7eEt4IFfZPqNP92ILHDUJ0gmLHkLSRuPTLHDOU/0yqw3iiQiNqTji+W8CWZxBQD6R
 sIS42jjdptnRP58hOAfQL+SIz7Sv0/HGKuOvdOD+cASyEnElIzCySn8+AiJLrNmGTUe0
 1iMU8CpvHUAsWzfkG4acDOYbPHzYtSfvAUxx1ozr7uv31TyVrWVplm807QXIVr8UIevW
 hc3ELZzBql/EM3LgTbGNjTInIIws7p/RbzKrCOtF4yfMFEvrLBooU0NBg1b/y+W99Fls
 KFP9z2YKRO1cZt65MNgbAQQKeXko1Vuxe8I1xgDunvf1G+QBJummD/IRAXwdRcuQt+bz
 dFNg==
X-Gm-Message-State: AOAM531mM+yZYorRD7A+0q/NM0BkBwrBg3mRGTTiPiSIbnlLLenYUf2Y
 1fnGVQGigmAUrfQJfnxyp/dFNgV6SYiq0g==
X-Google-Smtp-Source: ABdhPJzNai2hPKDSrm8ddobiCUJDxGd/WvhtMvaOGwr5jTie4A/RT72T+u/rQUwpA0uNL2ZGjfegmQ==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr704139wrg.180.1614964533288;
 Fri, 05 Mar 2021 09:15:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/49] hw/display/omap_lcdc: Fix coding style issues in
 template header
Date: Fri,  5 Mar 2021 17:14:48 +0000
Message-Id: <20210305171515.1038-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Fix some minor coding style issues in the template header,
so checkpatch doesn't complain when we move the code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210215103215.4944-8-peter.maydell@linaro.org
---
 hw/display/omap_lcd_template.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/omap_lcd_template.h b/hw/display/omap_lcd_template.h
index 22e51d9bffb..a2f86eee3c8 100644
--- a/hw/display/omap_lcd_template.h
+++ b/hw/display/omap_lcd_template.h
@@ -61,7 +61,7 @@ static void draw_line2_32(void *opaque, uint8_t *d, const uint8_t *s,
         b = (pal[v & 3] << 4) & 0xf0;
         ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         d += 4;
-        s ++;
+        s++;
         width -= 4;
     } while (width > 0);
 }
@@ -88,7 +88,7 @@ static void draw_line4_32(void *opaque, uint8_t *d, const uint8_t *s,
         b = (pal[v & 0xf] << 4) & 0xf0;
         ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         d += 4;
-        s ++;
+        s++;
         width -= 2;
     } while (width > 0);
 }
@@ -108,7 +108,7 @@ static void draw_line8_32(void *opaque, uint8_t *d, const uint8_t *s,
         g = pal[v] & 0xf0;
         b = (pal[v] << 4) & 0xf0;
         ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        s ++;
+        s++;
         d += 4;
     } while (-- width != 0);
 }
-- 
2.20.1


