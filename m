Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC84CD67F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:36:43 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ92r-0007yj-Ci
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:36:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Bu-0004Js-Sw
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Bs-0001Dj-HK
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3FB3bferdbl03k+KFKWByjScfRpd+RvVcbGHdUp8Wc=;
 b=g7zyz4fSZ6RNBH/rYj8qKmRKOGW/sBvSnMo1k4n8KuUmueAgWkqmiRtG27ohXlrcRo4S4U
 YK2MymW0qJr/lBtdohkYXfIDPhFBLYU8vBl9fMidFGzk0IxoJvTkFapa5vmuXBWaX3sgEY
 ZTL0HCbz10vWDv+wx2nOVN4k0014bpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-d5IZAKMANnWn3SBhNCEhRQ-1; Fri, 04 Mar 2022 08:41:50 -0500
X-MC-Unique: d5IZAKMANnWn3SBhNCEhRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 26-20020a05600c22da00b00388307f3503so1071610wmg.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k3FB3bferdbl03k+KFKWByjScfRpd+RvVcbGHdUp8Wc=;
 b=tvnJqg3FAoVZuX8TAbFm9XeB0bGZTzswZ8V8fkbIomxP2iP7H9hcyClLTpytBll0dN
 ONazhljH/OXjKnRmsjEigVtkRgDW2B0RzwBdoQ5NVt/vA2v7JMHj1qS4aYntjDXv4X0G
 HNH8hpkOdjyrvWeYIQJXXGtr2NOK2L/g1sr220K0RCxmqb2q35cQOnk80x0EasuZYHP4
 tN2sPUpkfstjBJSWCC4rbX0jLM/w4arGAh7MI3yZfcgeT3DI8HfuBusrzDuLz2JomzZr
 pOXlmuPTTzEo+xL/LRZQb5NzGg0DhmgDBt9yzg1T1vIv62P7JtVTxkJtXWlN2kFyr4a5
 7+4Q==
X-Gm-Message-State: AOAM531uzrVUfbEcd7Ghk7Y1AxOx652Lx0pMwxVE6OBmeB16BYYYzYZ6
 YVpTU/+de5/Sdv51J7XmIxiUHDzRVLIF/1Z4YtmCe5QIGrgA6jimO2D5LAMGPo7WfLr/FFGkJLW
 vu2TzTN1GcW3aFt1XBBdw/c2/JzUJDaqflUfooI3swAuUm/jxhtHYC4e6hPDK
X-Received: by 2002:a5d:534a:0:b0:1f0:5c4b:cec8 with SMTP id
 t10-20020a5d534a000000b001f05c4bcec8mr5774071wrv.115.1646401309177; 
 Fri, 04 Mar 2022 05:41:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZtuAcK/bje/+bmjJrgk4ULmjTMpqHJtVB2iKvzOy88HfZ8LGE1SU3SuyRpskJxgVXdguLDQ==
X-Received: by 2002:a5d:534a:0:b0:1f0:5c4b:cec8 with SMTP id
 t10-20020a5d534a000000b001f05c4bcec8mr5774046wrv.115.1646401308847; 
 Fri, 04 Mar 2022 05:41:48 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 l12-20020a5d6d8c000000b001efd2c071dbsm4909827wrs.20.2022.03.04.05.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:41:47 -0800 (PST)
Date: Fri, 4 Mar 2022 08:41:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/45] hw/misc/pvpanic: Use standard headers instead
Message-ID: <20220304133556.233983-36-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

QEMU side has already imported pvpanic.h from linux, remove bit
definitions from include/hw/misc/pvpanic.h, and use
include/standard-headers/linux/pvpanic.h instead.
Also minor changes for PVPANIC_CRASHLOADED -> PVPANIC_CRASH_LOADED.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220221122717.1371010-2-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/pvpanic.h | 8 --------
 hw/misc/pvpanic-isa.c     | 4 +++-
 hw/misc/pvpanic-pci.c     | 4 +++-
 hw/misc/pvpanic.c         | 5 +++--
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index ca3c5bb533..7f16cc9b16 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -22,14 +22,6 @@
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
-/* The bit of supported pv event, TODO: include uapi header and remove this */
-#define PVPANIC_F_PANICKED      0
-#define PVPANIC_F_CRASHLOADED   1
-
-/* The pv event value */
-#define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
-#define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
-
 /*
  * PVPanicState for any device type
  */
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
index a39fcdd1fc..b84d4d458d 100644
--- a/hw/misc/pvpanic-isa.c
+++ b/hw/misc/pvpanic-isa.c
@@ -21,6 +21,7 @@
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
 #include "hw/isa/isa.h"
+#include "standard-headers/linux/pvpanic.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PVPanicISAState, PVPANIC_ISA_DEVICE)
 
@@ -64,7 +65,8 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
 
 static Property pvpanic_isa_properties[] = {
     DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
-    DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events,
+                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
index 62e1be68c1..99cf7e2041 100644
--- a/hw/misc/pvpanic-pci.c
+++ b/hw/misc/pvpanic-pci.c
@@ -21,6 +21,7 @@
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
 #include "hw/pci/pci.h"
+#include "standard-headers/linux/pvpanic.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PVPanicPCIState, PVPANIC_PCI_DEVICE)
 
@@ -53,7 +54,8 @@ static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
 }
 
 static Property pvpanic_pci_properties[] = {
-    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events,
+                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index e2cb4a5d28..1540e9091a 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -21,12 +21,13 @@
 #include "hw/qdev-properties.h"
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
+#include "standard-headers/linux/pvpanic.h"
 
 static void handle_event(int event)
 {
     static bool logged;
 
-    if (event & ~(PVPANIC_PANICKED | PVPANIC_CRASHLOADED) && !logged) {
+    if (event & ~(PVPANIC_PANICKED | PVPANIC_CRASH_LOADED) && !logged) {
         qemu_log_mask(LOG_GUEST_ERROR, "pvpanic: unknown event %#x.\n", event);
         logged = true;
     }
@@ -36,7 +37,7 @@ static void handle_event(int event)
         return;
     }
 
-    if (event & PVPANIC_CRASHLOADED) {
+    if (event & PVPANIC_CRASH_LOADED) {
         qemu_system_guest_crashloaded(NULL);
         return;
     }
-- 
MST


