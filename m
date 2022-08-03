Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AB5588E4E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:12:22 +0200 (CEST)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJF6i-00012u-R3
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgj-0003Ek-Ek; Wed, 03 Aug 2022 09:45:29 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:38595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgb-0004ns-LX; Wed, 03 Aug 2022 09:45:28 -0400
Received: by mail-vs1-xe30.google.com with SMTP id 125so17871452vsd.5;
 Wed, 03 Aug 2022 06:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uhvOGIr9KoQIZ8UozVsdv7ibmMjyavjLyXmFf8ZJR50=;
 b=HIXKjYmbnU0ovgc8KLPXBJiYUV+ckpBOWhSFmZvthXqzFnX/B6hzJfxvPG7e8I/UBJ
 /unSG0nHpneM2T/SdvG/gzFnE/m/cmVfTodiPsUM4IwHrF03XfTqDETsQel2imZ6d35G
 1egOvRkBlitBfU0DP38aRoFsbcYj8MCmWaFX1bmT3TBMkSV7AcPhMuF2ZvPBQQxYnmY+
 fy6qNMRlODBCJohFpJ/qFDMTiSkKN0Oeen4a9IE8aBhJ7s1H9334gp9hQQCy0DVtsQMs
 AvDKXG2CKr7DllzQVWCOsqmm55gMDLo4YF4zqq7h7P0DZgrR9PTk0LAI1VvkimOD0jJx
 9ugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uhvOGIr9KoQIZ8UozVsdv7ibmMjyavjLyXmFf8ZJR50=;
 b=O2ZZEr+toOncyb19bP5f44egYMbQydf/TbRUS7J6aScOS/uQzA1ImE4ps1E90HgW2w
 VRPrsKCP7rG9huBHxumQWMUC88035s7mgX0DVT8E0nGHYxofEwKP4pCMGtzmJ/dLhMmG
 FJh1N7lLH92rflpQTxCFFzziV07HOx8b/xYuneXXp1mhsBK9q7Kn1Da2hLaZoOTic25o
 BZqEdSN6Ag6YO5AGS+0msQHVle5WWdZHOz43a1ewPwH73L4VCrO8r1lA+UZ+oQ/98sOc
 aLjWURLgzzHoOi1hZucC0XOalnmc1L0UAopa1hJFAqfP3Q6N7ALePIN10Yr0nvnBzHw9
 qmxg==
X-Gm-Message-State: ACgBeo2FIDaJSteI/zi51ed0+C+0Gw0nCaEAxBeEFxz9SSel4LACf0BV
 bvEdg0jQguLTvEKorscxYhyywO8IoBM=
X-Google-Smtp-Source: AA6agR7EhQeqVZoxVvAKwYpUdd1tznJNFZTdcws/bPQ282eezBu6CKf/zu9oTqr43LZcZ5wGCP0XIw==
X-Received: by 2002:a05:6102:5788:b0:388:5e7c:af05 with SMTP id
 dh8-20020a056102578800b003885e7caf05mr550823vsb.31.1659534314579; 
 Wed, 03 Aug 2022 06:45:14 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 04/10] ppc/pnv: add helpers for pnv-phb user devices
Date: Wed,  3 Aug 2022 10:44:53 -0300
Message-Id: <20220803134459.2633902-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe30.google.com
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 69 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 826c0c144e..da779dc298 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -18,6 +18,37 @@
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
+static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
+{
+    BusState *parent_bus = qdev_get_parent_bus(parent);
+
+    if (!qdev_set_parent_bus(child, parent_bus, &error_fatal)) {
+        return;
+    }
+}
+
 /*
  * Attach a root port device.
  *
@@ -41,6 +72,36 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
+/*
+ * User created devices won't have the initial setup that default
+ * devices have. This setup consists of assigning a parent device
+ * (chip for PHB3, PEC for PHB4/5) that will be the QOM/bus parent
+ * of the PHB.
+ */
+static void pnv_phb_user_device_init(PnvPHB *phb)
+{
+    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
+    Object *parent = NULL;
+
+    if (!chip) {
+        error_setg(&error_fatal, "invalid chip id: %d", phb->chip_id);
+        return;
+    }
+
+    /*
+     * Reparent user created devices to the chip to build
+     * correctly the device tree. pnv_xscom_dt() needs every
+     * PHB to be a child of the chip to build the DT correctly.
+     *
+     * TODO: for version 3 we're still parenting the PHB with the
+     * chip. We should parent with a (so far not implemented)
+     * PHB3 PEC device.
+     */
+    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
+    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb));
+}
+
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB *phb = PNV_PHB(dev);
@@ -74,6 +135,14 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
     object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
 
+    /*
+     * Handle user created devices. User devices will not have a
+     * pointer to a chip (PHB3) and a PEC (PHB4/5).
+     */
+    if (!phb->chip && !phb->pec) {
+        pnv_phb_user_device_init(phb);
+    }
+
     if (phb->version == 3) {
         object_property_set_link(phb->backend, "chip",
                                  OBJECT(phb->chip), errp);
-- 
2.36.1


