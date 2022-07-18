Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F057887E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:31:25 +0200 (CEST)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUaa-0003Cs-Kn
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURq-0007OY-FQ; Mon, 18 Jul 2022 13:22:22 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURo-0001fh-Nn; Mon, 18 Jul 2022 13:22:22 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10c0e6dd55eso25477835fac.7; 
 Mon, 18 Jul 2022 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mKoBtuOTfSB6xcNZ7+vc42tDBIpMtXBiNUw1ZaoB1g0=;
 b=Krf+NSku9cxFaADIt+Yl2Vv/G3WdKMS8w43uEOdZc7h+grdrDcGA79Pq5bHcr7l3oL
 Cqjqfx0k5zMBoLLwZH0pyQvhwGgFGaCHMSNQQK4uNbtoXqvyQMMLD6r8WDLzXnO7++nq
 IkZeuPCMKS5GLWaIRCsIKOyg2m2yBm+I+bHtGvqr0wNN2MD+UaPtomqYkvDyA6aKJY7O
 71lMdLxCSAVen3yozMyWjOGpQL5ir+HL2WHm2RuEPZ8gq4bvOqEf51NVGVkUxkNlI5tM
 2mc9cmt5Biz4BRX8GJRm3Pbd5ahMoML3gNERv+8rH7Hsz6RzMYabf8Jjd3AlrtP3Sdn6
 NRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mKoBtuOTfSB6xcNZ7+vc42tDBIpMtXBiNUw1ZaoB1g0=;
 b=IrcnMRZQbc4UBYhKlRc3WjMrydd78PnT7bf+EJiC4R6HYGMacc6JxzXSnvDhHlCtIQ
 0hy+xRBkdhQ4i94XKyk9CDcr2EFNNHR++ixq82i+2SiWFGry8+nVCHm9EJAdaxZCPUz9
 4+cbS2+l9H9vC9Colt7UEKUR/mknU8jthYqU/gaLT3vD5K4+CivjQEcfvFVOBPWdN936
 VdTI8hTKKDnZi6qzFYdllhIpiT2EupF0z/Pu4RL3SGCB9y08wby6qJ/4uQzRNeKRL1/m
 Ad8xy7is+HyFFcc697c1yabQD5Z5hJlBCRPlpfvsbQBHzGKjj0i5RAIHXXwPoDNAC7KD
 4ASw==
X-Gm-Message-State: AJIora+p0EsGdTmBuRRelV1G1DQXbi+J7OMaIxvJ0iNL4P+Zyb9pmPFZ
 jWbDdauovwfwKsoAsNcVcX/gZtCM79w=
X-Google-Smtp-Source: AGRyM1ui+HAQvcW0zo3ppwToBCmbW7SNUmPtFwxLFWefCTDZI9+ZE2E4Y0myZ+cKSJ9mRQInZ1Wnxg==
X-Received: by 2002:aca:1003:0:b0:33a:84ce:f366 with SMTP id
 3-20020aca1003000000b0033a84cef366mr1412192oiq.117.1658164939167; 
 Mon, 18 Jul 2022 10:22:19 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/30] ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
Date: Mon, 18 Jul 2022 14:21:40 -0300
Message-Id: <20220718172208.1247624-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220705145814.461723-3-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc.c           |  5 +----
 hw/ppc/ppc405_uc.c     |  4 ++--
 hw/ppc/ppc440_bamboo.c |  4 ++--
 hw/ppc/sam460ex.c      |  4 ++--
 hw/ppc/virtex_ml507.c  | 10 +++++-----
 5 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 15f2b5f0f0..8c88d3a480 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -422,10 +422,7 @@ static void ppc40x_set_irq(void *opaque, int pin, int level)
 
 void ppc40x_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc40x_set_irq,
-                                                  cpu, PPC40x_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), ppc40x_set_irq, PPC40x_INPUT_NB);
 }
 
 /* PowerPC E500 internal IRQ controller */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 36c8ba6f3c..d6420c88d3 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1470,9 +1470,9 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
     sysbus_realize_and_unref(uicsbd, &error_fatal);
 
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     *uicdevp = uicdev;
 
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index d5973f2484..873f930c77 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -200,9 +200,9 @@ static void bamboo_init(MachineState *machine)
     sysbus_realize_and_unref(uicsbd, &error_fatal);
 
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
     memset(ram_bases, 0, sizeof(ram_bases));
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 2f24598f55..7e8da657c2 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -334,9 +334,9 @@ static void sam460ex_init(MachineState *machine)
 
         if (i == 0) {
             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
-                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+                             qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
-                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+                             qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
         } else {
             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
                                qdev_get_gpio_in(uic[0], input_ints[i]));
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index b67a709ddc..53b126ff48 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -111,9 +111,9 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
     sysbus_realize_and_unref(uicsbd, &error_fatal);
 
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* This board doesn't wire anything up to the inputs of the UIC. */
     return cpu;
@@ -213,7 +213,7 @@ static void virtex_init(MachineState *machine)
     CPUPPCState *env;
     hwaddr ram_base = 0;
     DriveInfo *dinfo;
-    qemu_irq irq[32], *cpu_irq;
+    qemu_irq irq[32], cpu_irq;
     int kernel_size;
     int i;
 
@@ -236,12 +236,12 @@ static void virtex_init(MachineState *machine)
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                           64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
 
-    cpu_irq = (qemu_irq *) &env->irq_inputs[PPC40x_INPUT_INT];
+    cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr", 0);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq[0]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(dev, i);
     }
-- 
2.36.1


