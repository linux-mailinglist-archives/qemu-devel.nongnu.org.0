Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD334CD691
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:40:38 +0100 (CET)
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ96j-0005Ri-Ml
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:40:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8CE-0004jC-7v
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8CC-0001Fy-NL
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BxKih/Yy0qiS5QUDi7wjAqw2GnHJ/nwONeXDCjAw2o=;
 b=aUFB4mLnUVlJ8Uj0fJ81ZETrvtFx8E8CPhGK3VexqDpYfnrBK3RA2m8jPuEmMt+jaUEVdn
 s5dy8CRo7GdoAPHO6bBztxoKmIQrNvN8cZF05EQWBJJj5uxeNfaKTfgWbt4PV+R/QR31AK
 ZXgmT0mZSxR3gAo8Dc+ES0S8NKDK1CM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-9dXmRQ_4MfGz2DQ9ypKrfA-1; Fri, 04 Mar 2022 08:42:11 -0500
X-MC-Unique: 9dXmRQ_4MfGz2DQ9ypKrfA-1
Received: by mail-wr1-f69.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so3390371wra.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2BxKih/Yy0qiS5QUDi7wjAqw2GnHJ/nwONeXDCjAw2o=;
 b=htJ/YmFt0Zwmh/tkKNSxyVULi3J+Y+POunlhzzsIC6+c67Bqd08QuaHed4tiK6kVAZ
 rUmlg9WT98bobetvApnSf6fKWc36CNXkvtkttZlC4M5KT6UPb+kCmEDR8GWEQPJG2pIZ
 PX3i/j/ZkcDRJO3+H4YfK8nZN9kCd8Nv9GuXon0ejEC4kajqKqBkyHYe0pQNvFphlA4/
 Brcuor+SIOmirm/fhlGlBgyjzjuj1oD9GRG/EjNNWsp89a4KteZXUuKyjxZHp5LZNfhR
 KCBbdc8jBikaZmpdvwSymWuKkj09ssD63s+nIx07n6ia7IQIjha5/mxfxfgzUG1NR9sB
 dlXw==
X-Gm-Message-State: AOAM530cHpQ4qPJYyGupTpClaKrvpuFkqI5pEi7GnuttwYBScq8vLJFx
 S+AhWMfrskwiuloCMkzykqvPdhdAa5/U9xtvPSjvgvauVJ+NPHkVpoVcAFqUi8JkFxpze7+EjuX
 HXaX3/NmDJxHphmX6LJkdLDSns11EvP+0wqUbgE7UduW3vm7vrA+zyXFkgA03
X-Received: by 2002:a7b:ca52:0:b0:381:278d:c5a8 with SMTP id
 m18-20020a7bca52000000b00381278dc5a8mr7878028wml.136.1646401329809; 
 Fri, 04 Mar 2022 05:42:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuwcUIV5yo/miwd9AxAB4ZWpxzUobHOfvj76JGWHjnRgVHa9Y8vHlln2GXB/5uDa/r6W8AFA==
X-Received: by 2002:a7b:ca52:0:b0:381:278d:c5a8 with SMTP id
 m18-20020a7bca52000000b00381278dc5a8mr7878008wml.136.1646401329549; 
 Fri, 04 Mar 2022 05:42:09 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b001f1d72a6f97sm450450wru.50.2022.03.04.05.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:42:05 -0800 (PST)
Date: Fri, 4 Mar 2022 08:42:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/45] pci: expose TYPE_XIO3130_DOWNSTREAM name
Message-ID: <20220304133556.233983-38-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Type name will be used in followup patch for cast check
in pcihp code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220301151200.3507298-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
index 080a6613fe..05e2b06c0c 100644
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
MST


