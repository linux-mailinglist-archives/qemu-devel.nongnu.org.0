Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711A38828C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 00:02:33 +0200 (CEST)
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7nM-0005xM-68
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 18:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7h5-000741-AK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7h2-000374-9A
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfCgiJU0/iWOxOTGg77x6mXGX5z5RsV773l26eByVJA=;
 b=Kli1h2L7zEJft5MiX18k3xySSnegfZaHUWjlGxACzQvOcm00Tqzg1X7MAlj3GlD3u6iivr
 HBQcsRDez+Xj1N3mq1PdHLQRPlqnN2W3zEd2VT8QvDIqnS9zM9ATlEUp9X4I5WPGnOVS2R
 87cvsxYQb/pu6hPHBk0EorPnvH2+oZE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-LyEcqqbxOFmlkrbkzYvC3A-1; Tue, 18 May 2021 17:55:57 -0400
X-MC-Unique: LyEcqqbxOFmlkrbkzYvC3A-1
Received: by mail-ej1-f69.google.com with SMTP id
 h18-20020a1709063992b02903d59b32b039so2766404eje.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dfCgiJU0/iWOxOTGg77x6mXGX5z5RsV773l26eByVJA=;
 b=qOWuh4HkS46uQaFrFrr0RxewH41s17BBfAfgJ9B5b5Lt9eSMY2tHfiMTSHqhLeFMIZ
 vGXjXNaNvemWqZVw3l4I5l4TpcW4E7M970PB1VDT2FcqgRn1BDNf5DxyCAIyji8k80BB
 lJujziel5jDtkZ6aa9uFMUWN8DKv2NdurYBcWwbGA0nAYUbQILquVA0ZQqvjA6e5IIgm
 wLPUfJW53mZ3WEXF9ZTdxDGarJsyFw/R8KhFb5WUhKGOBKO/IBRkqz3GaiRcxizCRCEy
 DCSp5dvwPu1HtFu3j198upDmHcnj8QukkjWV4msMH9gTSEPfowq/aGXGJqfStgmkk3xM
 kd6Q==
X-Gm-Message-State: AOAM532bCTLMoRLk7wBIYSv7/H7A46Wg89+5s/YGUTRQlNGGC997Vm1P
 PDdcMrgu/bzUmsg5O3QmsbK/JPRTwmEgj+Sx4joJyuDXMbnu37/Ay7awjWE3ZYT11ZCkSMkUxwO
 Q7EzfhiTE/pL6cEw=
X-Received: by 2002:a17:907:920e:: with SMTP id
 ka14mr8282138ejb.193.1621374956766; 
 Tue, 18 May 2021 14:55:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+MTukvoJwK8+OcNQSzpnyMtpae8UHmkN1XpssPufUEfT7X9ivR+M6SXkYCeI/zYf5hMpEDg==
X-Received: by 2002:a17:907:920e:: with SMTP id
 ka14mr8282122ejb.193.1621374956593; 
 Tue, 18 May 2021 14:55:56 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f26sm6989792ejl.66.2021.05.18.14.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:55:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 02/11] hw/ide: Add PCIIDEState::isa_bus link
Date: Tue, 18 May 2021 23:55:36 +0200
Message-Id: <20210518215545.1793947-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518215545.1793947-1-philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IDE bus depends on ISA bus for IRQ/DMA.

Add an ISABus reference in PCIIDEState, and add link properties
to it in the PIIX and VIA objects (which inherit PCI_IDE).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/ide/pci.h |  1 +
 hw/ide/piix.c        | 11 ++++++++++-
 hw/ide/via.c         | 10 +++++++++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c422..e790722ed14 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -47,6 +47,7 @@ struct PCIIDEState {
     PCIDevice parent_obj;
     /*< public >*/
 
+    ISABus *isa_bus;
     IDEBus bus[2];
     BMDMAState bmdma[2];
     uint32_t secondary; /* used only for cmd646 */
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b9860e35a5c..48da68da37f 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -30,8 +30,9 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
-
+#include "qapi/error.h"
 #include "hw/ide/pci.h"
+#include "hw/isa/isa.h"
 #include "trace.h"
 
 static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
@@ -207,6 +208,12 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property piix_ide_properties[] = {
+    DEFINE_PROP_LINK("isa-bus", PCIIDEState, isa_bus,
+                     TYPE_ISA_BUS, ISABus *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -221,6 +228,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix_ide_properties);
 }
 
 static const TypeInfo piix3_ide_info = {
@@ -249,6 +257,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix_ide_properties);
 }
 
 static const TypeInfo piix4_ide_info = {
diff --git a/hw/ide/via.c b/hw/ide/via.c
index be09912b334..65fdca6dcf4 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -28,8 +28,9 @@
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 #include "sysemu/dma.h"
-
+#include "hw/isa/isa.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
 
@@ -210,6 +211,12 @@ static void via_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property via_ide_properties[] = {
+    DEFINE_PROP_LINK("isa-bus", PCIIDEState, isa_bus,
+                     TYPE_ISA_BUS, ISABus *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void via_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -224,6 +231,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
     k->revision = 0x06;
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    device_class_set_props(dc, via_ide_properties);
 }
 
 static const TypeInfo via_ide_info = {
-- 
2.26.3


