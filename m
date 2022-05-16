Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C700E529201
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:59:44 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhod-0002LX-Sk
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgB-0004UA-LS
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhg9-0006Ga-RH
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2T1w60jofo7fZUHG6FeDh5etrrEXvop8IS0FXVDyV0=;
 b=HKKGEng5YFU0nsF3X89OtoT0PJnGYrNTfLaxnxCnuQ1hgu35kvYHt4nfu3n4/OKzyxLo67
 PTMlUzR1RFFY2dsIjcg4/XpBreQPesDMHcv6G3X9PAvINQQMWg5lpO1iP3KDhAX621Khtr
 G2vNX2kvhozo9wgwAr1MUc4F6FriuLk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-wsN7XXriMmi6kmVEH02fAQ-1; Mon, 16 May 2022 16:50:56 -0400
X-MC-Unique: wsN7XXriMmi6kmVEH02fAQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 ox8-20020a170907100800b006f9dc6e4a22so6346562ejb.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l2T1w60jofo7fZUHG6FeDh5etrrEXvop8IS0FXVDyV0=;
 b=Ln58wwtWzCz+Wcib8ZyRlkJxXDVGETPr9ImwCvmGphVPAcpQKrMT0lVBaK2fSGrHAc
 0Ni1v/2cumtQwgBmpa96gzMvWv598Gy1xQ5pXPjaD9AOoAGxB9+42AHAqG7asT7sSBrT
 kObyM2/24Q3ZaQoVLcITnPTSn1i7i48K05afw9u15lEAhThko+5SFIm3Zp4W/sszyEfI
 WJA5pIVnBkr97toIl9/MkegHvYJAjewHBfQ6IbOz3J7HPz80s04QU5oejleCZisLyyZW
 0CjBWoQcNAzPVYYzNwelJbpZUO96yMv+FZ1aDTZemZrZp7CmxDhGWQMi+XPQ8qZx/Sd4
 x4BQ==
X-Gm-Message-State: AOAM532TMEIbJt5KxJa3AVactLZATapyXZvxb+ZW3K8DlekaRZJIM1LR
 yDYPS9oZyZ+SLzCbdavo7dpCAkWbMGusr7FpXaqyT5BVOTO2AjVgMME45dpcWVnGswnQGHE8TYz
 eOnRNDt2dbvaQ5I0ZjLMBOpBD3CFXNoIvyUY0GysrhJKA3De+K1KRroAiun42
X-Received: by 2002:a17:906:2319:b0:6f3:ad55:8fee with SMTP id
 l25-20020a170906231900b006f3ad558feemr16704178eja.26.1652734254540; 
 Mon, 16 May 2022 13:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnkKFFvKSfABbqW1+0Rjt1ee7SJmQ7mJW5CiU+VjDVwCGOmM9pTrlM1hWBO5wAZyAUSOkmNQ==
X-Received: by 2002:a17:906:2319:b0:6f3:ad55:8fee with SMTP id
 l25-20020a170906231900b006f3ad558feemr16704156eja.26.1652734254245; 
 Mon, 16 May 2022 13:50:54 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 fc10-20020a1709073a4a00b006f3ef214db2sm175031ejc.24.2022.05.16.13.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:53 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 14/86] hw/pci/cxl: Create a CXL bus type
Message-ID: <20220516204913.542894-15-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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


