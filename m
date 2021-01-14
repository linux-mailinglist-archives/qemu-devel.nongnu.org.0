Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B52F643F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:24:00 +0100 (CET)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04Tf-0002t5-9K
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04H1-0006lw-Bf; Thu, 14 Jan 2021 10:10:55 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Gy-0004Pl-Rh; Thu, 14 Jan 2021 10:10:55 -0500
Received: by mail-pl1-x634.google.com with SMTP id y8so3037022plp.8;
 Thu, 14 Jan 2021 07:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nT1NO2oOvTRXnT4qmsBpHS5imQeak8IMZL/sVV5o5Vs=;
 b=LLUhAHpDznGtgVX4SwtAGTx6bIAskvxzSVPIaWOkK++VTLzFSiZFm/OjRDiPiQQbY3
 rVf3iUKibyMo4IOQ8A5BoL1/UJoayktKfTcVoephxSxQO9Og1KoeQl86ZMY3J8MxpD96
 wmRTv9DPc2RHJbVyefvmnKYOJq/IH6tVWD8pkC8fmNBOrH5Ky9ZS4qS00ZXOQqlLWZaa
 pqNAFwd7yAW1H5s8VO4vQHbrT1oVDryoXPUkQyWvUmTQHp7rTCnfYZ3nS6M7L3LCkB0A
 RyKgSV9oUq5lmW0weH43Gdn8RXY6i80T9jxPwgkJ6cgLdMslzukVNxkI858YT5awKjJS
 xx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nT1NO2oOvTRXnT4qmsBpHS5imQeak8IMZL/sVV5o5Vs=;
 b=oE6hSv+OzO6/KqP//kL1kPCf3UIxVZf+57Y0xhmW0vFsD22xDf3uNkF2+gsr8MC7BC
 mRBWYPB0AZljhLlYTExUTaJ4khovgCiDGXtgbCy1B+XgFoZq8WFcN9jSl/LdQmbSMGbH
 MqCujo1KPwr0lZI4NmFIQwKbH/oPsVy17RMkAEo+KkQigKlpWU3P/6pVhZ/S45Ejgb+u
 alDL81Uu77zLM31JPRl+0vBhlwUOplXjpqfvR2XV9aRKKM7E78QZUTsjUiXm7+m5ioQD
 v77QmC1WV89d4vYIGz6HwG5En6Gbt/0P1OQjRgE0aYO4SnYtC0waPQo4LBb7jl2GaLNZ
 Jrlw==
X-Gm-Message-State: AOAM531vQU4X1ZpXYc9vUcH2IIacWvQUJeQyhVC4DJmfTDT+Vy25kjyr
 gsrroGDrk6oRJk5MDOzi0fyAaNHU1MQ=
X-Google-Smtp-Source: ABdhPJws17aYgRAZ8cQgSVDAQUn8sw7HD1ZSvPycsplWpThXUQF8EQPu1JB9eTQ1zlO7iSZ3/zs8NA==
X-Received: by 2002:a17:90a:6401:: with SMTP id
 g1mr5273691pjj.165.1610637048889; 
 Thu, 14 Jan 2021 07:10:48 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:10:48 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 9/9] hw/ssi: npcm7xx_fiu: Correct the dummy cycle emulation
 logic
Date: Thu, 14 Jan 2021 23:09:02 +0800
Message-Id: <20210114150902.11515-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

I believe send_dummy_bits() should also be fixed, but I really don't
know how based on my pure read/guess of the codes since there is no
public datasheet available for this NPCM7xx SoC.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/ssi/npcm7xx_fiu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 5040132b07..e76fb5ad9f 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -150,7 +150,7 @@ static uint64_t npcm7xx_fiu_flash_read(void *opaque, hwaddr addr,
     NPCM7xxFIUState *fiu = f->fiu;
     uint64_t value = 0;
     uint32_t drd_cfg;
-    int dummy_cycles;
+    int dummy_bytes;
     int i;
 
     if (fiu->active_cs != -1) {
@@ -180,10 +180,8 @@ static uint64_t npcm7xx_fiu_flash_read(void *opaque, hwaddr addr,
         break;
     }
 
-    /* Flash chip model expects one transfer per dummy bit, not byte */
-    dummy_cycles =
-        (FIU_DRD_CFG_DBW(drd_cfg) * 8) >> FIU_DRD_CFG_ACCTYPE(drd_cfg);
-    for (i = 0; i < dummy_cycles; i++) {
+    dummy_bytes = FIU_DRD_CFG_DBW(drd_cfg) >> FIU_DRD_CFG_ACCTYPE(drd_cfg);
+    for (i = 0; i < dummy_bytes; i++) {
         ssi_transfer(fiu->spi, 0);
     }
 
-- 
2.25.1


