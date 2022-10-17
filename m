Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A04601816
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:55:39 +0200 (CEST)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okWD3-0007PL-Ux
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVg2-0002ni-1R; Mon, 17 Oct 2022 15:21:30 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:40577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVg0-0002z2-Cv; Mon, 17 Oct 2022 15:21:29 -0400
Received: by mail-oi1-x235.google.com with SMTP id l5so13222730oif.7;
 Mon, 17 Oct 2022 12:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/r/v9NNBgGV7VlSQ/iTKWneUdC+4mqdWXAOwm1s4l3A=;
 b=XGdciI5IAewMdq1qcvs7TYmZ58u/lWEe2Vdsc3m3Xn6ZCvfQ5NnB53XCQ3p+3QyqlF
 V8XgeUDQsdJ9LXnKhpRZvHQbb/M5gyQJbzFgp4d0kncQQK0cNhM+/4sOVDTomwEhDxUl
 chvcHLgV8VpNyBAgljY0bA34zB8wJeoS+2zF4n8HjDEJV3N4SDIOUUWNSrb+VQkr4nTF
 65SbtjY2My5ocWi5oRc2GkdXsIhNYLe7dr7ckbgGCVGgKkQYZwSSXRVBQubQgxODiEZv
 FLKZPaeUlwbs5F6Y82aV+RwlLCB7j+4Yj2QZRZvHPMEoyAI7jVRBLks295o6TcwHdfa6
 HQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/r/v9NNBgGV7VlSQ/iTKWneUdC+4mqdWXAOwm1s4l3A=;
 b=DT6yIc/xls8FbOrmpR4mhQULfCgXTgxHT96fDEdhzN4tWWsySvd5LNjAsn5iBq0WjZ
 1znd8OgNkerBhRCqQNNAJnWpQLPSYnus97ZWnrNvR4AqZJRtCm7SK03z6A6xhRr5NsNQ
 JhvZeYGgvmypx/+G8N1XDch/7HlrQtlJueGhqjJIfsJu7JYyuoD+Vwh5GBv3AfhXjTb8
 rfH2CA61E9acjuMXFZlLqQHDT2ZyxFBoPhFNgu+rlDrob+ZU43Z5SPadpvPY9EiJeezA
 HMOnAWqhrRBXFJ3TDyVA+9QKZ4ZTxmBIgLVUT27L6RGdgCL7hJY6g6/sx3X8QCC2gZAj
 o8Rg==
X-Gm-Message-State: ACrzQf2XRVfeCkeCS6v0ui6P4s0hECIpJQYpPcLLcm0Jkt/VLqI87QDR
 6Md8mbcZkvnJUs64geGAZJst6xfWrr4=
X-Google-Smtp-Source: AMsMyM6qzeGYcCvD78rg5FKd1+uhYiw7nwruhyFwKhEid4Xuvp0JueiTRiatWtImCz6oBq3mby9Rtg==
X-Received: by 2002:a05:6808:1404:b0:355:4cd4:b10b with SMTP id
 w4-20020a056808140400b003554cd4b10bmr190195oiv.207.1666034486418; 
 Mon, 17 Oct 2022 12:21:26 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 26/38] hw/ppc/e500: Remove if statement which is now always true
Date: Mon, 17 Oct 2022 16:19:57 -0300
Message-Id: <20221017192009.92404-27-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

Now that the MPC8544DS board also has a platform bus, the if statement
is always true.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221003203142.24355-8-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c      | 30 ++++++++++++++----------------
 hw/ppc/e500.h      |  1 -
 hw/ppc/e500plat.c  |  1 -
 hw/ppc/mpc8544ds.c |  1 -
 4 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 496c61b612..3e950ea3ba 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1007,25 +1007,23 @@ void ppce500_init(MachineState *machine)
     }
 
     /* Platform Bus Device */
-    if (pmc->has_platform_bus) {
-        dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
-        dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
-        qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
-        qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-        pms->pbus_dev = PLATFORM_BUS_DEVICE(dev);
-
-        s = SYS_BUS_DEVICE(pms->pbus_dev);
-        for (i = 0; i < pmc->platform_bus_num_irqs; i++) {
-            int irqn = pmc->platform_bus_first_irq + i;
-            sysbus_connect_irq(s, i, qdev_get_gpio_in(mpicdev, irqn));
-        }
+    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
+    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
+    qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
+    qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    pms->pbus_dev = PLATFORM_BUS_DEVICE(dev);
 
-        memory_region_add_subregion(address_space_mem,
-                                    pmc->platform_bus_base,
-                                    &pms->pbus_dev->mmio);
+    s = SYS_BUS_DEVICE(pms->pbus_dev);
+    for (i = 0; i < pmc->platform_bus_num_irqs; i++) {
+        int irqn = pmc->platform_bus_first_irq + i;
+        sysbus_connect_irq(s, i, qdev_get_gpio_in(mpicdev, irqn));
     }
 
+    memory_region_add_subregion(address_space_mem,
+                                pmc->platform_bus_base,
+                                &pms->pbus_dev->mmio);
+
     /*
      * Smart firmware defaults ahead!
      *
diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
index 1e5853b032..68f754ce50 100644
--- a/hw/ppc/e500.h
+++ b/hw/ppc/e500.h
@@ -27,7 +27,6 @@ struct PPCE500MachineClass {
 
     int mpic_version;
     bool has_mpc8xxx_gpio;
-    bool has_platform_bus;
     hwaddr platform_bus_base;
     hwaddr platform_bus_size;
     int platform_bus_first_irq;
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index fc911bbb7b..5bb1c603da 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -86,7 +86,6 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     pmc->fixup_devtree = e500plat_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_42;
     pmc->has_mpc8xxx_gpio = true;
-    pmc->has_platform_bus = true;
     pmc->platform_bus_base = 0xf00000000ULL;
     pmc->platform_bus_size = 128 * MiB;
     pmc->platform_bus_first_irq = 5;
diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 9c81477698..7dd5219736 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -46,7 +46,6 @@ static void mpc8544ds_machine_class_init(ObjectClass *oc, void *data)
     pmc->pci_nr_slots = 2;
     pmc->fixup_devtree = mpc8544ds_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_20;
-    pmc->has_platform_bus = true;
     pmc->platform_bus_base = 0xFF800000ULL;
     pmc->platform_bus_size = 8 * MiB;
     pmc->platform_bus_first_irq = 5;
-- 
2.37.3


