Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED032F239
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:15:25 +0100 (CET)
Received: from localhost ([::1]:44002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEyy-0006KS-Iw
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3Q-00070U-Hi
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:56 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3A-0007bE-05
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id e23so2101509wmh.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2b6FsaIecUp7nn2WzqIajLloJVXEMYAzJTZLvvG7dSo=;
 b=IXVE+MgalQIgEyW5JQjoyGvT3KndB7KCnTd5JBvrnl631BrZqYj2c2cKuh5XGNoJLx
 5ZtQYVhYRs7jVHNd83jir7ebU8gqg2XEYPpS/4l1cQFD25rE/lq4CENQuu6mgDAALq1r
 TdfyCAYlfi0KlKPLpBSZuq2biw3Dtm2OukTHb4ZTczNQg+MyiHoXUkY0668aZrCfjvLk
 kwSLC/VwXGqKfGRjPvWxrQKHTRVmvUH5slfmmHc8L6VEulwVVSf1tQzDOVm3ksCsbYd4
 KyKAtJdFhRGLuEty+s38zdeunbvapTICssSkarw+ctvS3Tco09BRvU0KPnH2U3AiLgSa
 Jt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2b6FsaIecUp7nn2WzqIajLloJVXEMYAzJTZLvvG7dSo=;
 b=lCcq2T2qsJ8+Ivd+CNQ2dmC54U/PYNDdKJyWe4mkbvgd50dWaNMmETVN5oPM92jVxU
 We4ilZdw9jZiulHbbYui2yUhUDomodPhCuw+3ErlIZU/xf8DvTQPUTLFapmd1cmgXsnL
 0h9YHHAFz9p8IUlNvyqm2+avr0caNomaoDcjiBiCYiietyqFO/vGFfdP1gzLNjF/NNEz
 6yTQD3OFCUu0h7K1Pu9UiQo+eqMUScz4XWJ9m0sC4KhWY9ZtQGMwuoWob1sMgFdneooa
 1X9aWH+yu8fK2h/23GmBEQz6hGMQwMhWgm3YenOMVEvtBKLLiJvlFioqBl8Sr87mNFBs
 BFVA==
X-Gm-Message-State: AOAM532nvMjRknV3wWe4VKVgRiEEPZAWcmG14b3kJhToz6HGpa6tr5MY
 JTRYLgUhFChkW8BBs/Tu5qL7tILaB5CZhw==
X-Google-Smtp-Source: ABdhPJxE51iDO2lMfiVQeE8ZTbW/IrQCs+JsSgePfT//qj9ipaMF8R2+2Q+xrX9mCIN+76aiKhzFSA==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr9879536wmq.102.1614964534621; 
 Fri, 05 Mar 2021 09:15:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/49] hw/display/omap_lcdc: Delete unnecessary macro
Date: Fri,  5 Mar 2021 17:14:50 +0000
Message-Id: <20210305171515.1038-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

The macro draw_line_func is used only once; just expand it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210215103215.4944-10-peter.maydell@linaro.org
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


