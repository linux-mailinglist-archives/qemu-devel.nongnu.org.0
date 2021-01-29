Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645BC3082DD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 02:06:17 +0100 (CET)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5IEq-0004Q9-Fg
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 20:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3C18TYAgKCh4QOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICs-00032K-V7
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:04:14 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:41933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3C18TYAgKCh4QOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICr-0004W9-Ek
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:04:14 -0500
Received: by mail-pj1-x104a.google.com with SMTP id o3so4621082pju.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=ELaBYRMM2IbotDCIKyZuXyvpnGXxuQRotS+jnVcGgmk=;
 b=HRCvWaTXgEvzg559vIeY9WNgVG9kk+zzl5IXFom0uQQwXHbONTVsqbRRLGCVHBTGhU
 CUL3H/Buhk0LRyckH/GKyIJCoAVLA63/YBKw3G+prWDJxsaK3fywZkqRM3gMipTd1UyU
 HmCj3yDxTM9ETyXarFXLevgY3H0tgTkCltYOb4kR2vWswE05aK+VKfxQQSSKfauD8kgS
 Khn/6aqXDtgJWKhRB+oDOlOja8jzuwWznDpX8zWAECoRyB/F0Ed4bbMCCjM5FFksGX9/
 /+wvRJpWYSkwW4WDU41h4T/QOaa516riIjjgTb/xCp73k2LNTODdJ03Fd778aYReZP4o
 Ar8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ELaBYRMM2IbotDCIKyZuXyvpnGXxuQRotS+jnVcGgmk=;
 b=opckq6X+6IBQZwo7nY0Ke5EimLjxTam4Snz1pxzr11U9X2nOI+KhjkO/XYBb7CtL3l
 RP7mDmtTx+B6DzPe7uJiCX8janhLoLyyyN1H+9eK/ND6mH/YSdaeaE7lVxaheFJ+ysoz
 bQYr15K9CTKQfu8lKM2pGGlw0nsx6p6E9Mz7K7C1JDAM7IIoRNJwXx1TZChpf+zJB4LQ
 uTgU97PWDh07T3gtDqGTFVDTwpsbMvU2fZSRrznNcYyh2Rqy+VTrW5kCy8oRTeT97M+a
 stUcMxzLuNDZNaJhTgzXyDKIoy4hV0qF8p+UTcxOgmMPIpRWnqGuxB3MpphGL/cP+Thu
 Yq6Q==
X-Gm-Message-State: AOAM53210F98IEaO+UhED8NqnQWNuaUxRWTGgQ+v9uVos1P5XfMJEyan
 k7/KorydoJ8vlaOjA16YZ3nMh/9+THKenA==
X-Google-Smtp-Source: ABdhPJwFkNUN7HOClSDQdQ2F4yv8IdEinemvAlG/iu7lciK4ZW9rxJw6d4c4792ccwYmFgz4jErteU4BTfHIVQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:4209:: with SMTP id
 o9mr2049452pjg.75.1611882251532; Thu, 28 Jan 2021 17:04:11 -0800 (PST)
Date: Thu, 28 Jan 2021 16:58:42 -0800
In-Reply-To: <20210129005845.416272-1-wuhaotsh@google.com>
Message-Id: <20210129005845.416272-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 3/6] hw/arm: Add I2C sensors for NPCM750 eval board
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3C18TYAgKCh4QOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
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
Cc: cminyard@mvista.com, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

Add I2C temperature sensors for NPCM750 eval board.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 3fdd5cab01..47a215bd01 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -98,6 +98,24 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
     return NPCM7XX(obj);
 }
 
+static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
+{
+    g_assert(num < ARRAY_SIZE(soc->smbus));
+    return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
+}
+
+static void npcm750_evb_i2c_init(NPCM7xxState *soc)
+{
+    /* lm75 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), "tmp105", 0x48);
+    /* lm75 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
+    /* tmp100 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
+    /* tmp100 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -108,6 +126,7 @@ static void npcm750_evb_init(MachineState *machine)
 
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
+    npcm750_evb_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.365.g02bc693789-goog


