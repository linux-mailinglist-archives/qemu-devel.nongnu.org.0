Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F145282D4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:07:32 +0200 (CEST)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYZX-0005Kh-GK
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5X-0006Ds-0F
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5U-0005Ds-Mp
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2T1w60jofo7fZUHG6FeDh5etrrEXvop8IS0FXVDyV0=;
 b=gLItSC/yULcJ9Lnun9Qwd9x0AbO6nMUyt2f1zevJeg7mh7qlLNHauIGU9G4nU3bgatYI2d
 hAyZdnuxTJ0UxAX0VNWQYqNwOamhMqf2Wm+yrc6Ee/teAc4PzvKStPexICCZE6Wag3zIDT
 9pPnptb1NxEaxkLbRAYeHhXJbKBr1EY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-DWXr_jOAMTKa9TDRxaAJhg-1; Mon, 16 May 2022 06:36:27 -0400
X-MC-Unique: DWXr_jOAMTKa9TDRxaAJhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z23-20020a05600c221700b003942fd37764so10134411wml.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l2T1w60jofo7fZUHG6FeDh5etrrEXvop8IS0FXVDyV0=;
 b=xNK68TNwnAU3oaY/TARwjXLEZ1+uy8AtF00JMSWuNJEMHNG+iFjmstYFxDCqubdQwc
 1zZ5JxhaJJ0PmPbVQjMce8f5aVr/7tLUSnDnvs4G+vEoU20EveR6m0pnXAkrWpfI7zrN
 jbcx3L13mnBpDhHUUZbLpw+xypECEJFXwiOtJYarMq0r7V6FK6qkKNMinnRAUQoNZFm+
 X8qNmGaywK6CYnjQGHF2+0MsPsQqEw8fieGyKHrO1L7legl/mzszb0GlJ68GXyVBv3uk
 HNPUUqbqOAI8d5zRTWgr8OK3IDMM+T/IGZF7UZhMXJ3KWY6zmpqjSNSwVJ8/Qf1NaQ/G
 C65A==
X-Gm-Message-State: AOAM531MGvbivlOhr1Pvsy4S3pcVgKj4dPaSL9nHeo0ZPlERrp2lpDVM
 SwMnPDgYiFArNpRCWql4Kh5GIHeDnTuSq+tR9x+LpC8xbzTp8VhvEa8cuU9zVIg8Ie4Jue3cpW7
 NJrxbheDDIAGOrEHCKJL1R2yQLb46VA/KYmXoc2073BYy40TOqLNFkFJzLCEA
X-Received: by 2002:adf:ef46:0:b0:20a:e153:1f4e with SMTP id
 c6-20020adfef46000000b0020ae1531f4emr13601307wrp.352.1652697385669; 
 Mon, 16 May 2022 03:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo4OGjW0DSWaZ+JamI4DmX0wL9bziMn9+LhtFoCZAl39YU3gBEQBmyglE+XqKEeMa9fC9Pig==
X-Received: by 2002:adf:ef46:0:b0:20a:e153:1f4e with SMTP id
 c6-20020adfef46000000b0020ae1531f4emr13601286wrp.352.1652697385381; 
 Mon, 16 May 2022 03:36:25 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 k20-20020adfb354000000b0020d110bc39esm522882wrd.64.2022.05.16.03.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:25 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 14/91] hw/pci/cxl: Create a CXL bus type
Message-ID: <20220516095448.507876-15-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ben Widawsky <ben.widawsky@intel.com>

The easiest way to differentiate a CXL bus, and a PCIE bus is using a
flag. A CXL bus, in hardware, is backward compatible with PCIE, and
therefore the code tries pretty hard to keep them in sync as much as
possible.

The other way to implement this would be to try to cast the bus to the
correct type. This is less code and useful for debugging via simply
looking at the flags.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-13-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci_bus.h            | 7 +++++++
 hw/pci-bridge/pci_expander_bridge.c | 9 ++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 347440d42c..eb94e7e85c 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -24,6 +24,8 @@ enum PCIBusFlags {
     PCI_BUS_IS_ROOT                                         = 0x0001,
     /* PCIe extended configuration space is accessible on this bus */
     PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
+    /* This is a CXL Type BUS */
+    PCI_BUS_CXL                                             = 0x0004,
 };
 
 struct PCIBus {
@@ -53,6 +55,11 @@ struct PCIBus {
     Notifier machine_done;
 };
 
+static inline bool pci_bus_is_cxl(PCIBus *bus)
+{
+    return !!(bus->flags & PCI_BUS_CXL);
+}
+
 static inline bool pci_bus_is_root(PCIBus *bus)
 {
     return !!(bus->flags & PCI_BUS_IS_ROOT);
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index d4514227a8..a6caa1e7b5 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -24,7 +24,7 @@
 #include "hw/boards.h"
 #include "qom/object.h"
 
-enum BusType { PCI, PCIE };
+enum BusType { PCI, PCIE, CXL };
 
 #define TYPE_PXB_BUS "pxb-bus"
 typedef struct PXBBus PXBBus;
@@ -35,6 +35,10 @@ DECLARE_INSTANCE_CHECKER(PXBBus, PXB_BUS,
 DECLARE_INSTANCE_CHECKER(PXBBus, PXB_PCIE_BUS,
                          TYPE_PXB_PCIE_BUS)
 
+#define TYPE_PXB_CXL_BUS "pxb-cxl-bus"
+DECLARE_INSTANCE_CHECKER(PXBBus, PXB_CXL_BUS,
+                         TYPE_PXB_CXL_BUS)
+
 struct PXBBus {
     /*< private >*/
     PCIBus parent_obj;
@@ -251,6 +255,9 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     ds = qdev_new(TYPE_PXB_HOST);
     if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
+    } else if (type == CXL) {
+        bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
+        bus->flags |= PCI_BUS_CXL;
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
         bds = qdev_new("pci-bridge");
-- 
MST


