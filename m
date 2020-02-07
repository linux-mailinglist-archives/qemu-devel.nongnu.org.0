Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A2155A09
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 15:50:06 +0100 (CET)
Received: from localhost ([::1]:58340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j04xI-0007cE-Df
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 09:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j04iJ-0001UT-Aw
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j04iI-0003Xv-3e
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:35 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46066)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j04iH-0003Vf-TR
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:34 -0500
Received: by mail-wr1-x443.google.com with SMTP id a6so2914455wrx.12
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 06:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vV8V6Zd2+ORatSPrLlkXyDVrWhjxqzqsgFcOjCYFJpU=;
 b=dvLbfPpcMkJC5O2Qam6/Ed0jwJ2bQGqy+VKJD7Zj1BGXt3iKbsubVeAUSNO466dPF/
 3saVONziueJru7CHMDwY2e+WwPQoEm3zjUBf6kwF+hLGPXOVfV/idBJhV07DqEJnv3TM
 6fFW+acTOzkgjxFTpyA2+mMK4/oKBVDOrChTPSSkxAf7ZOnkF7macGc7wUTalwm5ouWe
 fhuUI6E0ch3jUdMIxKIEFOlv2s2l8pnAxfGjHkRvYu3er6+wy41vfB1x022Zf9qlrhFq
 f+47qQ2zE4oujhOAYSS3w+LUkJusft6rE/zIDMyY6YnLkTk/nAedQkhRD0PybLqEf0QB
 oGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vV8V6Zd2+ORatSPrLlkXyDVrWhjxqzqsgFcOjCYFJpU=;
 b=DwNiwXBqRgrbZ1fwgd8yA4hqJYUiBh68fe2pVxEKlqqHHPCNQbJDmzEJ/wfeDtTSKv
 tSOJ+CQjm5DEDSRIZ/I81eAbAm+ZzPHvN5WMwRnrFnGdFbsSaZO+ONBa9xsTfDXCEojT
 M3lImE4HWPYiGQAqF1lxl23oGLnalpdhCuHEHYc6CkSX6kMa8ltFZsF4EXv5cePDzum0
 LTyzj6hKxYZUBci/yVp1S+fb6GABRiW7jMNbU0otD7LVo1QXqa3QP0R/+zDwU623BAPA
 uOeZ3ClRqeV2dTJ0wy+TuJvAIM8V57oBcE8a8nYSTXgZvrfxJ7vqZCZGfK3b28GcjxCN
 upnw==
X-Gm-Message-State: APjAAAWw6Cz0HMZt0jbc7RwzPmzC1iRP7Q6xIuBRdRwL5k89UP3P8dH/
 6130su08l+5+kjlky/5nb50fYYFvwlE=
X-Google-Smtp-Source: APXvYqzrmT66XZUG0I8k3KrwkXnOMc4dZuNf5h/BOF/7gEHEvgrKSrQxqvqedv9g1rgF2zprP8ZAVA==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr4924519wra.8.1581086072771;
 Fri, 07 Feb 2020 06:34:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w1sm3796430wro.72.2020.02.07.06.34.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 06:34:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/48] bcm2835_dma: Re-initialize xlen in TD mode
Date: Fri,  7 Feb 2020 14:33:39 +0000
Message-Id: <20200207143343.30322-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200207143343.30322-1-peter.maydell@linaro.org>
References: <20200207143343.30322-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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

From: Rene Stange <rsta2@o2online.de>

TD (two dimensions) DMA mode did not work, because the xlen variable
has not been re-initialized before each additional ylen run through
in bcm2835_dma_update(). Fix it.

Signed-off-by: Rene Stange <rsta2@o2online.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/bcm2835_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index 667d951a6f7..ccff5ed55b2 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -54,7 +54,7 @@
 static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
 {
     BCM2835DMAChan *ch = &s->chan[c];
-    uint32_t data, xlen, ylen;
+    uint32_t data, xlen, xlen_td, ylen;
     int16_t dst_stride, src_stride;
 
     if (!(s->enable & (1 << c))) {
@@ -82,6 +82,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
             dst_stride = 0;
             src_stride = 0;
         }
+        xlen_td = xlen;
 
         while (ylen != 0) {
             /* Normal transfer mode */
@@ -117,6 +118,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
             if (--ylen != 0) {
                 ch->source_ad += src_stride;
                 ch->dest_ad += dst_stride;
+                xlen = xlen_td;
             }
         }
         ch->cs |= BCM2708_DMA_END;
-- 
2.20.1


