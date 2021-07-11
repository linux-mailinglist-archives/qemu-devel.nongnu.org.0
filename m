Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E367B3C3F7E
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:21:24 +0200 (CEST)
Received: from localhost ([::1]:34084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gt9-0000on-Ue
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gaC-000861-B3
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gaA-0001Hv-8Y
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id p8so22090394wrr.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OmxKGUjs4sfYwEkxfNiJeYY6j02zoeqKGP4fymZlAv8=;
 b=LV/LV5ws8pQWsRyae0dsgMEsXbuZaD1aLqvJKepZF5yq7SV5DFlfn7h6sAyxpCVsxQ
 m6D4yVdTnmjjV9eSkVlLWMFne0Kp+NmrSm8GYeKwhFt2WJp9pU0SzLLWt/v7PvsJW2oa
 sfgquBu/IOXEsr5gji+TBj5JjfffDnyLWXQGG3kOPei/aNFIKl0qdXfO+2SCoy8flzur
 sQktqur1eMjelt5ZiJoWy7NmfhrHCClvoxiYvHLea++WjSw4DT/9lUV9zHml1vgQm4Rx
 pEkE0cDYPHmbRO+b8qj6K0ZaOnxS4DW8ELAndj+EHH4m1QRieDXJV2L2VPWhyWRmE2VZ
 OvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OmxKGUjs4sfYwEkxfNiJeYY6j02zoeqKGP4fymZlAv8=;
 b=WNnv1JuP0CQEBlNVDljL5hxwnC6sWqeW/a9zpJbbtYFMsXa7/XwmoYiizjK2yKmVMD
 U6bzafcR/JPDiAr5o5k5VLap+psVs2AJGck7WX7FtcMIxWyeuANbLo9tZSDatNNwdWMr
 nJ30kZa6S2PY1RV5vY8dfUHJ5+YveaVmJ8Y/bOWIRBfPqIpVATuFkzOcqEtd+0DzGvsi
 LobBtPr++ZeE+QfT/xYqm/TOcoRy2pCzURaBXV1qTy6H6TgNPFkGnsR+mgWdWbGxkuMB
 v2Vp4RzpaWRHHjn7IPH1xFqAMJnDqX+LQCrwWH1IKVwEX6JSz5gSaxfnht3nqovf+Rtg
 1tTg==
X-Gm-Message-State: AOAM532aKvcQmCEfR7KPqeziuh5Ypi7DJjCNeapFi2opWgK8/a2lGzew
 C2ZsY+FNdFz8bSdRfFN6L4iPAN0bugOCQFoG
X-Google-Smtp-Source: ABdhPJz4LL4iYQ0A8UE6cz/ptj47F6yI4ZBLPuliA5VJaJQTd8WThVXRKyPMifAugkxkQjd14vZ20Q==
X-Received: by 2002:a05:6000:1b0c:: with SMTP id
 f12mr10640801wrz.225.1626037304827; 
 Sun, 11 Jul 2021 14:01:44 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id n12sm12575506wmq.5.2021.07.11.14.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/19] dp8393x: Replace 0x40 magic value by SONIC_REG_COUNT
 definition
Date: Sun, 11 Jul 2021 23:00:13 +0200
Message-Id: <20210711210016.2710100-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210710174954.2577195-3-f4bug@amsat.org>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 9118364aa33..d1e147a82a6 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -85,6 +85,7 @@ static const char *reg_names[] = {
 #define SONIC_MPT    0x2e
 #define SONIC_MDT    0x2f
 #define SONIC_DCR2   0x3f
+#define SONIC_REG_COUNT  0x40
 
 #define SONIC_CR_HTX     0x0001
 #define SONIC_CR_TXP     0x0002
@@ -158,7 +159,7 @@ struct dp8393xState {
 
     /* Registers */
     uint8_t cam[16][6];
-    uint16_t regs[0x40];
+    uint16_t regs[SONIC_REG_COUNT];
 
     /* Temporaries */
     uint8_t tx_buffer[0x10000];
@@ -972,7 +973,7 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
 
     address_space_init(&s->as, s->dma_mr, "dp8393x");
     memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
-                          "dp8393x-regs", 0x40 << s->it_shift);
+                          "dp8393x-regs", SONIC_REG_COUNT << s->it_shift);
 
     s->nic = qemu_new_nic(&net_dp83932_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id, s);
@@ -987,7 +988,7 @@ static const VMStateDescription vmstate_dp8393x = {
     .minimum_version_id = 0,
     .fields = (VMStateField []) {
         VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
-        VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
+        VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.31.1


