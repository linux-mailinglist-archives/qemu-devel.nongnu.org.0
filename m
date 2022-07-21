Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E4557CE3F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:53:50 +0200 (CEST)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXYi-0008I6-Kk
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alanjian85@gmail.com>)
 id 1oERMa-0005qe-CI
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:16:58 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alanjian85@gmail.com>)
 id 1oERMX-00043o-9g
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:16:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w7so1102509ply.12
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IE2seZL3x2Www6erRXlPQ9VA2PPtiiWtp2rXYtsXqyI=;
 b=m1jj3LygaOuMhZ3gfR63I2AWGAK0FWAFbGt+Z8A7gFco7RothLOJaB04k7JFzLi1kb
 fXXFo3ZOb8OyTqR1gE7OrfniS092ZIgynB/PagVB0rucemOWDfv23EqRWjYXRqT7P2wq
 FkKFJ0mtkXdUfrxjiQ8hBY3ugqrK1adGq258s2gHeaqDqKAp11UwLxbOVFB0NJpHSjhT
 dWwkDBj/RM1AOPCNIYxYIfTcRUdIlPZEcTB6oJPBhvhZzAppNj0ZZExVHii+60nbp0LD
 BgPjBIQAax1jD+2z5xXAlALqAYw/VE9lRNLO0ItP0VkreCSdQ31cvNmKTHo7OqoC2ns+
 Ne1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IE2seZL3x2Www6erRXlPQ9VA2PPtiiWtp2rXYtsXqyI=;
 b=KwRdnWIj+xWJA3YXMB8zNzojYy6B+J1p3cwixcwH+rFNnSBYlZeZrzgJ5j4+0Ro6nN
 S+JTtivVnc/3Tylf0+cDxf3+vHiROfsXI+Bqf/9uZcFEeBL3rFqmKPziEIHbBOfOINbt
 2JKYsAlbkTFHngv8wzMLFmE+Tru7KUMPM3eXHJ/sNhmd2377Vu28qnWaJiCHKiQ3+OIW
 4Ws1dZoTS50ES/ZM9Dy+TVSHBMSXjL/pbHk2Dy6WndVMG9u2tR2ECom07JGAfgOuC5+4
 ziR/OMcayBgk+Ie9xoMP4Y6MQID4/FyHB3n2Fnpx0JgNoum8rQA2+aKJ+1TQbN7oqjGG
 gRaQ==
X-Gm-Message-State: AJIora+vgIaxHn8yv5u7XSTS2Qb67uqS9eqZRx6S+KA7kth6Rb8vc0t9
 JE5lUaGV72cMnUy5FWbeQdyd5Z2TSs8=
X-Google-Smtp-Source: AGRyM1vulSjyODDjiv4bf4RU02szjC1tRg/LI/aCt4WcuJnpGRxmGtMVqeATn3wvhCrOSX+1y25ixQ==
X-Received: by 2002:a17:90b:3d04:b0:1f0:693f:69c8 with SMTP id
 pt4-20020a17090b3d0400b001f0693f69c8mr10014585pjb.188.1658391407282; 
 Thu, 21 Jul 2022 01:16:47 -0700 (PDT)
Received: from alanjian85-Vostro-5490.. (36-227-58-102.dynamic-ip.hinet.net.
 [36.227.58.102]) by smtp.gmail.com with ESMTPSA id
 o71-20020a62cd4a000000b00528d11c26f2sm1054006pfg.1.2022.07.21.01.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 01:16:46 -0700 (PDT)
From: alanjian85 <alanjian85@gmail.com>
X-Google-Original-From: alanjian85 <alanjian85@outlook.com>
To: qemu-devel@nongnu.org
Cc: alanjian85 <alanjian85@outlook.com>
Subject: [PATCH] hw/display/bcm2835_fb: Remove unnecessary offset
Date: Thu, 21 Jul 2022 16:15:44 +0800
Message-Id: <20220721081544.38228-1-alanjian85@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=alanjian85@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Jul 2022 10:50:32 -0400
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

This patch fixes the framebuffer mailbox interface(marked as deprecated
in official docs, but can still be fixed for emulation purposes) by
removing unneeded offset to make it works like buffer allocate tag in
bcm2835_property interface[1], some baremetal applications like the
Screen01/Screen02 examples from Baking Pi tutorial[2] didn't work
before this patch.

[1] https://github.com/qemu/qemu/blob/master/hw/misc/bcm2835_property.c#L158
[2] https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html

Signed-off-by: alanjian85 <alanjian85@outlook.com>
---
 hw/display/bcm2835_fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 088fc3d51c..a05277674f 100644
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
2.34.1


