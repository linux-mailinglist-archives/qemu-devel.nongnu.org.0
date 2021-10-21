Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4D435F9E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:46:30 +0200 (CEST)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVaf-0003dx-Hp
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXd-00020P-8j
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXb-0001uu-6X
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634812998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pnGsoIk9DwjVvIK5mv02Ef2J26qjf6hM046vHC95gs=;
 b=LXhpo1GLj31bcmuXIsfymp8YxN2h2cZxYxhRutWF8sG7gbw/c6rDI8bHX7qPSVYlGNk9CT
 GKVhEbqcFI4mOi6LqNBeeo3F/Kd+xdIm5Xos06r1PRn1tuqo7O2GGqa3WpB0uPJXYRg4Nv
 00r2Wm92yk1bee6fDXDJRKYuNJL4ZXY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-_S1nUSiNMFORvqnjg0_TLg-1; Thu, 21 Oct 2021 06:43:17 -0400
X-MC-Unique: _S1nUSiNMFORvqnjg0_TLg-1
Received: by mail-pl1-f199.google.com with SMTP id
 k18-20020a170902c41200b0013f24806d35so81856plk.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pnGsoIk9DwjVvIK5mv02Ef2J26qjf6hM046vHC95gs=;
 b=0ey69VqaV0PN1qB+4Skri4DfUaL+9V6hLN8Nz+J7Mu0la0W7F3X0jYA6F6JQO5PhSp
 onQgjrnae8mhSiw/ldTMuYGLTHU2JIlt1oTsTQPu7NvtSkSB9eITgNR9yGjV42dSthtd
 4BPYDAcJLjRMnd/h92aM8+K+StjvV0+azFnvQiQTPHGkeXrUpy+B2qa00In4ask1Hc6y
 bVNq6tnCn/4nsW/vmxwuWTb9CU9MWb9T3LYYDVhmdf56ykP3eUAEGdaZiuLu7tAlA2K+
 Sho1fA+iqU0SuOvomhgSj81kkpIVJYpRSRNN1GXAZOeIxARcQh2IGf9DsrrXliyc0MPZ
 NhTA==
X-Gm-Message-State: AOAM533XtIZTY74SRQ6RfVc8YXvoCvEJWVAtO3FCIQ+0ltym+e59QkoN
 +ofkI55bbEkOhBsrEmzIOCu1iUKQSbXZ4MVkuX9KezqljNhwEnhbXyYLyv8usEdgLhUoTJR3l4+
 7cq4CwrloIgL7GRCY8Rn2fXWrETc5pbu6sPpxP8ipdIZWp2ZmOasLJZ20NC/nveeV
X-Received: by 2002:a63:7a58:: with SMTP id j24mr2869075pgn.210.1634812995893; 
 Thu, 21 Oct 2021 03:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqFMbNPKr9S/3frrGXqq4JfaWSCeNvfx99r3WGCuAI8aN+GwY0xs7ZFKLT65+wRNDesk3Etw==
X-Received: by 2002:a63:7a58:: with SMTP id j24mr2869040pgn.210.1634812995485; 
 Thu, 21 Oct 2021 03:43:15 -0700 (PDT)
Received: from localhost.localdomain ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id e1sm5246893pgi.43.2021.10.21.03.43.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:43:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] pci: Define pci_bus_dev_fn type
Date: Thu, 21 Oct 2021 18:42:52 +0800
Message-Id: <20211021104259.57754-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211021104259.57754-1-peterx@redhat.com>
References: <20211021104259.57754-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's used in quite a few places of pci.c and also in the rest of the code base.
Define such a hook so that it doesn't need to be defined all over the places.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/pci/pci.c         | 14 ++++----------
 include/hw/pci/pci.h |  7 ++++---
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 186758ee11..1ab2b78321 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1655,9 +1655,7 @@ static const pci_class_desc pci_class_descriptions[] =
 };
 
 static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
-                                                  void (*fn)(PCIBus *b,
-                                                             PCIDevice *d,
-                                                             void *opaque),
+                                                  pci_bus_dev_fn fn,
                                                   void *opaque)
 {
     PCIDevice *d;
@@ -1672,8 +1670,7 @@ static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
 }
 
 void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
-                         void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
-                         void *opaque)
+                                 pci_bus_dev_fn fn, void *opaque)
 {
     bus = pci_find_bus_nr(bus, bus_num);
 
@@ -1683,9 +1680,7 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
 }
 
 static void pci_for_each_device_under_bus(PCIBus *bus,
-                                          void (*fn)(PCIBus *b, PCIDevice *d,
-                                                     void *opaque),
-                                          void *opaque)
+                                          pci_bus_dev_fn fn, void *opaque)
 {
     PCIDevice *d;
     int devfn;
@@ -1699,8 +1694,7 @@ static void pci_for_each_device_under_bus(PCIBus *bus,
 }
 
 void pci_for_each_device(PCIBus *bus, int bus_num,
-                         void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
-                         void *opaque)
+                         pci_bus_dev_fn fn, void *opaque)
 {
     bus = pci_find_bus_nr(bus, bus_num);
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 7fc90132cf..8e2d80860b 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -401,6 +401,8 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
 #define TYPE_PCIE_BUS "PCIE"
 
+typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
+
 bool pci_bus_is_express(PCIBus *bus);
 
 void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
@@ -458,11 +460,10 @@ static inline int pci_dev_bus_num(const PCIDevice *dev)
 
 int pci_bus_numa_node(PCIBus *bus);
 void pci_for_each_device(PCIBus *bus, int bus_num,
-                         void (*fn)(PCIBus *bus, PCIDevice *d, void *opaque),
+                         pci_bus_dev_fn fn,
                          void *opaque);
 void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
-                                 void (*fn)(PCIBus *bus, PCIDevice *d,
-                                            void *opaque),
+                                 pci_bus_dev_fn fn,
                                  void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus,
                                   void *(*begin)(PCIBus *bus, void *parent_state),
-- 
2.32.0


