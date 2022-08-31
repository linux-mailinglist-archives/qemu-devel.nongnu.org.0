Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4515A8698
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:18:01 +0200 (CEST)
Received: from localhost ([::1]:50974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTDt-0005P7-5R
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoM-00037y-G3; Wed, 31 Aug 2022 14:51:38 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoJ-00081R-Ts; Wed, 31 Aug 2022 14:51:37 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-12243fcaa67so3628678fac.8; 
 Wed, 31 Aug 2022 11:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QPNTxdwWE3vaQVFRdXAXSpvuE70hTKvUqdlAdBfJrZo=;
 b=QQuXaKhDN1tVpWY87jg0PIiCss8iA9mA9Qc6zfP2zO4CNIBc3a0L1Jgj6kJPlKF+Py
 nurMLkvoxwvEiMHVC7hvN8PR8DZ9UQlkRgI6Y6r8tjFJuPEuhlavTUmGjiRAFlNYcTCG
 drnK4l8kAMtrZbScDwgio91Lnx7ndC/7Gf2Hk6hH6g77CHFnj26FKzSN+TTJwxihM9O2
 Yfm5UXYuEVdXe8h7SGAB2PHGGo3SvE+6nZMPreDmF+vHtoS86Qf3ghWfDse99HbsSoWt
 TDi6gWxl+xmAOM0GkriMQekDqPmPfTfGsIcmwKbvGXwciZGLCPlalGxLu3J3+oLwybHe
 NSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QPNTxdwWE3vaQVFRdXAXSpvuE70hTKvUqdlAdBfJrZo=;
 b=1YByaMoroTjevo4bWJs/fGTfEGa7sguHSyJ8JeIpKocMuVM+YRIGLyzPQAcgE9ki90
 C8fq+y+rAskCI/PoppbrEjCcMYVuCyomjVFcW/g9nYSMynkWCJ99DcAkcK/Vw1J7OxxO
 1F/gs9aqTcLsYoANKebKrUNWQ/3kt7wbx8MNbYbnwmwP4ExHtwsEAbzcVhBN51c9+g5E
 zg6h24hTP3fsf1XRpuzhk573cfz4lQI0nGgOs5Gxe94urIanzBRlRUWdP5wueFZoimBk
 /XpPaX7cOYFrk89uu/ggx6pPEtefaUmnqft+T6EmjrPQ5pEtYpIBoM1QRLKtRxS8Gu3E
 RaKQ==
X-Gm-Message-State: ACgBeo1GCUxeD1K7Z3mNHH4IYawF+hH4RgE3JPRlqZrnCevpVOa32Q9b
 RVOwHwFE+dSANb4/7uW/cvBoI0AT39s=
X-Google-Smtp-Source: AA6agR6EGGhh0E36zmkNYGbsOBRFYclxkfBli7YDfYG1lk5gToeNV67OsRIndLVhPn0apM/S4amH6w==
X-Received: by 2002:aca:3ac3:0:b0:344:821:525f with SMTP id
 h186-20020aca3ac3000000b003440821525fmr1724904oia.63.1661971894623; 
 Wed, 31 Aug 2022 11:51:34 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 18/60] ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
Date: Wed, 31 Aug 2022 15:49:52 -0300
Message-Id: <20220831185034.23240-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We rely on the phb-id and chip-id, which are PHB properties, to assign
chassis and slot to the root port. For default devices this is no big
deal: the root port is being created under pnv_phb_realize() and the
values are being passed on via the 'index' and 'chip-id' of the
pnv_phb_attach_root_port() helper.

If we want to implement user created root ports we have a problem. The
user created root port will not be aware of which PHB it belongs to,
unless we're willing to violate QOM best practices and access the PHB
via dev->parent_bus->parent. What we can do is to access the root bus
parent bus.

Since we're already assigning the root port as QOM child of the bus, and
the bus is initiated using PHB properties, let's add phb-id and chip-id
as properties of the bus. This will allow us trivial access to them, for
both user-created and default root ports, without doing anything too
shady with QOM.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-2-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 50 ++++++++++++++++++++++++++++++++++
 include/hw/pci-host/pnv_phb3.h |  9 +++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index d4c04a281a..af8575c007 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1006,6 +1006,11 @@ void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB3_ROOT_BUS);
 
+    object_property_set_int(OBJECT(pci->bus), "phb-id", phb->phb_id,
+                            &error_abort);
+    object_property_set_int(OBJECT(pci->bus), "chip-id", phb->chip_id,
+                            &error_abort);
+
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
 }
 
@@ -1105,10 +1110,55 @@ static const TypeInfo pnv_phb3_type_info = {
     .instance_init = pnv_phb3_instance_init,
 };
 
+static void pnv_phb3_root_bus_get_prop(Object *obj, Visitor *v,
+                                       const char *name,
+                                       void *opaque, Error **errp)
+{
+    PnvPHB3RootBus *bus = PNV_PHB3_ROOT_BUS(obj);
+    uint64_t value = 0;
+
+    if (strcmp(name, "phb-id") == 0) {
+        value = bus->phb_id;
+    } else {
+        value = bus->chip_id;
+    }
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void pnv_phb3_root_bus_set_prop(Object *obj, Visitor *v,
+                                       const char *name,
+                                       void *opaque, Error **errp)
+
+{
+    PnvPHB3RootBus *bus = PNV_PHB3_ROOT_BUS(obj);
+    uint64_t value;
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    if (strcmp(name, "phb-id") == 0) {
+        bus->phb_id = value;
+    } else {
+        bus->chip_id = value;
+    }
+}
+
 static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
 
+    object_class_property_add(klass, "phb-id", "int",
+                              pnv_phb3_root_bus_get_prop,
+                              pnv_phb3_root_bus_set_prop,
+                              NULL, NULL);
+
+    object_class_property_add(klass, "chip-id", "int",
+                              pnv_phb3_root_bus_get_prop,
+                              pnv_phb3_root_bus_set_prop,
+                              NULL, NULL);
+
     /*
      * PHB3 has only a single root complex. Enforce the limit on the
      * parent bus
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index bff69201d9..4854f6d2f6 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -104,9 +104,16 @@ struct PnvPBCQState {
 };
 
 /*
- * PHB3 PCIe Root port
+ * PHB3 PCIe Root Bus
  */
 #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
+struct PnvPHB3RootBus {
+    PCIBus parent;
+
+    uint32_t chip_id;
+    uint32_t phb_id;
+};
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3RootBus, PNV_PHB3_ROOT_BUS)
 
 /*
  * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
-- 
2.37.2


