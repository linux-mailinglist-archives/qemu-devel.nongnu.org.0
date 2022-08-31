Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F005A8687
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:14:49 +0200 (CEST)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTAm-0001R5-4l
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoU-0003DP-T2; Wed, 31 Aug 2022 14:51:48 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoS-00084D-MX; Wed, 31 Aug 2022 14:51:46 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eab59db71so22381495fac.11; 
 Wed, 31 Aug 2022 11:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mf0xMSXHla7c6wlDImyxuRxbh5GSr36wJRdvN1Vp3rI=;
 b=QBCZ6qTxHTxTFqr5eedcWASjOnZh54JwrfJb5hNDJioAPNctadnhoI1iI9e9y6knlt
 /2MjhpVe9w6Ln5sOQnYhhni3dcrOXIBunplLlTYTCxKwzVW7AZ7yLKYTXnWv7ItvO40V
 FauGnLSxTs9qVYeEaRWi4zSts0zOT4Da2j+vYM5GgJVgFKwQ0NT+xA6nhM5P7Gy2INWi
 JPqsSSk4dvEPE6Ha9lpwD81PCoLTK4gWvqtTpfOOSnxoNxha64TwBj6cYliY9ma3U9J4
 vLMZAIXgbGCaj4uESh6yWdgl3z6yEcVcn9hhgnewrocVBJgZVTvv+NAKG8rPgsHr2fE9
 GFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mf0xMSXHla7c6wlDImyxuRxbh5GSr36wJRdvN1Vp3rI=;
 b=57w75Un1KxQCtPT3x6KHOXrvwl4rW7/9yzHKCI74E31MTmKwXpUZQVciSi2LThCBtj
 065Cc+Vaqyd++218m6kxnWJyrEkqjKgHUCxsXlU0fMeJxNIA4P+rUFjzbq0xTaSDUI/+
 0Bc5K4IlrmiB4yKNZ8tXoOG/FWPBOHxpawwNY72h5GxtcuR7VdYCBLgu0V3tS3DZ9yV6
 t7gc4KPmAcMEhMr+bvyAbLdrk/FvZst0vBxSyrhHrQvFYM7VcJDx3jGIJMQeyxMcTpKg
 ero2wSU2+Tzhym+xmFtQbdTakv8rKVGj8jmZX4aN6v6KhbZXxghSZW/x09PHah8lQMKw
 8tCg==
X-Gm-Message-State: ACgBeo0MWo3WcIyrL9RKUPe75tCl9VkmpY7pajZS2W/R4NXRoKWJzKP3
 kYY2sFVw9hUUONOwNnUPrsn76Kky39I=
X-Google-Smtp-Source: AA6agR6mmpn8hAEn3nJ5wtfng8+KXGVsx02Myy3U57LIVraX2Ztx+yJ+uJAS5dgyQAXBc2KqVurdYw==
X-Received: by 2002:a05:6871:10e:b0:121:ece3:40fc with SMTP id
 y14-20020a056871010e00b00121ece340fcmr2201237oab.140.1661971902860; 
 Wed, 31 Aug 2022 11:51:42 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 21/60] ppc/pnv: add helpers for pnv-phb user devices
Date: Wed, 31 Aug 2022 15:49:55 -0300
Message-Id: <20220831185034.23240-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

pnv_parent_qom_fixup() and pnv_parent_bus_fixup() are versions of the
helpers that were reverted by commit 9c10d86fee "ppc/pnv: Remove
user-created PHB{3,4,5} devices". They are needed to amend the QOM and
bus hierarchies of user created pnv-phbs, matching them with default
pnv-phbs.

A new helper pnv_phb_user_device_init() is created to handle
user-created devices setup. We're going to call it inside
pnv_phb_realize() in case we're realizing an user created device. This
will centralize all user device realated in a single spot, leaving the
realize functions of the phb3/phb4 backends untouched.

Another helper called pnv_chip_add_phb() was added to handle the
particularities of each chip version when adding a new PHB.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-5-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 75 +++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/pnv.c          | 20 ++++++++++++
 include/hw/ppc/pnv.h  |  1 +
 3 files changed, 96 insertions(+)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 826c0c144e..5dc44f45d1 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -18,6 +18,38 @@
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
 
+
+/*
+ * Set the QOM parent of an object child. If the device state
+ * associated with the child has an id, use it as QOM id. Otherwise
+ * use object_typename[index] as QOM id.
+ */
+static void pnv_parent_qom_fixup(Object *parent, Object *child, int index)
+{
+    g_autofree char *default_id =
+        g_strdup_printf("%s[%d]", object_get_typename(child), index);
+    const char *dev_id = DEVICE(child)->id;
+
+    if (child->parent == parent) {
+        return;
+    }
+
+    object_ref(child);
+    object_unparent(child);
+    object_property_add_child(parent, dev_id ? dev_id : default_id, child);
+    object_unref(child);
+}
+
+static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child,
+                                 Error **errp)
+{
+    BusState *parent_bus = qdev_get_parent_bus(parent);
+
+    if (!qdev_set_parent_bus(child, parent_bus, errp)) {
+        return;
+    }
+}
+
 /*
  * Attach a root port device.
  *
@@ -41,6 +73,39 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
+/*
+ * User created devices won't have the initial setup that default
+ * devices have. This setup consists of assigning a parent device
+ * (chip for PHB3, PEC for PHB4/5) that will be the QOM/bus parent
+ * of the PHB.
+ */
+static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
+{
+    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
+    Object *parent = NULL;
+
+    if (!chip) {
+        error_setg(errp, "invalid chip id: %d", phb->chip_id);
+        return false;
+    }
+
+    parent = pnv_chip_add_phb(chip, phb, errp);
+    if (!parent) {
+        return false;
+    }
+
+    /*
+     * Reparent user created devices to the chip to build
+     * correctly the device tree. pnv_xscom_dt() needs every
+     * PHB to be a child of the chip to build the DT correctly.
+     */
+    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
+    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb), errp);
+
+    return true;
+}
+
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB *phb = PNV_PHB(dev);
@@ -74,6 +139,16 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
     object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
 
+    /*
+     * Handle user created devices. User devices will not have a
+     * pointer to a chip (PHB3) and a PEC (PHB4/5).
+     */
+    if (!phb->chip && !phb->pec) {
+        if (!pnv_phb_user_device_init(phb, errp)) {
+            return;
+        }
+    }
+
     if (phb->version == 3) {
         object_property_set_link(phb->backend, "chip",
                                  OBJECT(phb->chip), errp);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 758e36132d..737dee4980 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -281,6 +281,26 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
     g_free(reg);
 }
 
+/*
+ * Adds a PnvPHB to the chip. Returns the parent obj of the
+ * PHB which varies with each version (phb version 3 is parented
+ * by the chip, version 4 and 5 are parented by the PEC
+ * device).
+ *
+ * TODO: for version 3 we're still parenting the PHB with the
+ * chip. We should parent with a (so far not implemented)
+ * PHB3 PEC device.
+ */
+Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
+{
+    if (phb->version == 3) {
+        return OBJECT(chip);
+    } else {
+        /* phb4 support will be added later */
+        return NULL;
+    }
+}
+
 static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)
 {
     static const char compat[] = "ibm,power8-xscom\0ibm,xscom";
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 290adac76c..c44f357bce 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -234,6 +234,7 @@ struct PnvMachineState {
 };
 
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
+Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp);
 
 #define PNV_FDT_ADDR          0x01000000
 #define PNV_TIMEBASE_FREQ     512000000ULL
-- 
2.37.2


