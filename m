Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCEB4BD8AD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:49:23 +0100 (CET)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5Jq-0003PD-JZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:49:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zQ-0008A4-R1
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:16 -0500
Received: from [2a00:1450:4864:20::32d] (port=39480
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zP-00011u-81
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso13029299wmq.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/WgV7SCF1nvzYrA0ef2G2OADZcw5l795LudXqExHAzA=;
 b=F0f9CuO7m/5sZtS79gDOoNmJ/RIRPYT30dUA1PjX+jgphjh8jy+OklVxZbwgRgbpf+
 pQlKZt7tfQy6mKcWWFNHpDRM0KrFxNQJU5pt8yJ8PSrJ+0QagvR9B0dNX4dV2rRcyjgV
 i7vJ8S/taCMsYUDGP6RjZQmpf4bmY/q6tJTBI086+aBd0WC9GIm/WeiANnExQcBHvUNs
 575XZggrEBWVZBZB8LtgvkNBbuYsxviIof6MaymBLH0EAb1+7qHm4nibTX1gxqGQj5jY
 5mcDaI/fnDyd+/NTj7p+X5zMwEKc5ub1HPdhZc549e2LFlhm19/9nPavsioWt/l55eEu
 L9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/WgV7SCF1nvzYrA0ef2G2OADZcw5l795LudXqExHAzA=;
 b=iq2zeIeoUm8g2h93vVgnb3YZDgkBgZaxdWVRLE4kz084j7LWR8tlvZEsYvJHfPOsJ3
 GypxTgYEZIlMZGVt3Wled7grllK93Vgio943i5vbxpor49yem+pdoSPabnvT0BOXudto
 OL84Po48B+5ii3HUAGUa7iODgHDEaKhO7ANZWshWhOqydBk04yrS+uenbuYNntKNq99B
 zSVD385YtqyI88dsYQYDCyfjtzF+W52cUv3SdA/GugYKg5PNvvljEQRuP2OypXAMDru4
 9wlHS1nh83lwTVgl/a00LcbcxCxpggmWBeFAZH2EiNrzN9cx1ixyMJqCfMW8TxFGnDDz
 T+qg==
X-Gm-Message-State: AOAM532enuveij9m9jCGZ18Ba3IIv2pa5F0FrzVNsekwLILh5ytilV/M
 6a2RwccCER2Fz8HTxBPyYrd1zUiuY1fU1w==
X-Google-Smtp-Source: ABdhPJwExcOyQuDpRAUrAIFHfhrZtVNprXvfS69Rf1APErN4dRNvuCFi/xF/HjAtU+pf51Eu9xX60w==
X-Received: by 2002:a05:600c:ac5:b0:37b:b5fb:555d with SMTP id
 c5-20020a05600c0ac500b0037bb5fb555dmr19919470wmr.153.1645435693926; 
 Mon, 21 Feb 2022 01:28:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/26] Kconfig: Add 'imply I2C_DEVICES' on boards with
 available i2c bus
Date: Mon, 21 Feb 2022 09:27:48 +0000
Message-Id: <20220221092800.404870-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

For arm boards with an i2c bus which a user could reasonably
want to plug arbitrary devices, add 'imply I2C_DEVICES' to the
Kconfig stanza.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20220208155911.3408455-3-peter.maydell@linaro.org
---
 hw/arm/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2e0049196d6..6945330030e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -46,6 +46,7 @@ config DIGIC
 
 config EXYNOS4
     bool
+    imply I2C_DEVICES
     select A9MPCORE
     select I2C
     select LAN9118
@@ -184,6 +185,7 @@ config REALVIEW
     bool
     imply PCI_DEVICES
     imply PCI_TESTDEV
+    imply I2C_DEVICES
     select SMC91C111
     select LAN9118
     select A9MPCORE
@@ -229,6 +231,7 @@ config SABRELITE
 
 config STELLARIS
     bool
+    imply I2C_DEVICES
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
     select I2C
@@ -406,6 +409,7 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    imply I2C_DEVICES
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -414,6 +418,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    imply I2C_DEVICES
     select SERIAL
     select IMX
     select IMX_I2C
@@ -422,6 +427,7 @@ config FSL_IMX31
 
 config FSL_IMX6
     bool
+    imply I2C_DEVICES
     select A9MPCORE
     select IMX
     select IMX_FEC
@@ -450,6 +456,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    imply I2C_DEVICES
     select ARMSSE
     select LAN9118
     select MPS2_FPGAIO
@@ -466,6 +473,7 @@ config FSL_IMX7
     bool
     imply PCI_DEVICES
     imply TEST_DEVICES
+    imply I2C_DEVICES
     select A15MPCORE
     select PCI
     select IMX
@@ -481,6 +489,7 @@ config ARM_SMMUV3
 
 config FSL_IMX6UL
     bool
+    imply I2C_DEVICES
     select A15MPCORE
     select IMX
     select IMX_FEC
@@ -495,6 +504,7 @@ config MICROBIT
 
 config NRF51_SOC
     bool
+    imply I2C_DEVICES
     select I2C
     select ARM_V7M
     select UNIMP
-- 
2.25.1


