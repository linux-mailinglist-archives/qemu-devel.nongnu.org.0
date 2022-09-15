Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF385B9F0A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:39:20 +0200 (CEST)
Received: from localhost ([::1]:43800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqxT-0000Sn-6M
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqka-0007ut-QQ; Thu, 15 Sep 2022 11:26:00 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkY-0007Ht-Rn; Thu, 15 Sep 2022 11:26:00 -0400
Received: by mail-ed1-x52d.google.com with SMTP id q21so27489476edc.9;
 Thu, 15 Sep 2022 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=G+j3D6z4smsnshtw0WRqS3uLuJUbj35U3qDanfS/RVQ=;
 b=ecO+uk9zfvm1ZBpX8nhvxkR16wQZBp3vaV7yvGRi3MyfHHaBOE6U8hFJcjqUpP2LLO
 1ZBU2y/QtovwlKyVrxbKLYVKdMv7wSd78ZeCJTslgVnELzd13wyol2LGEUuC/T8sX2FI
 WFc6pjm1YjuwLpAOgKQfqUFjAdbwZpuERDByDfqxxFf/si4EaVIcoVJy62kSqlIJu+oi
 Yq/cYRD4Uaoj4UPYKcKludS1oUyTeILwMbcHrqoMganIINGOGyNAanKcSC1QaWjiODyn
 1/UoqmSLnF3IH+w+MZ9BxicyjxvLm5HY1KqRLQfpDo7H1CHBYRCsu4cLkJIGvsCooJrh
 6eVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=G+j3D6z4smsnshtw0WRqS3uLuJUbj35U3qDanfS/RVQ=;
 b=cXOl+YXYwWhVVeQMIRseMZRw92kc7Y6h1/BfGQNNQNi89ZnBbuZPPfCBE/K30zrfeE
 GR8OfMxXngbsOxCWL+nzvi67GAneRRuW5UWse5ingi/C9RTATiDBWGMsqm3MIEFVf0in
 PiszhXzcGNOW3ovICpcsd4xmFPYw7hxvuqNqCqXtaWMyQSHLyuPkv7QO41NSwxs6IdEf
 eaziKvMLSCg1x7eajOK0w+gcM7h3Lc/a13Cry4gdz3olKMd3o6HGzx4qBr9PcjqUz9v3
 0m5zesi6dCfC9Jkko6lfEts+as3ZQ5AGu3EiwvAeAe3Ni4XJ5R0NU3C7hc3R88/7r4lj
 F+TQ==
X-Gm-Message-State: ACrzQf1Cl2f3TaDZ4b08eEedpYabjmXz+ZMz799MpuvGgXGGErSY+Du4
 xs2aehOkrdRX05ZSA706wlRVoDLVNGQ=
X-Google-Smtp-Source: AMsMyM5TTqoo79OVQzDw6Aesq/LWxbZ8kd13kFg4NC1FObYPYXDz6Ee/jSzXT5hCvVPU9qXPErf+hw==
X-Received: by 2002:a50:ee08:0:b0:44f:dc1:fc6b with SMTP id
 g8-20020a50ee08000000b0044f0dc1fc6bmr340805eds.15.1663255556692; 
 Thu, 15 Sep 2022 08:25:56 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:25:56 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 05/11] hw/ppc/e500: Remove if statement which is now always
 true
Date: Thu, 15 Sep 2022 17:25:14 +0200
Message-Id: <20220915152520.21948-6-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Now that the MPC8544DS board also has a platform bus, the if statement
was always true.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c      | 30 ++++++++++++++----------------
 hw/ppc/e500.h      |  1 -
 hw/ppc/e500plat.c  |  1 -
 hw/ppc/mpc8544ds.c |  1 -
 4 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..864b6f3d92 100644
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
-                                    sysbus_mmio_get_region(s, 0));
+    s = SYS_BUS_DEVICE(pms->pbus_dev);
+    for (i = 0; i < pmc->platform_bus_num_irqs; i++) {
+        int irqn = pmc->platform_bus_first_irq + i;
+        sysbus_connect_irq(s, i, qdev_get_gpio_in(mpicdev, irqn));
     }
 
+    memory_region_add_subregion(address_space_mem,
+                                pmc->platform_bus_base,
+                                sysbus_mmio_get_region(s, 0));
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
index cd6cd04bef..4ca696b56a 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -46,7 +46,6 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     pmc->pci_nr_slots = 2;
     pmc->fixup_devtree = mpc8544ds_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_20;
-    pmc->has_platform_bus = true;
     pmc->platform_bus_base = 0xEC000000ULL;
     pmc->platform_bus_size = 128 * MiB;
     pmc->platform_bus_first_irq = 5;
-- 
2.37.3


