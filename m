Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B86C2D9BD4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:09:46 +0100 (CET)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqPx-0005lq-3H
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEh-00081L-FK; Mon, 14 Dec 2020 10:58:07 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEV-0001RG-Nn; Mon, 14 Dec 2020 10:58:07 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MoNu2-1kM9J13kGu-00opV9; Mon, 14 Dec 2020 16:57:44 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/19] ads7846: moves from the hw/display folder to the
 hw/input folder.
Date: Mon, 14 Dec 2020 16:57:22 +0100
Message-Id: <20201214155733.207430-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0WKpRjXuBi8JwZ9eWpDAIR94JA6hlF7eM8C5YcsRp8JVnmWtlm5
 WzVQYJv2gLKKUdqCkiYWlK+NkaK6QwnQzA6pjqgtesWbWeQkTU2WZoBHIKYf7qnecU+//7e
 fIUyk9Ho4/7Ihlr8najGYrh44PcGGQIhPtND7ybNEvTuJ+x5sTUV4OnW3escUgGbCNKkIIa
 miWE8wDRAWquFPb0/u1Og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TMOv9w+DPrc=:saLVOzw4HNpL/dwp92moBc
 tzmOzB3RCh2P/EhwEBlg73DHUZk47PTpdpGdVoXcPTBay6p4WSn+/r0utuNqRGb6OWYRC+QVd
 sm3QPPF0JqhPbVSCV4LFrIfzxlcAqIMlIe3p0lqss96T8GNFofoc4aEg9l7t9Odc3m1LcyPxM
 Cw4PtNBfckaVfr73KCf6V+6OmzN5pXbeKi2XAKZ3BmlrkoYhy4AM2Y8tEm2xsd/+dfiDC+l4e
 SzIFx6GlRhEA8RB5ohf7/zEIoWViVupZwTVrfeQv4Zl8RPUMtissX6JZxyD3pVbqp4Xp5VKTZ
 oNhwGBawPmyVtATWCcYE6e3q/TJb7mHd7AkaEnm/9ndwEo7k2CL8UXlAUzbDjJCsp9cx3uB1f
 cyh/NeXmwNrLGYz+KSprp8bxo0GkIYKlkVif9dCdmMafRjJ6lOuDF2JPwpmkeD0DP1yMVpKZE
 QL22jiameQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gan Qixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

ads7846 is a touch-screen controller that is an input device rather
than a display device, so move it to the hw/input folder.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201115123503.1110665-1-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/Kconfig                  | 2 +-
 hw/display/Kconfig              | 3 ---
 hw/display/meson.build          | 1 -
 hw/input/Kconfig                | 3 +++
 hw/{display => input}/ads7846.c | 0
 hw/input/meson.build            | 1 +
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename hw/{display => input}/ads7846.c (100%)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index eb8a8844cf86..0a242e4c5d8a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -156,7 +156,7 @@ config TOSA
 
 config SPITZ
     bool
-    select ADS7846 # display
+    select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
     select MAX7310 # GPIO expander
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 15d59e10dc2c..ca46b5830e73 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -9,9 +9,6 @@ config EDID
 config FW_CFG_DMA
     bool
 
-config ADS7846
-    bool
-
 config VGA_CIRRUS
     bool
     default y if PCI_DEVICES
diff --git a/hw/display/meson.build b/hw/display/meson.build
index dad3bd2b414b..9d79e3951d9e 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -6,7 +6,6 @@ softmmu_ss.add(when: 'CONFIG_EDID', if_true: files('edid-generate.c', 'edid-regi
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb.c'))
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb-standalone.c'))
 
-softmmu_ss.add(when: 'CONFIG_ADS7846', if_true: files('ads7846.c'))
 softmmu_ss.add(when: 'CONFIG_VGA_CIRRUS', if_true: files('cirrus_vga.c'))
 softmmu_ss.add(when: ['CONFIG_VGA_CIRRUS', 'CONFIG_VGA_ISA'], if_true: files('cirrus_vga_isa.c'))
 softmmu_ss.add(when: 'CONFIG_G364FB', if_true: files('g364fb.c'))
diff --git a/hw/input/Kconfig b/hw/input/Kconfig
index 64f14daabf6c..55865bb38696 100644
--- a/hw/input/Kconfig
+++ b/hw/input/Kconfig
@@ -1,6 +1,9 @@
 config ADB
     bool
 
+config ADS7846
+    bool
+
 config LM832X
     bool
     depends on I2C
diff --git a/hw/display/ads7846.c b/hw/input/ads7846.c
similarity index 100%
rename from hw/display/ads7846.c
rename to hw/input/ads7846.c
diff --git a/hw/input/meson.build b/hw/input/meson.build
index e7285b15ae6d..0042c3f0dc54 100644
--- a/hw/input/meson.build
+++ b/hw/input/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(files('hid.c'))
 softmmu_ss.add(when: 'CONFIG_ADB', if_true: files('adb.c', 'adb-mouse.c', 'adb-kbd.c'))
+softmmu_ss.add(when: 'CONFIG_ADS7846', if_true: files('ads7846.c'))
 softmmu_ss.add(when: 'CONFIG_LM832X', if_true: files('lm832x.c'))
 softmmu_ss.add(when: 'CONFIG_PCKBD', if_true: files('pckbd.c'))
 softmmu_ss.add(when: 'CONFIG_PL050', if_true: files('pl050.c'))
-- 
2.29.2


