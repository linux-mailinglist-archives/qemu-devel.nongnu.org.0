Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028E4482CE3
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 23:08:50 +0100 (CET)
Received: from localhost ([::1]:48264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4920-000277-DO
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 17:08:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SCDSYQcKCuUcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n48z4-0000f9-7o
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 17:05:46 -0500
Received: from [2607:f8b0:4864:20::b49] (port=40625
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SCDSYQcKCuUcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n48z2-00066x-Bm
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 17:05:45 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 z188-20020a2565c5000000b0060be1f32877so40116579ybb.7
 for <qemu-devel@nongnu.org>; Sun, 02 Jan 2022 14:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=LppqlFN98GVmb98Ji5/oRgfzsW3jaDcyDZcdlq1a/gA=;
 b=RlbpecofOmrFTeGIK9bD1bkuH3qHH1xCOBY9NKAUwe3z/NbHFvCppHzmTJquswNWm/
 f9toDJciUY8pI+K0qXDVMI9gKoT2r+YPyogt6jFSBVNQLtcQp3ly6jrVZddPsXuh9aXN
 tvhFKaCXdHKsrkrPFHQjC8YVUOwLX+1U2n6TbdxntjMA5SieUDqjEI3U4if6aumK/n3L
 0M06M1WiPjuaj2QkGOQvLirGIfZBG3qtaNtQc5sDZM66vqnDlB/U+9E9166T7Sml6/oD
 ZuazDL+NzFEk6w8MbXDGx2wQ9D8H7w+OJiQXMcbKMXTGDaNPHYgmmAraD4xlX2T5LVr7
 ypTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LppqlFN98GVmb98Ji5/oRgfzsW3jaDcyDZcdlq1a/gA=;
 b=uygN2BCIHFQ0VQdHb86U3ZJt0vG8AHiFGRsNCJki7g1oaqQHUucMb0c9AhW82W4vxV
 WsvlMFv/5R9NY5z+vZHzMDyMpbmtS0TXsYttGCtMJebw981pIYSGGnUWrpn+NZ69ipib
 yOxA2tw1VhgbG+pyFX2ljtFBk7bDXCqiT5AvVV1YdDl+RN94cY38MytRL+QukkHbT5JA
 VkENIKAxXLB2NTgRspSi0RX753y+KzKsaDI73OmQTO8y8wW7vRgCJ9tk+R8FFcLN8ctH
 QSLfTv1H49Hd4xsrJEF9Qw2B4QhRcIvXzvNr+5Gv6mUCpwSA9fpILiAYD84jqBIw+8G9
 9zxw==
X-Gm-Message-State: AOAM530qMB2rbflL73/EI3zZPjL9uqLSVHXlRE4w/bxU7y75+cCpBsSq
 OzGgzOVEqg8/OldkMqVp1o69tFn7sYvc
X-Google-Smtp-Source: ABdhPJyRwSCmCExYDGQkFyQ5Gtbfe2fbVLZKR3cBR1Nm3CMIUUTnRWTQHtHQqd0/gAtJSjAAv5EGynOX3p2a
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:a05:6902:1209:: with SMTP id
 s9mr22395167ybu.48.1641160776047; Sun, 02 Jan 2022 13:59:36 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:45 -0800
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
Message-Id: <20220102215844.2888833-5-venture@google.com>
Mime-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 4/4] hw/arm: kudo add lm75s on bus 13
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3SCDSYQcKCuUcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

Add the four lm75s behind the mux on bus 13.

Tested by booting the firmware:
lm75 42-0048: hwmon0: sensor 'lm75'
lm75 43-0049: supply vs not found, using dummy regulator
lm75 43-0049: hwmon1: sensor 'lm75'
lm75 44-0048: supply vs not found, using dummy regulator
lm75 44-0048: hwmon2: sensor 'lm75'
lm75 45-0049: supply vs not found, using dummy regulator
lm75 45-0049: hwmon3: sensor 'lm75'

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/npcm7xx_boards.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 4cd58972c5..7d0f3148be 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -330,6 +330,8 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 
 static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
+    I2CSlave *i2c_mux;
+
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
 
@@ -337,7 +339,14 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 
     at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
 
-    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13), TYPE_PCA9548, 0x77);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
+                                      TYPE_PCA9548, 0x77);
+
+    /* tmp105 is compatible with the lm75 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp105", 0x49);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
     at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
 
-- 
2.34.1.448.ga2b2bfdf31-goog


