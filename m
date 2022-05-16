Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B7C5282B3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:57:08 +0200 (CEST)
Received: from localhost ([::1]:39256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYPT-00023j-BF
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5T-00066K-9S
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5R-0005CO-MH
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZ5/sr2bWt1vV88MsUXSF6Uqm1C5mSRHxK5Hlw6cX90=;
 b=WGutu8QsAiJlx5bn21cbuO6TTSpX9eLVPttdDj3BRqIqvS6qY3fo25+1Dn+ECep3rr+eFm
 mE0e03dFSFbzhk9GrLUV6i3u1ZLBz3QtUKkBEFK5N7djWqMr1g3siG22J6A9Rk9/H/Hgjq
 TaQLLNJc1oTxIuhu/OcHjTM3EDdIagY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-x_q6TOHhNqKwm2qSj92NCg-1; Mon, 16 May 2022 06:36:23 -0400
X-MC-Unique: x_q6TOHhNqKwm2qSj92NCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so5435693wmi.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LZ5/sr2bWt1vV88MsUXSF6Uqm1C5mSRHxK5Hlw6cX90=;
 b=G67MoKL/42khB5qsfq7qBuntYsiGVRjKwTX+1DyrAX/uhfs/GAF9vhOKTndY7oYdba
 8ry5XMrdt4P/V9M7NKGc0e4Dpuc/Pi31EBIXyb1e3GithIiMALiOoTd4u6Rcn2Sjy9aE
 x0nxZaNk1HEM1pBa8Q3chjTWljOYcfmv4gRHSUNSYqPNpzwMiVY1KQMCersRIyzTLqxN
 sEufj7CH1AuXZnifuIVVoN19rNuWIvc7l75S7pvJy2K06yUg3EHRM/PZXbFdB9dT/z8O
 qEsHPxDc8YxUVRklV2eVqP7ohlu7wCc+6gegBbKdLDp0cckKnAqFd/IWz9oB0D70a6kD
 hW8w==
X-Gm-Message-State: AOAM530bDrAyqNRuDIRaRzY503QKyx4gU8+P5O++PrWrw8dupBI52fhQ
 yLB+Y54hTEUE95f9YqJuARLswWnhOtotOtDEk387mQbpGR2joBdwrl73CrNPonb3tMPCjncjdzf
 aCBjcIrZ6Q/Nlnd02Sax0RdeL68dKu/zxr2wn4W0BdfNHpsviPMcDSQKcwy2V
X-Received: by 2002:a05:6000:168e:b0:20c:547d:11a1 with SMTP id
 y14-20020a056000168e00b0020c547d11a1mr13811348wrd.37.1652697382341; 
 Mon, 16 May 2022 03:36:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1pucyH8SfoAPVXcme13qVb3VGrpCSjMGU0ORd5lGurJ1088Pn9stSuZxscedwiYQRt/fK1g==
X-Received: by 2002:a05:6000:168e:b0:20c:547d:11a1 with SMTP id
 y14-20020a056000168e00b0020c547d11a1mr13811331wrd.37.1652697382100; 
 Mon, 16 May 2022 03:36:22 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 z12-20020a7bc7cc000000b003942a244f39sm14961092wmk.18.2022.05.16.03.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:21 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 13/91] hw/pxb: Use a type for realizing expanders
Message-ID: <20220516095448.507876-14-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


