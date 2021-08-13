Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127813EBECC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:37:02 +0200 (CEST)
Received: from localhost ([::1]:40628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgjV-0007PC-2W
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hQEXYQgKCvIqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh6-0003ZP-EN
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:32 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:38684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hQEXYQgKCvIqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh4-0005tN-E6
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:32 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 s16-20020a05620a0810b02903d250dfc6a7so8555585qks.5
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=kZSaVNBvegFVl84P08rxmdcoUBFyrFrB0RMDEqBNAig=;
 b=K2sqYcswLHSYD24jd3am+/LWeUcnGPdwnkzS+9YHfV8Tnak6OmleOMe+WHJzciDJFs
 5oe1JEyxtw2lFo4Euf9ROtf1ERr/xyIvCAB732MXg+Huw+v6st3uKIJ6fT842E4VWgy9
 dRWC6vtALW/QWF37gLVfjd3TOU6C6Ncn+uQoZTw2w4AyhsNUfJ06ub4voA6XwdsVROZ+
 j8UfMuWjtwIfhCW67NyJgTaKg7IPtqmcEuRqanzKEDAYrrKndbeZ2IA82InIdr4SkZq1
 EhhJMxA3/qmkRRZpCt4anEab4zAE855cyhfbQHchtdM8EwI55RBStcb5lA4Hh6myZpVk
 bZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=kZSaVNBvegFVl84P08rxmdcoUBFyrFrB0RMDEqBNAig=;
 b=riAftP/rg/UXY4Bj8JtSPEbYQRXAWUzmdxpZDACUQv9a0ewrdfwRq06N+Q686p/UQL
 X2uyuvuIVtuxYCdeyX5AglRoLFv3ZK1vbF2h9vWE6yauQYsJqbDiXgXraKHo0DmF0//1
 Nlmdy0PuJb2GPY8TR4ofDGk2ufQp8ptLUnuLF1lbOgVzEz3OZ+u5SoL/wrc21gufOz0y
 E3IHbD5DlCyJabwH0KKVdtYHLfyzO94BZwup2CElahNPfEmDuskkai+iv9cS99zLX9b3
 SYYw3BvWrC604Bhd9UXE2iJd/jyWDgzI7Iko0aTNygCqI/NhyEfmB9B87I6s+JfYJnMd
 szwQ==
X-Gm-Message-State: AOAM531OV+teXldrHwkcL5kPnTP5j44XeZ5c4PDfWtI0syp+Rlh0wsjM
 EsswSCls5i3IiB+l8ufLLGo0Cs5yD/OA2A==
X-Google-Smtp-Source: ABdhPJxvKHp5k9Qik/MlvebyJdukg93DntzyUwQo7gbtETCnvgeUsLJpQvEGxyuzVvQZc9YeS5A7deFZjcHcXw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6214:1633:: with SMTP id
 e19mr1217790qvw.57.1628897669073; Fri, 13 Aug 2021 16:34:29 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:47 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 1/7] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3hQEXYQgKCvIqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.33.0.rc1.237.g0d66db33f3-goog


