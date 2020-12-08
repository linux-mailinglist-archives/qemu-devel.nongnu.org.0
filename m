Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9DD2D33FA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:29:45 +0100 (CET)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjcG-0003nx-9L
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmio7-0008DF-IL
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmio5-000622-1J
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NfyJIWm9NTNXJoxhCiducqmGoodXPdSLT7zCKbR/FRw=;
 b=Kuk8tNPs9nwuKs37Hz6qnkRdwPRD+z8KxKW8QlSmdRICqCV9iWHGPwvaG73nTaBTyg99YZ
 fCvK8/ahM2q61alh2qvn+aIog1K3v/HBakSOyYbPP3SMhgft9dglk58G+7ebb6F6x0CIWG
 /OLI89jwvdblxESiacvIUJbylgvZdOg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Q9ukITgpMRi_jGhjkBQusA-1; Tue, 08 Dec 2020 14:37:50 -0500
X-MC-Unique: Q9ukITgpMRi_jGhjkBQusA-1
Received: by mail-wm1-f72.google.com with SMTP id k128so1272824wme.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NfyJIWm9NTNXJoxhCiducqmGoodXPdSLT7zCKbR/FRw=;
 b=pVa082xQLjiykkYLnLxYX6N92LotZfXvmww6HHUWVIltk7qv5wqh0U4jmxuOKZCIxd
 /MzFM7dkxy8ASxYBb6zTmpcTxkqPALhR3GRLP/gRLhjnh9ecgEL2dPhBrdjkgLrymJmx
 jQhqNk94glL8gyV7tZg+OMl9uri7cGh8aBZOuIQrRTC5t75NC4ia4+vAdJhrtKECZLyU
 43OJtpME4dprntg2vD0pHcC9VhD7/FIZV9QN8UMit2JON2P70fO7kwQPDOwtzBRoAQ4K
 Z3vmqayh7re9+kNikhKHzedka92HL6zn350cELsfqI7jGGsSrOW+6YaBmtTzrHiMQniN
 Zb+g==
X-Gm-Message-State: AOAM531EmS5POk/pqeVJKt5d+KSJuj5DLQhAYAUjoDBmmK88B7B4JSOE
 zg+JKVcP2ydYOqGVxnjgVfGVc/MtibxSZkEYyadnj654z0OAFvleY8Kk+TJYhq/p44bZroBSG/K
 3T3BB1J5JKQr19/iSWh4jJPuPvcUWqv4Q2q0wd0W2bJhDyyyT3LziHCpHUJrh
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr5321120wmm.122.1607456268993; 
 Tue, 08 Dec 2020 11:37:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ++BzOhkJSgBGQqBtEHOZDbONyRAHGWQfKR7bpce5HPcFzbg1+amxhZx/qNk22ghLxRJTDA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr5321109wmm.122.1607456268758; 
 Tue, 08 Dec 2020 11:37:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id m81sm5250533wmf.29.2020.12.08.11.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:48 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 66/66] hw/virtio-pci Added AER capability.
Message-ID: <20201208193307.646726-67-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew <andrew@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Added AER capability for virtio-pci devices.
Also added property for devices, by default AER is disabled.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Message-Id: <20201203110713.204938-3-andrew@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.h |  4 ++++
 hw/virtio/virtio-pci.c | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 06e2af12de..d7d5d403a9 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -41,6 +41,7 @@ enum {
     VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,
     VIRTIO_PCI_FLAG_INIT_PM_BIT,
     VIRTIO_PCI_FLAG_INIT_FLR_BIT,
+    VIRTIO_PCI_FLAG_AER_BIT,
 };
 
 /* Need to activate work-arounds for buggy guests at vmstate load. */
@@ -80,6 +81,9 @@ enum {
 /* Init Function Level Reset capability */
 #define VIRTIO_PCI_FLAG_INIT_FLR (1 << VIRTIO_PCI_FLAG_INIT_FLR_BIT)
 
+/* Advanced Error Reporting capability */
+#define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
+
 typedef struct {
     MSIMessage msg;
     int virq;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ceaa233129..f863f69ede 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1817,6 +1817,12 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
          */
         pci_set_word(pci_dev->config + pos + PCI_PM_PMC, 0x3);
 
+        if (proxy->flags & VIRTIO_PCI_FLAG_AER) {
+            pcie_aer_init(pci_dev, PCI_ERR_VER, last_pcie_cap_offset,
+                          PCI_ERR_SIZEOF, NULL);
+            last_pcie_cap_offset += PCI_ERR_SIZEOF;
+        }
+
         if (proxy->flags & VIRTIO_PCI_FLAG_INIT_DEVERR) {
             /* Init error enabling flags */
             pcie_cap_deverr_init(pci_dev);
@@ -1858,7 +1864,15 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
 static void virtio_pci_exit(PCIDevice *pci_dev)
 {
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(pci_dev);
+    bool pcie_port = pci_bus_is_express(pci_get_bus(pci_dev)) &&
+                     !pci_bus_is_root(pci_get_bus(pci_dev));
+
     msix_uninit_exclusive_bar(pci_dev);
+    if (proxy->flags & VIRTIO_PCI_FLAG_AER && pcie_port &&
+        pci_is_express(pci_dev)) {
+        pcie_aer_exit(pci_dev);
+    }
 }
 
 static void virtio_pci_reset(DeviceState *qdev)
@@ -1911,6 +1925,8 @@ static Property virtio_pci_properties[] = {
                     VIRTIO_PCI_FLAG_INIT_PM_BIT, true),
     DEFINE_PROP_BIT("x-pcie-flr-init", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_INIT_FLR_BIT, true),
+    DEFINE_PROP_BIT("aer", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_AER_BIT, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


