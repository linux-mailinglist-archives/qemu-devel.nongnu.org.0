Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E1D5A86AD
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:21:54 +0200 (CEST)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTHd-0003qp-B2
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoI-00035Y-Ic; Wed, 31 Aug 2022 14:51:34 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoG-00081R-Uv; Wed, 31 Aug 2022 14:51:34 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-12243fcaa67so3628358fac.8; 
 Wed, 31 Aug 2022 11:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wrITHAM878AYouv8OPaOTKOYGcaGeIQb9/lxLYsmtN8=;
 b=PMP+T88VHQLluqPbzc672pRvPacZpEv8dJWgMUjyRWvazvPIlBr2dKsLYFU55okwtc
 jW0oUxR7gfOSotP2SWUqxmvMiYb7XiEwpfvjAGUN19nYEUlrGossg8hBGgYqYxLvaXRQ
 YUVVDc2kUfAuRp0KDGjE17T2MZU6KBK9c6c9exlvXSbVl8mUHL7z8GucJM7ZmnrDlJvp
 RIgKXCnuawyUIwtJnW9ZmvUYJz2NUcROCdCNy6oL1o0+jo85u1bfbT8aBzvzor35MzLV
 bzLPKFJbN3WxviMCVD3YiCaJ75QT++fpg/jYGviV7WdW6wlY6Ko3lbfAGmBlcEkPbIdQ
 9D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wrITHAM878AYouv8OPaOTKOYGcaGeIQb9/lxLYsmtN8=;
 b=RmKE1e6ExarJpkBfMcY1dQOoQ33FRM35nNWXWek30TWFJhUwaeZS2V/y5T4xhT1eqK
 d9pUIrks2AE/t6ofOvfxKlijVwcAtkbPelyzedf40e3H5zAHQ7kzcZJXIG5NIs59b8o/
 cmGwap9jFUjCJy3OA8r1mUr0zrpvFcVDDH9Kc8wF2IZMIjYpQ0y1EpbSO2qh3CJwv2MQ
 Kryk8rnc9SzBESO26CCgD4HDOKqP5Rs3aWDmVdLZ1X3TVp6RZg0tiGgYaTokdn4nnwDG
 BPhUqJ3givySkOw6LL471GKX4S773BRjHIJIjGmm9AmNDQ1Zj7sMXh+SKHDSzpJVCJYm
 9gcg==
X-Gm-Message-State: ACgBeo1zY9U+qpZKzsfO6cGw2xbJK83ndakR4b9QhDcdYX3kbhv8S2f6
 8+/Y7pd6T1e7u1D4JpTNpKrBnMRWOyc=
X-Google-Smtp-Source: AA6agR4n9teOsEqTWLYfVrHMoUGv9VwfBLqSoT0sx0lMQHINwP0lHo24tsWmWhtUip5lTQWX+kzyBw==
X-Received: by 2002:a05:6871:796:b0:11e:b92e:731e with SMTP id
 o22-20020a056871079600b0011eb92e731emr2215633oap.41.1661971891695; 
 Wed, 31 Aug 2022 11:51:31 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 17/60] ppc/pnv: move attach_root_port helper to pnv-phb.c
Date: Wed, 31 Aug 2022 15:49:51 -0300
Message-Id: <20220831185034.23240-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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

The helper is only used in this file.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-13-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 24 ++++++++++++++++++++++++
 hw/ppc/pnv.c          | 25 -------------------------
 include/hw/ppc/pnv.h  |  1 -
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index cc15a949c9..c47ed92462 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -18,6 +18,30 @@
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
 
+/*
+ * Attach a root port device.
+ *
+ * 'index' will be used both as a PCIE slot value and to calculate
+ * QOM id. 'chip_id' is going to be used as PCIE chassis for the
+ * root port.
+ */
+static void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
+{
+    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
+    g_autofree char *default_id = g_strdup_printf("%s[%d]",
+                                                  TYPE_PNV_PHB_ROOT_PORT,
+                                                  index);
+    const char *dev_id = DEVICE(root)->id;
+
+    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
+                              OBJECT(root));
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
+    qdev_prop_set_uint16(DEVICE(root), "slot", index);
+
+    pci_realize_and_unref(root, pci->bus, &error_fatal);
+}
 
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
 {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6b94c373d1..758e36132d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1188,31 +1188,6 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
     }
 }
 
-/*
- * Attach a root port device.
- *
- * 'index' will be used both as a PCIE slot value and to calculate
- * QOM id. 'chip_id' is going to be used as PCIE chassis for the
- * root port.
- */
-void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
-{
-    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    g_autofree char *default_id = g_strdup_printf("%s[%d]",
-                                                  TYPE_PNV_PHB_ROOT_PORT,
-                                                  index);
-    const char *dev_id = DEVICE(root)->id;
-
-    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
-                              OBJECT(root));
-
-    /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
-    qdev_prop_set_uint16(DEVICE(root), "slot", index);
-
-    pci_realize_and_unref(root, pci->bus, &error_fatal);
-}
-
 static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 0eda47da0c..290adac76c 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -193,7 +193,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
-void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.37.2


