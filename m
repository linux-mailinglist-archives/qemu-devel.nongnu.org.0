Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27485A8707
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:54:36 +0200 (CEST)
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTnH-00085q-Vw
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpN-0005ER-Dz; Wed, 31 Aug 2022 14:52:41 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:40820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpL-0008C1-By; Wed, 31 Aug 2022 14:52:41 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso10876344otp.7; 
 Wed, 31 Aug 2022 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=A6mdQ5gjvVnJGuQtMmjZVEkvGRhsgBD7Z2WRxvDVaJk=;
 b=FIMZfMfImvM7PllO2GBepqDGXtIXAiIcrCrWFLuiGtJ/JfTuPr8zNgBKK+A9EpwHPM
 R+qRsqDeMahbxEJJ8fn+hARfmaVvdu/XBzK9S5av/lH8mJAJsQGXc4VEb2W+qoRyt4G9
 0qXpsh6dMqaVp2F/UTl/5wDOr0ByYLVX5MHn+LF3XA2hDZQRHLnBR66SGNTaTg0uchTJ
 0bHZTCjWfnj1Az8Qe3pXqWamyb085MMegfQIQjufINLu7UNDgxCxalgP9SQ5q45Rh15C
 qhftp5XA5EwFQPIgMQWO0DzNxV0nCJOV5z/mrdKdrPzksniTfpVgWLwoWL/nl3ucTawY
 E6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=A6mdQ5gjvVnJGuQtMmjZVEkvGRhsgBD7Z2WRxvDVaJk=;
 b=PJ8deFlTlSpQTL3lxCAsa1e54I/t1qNaTK+5tt3IfMTQkvJQnLwGdrPQcsdPo1qGMX
 NiFXxybX5hLUCO03H8e+a/AYFgIt348M7a3rCjN2iJxHtu+7ofYIIW39ulM8pwX0FCdb
 oPwfpdY3Jc6/x3gi0MKlm2XElkuLtFXZVCApsbBZNO2Lmmb5vo0vdf4ZONWqV2MfsPiT
 HXL308hv6ZBhQckam3X4T9gYJiZS9l59GmbOzIDVj/Mx6pz6VMGUtidzjD/kGjjs98Y9
 3w211pNFQYUBCUsnNkyrJ9LcUPPVQlWJtxjR1u1swZQztvf0MZuETyWsXqr0ljm6Or+M
 ZeBQ==
X-Gm-Message-State: ACgBeo3MkyGQSypfgD4gq2FLjNj5IjYaNYwwgWUxCP4MyoTSG0hh7bC3
 +i8H/bD6ySC+CwhEtHOfTJ17ZWRwub0=
X-Google-Smtp-Source: AA6agR74uxVMJ+WrUPRP80frj5WUqqlPw5cOC6Y+X/UJIlh+etT8qGYJ1kHhtYCx9ZvtuIqVrQj3xw==
X-Received: by 2002:a9d:2f61:0:b0:639:bbd:c414 with SMTP id
 h88-20020a9d2f61000000b006390bbdc414mr11280894otb.41.1661971956526; 
 Wed, 31 Aug 2022 11:52:36 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 40/60] ppc/ppc405: QOM'ify OCM
Date: Wed, 31 Aug 2022 15:50:14 -0300
Message-Id: <20220831185034.23240-41-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
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

The OCM controller is currently modeled as a simple DCR device with
a couple of memory regions.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <ecb93d2d5993bb7a970365744c7d342d4abcb017.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h    | 16 ++++++++++
 hw/ppc/ppc405_uc.c | 77 +++++++++++++++++++++++-----------------------
 2 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index bcf55e4f6b..a5b493d3e7 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,21 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* On Chip Memory */
+#define TYPE_PPC405_OCM "ppc405-ocm"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
+struct Ppc405OcmState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    MemoryRegion ram;
+    MemoryRegion isarc_ram;
+    MemoryRegion dsarc_ram;
+    uint32_t isarc;
+    uint32_t isacntl;
+    uint32_t dsarc;
+    uint32_t dsacntl;
+};
+
 /* General purpose timers */
 #define TYPE_PPC405_GPT "ppc405-gpt"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GptState, PPC405_GPT);
