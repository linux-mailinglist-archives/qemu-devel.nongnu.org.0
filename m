Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A656A823B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:31:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5T-0007f0-Aj; Thu, 02 Mar 2023 07:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5P-0007dB-Nk
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5O-0002v3-1p
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWLYjuhdjDRLurVn1ktvDMOhSO7eZ7zfYFHt+ck3q+o=;
 b=TOcykAnW0ZERbRFXiMl/7MgkNgy4wwW51Uol3y0ma1RPSSCEWgElJELPA3pVudurbC1mEo
 iYyed0jqNqwJ3Ha9oW3CfNMdCPHdf2ib0Mc0oUrO9tG+CT/mHUEwbR4RXpR9NMVWo9bYfs
 jlJ7ylzROVF/Z2bi+4gFckvq5hIP+jA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-vA1nm529PNaINPGJve2rOw-1; Thu, 02 Mar 2023 07:31:00 -0500
X-MC-Unique: vA1nm529PNaINPGJve2rOw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so1012809wmq.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWLYjuhdjDRLurVn1ktvDMOhSO7eZ7zfYFHt+ck3q+o=;
 b=E0UZhr99Dx4cWklETFC3tWbnYi3X7qFwfH9hfhnWWo6OVMy7C5LrR/sO0pp9kb3ho+
 YirWd53JMVwfgfYJRIfuR2lRSA66xAa3kdoBdS3j8zCdv+Kd+2eNEwUlTjw7eYp+d0bo
 tXN03nQGCDSKAWYlOXpfRAARnq8dVFAnIbpI5LN/U2/w1FFdGfHvtvVtYp0PQyLCKfx0
 ftcVrFdSI4rtWvjUbCL3MJHWt97gKM6bfTHJmI9Z45dTIFQL49TJBfKhg82vhKGNR7ML
 byTK/nCoQIA1qEBlXp1lZUSh9fJvSGIBtoZeGRMdHdUILySivdO5KB7kvCLjmgmxRfQZ
 3WOQ==
X-Gm-Message-State: AO0yUKVBU3gSGfF63D5Sa2/Au3xK9FojLAFjQaQh6RWw2Dz1wadw2Byu
 enXFN/uzRZh3LKeGX5th8Pw1CP24jZQevsIp9rOPqnIX0PQiolAKACAUK0c8u+rPCXaA4FUKRE/
 u8imYNXZyZo+du5GMSUPJsoplL1hmAYLat/y9bmL4md5dYs9qtX+2sFwICfmjj29ucj/2nBwXhY
 o=
X-Received: by 2002:a05:6000:108c:b0:2c7:760:2539 with SMTP id
 y12-20020a056000108c00b002c707602539mr7367076wrw.50.1677760258159; 
 Thu, 02 Mar 2023 04:30:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8t4995Ua6gP6YhJPpJNCQ/sIUq3tz9wBLyjchKFLRPEQ0AJrL1v0X/4z0gpGUbovst24HPKg==
X-Received: by 2002:a05:6000:108c:b0:2c7:760:2539 with SMTP id
 y12-20020a056000108c00b002c707602539mr7367061wrw.50.1677760257826; 
 Thu, 02 Mar 2023 04:30:57 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 x6-20020adff646000000b002c56046a3b5sm14760637wrp.53.2023.03.02.04.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:30:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 08/62] xen-platform: allow its creation with XEN_EMULATE mode
Date: Thu,  2 Mar 2023 13:29:35 +0100
Message-Id: <20230302123029.153265-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joao Martins <joao.m.martins@oracle.com>

The only thing we need to fix to make this build is the PIO hack which
sets the BIOS memory areas to R/W v.s. R/O. Theoretically we could hook
that up to the PAM registers on the emulated PIIX, but in practice
nobody cares, so just leave it doing nothing.

Now it builds without actual Xen, move it to CONFIG_XEN_BUS to include it
in the KVM-only builds.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/xen/meson.build    |  5 ++++-
 hw/i386/xen/xen_platform.c | 39 +++++++++++++++++++++++++-------------
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300cb..2e64a34e16f8 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -2,6 +2,9 @@ i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
   'xen-mapcache.c',
   'xen_apic.c',
-  'xen_platform.c',
   'xen_pvdevice.c',
 ))
+
+i386_ss.add(when: 'CONFIG_XEN_BUS', if_true: files(
+  'xen_platform.c',
+))
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 8a616970539c..539f7da374ce 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -27,9 +27,9 @@
 #include "qapi/error.h"
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
-#include "hw/xen/xen_common.h"
 #include "migration/vmstate.h"
-#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen.h"
+#include "net/net.h"
 #include "trace.h"
 #include "sysemu/xen.h"
 #include "sysemu/block-backend.h"
@@ -37,6 +37,11 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
+#ifdef CONFIG_XEN
+#include "hw/xen/xen_common.h"
+#include "hw/xen/xen-legacy-backend.h"
+#endif
+
 //#define DEBUG_PLATFORM
 
 #ifdef DEBUG_PLATFORM
@@ -279,18 +284,26 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
     PCIXenPlatformState *s = opaque;
 
     switch (addr) {
-    case 0: /* Platform flags */ {
-        hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
-            HVMMEM_ram_ro : HVMMEM_ram_rw;
-        if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
-            DPRINTF("unable to change ro/rw state of ROM memory area!\n");
-        } else {
+    case 0: /* Platform flags */
+        if (xen_mode == XEN_EMULATE) {
+            /* XX: Use i440gx/q35 PAM setup to do this? */
             s->flags = val & PFFLAG_ROM_LOCK;
-            DPRINTF("changed ro/rw state of ROM memory area. now is %s state.\n",
-                    (mem_type == HVMMEM_ram_ro ? "ro":"rw"));
+#ifdef CONFIG_XEN
+        } else {
+            hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
+                HVMMEM_ram_ro : HVMMEM_ram_rw;
+
+            if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
+                DPRINTF("unable to change ro/rw state of ROM memory area!\n");
+            } else {
+                s->flags = val & PFFLAG_ROM_LOCK;
+                DPRINTF("changed ro/rw state of ROM memory area. now is %s state.\n",
+                        (mem_type == HVMMEM_ram_ro ? "ro" : "rw"));
+            }
+#endif
         }
         break;
-    }
+
     case 2:
         log_writeb(s, val);
         break;
@@ -508,8 +521,8 @@ static void xen_platform_realize(PCIDevice *dev, Error **errp)
     uint8_t *pci_conf;
 
     /* Device will crash on reset if xen is not initialized */
-    if (!xen_enabled()) {
-        error_setg(errp, "xen-platform device requires the Xen accelerator");
+    if (xen_mode == XEN_DISABLED) {
+        error_setg(errp, "xen-platform device requires a Xen guest");
         return;
     }
 
-- 
2.39.1


