Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5583C799F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:26:05 +0200 (CEST)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qqq-0006bC-R4
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcH-0007no-ED
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcG-00085i-0q
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZFXStzDbpHZ3x7owVBtjJeqaH/pfDgxn4UIZ7oQ1Es0=;
 b=VsvwKzJ3bxorIypQsx6T4fmkz7HwMwwSqjxIhnrSfJS6uuol7wL48tshwZQON57w3JrSjn
 Im7evG6+y6BrTTf/ayghUQ3rbRcTlh+cewHTpI0CcaKIRFTAQr4lJ6tfQ7ZYBeoDmQdZTT
 7iZFDIXRdKFk3sB6DE4hdTv3T4ze57Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-edn1VnOwNse186E3IdJkPQ-1; Tue, 13 Jul 2021 18:10:57 -0400
X-MC-Unique: edn1VnOwNse186E3IdJkPQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so317136wrs.15
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZFXStzDbpHZ3x7owVBtjJeqaH/pfDgxn4UIZ7oQ1Es0=;
 b=g+LEXkOTWzUAbPvhdD9GXvwPKEe2vcltAUUa1pZNYGbdbkhYNCQh1ef9VOManl7M6q
 fYW9jpvlvCAHvk1uym1KQlAtw6Py/rdn22xdLgCED46+MYN3rLSHbi9sL8vzgM4pbhEA
 6fFagByN12U2fKLaAbRdybOW0n0bqJP+HvZKpNUdsRTSlBxiCWEWgMhvrlPxXRKObCZm
 Ktwm6Yo1uzbRCaJ7Wh4LtVncpsdVjiDdcgNiEA40bhYhMqLrMpuzCsoDkoYi2LrTysSZ
 yksPwl1brik6kzQUfpc26FoVnOMv88F47C/zKe5kGrDJJGAZCmp+jh4fM7QIadyTaEog
 DEjA==
X-Gm-Message-State: AOAM533hyEX/FRNTs3XYk8jfe9u+a1BdR1PlASfFxPXkrJNkjOBIQkZs
 eUvWEyzef7te7+wv0Xw/IxYS00eXdKRqk4Jz+e4OSsEspuUNTog86F98jIUE69thHhCMoN3JuyH
 OxSqm8/0lyotTl/Wljff7xaWfnrLscjcbiTYyJN4u575LLNKhE+oJGDDlGHKY
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr7592936wmk.51.1626214255858; 
 Tue, 13 Jul 2021 15:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0ZzWe9I73aGGO7j1OwNTiA6zd2fs/BshULqswmanHj9MZR8RlEoEEEdK4yMo1FKKHirTXUg==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr7592917wmk.51.1626214255693; 
 Tue, 13 Jul 2021 15:10:55 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id r17sm3476726wmq.13.2021.07.13.15.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:55 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] hw/pxb: Add a bypass iommu property
Message-ID: <20210713220946.212562-16-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xingang Wang <wangxingang5@huawei.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a bypass_iommu property for pci_expander_bridge, the property
is used to indicate whether pxb root bus will bypass iommu. By
default the bypass_iommu is disabled, and it can be enabled with:
qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <1625748919-52456-3-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index aedded1064..7112dc3062 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -57,6 +57,7 @@ struct PXBDev {
 
     uint8_t bus_nr;
     uint16_t numa_node;
+    bool bypass_iommu;
 };
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -255,6 +256,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
     bus->map_irq = pxb_map_irq_fn;
 
     PCI_HOST_BRIDGE(ds)->bus = bus;
+    PCI_HOST_BRIDGE(ds)->bypass_iommu = pxb->bypass_iommu;
 
     pxb_register_bus(dev, bus, &local_err);
     if (local_err) {
@@ -301,6 +303,7 @@ static Property pxb_dev_properties[] = {
     /* Note: 0 is not a legal PXB bus number. */
     DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
     DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
+    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


