Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C2580120
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:07:07 +0200 (CEST)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzfm-0007QE-Pq
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alanjian85@gmail.com>)
 id 1oFzbz-0003F1-UP; Mon, 25 Jul 2022 11:03:14 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alanjian85@gmail.com>)
 id 1oFzbu-0001Gc-Hk; Mon, 25 Jul 2022 11:03:11 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q16so10608435pgq.6;
 Mon, 25 Jul 2022 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O630ZHvwqLA8MIAsYUIHlxVlcbZ6jvT8+3Z4HLFNcpA=;
 b=eRAGsAxKHo5Lpsz9vVqcxTSUplv11TxiVeENA34Uq0wZQrZPhJfp2ps2XfC4rMEzt+
 qBnXxbrZEg4EP0nTwP6tK0VayCXsfMMKdYCzqkC7QBjVMvsY/2sYNbMkv4Y3Ad7vYE+h
 ZCi6IeIlegfKnVwllLJEV3qu/3/7flFYatSwT0nRzATknwlGEwfDCPFyfq+/XIspgY2Y
 mOo5FCUwovYxNZl1jb59VqhHoj0MdQiuICCglg5/AqDwsjiIAvypC+kXtjPCrFvtszid
 czg4zkqiv+E1GhOIbzrAXGURdS0qOCcBmsq0QfsOn+CpL22OPbVbuJO2z3d97jOu7RSx
 K6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O630ZHvwqLA8MIAsYUIHlxVlcbZ6jvT8+3Z4HLFNcpA=;
 b=lJs7dMkJ7RFepgVT2yVfh0W6mCpimFdLySGRuIGNO4r+ZoT0nLpWpAdPY0Mv7YLm+G
 BTxx7VCr/IRFL3H2qKYbpnYutE1AoRB9jvCCUlFuCtm9qVhJIfipvl21JCoisg59zJLE
 /EPJKc1fYDr6cE6ab9M0EdU27PkE4NoqHU6j3HMjhHb5XVF6/V+hUFYAxtuvqJl6tkYq
 MRgzZqy6llsD1ALcj52xEBFSZ//Hdl9H63T9JqF1SxZhJs/KBlJtyZTKoYqlVieiKAPi
 g7kM64ox1QAerkeWGS+d/GpAzBA7hDUK5SAoEMkRHRkE38hP8hSNuxj+ERTLfx+jKb3F
 DOcw==
X-Gm-Message-State: AJIora9MAdw2xuBZSJSs94oN3o7dOW0U7SY4NdW/gCz/fqBFaXCkmKnJ
 kgvPF9lrp+z3kKyZ6va2txQZ3jkSCAZrXQ==
X-Google-Smtp-Source: AGRyM1vRCcULAWOLoja3gHUAL7VFryEaZSiMyKXZLWWwxgQZV2djBADc4/PuSMfeB6IULA6BAGbt4w==
X-Received: by 2002:a05:6a00:198f:b0:52a:dc25:cc78 with SMTP id
 d15-20020a056a00198f00b0052adc25cc78mr13114669pfl.20.1658761384295; 
 Mon, 25 Jul 2022 08:03:04 -0700 (PDT)
Received: from alanjian85-Vostro-5490.. (36-227-56-150.dynamic-ip.hinet.net.
 [36.227.56.150]) by smtp.gmail.com with ESMTPSA id
 h7-20020a17090a604700b001f1ef42fd7bsm11209451pjm.36.2022.07.25.08.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 08:03:03 -0700 (PDT)
From: Alan Jian <alanjian85@gmail.com>
X-Google-Original-From: Alan Jian <alanjian85@outlook.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Alan Jian <alanjian85@outlook.com>
Subject: [PATCH v2] hw/display/bcm2835_fb: Fix framebuffer allocation address
Date: Mon, 25 Jul 2022 22:58:39 +0800
Message-Id: <20220725145838.8412-1-alanjian85@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=alanjian85@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This patch fixes the dedicated framebuffer mailbox interface(marked as
deprecated in official docs, but can still be fixed for emulation purposes)
by removing unneeded offset to make it works like buffer allocate tag in
bcm2835_property interface[1], some baremetal applications like the
Screen01/Screen02 examples from Baking Pi tutorial[2] didn't work
before this patch.

[1] https://github.com/qemu/qemu/blob/master/hw/misc/bcm2835_property.c#L158
[2] https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html

Signed-off-by: Alan Jian <alanjian85@outlook.com>
---
This patch is v2 because the previous one is signed by my username, not my full name, 
which is not allowed in the submission rule of QEMU.

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


