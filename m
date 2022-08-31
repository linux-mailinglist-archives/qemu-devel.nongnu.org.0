Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3057E5A8666
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:05:44 +0200 (CEST)
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTT1y-0003cj-3E
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoA-0002sf-ET; Wed, 31 Aug 2022 14:51:26 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:33721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSo5-00081o-LD; Wed, 31 Aug 2022 14:51:26 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11eb8b133fbso21850641fac.0; 
 Wed, 31 Aug 2022 11:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=l0Q7kFWHTZCkClGgdCSBhfLG4Xrz8TKrjzGSIuK63Xw=;
 b=j1uyzrlwhZDAasAdT6sk3dCvNw4PFwxBa95lJl7EcEH6QNxIYaioe0i1X7yWEzbODb
 yqR87VtAiiRgd3BSxVxxvCxTXieTUVXJEykIIQ/biiRXoo+cfgx2hzW7tOBQ1o0Yh0b8
 I9+42kDbuh4p/AY1QR7lsiM75U4+adANc7C1tM+BZvyf0ZZeyhFy9fNJ1y4iPZxYN/6Q
 FB9a2Eka6YqXwjl8FKkYHEBcoSlUlxeimHbku2RJcFnyn9SOLZn6oXwTcYuzpOZXacpt
 ennCbnKf4OcVSXnB1/YttiMF3FYFqWoWBiX6M6rG4vN3B8HDCR3Yp1mIjzRZlHlHmFfW
 tADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=l0Q7kFWHTZCkClGgdCSBhfLG4Xrz8TKrjzGSIuK63Xw=;
 b=NxBQB2zM3dAZhzDICGEB5QOD5t4Vj8UcwHtUgEfPVxgIRZIsAhzuhtZRSWjgTQKTMC
 YX/f3sgHqMkNgYwpZxAy/hoDikTuYm9lnnCBp+H+F1Nyc28J5tZaktSjgPwOB7tB+We6
 fss3R3HTfCZ1yEkykxUiNb/PLPCUJCs8yseD8FcZZ/kRIJ2xHDW00mNV0OSd3WbSuCjq
 oN30BZBBOn1lw2ozTrn5enz+ntBtBCnquGo/hlMwk33t5Z9oH9g9XbbHmi6q03PkkWrK
 8nfmN5VO3RWG3hWDifMgmZfn+0X+KVJtU1X54ZakrdXzxKxj8GKzI8acU8ak3En1po3a
 UySw==
X-Gm-Message-State: ACgBeo1byIwZzlaENZYo/X8W96O5xb+IeWqJe9sbcDuttC/b+Ad4tjUT
 c4diwyo1iefMvc3pinQh4ITKrzc7Ob4=
X-Google-Smtp-Source: AA6agR6Tkb8fHOpUQ77BbUDEO2DQF849y8WfxVid7K+e47mCuFPoI4h2NjZoUY+hRkcgv0KE+b5INA==
X-Received: by 2002:a05:6870:2385:b0:11f:3ac8:d153 with SMTP id
 e5-20020a056870238500b0011f3ac8d153mr2021992oap.148.1661971879523; 
 Wed, 31 Aug 2022 11:51:19 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 12/60] ppc/pnv: remove pnv-phb3-root-port
Date: Wed, 31 Aug 2022 15:49:46 -0300
Message-Id: <20220831185034.23240-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unified pnv-phb-root-port can be used in its place. There is no ABI
breakage in doing so because no official QEMU release introduced user
creatable pnv-phb3-root-port devices.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-8-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c          |  2 +-
 hw/pci-host/pnv_phb3.c         | 42 ----------------------------------
 hw/ppc/pnv.c                   |  1 +
 include/hw/pci-host/pnv_phb3.h |  6 -----
 4 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 5e61f85614..cdddc6a389 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -34,7 +34,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     switch (phb->version) {
     case 3:
         phb_typename = g_strdup(TYPE_PNV_PHB3);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 4:
         phb_typename = g_strdup(TYPE_PNV_PHB4);
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index ad9e983fe9..d4c04a281a 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1122,51 +1122,9 @@ static const TypeInfo pnv_phb3_root_bus_info = {
     .class_init = pnv_phb3_root_bus_class_init,
 };
 
-static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
-{
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    PCIDevice *pci = PCI_DEVICE(dev);
-    Error *local_err = NULL;
-
-    rpc->parent_realize(dev, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-    pci_config_set_interrupt_pin(pci->config, 0);
-}
-
-static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
-
-    dc->desc     = "IBM PHB3 PCIE Root Port";
-
-    device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
-                                    &rpc->parent_realize);
-    dc->user_creatable = false;
-
-    k->vendor_id = PCI_VENDOR_ID_IBM;
-    k->device_id = 0x03dc;
-    k->revision  = 0;
-
-    rpc->exp_offset = 0x48;
-    rpc->aer_offset = 0x100;
-}
-
-static const TypeInfo pnv_phb3_root_port_info = {
-    .name          = TYPE_PNV_PHB3_ROOT_PORT,
-    .parent        = TYPE_PCIE_ROOT_PORT,
-    .instance_size = sizeof(PnvPHB3RootPort),
-    .class_init    = pnv_phb3_root_port_class_init,
-};
-
 static void pnv_phb3_register_types(void)
 {
     type_register_static(&pnv_phb3_root_bus_info);
-    type_register_static(&pnv_phb3_root_port_info);
     type_register_static(&pnv_phb3_type_info);
     type_register_static(&pnv_phb3_iommu_memory_region_info);
 }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index ae6cd14a8a..672227a0e1 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2129,6 +2129,7 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     static GlobalProperty phb_compat[] = {
         { TYPE_PNV_PHB, "version", "3" },
+        { TYPE_PNV_PHB_ROOT_PORT, "version", "3" },
     };
 
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 3b9ff1096a..bff69201d9 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -108,12 +108,6 @@ struct PnvPBCQState {
  */
 #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
 
-#define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
-
-typedef struct PnvPHB3RootPort {
-    PCIESlot parent_obj;
-} PnvPHB3RootPort;
-
 /*
  * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
  */
-- 
2.37.2


