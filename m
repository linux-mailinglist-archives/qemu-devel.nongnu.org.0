Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE04D0B93
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:59:34 +0100 (CET)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMKD-0002jZ-Sj
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:59:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7T-0008Ct-Dn
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7R-0005iE-R4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BxKih/Yy0qiS5QUDi7wjAqw2GnHJ/nwONeXDCjAw2o=;
 b=FON64Ebj+0RFWlb86Oh4XVpuwcV/E/7YH/sRVtNaMLTqcdYgn1tqvMik4GV6/tssOJleVO
 q7CGnJmRqvX1RDr18/T7MdPBacA7arnl4hTDPmuSZi2DLIWbT6nWUZv4FyYE19Uc5BAVuE
 Ut0p7lp8RMGmXE6eqlaZFCArQoruXQo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-4ogDhwExNKKhl0LqyRvvzA-1; Mon, 07 Mar 2022 17:46:20 -0500
X-MC-Unique: 4ogDhwExNKKhl0LqyRvvzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i83-20020a1c3b56000000b00389a203e5adso1101307wma.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2BxKih/Yy0qiS5QUDi7wjAqw2GnHJ/nwONeXDCjAw2o=;
 b=czayQTvKk2xIkMY556kZu41TgNXMWs4JfSqmxs2Vv7rDue7Erzd+kr9KZqde69z/9Z
 Kk7RcYxda7zFO4s8JTfH5/za6Lake0+1hfdeZLqf5I7sexpOc769AKblu6dGQ8rgWTXv
 b3X7t8EgmUJVEnYJYBtsrsY4L3tR8BLJdKrpQTvLHfFW2FBkOk5a/tBKO6ExAErkvJrw
 coWy52GMdpVzUgXwya/mZVAllSpNxX3aE1BQh6Cb2NIzkwgVFhW6kgCGNcUp+xIQJYVW
 1iFNk/Lm5tKuyKcZEDGYhN1Bh7aqXStgpBXPtKrrqHWlWT+TLrnTtLpfhjSh24S7tiFA
 7nvw==
X-Gm-Message-State: AOAM532lQYux9vs0nLtVt6dbE/LDizIb+pjA5SIcvMQGg4BP0daVWDli
 ci6+myXBac3GJ2gJxOtRhXYU+s3gP8a96YM0k5Xe/n1YiePQh1P4nLG6Acb1Au8Y1Xpb9ry7fwU
 SMGBRE4TVW/a1CYIfeU4EJWAd8z2+NCa49FbFfjDOLl9a523RZ6QAa9j3yhM1
X-Received: by 2002:a5d:47c6:0:b0:1ef:f98f:900b with SMTP id
 o6-20020a5d47c6000000b001eff98f900bmr10086853wrc.314.1646693178721; 
 Mon, 07 Mar 2022 14:46:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDxjDYW4pHxr1nL4UxkUWT36i9y4OvWUnD7pF5bG/+UnXVYyUzh5y8E+4/2fO6LoMvfZveWA==
X-Received: by 2002:a5d:47c6:0:b0:1ef:f98f:900b with SMTP id
 o6-20020a5d47c6000000b001eff98f900bmr10086843wrc.314.1646693178443; 
 Mon, 07 Mar 2022 14:46:18 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm506183wmc.36.2022.03.07.14.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:18 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 33/47] pci: expose TYPE_XIO3130_DOWNSTREAM name
Message-ID: <20220307224357.682101-34-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


