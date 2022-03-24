Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CD84E6897
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:22:19 +0100 (CET)
Received: from localhost ([::1]:58978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXS6E-00088R-O2
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:22:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0M-0005ql-2N
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:16:14 -0400
Received: from [2607:f8b0:4864:20::431] (port=34455
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0K-00033E-KL
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:16:13 -0400
Received: by mail-pf1-x431.google.com with SMTP id h19so3602945pfv.1
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 11:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SrYGGx56D5KZCgDRAE+ARenQHiw5A2xBeYHRC7blJI=;
 b=rDHG9AqpGCyEQHWiSxi8VCe4kJs2bIUZHzrzyG/78OW+dLVWl7qmiBYd5d2/Cz7xwP
 57KwaiNe7DdQDwMOG4GWWnZeG4QE+bsAsaSRMKqpiAD4+3e4MH+FMkNbvAZgTP/QU2oE
 SvoXiNPFK81biDCvluJvePFLmKa+kjfo5yTm0nI5I3BdR5XDCtMQSjYoEvtad3fem9EC
 8yxpX5myPgo1EyE6AInA1jw4xxBhvK4m1lujj+WEy837dNszGND1rhNhpjBVt0kjANea
 7LCNTA5dfntHwXgEkISSyCRDGDV0ZhXHLayp+Tr22GDfZaAdIL3Lyaa4dKAq4mLzshxL
 tf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SrYGGx56D5KZCgDRAE+ARenQHiw5A2xBeYHRC7blJI=;
 b=nUaj1Kn8ta7olWLO8/URF6zSqIaLJAGR2KHn/trBUjaBgcRL1YPyayyrkFuY9zh5Di
 4tyrYD/ExvjhhsoPeLtFAZisKhSVy8fnvQhfi5D27uxMCo2wgrfho+d8nXfNII3ZxrWk
 9FLzEx235DgdgelaTOxy5cTtzHLEj66q8KroHYaitMDxjsJydJdxI1SNpBXDWqzx0Njp
 EqQPDZ0jNsWlly2EQDAqkLIFofErjDqsnsEH3BV2Yd/CvNIzTIIk02/6okLCj6JPntIa
 YBzaOH+1zmWHL7Q/WaJyylAIw0oa5LlcmyNkA4Fk+qhOsGJxON4hAX5UnihhcfuXVhcD
 5a1A==
X-Gm-Message-State: AOAM530ZgYEw6Lh7L5e3W/J7IBtLjmdU4i7U7S5OmxGNnI9x+yT6P8y4
 zuwQ/ImP2eaVHCpmNOaiUgsx0tBeIQUaag==
X-Google-Smtp-Source: ABdhPJwpSz3xLGe3oOZ0PZsFrh+ZXI+QqWL0xL8vit6tT7rD0dKLyHEruJHVF9VB2HbN6lSeoaUJmQ==
X-Received: by 2002:a65:424a:0:b0:375:6d8b:8d44 with SMTP id
 d10-20020a65424a000000b003756d8b8d44mr5055867pgq.170.1648145770176; 
 Thu, 24 Mar 2022 11:16:10 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.101])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm3577725pjd.15.2022.03.24.11.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 11:16:09 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/4] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Fri, 25 Mar 2022 02:15:54 +0800
Message-Id: <20220324181557.203805-2-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324181557.203805-1-zongyuan.li@smartx.com>
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Real View" <qemu-arm@nongnu.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/realview.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 7b424e94a5..d2dc8a8952 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -13,9 +13,11 @@
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/primecell.h"
+#include "hw/core/split-irq.h"
 #include "hw/net/lan9118.h"
 #include "hw/net/smc91c111.h"
 #include "hw/pci/pci.h"
+#include "hw/qdev-core.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -53,6 +55,20 @@ static const int realview_board_id[] = {
     0x76d
 };
 
+static void split_irq_from_named(DeviceState *src, const char* outname,
+                                 qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    qdev_realize_and_unref(splitter, NULL, &error_fatal);
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+    qdev_connect_gpio_out_named(src, outname, 0,
+                                qdev_get_gpio_in(splitter, 0));
+}
+
 static void realview_init(MachineState *machine,
                           enum realview_board_type board_type)
 {
@@ -66,7 +82,6 @@ static void realview_init(MachineState *machine,
     DeviceState *dev, *sysctl, *gpio2, *pl041;
     SysBusDevice *busdev;
     qemu_irq pic[64];
-    qemu_irq mmc_irq[2];
     PCIBus *pci_bus = NULL;
     NICInfo *nd;
     DriveInfo *dinfo;
@@ -229,14 +244,14 @@ static void realview_init(MachineState *machine,
      * and the PL061 has them the other way about. Also the card
      * detect line is inverted.
      */
-    mmc_irq[0] = qemu_irq_split(
-        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
-        qdev_get_gpio_in(gpio2, 1));
-    mmc_irq[1] = qemu_irq_split(
-        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
-        qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
-    qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
-    qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
+    split_irq_from_named(dev, "card-read-only",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
+                   qdev_get_gpio_in(gpio2, 1));
+
+    split_irq_from_named(dev, "card-inserted",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
+                   qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
+
     dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
-- 
2.34.0


