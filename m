Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B988E681B92
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMahA-00019C-Rp; Mon, 30 Jan 2023 15:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeu-0007Jy-2P
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeh-0007RL-Mu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4R5ipfpi1/Z3UUni3TXKOg4dULRbxLgNKi7fR+CL6/U=;
 b=WpoidX+AdhP48RPawD+ia/Us7hK8SpvIv3qNOZf12dHx25B6U8xxKDLUb7tOBFf+cxmdhZ
 iNTAdukBm0GgLa3BI83aQs2kbpZU+kIcLTcLdvI5KMf72fGbmdh+VAcWb/mStK17FI++GN
 oY77ue+f30a6xgHwYZOTbeI60F1o6s4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-KZkSudpSMOqJPBCZcVW9cQ-1; Mon, 30 Jan 2023 15:21:29 -0500
X-MC-Unique: KZkSudpSMOqJPBCZcVW9cQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z6-20020aa7cf86000000b0049f95687b88so8967921edx.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4R5ipfpi1/Z3UUni3TXKOg4dULRbxLgNKi7fR+CL6/U=;
 b=66ZErstuZOC1dIdKgu3jKB2vtem57qIhRPfUUdVKUxtmJd3HX7TzBitBmYoDIDbEkj
 k42zKNoMwU72HKIy/UD1UP0PQ1CCMrZSf3DesdPGbzBktOeTANMJqDX3uowQbjliu7ze
 Q2XW9+J6W0JyMaTgyZzRUb/u662SjW8CN1S7SQc5YFeoydLQFdbOOxWgkEjiHGP6g1Sq
 CYgh3Qn9R8Vt2rhE1cWK2crpJ6SLN5cHjYDrQI3S0ewD4mfSy3u7zA2RG1PpS0xtNIpz
 FTcaU7GBBTphlnCfnW0yEiaugfbKUdtRUBm0VN6bZg/eh2xM4Q+8BjrFWvw+ilPqb/VY
 17rQ==
X-Gm-Message-State: AO0yUKUqsVn8OCQUDDezRjJAcXgw3LXZhi/3ThtuDG8JgS6yfRbx5Q/2
 htpBjNBb5/2miHiIf0WAKwp3ujP+btK3iQ+sc5wSeH1x4bRvQ/4qBZzB6LucQhZybrc7IpAoKYj
 yNmS0jEHoqTBlNgcWRu7wPrF4T4Z0EFOblPaqYTonUgxrfPM3L66K90C113Yo
X-Received: by 2002:a17:906:b187:b0:88b:28ea:5bdc with SMTP id
 w7-20020a170906b18700b0088b28ea5bdcmr2109142ejy.42.1675110087686; 
 Mon, 30 Jan 2023 12:21:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8jnBWrFI5qn0sa1CdaiVKf0/S1dGFicuAKO0G0auQALSUOOAQiOKDyx0HlNULFdO1pxEYG9Q==
X-Received: by 2002:a17:906:b187:b0:88b:28ea:5bdc with SMTP id
 w7-20020a170906b18700b0088b28ea5bdcmr2109118ejy.42.1675110087469; 
 Mon, 30 Jan 2023 12:21:27 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 o2-20020a1709064f8200b0088a2aebb146sm1258157eju.52.2023.01.30.12.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:26 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 49/56] pcihp: generate populated non-hotpluggble slot
 descriptions on non-hotplug path
Message-ID: <20230130201810.11518-50-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Generating slots descriptions populated by non-hotpluggable devices
is akward at best and complicates hotplug path (build_append_pcihp_slots)
needlessly, and builds only dynamic _DSM for such slots which is overlkill.
Clean it up and let non-hotplug path (build_append_pci_bus_devices)
to handle that task.

Such clean up effectively drops dynamic _DSM methods on non-hotpluggable
slots (even though bus itself is hotpluggable), but in practice it
affects only built-in devices (ide controllers/various bridges) that don't
use acpi-index anyways so effectively it doesn't matter (NICs are hotpluggble).

Follow up series will add static _DSM for non-hotpluggble devices/buses
that will not depend on ACPI PCI hotplug at all, and potentially would
allows us to reuse non-hotplug path elsewhere (PBX/microvm/arm-virt),
including new support for acpi-index for non-hotpluggable devices.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-40-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a02608c215..145389aa58 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -412,6 +412,7 @@ static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
     PCIDevice *pdev = bus->devices[devfn];
     if (pdev) {
         return is_devfn_ignored_generic(devfn, bus) ||
+               !DEVICE_GET_CLASS(pdev)->hotpluggable ||
                /* Cold plugged bridges aren't themselves hot-pluggable */
                (IS_PCI_BRIDGE(pdev) && !DEVICE(pdev)->hotplugged);
     } else { /* non populated slots */
@@ -438,17 +439,14 @@ static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
     notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
 
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
-        PCIDevice *pdev = bus->devices[devfn];
         int slot = PCI_SLOT(devfn);
         int adr = slot << 16 | PCI_FUNC(devfn);
-        bool hotpluggbale_slot = true;
 
         if (is_devfn_ignored_hotplug(devfn, bus)) {
             continue;
         }
 
-        if (pdev) {
-            hotpluggbale_slot = DEVICE_GET_CLASS(pdev)->hotpluggable;
+        if (bus->devices[devfn]) {
             dev = aml_scope("S%.02X", devfn);
         } else {
             dev = aml_device("S%.02X", devfn);
@@ -462,17 +460,15 @@ static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
         aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
         aml_append(dev, aml_pci_device_dsm());
 
-        if (hotpluggbale_slot) {
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-            /* add _EJ0 to make slot hotpluggable  */
-            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-            );
-            aml_append(dev, method);
+        aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+        /* add _EJ0 to make slot hotpluggable  */
+        method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
+        aml_append(method,
+            aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
+        );
+        aml_append(dev, method);
 
-            build_append_pcihp_notify_entry(notify_method, slot);
-        }
+        build_append_pcihp_notify_entry(notify_method, slot);
 
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
@@ -491,8 +487,9 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
+        PCIDevice *pdev = bus->devices[devfn];
 
-        if (!bus->devices[devfn] || is_devfn_ignored_generic(devfn, bus)) {
+        if (!pdev || is_devfn_ignored_generic(devfn, bus)) {
             continue;
         }
 
-- 
MST


