Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B6578880
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:32:55 +0200 (CEST)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUc3-0005Pc-32
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURw-0007UK-Iu; Mon, 18 Jul 2022 13:22:28 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURq-0001eo-NB; Mon, 18 Jul 2022 13:22:24 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10bf634bc50so25528572fac.3; 
 Mon, 18 Jul 2022 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lJ3G/7AALhm/eJFFx1uv9eE9kShhjgEUUPSmrmJnznw=;
 b=fXEs2nd9jAPYZEPnHGJMHV4hd5P98UHMClBqsy28KAlG4zAhIjrrIXte6jz3agBcF7
 LpmVgbkT9OSq6LJHS0ZCMhyPCyILMWfsmR2Qps3UKy14xaCgluFaM2t4NQBaFvAXr3lV
 1H6jn/swrGPl6OcsodUaAAyI4e3yr+5NUX41wGNpzwt3f/RC//k2XHbTLF6aQ/71QSci
 Alc8jpoEPidJg7ifPHk/A6yYyVqqxszVcUy1+lu9nX87u0D0lFNrPRpQi4WXciqqn/Nx
 HBXH67bQzBoj6ta2/pYjfVW4nfvGC40cdlM7pbDhPAj576UMKv2QTYzohwM0Gb63uUZO
 oVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lJ3G/7AALhm/eJFFx1uv9eE9kShhjgEUUPSmrmJnznw=;
 b=Ldm+rm9o4Mhc51H+17RGvAu9XJtC+DbJr+SnJ11hU5+yjw7BDEr7Ztvi8RWg0v4nE6
 Jg8ytTemGJHCUPp37a93fRz2M1EQTuI2ASBiED8/RIZ+E6hVrO6rrO2z0vZPh6wR4PDK
 tp4UR+uydpiWTuRsAlGJcULXhDNW5TYBycsruaRk+zoJVKBTvv180Bdjkw4cp10SNC2a
 XkHsr8lQt7H/chiixunqRUizyOk3AwNzH12TkXgOnrvCx1oD4g0W9TzJkdhTyRenJ1Cy
 dco1PA7/2Us/XRCT4TA05v+sGVBxfbQQLZ6yYUs0NcN3V9bApVm9To1PNkiYWimhuaPY
 SRUg==
X-Gm-Message-State: AJIora+UjAgN9yDExD9RNrrO2hiL5XH7hKjCAzyPgfwamdg7NK7yjgpI
 A8hCwE3/iONzFfDRDvooxaWZGTZa440=
X-Google-Smtp-Source: AGRyM1vSZiH8nMJg4nz1lEGx65prrMS5iWrJsdylsJt+ECugwEZCm0sqX9NtUJCduuP2sxAw46a/Wg==
X-Received: by 2002:a05:6808:6:b0:33a:7265:bace with SMTP id
 u6-20020a056808000600b0033a7265bacemr3344859oic.270.1658164941515; 
 Mon, 18 Jul 2022 10:22:21 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 03/30] ppc/6xx: Allocate IRQ lines with qdev_init_gpio_in()
Date: Mon, 18 Jul 2022 14:21:41 -0300
Message-Id: <20220718172208.1247624-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220705145814.461723-4-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/mac_newworld.c  | 8 ++++----
 hw/ppc/mac_oldworld.c  | 2 +-
 hw/ppc/pegasos2.c      | 2 +-
 hw/ppc/ppc.c           | 5 +----
 hw/ppc/prep.c          | 2 +-
 hw/ppc/prep_systemio.c | 2 +-
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 22405dd27a..cf7eb72391 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -262,16 +262,16 @@ static void ppc_core99_init(MachineState *machine)
         switch (PPC_INPUT(env)) {
         case PPC_FLAGS_INPUT_6xx:
             openpic_irqs[i].irq[OPENPIC_OUTPUT_INT] =
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT];
+                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_CINT] =
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT];
+                 qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_MCK] =
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_MCP];
+                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_MCP);
             /* Not connected ? */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_DEBUG] = NULL;
             /* Check this */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_RESET] =
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_HRESET];
+                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_HRESET);
             break;
 #if defined(TARGET_PPC64)
         case PPC_FLAGS_INPUT_970:
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index d62fdf0db3..03732ca7ed 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -271,7 +271,7 @@ static void ppc_heathrow_init(MachineState *machine)
         case PPC_FLAGS_INPUT_6xx:
             /* XXX: we register only 1 output pin for heathrow PIC */
             qdev_connect_gpio_out(pic_dev, 0,
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT]);
+                              qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT));
             break;
         default:
             error_report("Bus model not supported on OldWorld Mac machine");
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 9411ca6b16..61f4263953 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -155,7 +155,7 @@ static void pegasos2_init(MachineState *machine)
 
     /* Marvell Discovery II system controller */
     pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
-                             ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT]));
+                          qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT_INT)));
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 8c88d3a480..161e5f9087 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -154,10 +154,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
 
 void ppc6xx_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc6xx_set_irq, cpu,
-                                                  PPC6xx_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), ppc6xx_set_irq, PPC6xx_INPUT_NB);
 }
 
 #if defined(TARGET_PPC64)
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index a1cd4505cc..f08714f2ec 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -275,7 +275,7 @@ static void ibm_40p_init(MachineState *machine)
     /* PCI -> ISA bridge */
     i82378_dev = DEVICE(pci_create_simple(pci_bus, PCI_DEVFN(11, 0), "i82378"));
     qdev_connect_gpio_out(i82378_dev, 0,
-                          cpu->env.irq_inputs[PPC6xx_INPUT_INT]);
+                          qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT));
     sysbus_connect_irq(pcihost, 0, qdev_get_gpio_in(i82378_dev, 15));
     isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
 
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index 8c9b8dd67b..5a56f155f5 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -262,7 +262,7 @@ static void prep_systemio_realize(DeviceState *dev, Error **errp)
     qemu_set_irq(s->non_contiguous_io_map_irq,
                  s->iomap_type & PORT0850_IOMAP_NONCONTIGUOUS);
     cpu = POWERPC_CPU(first_cpu);
-    s->softreset_irq = cpu->env.irq_inputs[PPC6xx_INPUT_HRESET];
+    s->softreset_irq = qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_HRESET);
 
     isa_register_portio_list(isa, &s->portio, 0x0, ppc_io800_port_list, s,
                              "systemio800");
-- 
2.36.1


