Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1C33A0522
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:26:57 +0200 (CEST)
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiJM-00022N-LV
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PNK_YAcKCusiRagheRTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--venture.bounces.google.com>)
 id 1lqiI4-000053-71
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:25:36 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:47060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PNK_YAcKCusiRagheRTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--venture.bounces.google.com>)
 id 1lqiI2-0001Mi-KZ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:25:35 -0400
Received: by mail-qk1-x749.google.com with SMTP id
 205-20020a3707d60000b02903aa9208caa2so6492747qkh.13
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=BuLZRWh+N1B9P7DN5vdDFIi7K4s3geFpmLZAmBGD7UA=;
 b=JabcKgumtewW53lGfjBr0Clh49I/rDF/HPglmwCJo4Hh9e4T3rrN9wtEfOQQ2ELm/i
 QA707y1iRt2EZkOLbboLyFzB/PqV/4Bc3xHpESMDTUnnsKMruGzBaJYpRQ0dY3/2BDjO
 diBtAQahjlY1XvmMqc+2VvWR9cs2fJQOaYeHuLO2KJZW91AbwsHrPFmYN3VQaZozrFq/
 K2s8rgsV7riweyK5rnU91Flc0dbvtvkW64ofbllBMjO5mWfv2Ispl0opscgUhI8B9y7u
 XG+TPmS5h5JmnR8FuSQxYcoNGlaGLTo5SaFO7iCze/UOc0TEl0Zh1B+9VW657YsCmwry
 fpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BuLZRWh+N1B9P7DN5vdDFIi7K4s3geFpmLZAmBGD7UA=;
 b=UjBdQqXA26gdRw6BvdXR3A2pzTsUuZbC0FcqTyxydJqp8LSH5BXZEIo2IN0h1FgYrb
 cNaFOClJ8gH7fgm1K+lV5/6OnIPSGwfJrW48KCP09HfvaePZGi8kSjan6md76BoatMGt
 98E+98DaEsUP+3LiDo1T/yys+jth/R60jjqn+CZHKaDw8nxc0bAfnnbsgnGbzWNlcDr7
 mKvlDmGx88f0phlPOINM9Juq02IFzS3ZYDPS48eBboQpFRTJKJ/wlTJO+B9etsLUWjZu
 uqFOimk22D/g+t1R2iWOd+3XvRmmVQtHAyHmVKUjZ++omHIXgj92ck3vpYlAdf79M0fp
 ySiQ==
X-Gm-Message-State: AOAM531u1ctiHU0j7xKlcFJoDiSjAlXZQhVlIchCrzMp6aMQUFx7+KXS
 4LBhP2kOy9mR1hs+X/EGmob8+XH67N/L
X-Google-Smtp-Source: ABdhPJzk3AxJemlRbW8F31QH+M16oDiDF96Py5NVwqPbmE/zCjA6cFlW8NJz/WWNKDfoz5t8bTwknS9qUIng
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:ad4:4ae4:: with SMTP id
 cp4mr2119815qvb.44.1623183932946; Tue, 08 Jun 2021 13:25:32 -0700 (PDT)
Date: Tue,  8 Jun 2021 13:25:20 -0700
In-Reply-To: <20210608202522.2677850-1-venture@google.com>
Message-Id: <20210608202522.2677850-2-venture@google.com>
Mime-Version: 1.0
References: <20210608202522.2677850-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 1/3] hw/arm: gsj add i2c comments
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3PNK_YAcKCusiRagheRTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--venture.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Adds comments to the board init to identify missing i2c devices.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/npcm7xx_boards.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d4553e3786..9b7a7cd201 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -220,7 +220,21 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     at24c_eeprom_init(soc, 9, 0x55, 8192);
     at24c_eeprom_init(soc, 10, 0x55, 8192);
 
-    /* TODO: Add additional i2c devices. */
+    /*
+     * i2c-11:
+     * - power-brick@36: delta,dps800
+     * - hotswap@15: ti,lm5066i
+     */
+
+    /*
+     * i2c-12:
+     * - ucd90160@6b
+     */
+
+    /*
+     * i2c-15:
+     * - pca9548@75
+     */
 }
 
 static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
-- 
2.32.0.rc1.229.g3e70b5a671-goog