@@ -136,6 +151,7 @@ struct Ppc405SoCState {
     DeviceState *uic;
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
+    Ppc405OcmState ocm;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 1994801abe..8ee0357ac3 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -773,20 +773,9 @@ enum {
     OCM0_DSACNTL = 0x01B,
 };
 
-typedef struct ppc405_ocm_t ppc405_ocm_t;
-struct ppc405_ocm_t {
-    MemoryRegion ram;
-    MemoryRegion isarc_ram;
-    MemoryRegion dsarc_ram;
-    uint32_t isarc;
-    uint32_t isacntl;
-    uint32_t dsarc;
-    uint32_t dsacntl;
-};
-
-static void ocm_update_mappings (ppc405_ocm_t *ocm,
-                                 uint32_t isarc, uint32_t isacntl,
-                                 uint32_t dsarc, uint32_t dsacntl)
+static void ocm_update_mappings(Ppc405OcmState *ocm,
+                                uint32_t isarc, uint32_t isacntl,
+                                uint32_t dsarc, uint32_t dsacntl)
 {
     trace_ocm_update_mappings(isarc, isacntl, dsarc, dsacntl, ocm->isarc,
                               ocm->isacntl, ocm->dsarc, ocm->dsacntl);
@@ -828,12 +817,11 @@ static void ocm_update_mappings (ppc405_ocm_t *ocm,
     }
 }
 
-static uint32_t dcr_read_ocm (void *opaque, int dcrn)
+static uint32_t dcr_read_ocm(void *opaque, int dcrn)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = opaque;
     uint32_t ret;
 
-    ocm = opaque;
     switch (dcrn) {
     case OCM0_ISARC:
         ret = ocm->isarc;
@@ -855,12 +843,11 @@ static uint32_t dcr_read_ocm (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_ocm (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_ocm(void *opaque, int dcrn, uint32_t val)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = opaque;
     uint32_t isarc, dsarc, isacntl, dsacntl;
 
-    ocm = opaque;
     isarc = ocm->isarc;
     dsarc = ocm->dsarc;
     isacntl = ocm->isacntl;
@@ -886,12 +873,11 @@ static void dcr_write_ocm (void *opaque, int dcrn, uint32_t val)
     ocm->dsacntl = dsacntl;
 }
 
-static void ocm_reset (void *opaque)
+static void ppc405_ocm_reset(DeviceState *dev)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = PPC405_OCM(dev);
     uint32_t isarc, dsarc, isacntl, dsacntl;
 
-    ocm = opaque;
     isarc = 0x00000000;
     isacntl = 0x00000000;
     dsarc = 0x00000000;
@@ -903,25 +889,31 @@ static void ocm_reset (void *opaque)
     ocm->dsacntl = dsacntl;
 }
 
-static void ppc405_ocm_init(CPUPPCState *env)
+static void ppc405_ocm_realize(DeviceState *dev, Error **errp)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = PPC405_OCM(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
 
-    ocm = g_new0(ppc405_ocm_t, 1);
     /* XXX: Size is 4096 or 0x04000000 */
-    memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4 * KiB,
+    memory_region_init_ram(&ocm->isarc_ram, OBJECT(ocm), "ppc405.ocm", 4 * KiB,
                            &error_fatal);
-    memory_region_init_alias(&ocm->dsarc_ram, NULL, "ppc405.dsarc",
+    memory_region_init_alias(&ocm->dsarc_ram, OBJECT(ocm), "ppc405.dsarc",
                              &ocm->isarc_ram, 0, 4 * KiB);
-    qemu_register_reset(&ocm_reset, ocm);
-    ppc_dcr_register(env, OCM0_ISARC,
-                     ocm, &dcr_read_ocm, &dcr_write_ocm);
-    ppc_dcr_register(env, OCM0_ISACNTL,
-                     ocm, &dcr_read_ocm, &dcr_write_ocm);
-    ppc_dcr_register(env, OCM0_DSARC,
-                     ocm, &dcr_read_ocm, &dcr_write_ocm);
-    ppc_dcr_register(env, OCM0_DSACNTL,
-                     ocm, &dcr_read_ocm, &dcr_write_ocm);
+
+    ppc4xx_dcr_register(dcr, OCM0_ISARC, ocm, &dcr_read_ocm, &dcr_write_ocm);
+    ppc4xx_dcr_register(dcr, OCM0_ISACNTL, ocm, &dcr_read_ocm, &dcr_write_ocm);
+    ppc4xx_dcr_register(dcr, OCM0_DSARC, ocm, &dcr_read_ocm, &dcr_write_ocm);
+    ppc4xx_dcr_register(dcr, OCM0_DSACNTL, ocm, &dcr_read_ocm, &dcr_write_ocm);
+}
+
+static void ppc405_ocm_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ocm_realize;
+    dc->reset = ppc405_ocm_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1420,6 +1412,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 
     object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
+
+    object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1516,7 +1510,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* OCM */
-    ppc405_ocm_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ocm), &s->cpu, errp)) {
+        return;
+    }
 
     /* GPT */
     sbd = SYS_BUS_DEVICE(&s->gpt);
@@ -1559,6 +1555,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_OCM,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405OcmState),
+        .class_init     = ppc405_ocm_class_init,
+    }, {
         .name           = TYPE_PPC405_GPT,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405GptState),
-- 
2.37.2


