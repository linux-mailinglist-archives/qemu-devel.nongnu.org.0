Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB00D3DF6A3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:54:30 +0200 (CEST)
Received: from localhost ([::1]:58440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1Qj-0002WN-QN
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1Ob-0000QQ-BU
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1OZ-00081P-Cn
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628023934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GCqmbQ2PqvsxCTgcHNXiIdnPeK91I0G8qY//cWdHM1Y=;
 b=gfyU4XEZjf8uHPtlJNKEXVdpUi4Ao53t2+Zm57qUyHXY+xTJUEodnGaWV5thSnYoANvQ5T
 OCl5iHQkTkW+mH2w7/Chj7frzjGz3CkJuaNxcQcHTkkDKdeS0OycjTohYYK/kzkw+UcTLs
 xFljCb+zGPjNivek8WaWTD2nPtv+qzo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-VK-x-qnvOfiKzavoNF3wSg-1; Tue, 03 Aug 2021 16:52:13 -0400
X-MC-Unique: VK-x-qnvOfiKzavoNF3wSg-1
Received: by mail-ed1-f71.google.com with SMTP id
 de5-20020a0564023085b02903bb92fd182eso274950edb.8
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GCqmbQ2PqvsxCTgcHNXiIdnPeK91I0G8qY//cWdHM1Y=;
 b=Gx/C+oNQKMHjLMlG8sliuD+pVjSIjpCf1l8zvmdhj4W+ojRaqCboyhLluuA4v7hZWR
 sv2f7AlQnrH+SErBKhJs7q/lYKURPhzOlPtywuBBiOuJex2G+XQizzYa0H62bW9y1P4E
 F2bqNHKWfVyWyJVG1/QAnNtIo0FRJBL6XF2k37FPm45WoIikhT4y2pxeeCo6VveNZxn2
 C4elMzBTSrrvGaYznkQs0tkhvN5bOAmH+tsG7SsS1j02mUGtCQj5Hv9eMeKC7+SZnp7N
 M0tHTDg+kU/pE4THKhDMVsp//mPwXPCcm8KlHrRqc24aJ9jDMVOaAYMEZBwcyowy4+uH
 k/ZA==
X-Gm-Message-State: AOAM531BelTflrmA03S34kjCfqUAhcMjx5aafeukzlstuzCwc+j6u7qq
 ZHm2gnO9VI5BMazoAHdSZTL8PcZHiTDOY21iu8gBg+gT1vxPq/qYfEU2BgzzNk9MVy42QPClZS9
 atNgnLo1nRTDP+DW+ET+llHMHMICNeXPq49s31ndE5WKCYnFN4KhL9Wn8HqrD
X-Received: by 2002:aa7:df96:: with SMTP id b22mr27461237edy.324.1628023931609; 
 Tue, 03 Aug 2021 13:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrnxBScQ32TG5oJ/QWMnR+oBz1hwm+97wEfFHLlqRpJItXlqTJrf8pTVIzA3/KZnoBIg21tg==
X-Received: by 2002:aa7:df96:: with SMTP id b22mr27461205edy.324.1628023931358; 
 Tue, 03 Aug 2021 13:52:11 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id m12sm151ejd.21.2021.08.03.13.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:52:10 -0700 (PDT)
Date: Tue, 3 Aug 2021 16:52:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] acpi: x86: pcihp: add support hotplug on multifunction
 bridges
Message-ID: <20210803205043.165034-3-mst@redhat.com>
References: <20210803205043.165034-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803205043.165034-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, &lt@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Mammedov@redhat.com, Vivier@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Commit [1] switched PCI hotplug from native to ACPI one by default.

That however breaks hotplug on following CLI that used to work:
   -nodefaults -machine q35 \
   -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
   -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2

where PCI device is hotplugged to pcie-root-port-1 with error on guest side:

  ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
  ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
  ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
  ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)

cause is that QEMU's ACPI hotplug never supported functions other then 0
and due to bug it was generating notification entries for not described
functions.

Technically there is no reason not to describe cold-plugged bridges
(root ports) on functions other then 0, as they similarly to bridge
on function 0 are unpluggable.

So since we need to describe multifunction devices iterate over
fuctions as well. But describe only cold-plugged bridges[root ports]
on functions other than 0 as well.

1)
Fixes: 17858a169508609ca9063c544833e5a1adeb7b52 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reported-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20210723090424.2092226-1-imammedo@redhat.com>
Fixes: 17858a169508609ca9063c544833e5a1adeb7b52 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)<br>
Signed-off-by: Igor Mammedov &lt;<a href="mailto:imammedo@redhat.com" target="_blank">imammedo@redhat.com</a>&gt;<br>
Reported-by: Laurent Vivier &lt;<a href="mailto:lvivier@redhat.com" target="_blank">lvivier@redhat.com</a>&gt;<br>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 17836149fe..a33ac8b91e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -374,7 +374,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
     PCIBus *sec;
-    int i;
+    int devfn;
 
     bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
     if (bsel) {
@@ -384,23 +384,31 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
     }
 
-    for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         DeviceClass *dc;
         PCIDeviceClass *pc;
-        PCIDevice *pdev = bus->devices[i];
-        int slot = PCI_SLOT(i);
+        PCIDevice *pdev = bus->devices[devfn];
+        int slot = PCI_SLOT(devfn);
+        int func = PCI_FUNC(devfn);
+        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
+        int adr = slot << 16 | func;
         bool hotplug_enabled_dev;
         bool bridge_in_acpi;
         bool cold_plugged_bridge;
 
         if (!pdev) {
-            if (bsel) { /* add hotplug slots for non present devices */
+            /*
+             * add hotplug slots for non present devices.
+             * hotplug is supported only for non-multifunction device
+             * so generate device description only for function 0
+             */
+            if (bsel && !func) {
                 if (pci_bus_is_express(bus) && slot > 0) {
                     break;
                 }
-                dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
+                dev = aml_device("S%.02X", devfn);
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-                aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
+                aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
@@ -436,9 +444,18 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             continue;
         }
 
-        /* start to compose PCI slot descriptor */
-        dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
-        aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
+        /*
+         * allow describing coldplugged bridges in ACPI even if they are not
+         * on function 0, as they are not unpluggable, for all other devices
+         * generate description only for function 0 per slot
+         */
+        if (func && !bridge_in_acpi) {
+            continue;
+        }
+
+        /* start to compose PCI device descriptor */
+        dev = aml_device("S%.02X", devfn);
+        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
 
         if (bsel) {
             /*
@@ -496,7 +513,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
             build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
         }
-        /* slot descriptor has been composed, add it into parent context */
+        /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
 
@@ -525,13 +542,12 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         /* Notify about child bus events in any case */
         if (pcihp_bridge_en) {
             QLIST_FOREACH(sec, &bus->child, sibling) {
-                int32_t devfn = sec->parent_dev->devfn;
-
                 if (pci_bus_is_root(sec)) {
                     continue;
                 }
 
-                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
+                aml_append(method, aml_name("^S%.02X.PCNT",
+                                            sec->parent_dev->devfn));
             }
         }
 
-- 
MST


