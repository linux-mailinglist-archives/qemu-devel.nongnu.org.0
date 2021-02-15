Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B2131B75E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:42:45 +0100 (CET)
Received: from localhost ([::1]:58488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbL2-0000Tw-VD
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbBA-0004Uj-Rr
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:35 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB3-0001je-LC
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:32 -0500
Received: by mail-wr1-x432.google.com with SMTP id n4so5265049wrx.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvF8P5E15O40+Gw1s78SulbtIHDLH/Ds9X/sriTHyPY=;
 b=OwZWmmH+67QuViAPfJoNecTjOjmDLkz2Pz7l3FwpD5dmEKYEl+NKDrHufot9y+vBpu
 95FruJvL+vrVVPA6CvnN8c4B4BgB+cGyhEA5DHCrLlSMYssxnRrENtFox96ljyLfxfvO
 rWXXB70AXb04VD9SqVUnf86bKQF28CkQHbQC97bee5XMa50LhRTY90F5aQ14DJycs8Nm
 ksAcrzxK1Ijls0fHOIVHDDzJggx3LUFwYOIma1IZKkF6ypY6cT8ITg+S2u54hC9o4eBA
 +UoNvIejGmMFsXcK+gK6eiri2Aw1KNl/u4V27oXXsV/mrVU+CdonvvBj1+pW+YjsTSuH
 u0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvF8P5E15O40+Gw1s78SulbtIHDLH/Ds9X/sriTHyPY=;
 b=DZ4En4X0X5hAri9Bt8aDgdk2u2kzcWBBOYY1+HPOpf2IRO7T63bT8icQT7uHRDrhad
 Sf8489zMZBdg8Qty5Y2vb1vf/ZHWHfLDHh/ZGjHxotLvhTJPF96BQUq/Ix5+ks87EkPV
 EoMQsxUovAzrixGHkwweSWLVaxUbHGZmBCu/2cNDni9ys+wWnjBppo/V5fiQhpVNgBQ0
 gnsRNKBImVdMewtCRYv05+gFeYZU411o/xAYzI2wt2RSjNNCQcVD5Gwj73eOCSW75Dbx
 5QDBYR2QadFals0/rp97vZflcjXtKHMCcVNRF4bVtmLS+oRKLAvkqcjzriiLf7kP+w6S
 4w1g==
X-Gm-Message-State: AOAM530qEVz1l43VmedqFSx46g7Xln0tLoWMP98gDH4tggdaKNAwPSD2
 XTxuJqizwAgoKP/njEWnUgJkWg==
X-Google-Smtp-Source: ABdhPJx2jj51v4FTTjpIMfY+6TUpp2EhnqjPfgOEWJLrgm+o5M0Chn+JgtmZii0Y4Jm4aLaOFMit1Q==
X-Received: by 2002:adf:b611:: with SMTP id f17mr17787056wre.8.1613385144453; 
 Mon, 15 Feb 2021 02:32:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 9/9] hw/display/omap_lcdc: Delete unnecessary macro
Date: Mon, 15 Feb 2021 10:32:15 +0000
Message-Id: <20210215103215.4944-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

The macro draw_line_func is used only once; just expand it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/omap_lcdc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 2db04fad2fc..0ba42ef637c 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -70,8 +70,6 @@ static void omap_lcd_interrupts(struct omap_lcd_panel_s *s)
     qemu_irq_lower(s->irq);
 }
 
-#define draw_line_func drawfn
-
 /*
  * 2-bit colour
  */
@@ -202,7 +200,7 @@ static void omap_update_display(void *opaque)
 {
     struct omap_lcd_panel_s *omap_lcd = (struct omap_lcd_panel_s *) opaque;
     DisplaySurface *surface;
-    draw_line_func draw_line;
+    drawfn draw_line;
     int size, height, first, last;
     int width, linesize, step, bpp, frame_offset;
     hwaddr frame_base;
-- 
2.20.1


