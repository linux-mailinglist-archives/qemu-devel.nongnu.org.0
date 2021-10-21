Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D46435FA6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:47:51 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVby-0006XA-Px
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXj-00029N-VD
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXi-0002TN-0m
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pho+TtIdP4qBZG3cdR7uV3of32w57JyQCr7ZXpyaYms=;
 b=gSsQcSDCJvbhF6ikWA0bauSMXqmELOoiTYm3caP5S9cNqKBWJ1T8Fa+fg3/+Qm72e1nUHu
 ivoSVkK2GLiFA6OSGgxNVSvh5D6l6kUq10eP32sCnW7PKD1pmEGG18Qk9RzBqIFSAVqqkh
 1W1z/9iKQssyHCzYkoPsXQG08xoxuwE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-GDC7uu-UOF6YKAmwkzhHzQ-1; Thu, 21 Oct 2021 06:43:24 -0400
X-MC-Unique: GDC7uu-UOF6YKAmwkzhHzQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 r7-20020a17090a454700b001a1ca0191b8so161761pjm.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pho+TtIdP4qBZG3cdR7uV3of32w57JyQCr7ZXpyaYms=;
 b=4dwts9i1puQffeJfZmi32fkdSK/WU4E5QpIxlgJCNNEhWIIGifVz4QRkZ1QWyGwCT1
 SmdgQUCEdAAJKQIZFuKR+7t4A7r/eazp7icGB5ng12eMlT6UQgY/3Iq+ydcoQrUC1yZj
 GH8/AG79LEgVdzUrYzE458US/zZZlytq8uXM8vvTaMlgzEj3/TPTWbunuQ0LW1c2MIiA
 B2SmBJYYoQJDzro8HA9tq7lM2Gyh0gatQyJJSxLlO9pZf3qoEHmz+dzGowesZqJmbVE+
 IR+fsHny4S6cMOoeoprR9ctnaWTdwv7bi5g7TPwOogxTA21rWI+g4hwNXVSVTSGlg1gl
 JCxg==
X-Gm-Message-State: AOAM532EwcY6KhxQNYpZ+j6O/NLpemRB0B6ScrzO+DMLB79ocMNfJodI
 nY92WRTQgX3Ki6JYtnMo8/1vGhn5RR788RWo8sIejyf0qE42FWTqT/g/gTwjZ7EfuKM8AdIgVj9
 yC3IRI8yvzqObXQfYYrTBy31hOyT1CUy/YKCkqqAjPT3HoWokADfOfAwhnF5oppX9
X-Received: by 2002:a17:90b:3ecd:: with SMTP id
 rm13mr5624498pjb.189.1634813002468; 
 Thu, 21 Oct 2021 03:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx8fU69lZ5q3MmA1VBiGyPN6r1fFX70ZYjzJOmTw3DOuArHjYiS5kCU9UIvJLB4XtiQj7p6A==
X-Received: by 2002:a17:90b:3ecd:: with SMTP id
 rm13mr5624385pjb.189.1634813001333; 
 Thu, 21 Oct 2021 03:43:21 -0700 (PDT)
Received: from localhost.localdomain ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id e1sm5246893pgi.43.2021.10.21.03.43.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:43:20 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] pci: Export pci_for_each_device_under_bus*()
Date: Thu, 21 Oct 2021 18:42:53 +0800
Message-Id: <20211021104259.57754-3-peterx@redhat.com>
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

They're actually more commonly used than the helper without _under_bus, because
most callers do have the pci bus on hand.  After exporting we can switch a lot
of the call sites to use these two helpers.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/pci/pci.c         | 10 +++++-----
 include/hw/pci/pci.h |  5 +++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1ab2b78321..6b834cace5 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1654,9 +1654,9 @@ static const pci_class_desc pci_class_descriptions[] =
     { 0, NULL}
 };
 
-static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
-                                                  pci_bus_dev_fn fn,
-                                                  void *opaque)
+void pci_for_each_device_under_bus_reverse(PCIBus *bus,
+                                           pci_bus_dev_fn fn,
+                                           void *opaque)
 {
     PCIDevice *d;
     int devfn;
@@ -1679,8 +1679,8 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
     }
 }
 
-static void pci_for_each_device_under_bus(PCIBus *bus,
-                                          pci_bus_dev_fn fn, void *opaque)
+void pci_for_each_device_under_bus(PCIBus *bus,
+                                   pci_bus_dev_fn fn, void *opaque)
 {
     PCIDevice *d;
     int devfn;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 8e2d80860b..437eabe609 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -465,6 +465,11 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
 void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
                                  pci_bus_dev_fn fn,
                                  void *opaque);
+void pci_for_each_device_under_bus(PCIBus *bus,
+                                   pci_bus_dev_fn fn, void *opaque);
+void pci_for_each_device_under_bus_reverse(PCIBus *bus,
+                                           pci_bus_dev_fn fn,
+                                           void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus,
                                   void *(*begin)(PCIBus *bus, void *parent_state),
                                   void (*end)(PCIBus *bus, void *state),
-- 
2.32.0


