Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37BE529278
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:08:44 +0200 (CEST)
Received: from localhost ([::1]:38258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhxM-0006qw-0P
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgA-0004U8-W4
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhg9-0006GV-7y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZ5/sr2bWt1vV88MsUXSF6Uqm1C5mSRHxK5Hlw6cX90=;
 b=esknNTy2fsQnUE3nikJmbU860yY+UpwQxVWQihdTgjYrHXRDy3KY+ESqXxGFrH01zjzoeg
 Lf3gw3GF5XwCOPYaKopymy5N/HuTTOYLhHx6DXR8/Et020VqpTsH2sU+AmgoTiO0FHhDAm
 qpnWqU3LxoiCxBM0HeCluiSDJ5RIAZg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-UrxR6bgzPPiCgHIqYcQQqQ-1; Mon, 16 May 2022 16:50:52 -0400
X-MC-Unique: UrxR6bgzPPiCgHIqYcQQqQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso6357395ejc.18
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LZ5/sr2bWt1vV88MsUXSF6Uqm1C5mSRHxK5Hlw6cX90=;
 b=f3ZFpWAG5hWAKN7dCGGatqt/MXxR2BzKo8KJ+22uoC7H6Rm2PKpAM0ZpKoMGPvRrXD
 eqoK+Npbyu5o2odbCiszlr6Z2PdML8QXTyipdTlLourXYPAr1ZXSvw3vQ7ftUoVkMymX
 tjfn1nUsZ/ODwV7cNE8Vz7we4hl+xd1Kl+QG4D10cOuMKXHxjxVVpuGHGp4op41QEnXB
 SawLc29q5n9RtK5/QhSmxunEP/z9OHRjHoW4v5CtbwgUa+52qCG8MvIcco5fTNeeIprc
 3t6ZXG0mPvHG4m6eMuV2Dh0ACBQDDU4QK5GE8DYfRMi7cKdDtUAXou83PrM2HSrPwDSA
 IcPA==
X-Gm-Message-State: AOAM5328pAANhC2qP5ms2DUiipiJ0WMZmQWuulrWGnBqhVEQRIJpbeZ6
 Vy8AFv3doFv7/3vXh9xBJM0j4/4Jwy/Pg2gwWebdFIOfL+j4kzdfsaPdMJN+Wf2I3jdBeeUSEqJ
 Ru/7p382gAhQ5WVnQ+SC22PGAExA4/OsdUDKZ/YrpPz62qvRt+5AOp6K54fC7
X-Received: by 2002:aa7:d911:0:b0:42a:af69:e167 with SMTP id
 a17-20020aa7d911000000b0042aaf69e167mr8142514edr.54.1652734251035; 
 Mon, 16 May 2022 13:50:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHSnXK2bnt4SJhaBVk137TB47IVQ99vwMWWqmJ7wKHxo5Pc/fcKQa4jiy0XLdJCaPhF47G2w==
X-Received: by 2002:aa7:d911:0:b0:42a:af69:e167 with SMTP id
 a17-20020aa7d911000000b0042aaf69e167mr8142485edr.54.1652734250749; 
 Mon, 16 May 2022 13:50:50 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 j5-20020a170906534500b006f3ef214e48sm156211ejo.174.2022.05.16.13.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:50 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 13/86] hw/pxb: Use a type for realizing expanders
Message-ID: <20220516204913.542894-14-mst@redhat.com>
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

This opens up the possibility for more types of expanders (other than
PCI and PCIe). We'll need this to create a CXL expander.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-12-Jonathan.Cameron@huawei.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index de932286b5..d4514227a8 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -24,6 +24,8 @@
 #include "hw/boards.h"
 #include "qom/object.h"
 
+enum BusType { PCI, PCIE };
+
 #define TYPE_PXB_BUS "pxb-bus"
 typedef struct PXBBus PXBBus;
 DECLARE_INSTANCE_CHECKER(PXBBus, PXB_BUS,
@@ -221,7 +223,8 @@ static gint pxb_compare(gconstpointer a, gconstpointer b)
            0;
 }
 
-static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
+static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
+                                   Error **errp)
 {
     PXBDev *pxb = convert_to_pxb(dev);
     DeviceState *ds, *bds = NULL;
@@ -246,7 +249,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
     }
 
     ds = qdev_new(TYPE_PXB_HOST);
-    if (pcie) {
+    if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
@@ -295,7 +298,7 @@ static void pxb_dev_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pxb_dev_realize_common(dev, false, errp);
+    pxb_dev_realize_common(dev, PCI, errp);
 }
 
 static void pxb_dev_exitfn(PCIDevice *pci_dev)
@@ -348,7 +351,7 @@ static void pxb_pcie_dev_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pxb_dev_realize_common(dev, true, errp);
+    pxb_dev_realize_common(dev, PCIE, errp);
 }
 
 static void pxb_pcie_dev_class_init(ObjectClass *klass, void *data)
-- 
MST


