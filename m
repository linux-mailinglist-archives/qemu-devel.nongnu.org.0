Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1945A3897A8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 22:13:31 +0200 (CEST)
Received: from localhost ([::1]:40022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSZO-0005wJ-5c
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 16:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljSVt-0001dA-Vr; Wed, 19 May 2021 16:09:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljSVs-0003PH-DM; Wed, 19 May 2021 16:09:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c14so13509941wrx.3;
 Wed, 19 May 2021 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i0R1B2wNv5GtUfi6OCru6hxSiiBtsSrJgzRomgBg/As=;
 b=OeMfG2cfQfVN52nUjKXQ3AMdcD59alHrcziLnVegGHY8dkzK0jd6Gt/qy405537MbF
 espHXC6CBM19Y7alfGl24hGsRlG5t1HMt1K1b8xKQqS5fa1Pqu2GKTv58qHk1OY/A+hf
 uVEP24fnqWF2DwP1UI/joiVf6v/08vOvMGpl+GOxHgjfaAujAr1Fk4aKJWqm5eJyPLun
 TErRuWo2LmPV6qX7tVBlblqUJJDBRUgSRz5SgHhc12vdY5TFFgE0CvjeCuLHcluk85dv
 7GSR5UjMCcm+vezrPXX3WGCZxLtzgg0gNB4T1uOgGIO1UMoIQfGlCGpOm57Nr2/GXQMH
 ae2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i0R1B2wNv5GtUfi6OCru6hxSiiBtsSrJgzRomgBg/As=;
 b=oRxkvmgOs2wJOfnSkHRrHguMQ/Els/AWDwZ1RbYDVgpwcFosVF63DCa8b+X5Sv+vgK
 tekUN0GCgs3ta6c+bKtiyXKgJ90MN3/B3GDpQgVsURtTP85PT3M02lsWbTQBzyiCSUyJ
 UloWLWdLrF4Ajk4KaPY13YxLjeQcTbg40WZumcyqYpejQ0qOKCuUUEu/gsg7nsAkNozE
 cLciKG3zJ0OKS9sAVxeaKO0WnGyQ4K4qxQa3Kx0IAah+K4BhY+vU9RNvhPAgSctZ3hmt
 LWF+i+A+EWGcR0U78392Sc2VfGFvg7w3v5jKmvGGW5SVGQfffS4R7LpbrktPGRjkavhY
 qSwQ==
X-Gm-Message-State: AOAM532cYLLwglH0CQLoWYIb13dLoPaDUzUrxD/9p0Lldl9FzLfK5mDo
 MaDrusitUGzYsDhRzR9s2ozJ8SFOIcu2Lw==
X-Google-Smtp-Source: ABdhPJxHzZyMp07IajDSGSrYzkRJjtlcvciQo07FHJ2d5qDamCox1d/LdqVD4/xC+/HNqIguRpyvLg==
X-Received: by 2002:a5d:4ccc:: with SMTP id c12mr650478wrt.137.1621454990577; 
 Wed, 19 May 2021 13:09:50 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s15sm556216wrt.54.2021.05.19.13.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:09:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/usb/Kconfig: Introduce USB_CHIPIDEA symbol
Date: Wed, 19 May 2021 22:09:40 +0200
Message-Id: <20210519200942.2223292-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519200942.2223292-1-f4bug@amsat.org>
References: <20210519200942.2223292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the TYPE_CHIPIDEA model is only built when the IMX
machines are built. Since it is not specific to IMX, add its
symbol to allow other machines to use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig     | 4 ++++
 hw/usb/Kconfig     | 3 +++
 hw/usb/meson.build | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b887f6a5b17..585de92f00a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -385,6 +385,7 @@ config FSL_IMX25
     select IMX_I2C
     select WDT_IMX2
     select DS1338
+    select USB_CHIPIDEA
 
 config FSL_IMX31
     bool
@@ -403,6 +404,7 @@ config FSL_IMX6
     select IMX_USBPHY
     select WDT_IMX2
     select SDHCI
+    select USB_CHIPIDEA
 
 config ASPEED_SOC
     bool
@@ -447,6 +449,7 @@ config FSL_IMX7
     select PCI_EXPRESS_DESIGNWARE
     select SDHCI
     select UNIMP
+    select USB_CHIPIDEA
 
 config ARM_SMMUV3
     bool
@@ -460,6 +463,7 @@ config FSL_IMX6UL
     select WDT_IMX2
     select SDHCI
     select UNIMP
+    select USB_CHIPIDEA
 
 config MICROBIT
     bool
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 53f8283ffdc..5b230cfbf33 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -133,3 +133,6 @@ config XLNX_USB_SUBSYS
     bool
     default y if XLNX_VERSAL
     select USB_DWC3
+
+config USB_CHIPIDEA
+    bool
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index f357270d0b6..67df878f0f3 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -27,7 +27,7 @@
 softmmu_ss.add(when: 'CONFIG_USB_DWC3', if_true: files('hcd-dwc3.c'))
 
 softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
+softmmu_ss.add(when: 'CONFIG_USB_CHIPIDEA', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
 softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-pci.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
-- 
2.26.3


