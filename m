Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C24C8EB9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:15:55 +0100 (CET)
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4EE-0003ab-GW
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP4Ay-0000Yc-W1
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:12:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP4At-0004Fq-AF
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646147544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QI9X/zpXFUd7V6NniMez8SnNpm4htCxFv7oefly+mkg=;
 b=W7b+Wc+OKj3LFdB180n7ZoPs5+5YzaDS0LGmiLKKPYRFW9kEOs4wdoMFip8cPtmdy8AQ6G
 2d+yf+wEFfL7CL8TQwLEOABw+wDfC2okkJFlQtFVIRd7s3hOTpS57cvC7dj17FEzYlaW/o
 /CMCgrXCFyljkGlbGw/LWa77NOXv7AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-Tpda8oOvONSxGF7713MFKw-1; Tue, 01 Mar 2022 10:12:23 -0500
X-MC-Unique: Tpda8oOvONSxGF7713MFKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31DE9800422
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 15:12:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA2A7D3CB;
 Tue,  1 Mar 2022 15:12:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] pci: expose TYPE_XIO3130_DOWNSTREAM name
Date: Tue,  1 Mar 2022 10:11:58 -0500
Message-Id: <20220301151200.3507298-2-imammedo@redhat.com>
In-Reply-To: <20220301151200.3507298-1-imammedo@redhat.com>
References: <20220301151200.3507298-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Type name will be used in followup patch for cast check
in pcihp code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
 hw/pci-bridge/xio3130_downstream.c         |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/pci-bridge/xio3130_downstream.h

diff --git a/include/hw/pci-bridge/xio3130_downstream.h b/include/hw/pci-bridge/xio3130_downstream.h
new file mode 100644
index 0000000000..1d10139aea
--- /dev/null
+++ b/include/hw/pci-bridge/xio3130_downstream.h
@@ -0,0 +1,15 @@
+/*
+ * TI X3130 pci express downstream port switch
+ *
+ * Copyright (C) 2022 Igor Mammedov <imammedo@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_PCI_BRIDGE_XIO3130_DOWNSTREAM_H
+#define HW_PCI_BRIDGE_XIO3130_DOWNSTREAM_H
+
+#define TYPE_XIO3130_DOWNSTREAM "xio3130-downstream"
+
+#endif
+
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 04aae72cd6..b17cafd359 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -28,6 +28,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "hw/pci-bridge/xio3130_downstream.h"
 
 #define PCI_DEVICE_ID_TI_XIO3130D       0x8233  /* downstream port */
 #define XIO3130_REVISION                0x1
@@ -173,7 +174,7 @@ static void xio3130_downstream_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo xio3130_downstream_info = {
-    .name          = "xio3130-downstream",
+    .name          = TYPE_XIO3130_DOWNSTREAM,
     .parent        = TYPE_PCIE_SLOT,
     .class_init    = xio3130_downstream_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.31.1


