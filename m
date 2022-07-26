Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C104158165F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:27:59 +0200 (CEST)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMTW-0000tx-QW
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMI-0006Vg-Rl
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMD-00063j-Ey
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id id17so8962783wmb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pjPZonZgIif23LZ1eMjprz1ddmRluH8DP+Iy9f6sgDM=;
 b=twyBhViCa3bdyDCbXVONj55ckcfmc3r4DYT7tfLNsRIkfzbCfJAKB/DzeVZh32s6zR
 O9u7FdQLu/U0wDycfsBBno2m4r9GotOpteYrkgvQG5giVR2lznftvE6j0fsr7GcXvXqP
 BnK31OchApsHrC6EEfAt22Ox5HB2qqu9/f4Aiob1x0eF54oL7r9kjpHn32L6rzCVqksK
 CGhpwq86ty127nqcoeU8JpX/WLszlqtwPL3yA67LlzsBCXlav9fnap7tJYmosW0udDwO
 A8u92dKK4W1NFyzvSRp6TjQMfUpjor0679LByECHoTA8voddhZwcWcTl0HmQyVa82Pms
 1CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjPZonZgIif23LZ1eMjprz1ddmRluH8DP+Iy9f6sgDM=;
 b=ebI6dJfD4Bdl0Md4M/LAMW2pLl95wVEcZkL8gI+uJGYoj2fESlAAXXiWWdAtybFzNl
 1W9zsHoKUn4sCBAYUnagkg+l9PS/BtDe6YIg/ahxjHuXajzHaF2C2ShU0+5O9NL66OcX
 oN8vhC7Te2tUQm5101CbHRtuifcDi6L58UgN5W9aS5vqGn84vxwMsj404kio2kx00sQJ
 5LMO+P4OJZ0Q89Alpy0ka8IY20lCs3zatOKdgTiWBTTjQB6KAnC7Zw2qKzaE3czyfDoO
 7ujUud9c42tG8tpDN7JdJww7aO5WtLu3NZ/70XwU8HfItuXMrdXGYbNom3AhLPKC1Fnl
 AaGA==
X-Gm-Message-State: AJIora8tBdtx0KYBkqz+dBPpwoXHHA2NPoTfGxhCQJ5CMrS3+JKIXHgr
 LiiFxVAs6i/qZlm/dr1crOaoOzyDT3YV2A==
X-Google-Smtp-Source: AGRyM1ue7scHQBSF4MsfggxCQ4F2roYGwOTlZASJMDMcH/EldUD/HFm6X+ppnq+hYIEHosrMvUhKJQ==
X-Received: by 2002:a7b:ce0a:0:b0:3a3:1adf:af34 with SMTP id
 m10-20020a7bce0a000000b003a31adfaf34mr12306948wmc.127.1658848823710; 
 Tue, 26 Jul 2022 08:20:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] hw/display/bcm2835_fb: Fix framebuffer allocation address
Date: Tue, 26 Jul 2022 16:20:12 +0100
Message-Id: <20220726152012.1631158-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Alan Jian <alanjian85@gmail.com>

This patch fixes the dedicated framebuffer mailbox interface by
removing an unneeded offset.  This means that we pick the framebuffer
address in the same way that we do if the guest code uses the buffer
allocate mechanism of the bcm2835_property interface (case
0x00040001: /* Allocate buffer */ in bcm2835_property.c).

The documentation of this mailbox interface doesn't say anything
about using parts of the request buffer address to affect the
chosen framebuffer address:
https://github.com/raspberrypi/firmware/wiki/Mailbox-framebuffer-interface

Some baremetal applications like the Screen01/Screen02 examples from
Baking Pi tutorial[1] didn't work before this patch.

[1] https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html

Signed-off-by: Alan Jian <alanjian85@outlook.com>
Message-id: 20220725145838.8412-1-alanjian85@outlook.com
[PMM: tweaked commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/bcm2835_fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 088fc3d51c5..a05277674f2 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -279,8 +279,7 @@ static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
     newconf.xoffset = ldl_le_phys(&s->dma_as, value + 24);
     newconf.yoffset = ldl_le_phys(&s->dma_as, value + 28);
 
-    newconf.base = s->vcram_base | (value & 0xc0000000);
-    newconf.base += BCM2835_FB_OFFSET;
+    newconf.base = s->vcram_base + BCM2835_FB_OFFSET;
 
     /* Copy fields which we don't want to change from the existing config */
     newconf.pixo = s->config.pixo;
-- 
2.25.1


