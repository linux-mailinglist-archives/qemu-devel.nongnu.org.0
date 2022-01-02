Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3D482CF0
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 23:15:25 +0100 (CET)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n498O-0000bF-O4
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 17:15:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RSDSYQcKCuIZIRXYVIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--venture.bounces.google.com>)
 id 1n490o-00020w-L3
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 17:07:34 -0500
Received: from [2607:f8b0:4864:20::949] (port=37723
 helo=mail-ua1-x949.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RSDSYQcKCuIZIRXYVIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--venture.bounces.google.com>)
 id 1n490n-0006FE-62
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 17:07:34 -0500
Received: by mail-ua1-x949.google.com with SMTP id
 f4-20020ab01004000000b002fa01148f7aso17106927uab.4
 for <qemu-devel@nongnu.org>; Sun, 02 Jan 2022 14:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9lgdCE3tpUQtlY2ZV5qpqcuD6bnWF6/JTyvPjSFhlg8=;
 b=kawGX3uRa+Vkk7RKjbuZ7EisI6TqDrjlgq89wwY3UZiyi5U1Pdn3YYNYmwbZW12U2S
 KCtzCgk3fQktlckMzLMRswVUYzEnKPTMa6bcCTyuzTF6MjXVwvXYz8HHJJCVnW604psM
 kF3CYNSqbLXQmIm/k9ERfAq85SwUH2O/WsY1x0BUCV2cAEHLg8xbj7SXJct8+0WKzuYn
 uiUoyPibBCCfzNl0hisMsXvgT/NXxxwMQ/nVn1W2xb3+SUT6ovuIQZyyG6PHGK8q3v2F
 SXV7chkgPZ0KdgZDHnJVFz49zjsFfLNQEOXuIZ0aZHfaP+5rjIa2vZUvva50n17lVV5M
 Lu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9lgdCE3tpUQtlY2ZV5qpqcuD6bnWF6/JTyvPjSFhlg8=;
 b=d1iRDYKnd4Zy6bM7zQjvQDuDPiG6jQZoDamAgQiDX5qmGnUpfj6eeKbsqUVJ419Vxb
 kIIXQNUkbKjrILB5y1OH85LhNqbbFbW8kOGdaU45xHcaduE2uxHnfq2Se0dz5VA/Z0i0
 3HI+W8WqviKVAK6UCBG6H7spgZMhvEx0HetR0HNUbJX0dJ8NAmdl3jlTvMiUnmEQ824U
 K5rENE22iRVCnS5znUf1/U+TyzW427tlV13FMOYV3TDuUADYGT2ZjvUkZHqwKxZ5xPnN
 TWwy0phIxLGIKorzb1kSdIqRgqI51sXx9x+iuUmhtwTqFjV2ACYKajd18EUeeCaxbgsL
 iLew==
X-Gm-Message-State: AOAM533dIeOJVDLEKl79nIkry5cMqZTyvuJpOrW9zyUC5rK4s5nUHd9o
 4Jwcts0aPxew03NHlRWF99mdcLKk1Y8d
X-Google-Smtp-Source: ABdhPJwQ7KyzvnBsEhs6P8YjhTDYM5lRP487o6xUR4kt13R74y8+OUUPWlZFc2sCcu1t0QHiNdnMqPk3UOji
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:a05:6902:1546:: with SMTP id
 r6mr26126026ybu.88.1641160773845; Sun, 02 Jan 2022 13:59:33 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:44 -0800
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
Message-Id: <20220102215844.2888833-4-venture@google.com>
Mime-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 3/4] hw/arm: add i2c muxes to kudo-bmc
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::949
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3RSDSYQcKCuIZIRXYVIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--venture.bounces.google.com;
 helo=mail-ua1-x949.google.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 257bf638fd..4cd58972c5 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -330,8 +330,17 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 
 static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
+
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
+
     at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13), TYPE_PCA9548, 0x77);
+
     at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+
     /* TODO: Add remaining i2c devices. */
 }
 
-- 
2.34.1.448.ga2b2bfdf31-goog


