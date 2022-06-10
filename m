Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF15461C8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:23:41 +0200 (CEST)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzarj-0006Qi-AO
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYL-0002OW-Qy
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYJ-0006S4-Ag
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GChmIMU2dxex7tHilhwT7e7Y+3Ss6WE6zGsqe1kiQZM=;
 b=abdaw/dgBzMZBlvt+LZ4M3m0BYzPKo5ZmvyWw/sh0PBjs2RHQVy7/TETXyJKZmudLISrIV
 2VUN2iKswMECF9COQ1shH0e6SlKjnrUxhpKBdWp/XCS6Y0SuibluxDXsJFdWDxzh/WjqI9
 XDMYdRsOjcon0BWeMq4FiQoqf5wu7Xc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-3qYDnNpEOSWyK4S456YUPA-1; Fri, 10 Jun 2022 03:59:29 -0400
X-MC-Unique: 3qYDnNpEOSWyK4S456YUPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso967341wms.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GChmIMU2dxex7tHilhwT7e7Y+3Ss6WE6zGsqe1kiQZM=;
 b=EsZtdHhmfoK2gMUAlwVuy17Dax9ypNmp8CRSOwZmPq2lr5Cv1ybeVhJFtMsxtxinVo
 rH8G8rbCSmX67MCeTCX7g4+MTvZ0DaHDouE6W/8B8ccr1062XDeIbwleIb24L1EnECGv
 wO+2x+SGh82MyT3D8D1Qf4rwht/zkuBbJBOWP2va3hzR8xkCvaQoF1cfJFnDO2897znA
 PJXhebshv/HHSPKGo9ReYmAvllkucX+E9eGokLqH8qc8UD7w5D37EdYesZN6/43ST6yF
 pNoPbtblR0J9A4yHMCkOy5beZYE/b+4CXeXtaMY8SNpHyxjkG1wVYrdYXDMSVVZ+Onxp
 1qHQ==
X-Gm-Message-State: AOAM531GuMVvKYJh86ThkQkh4/Wb0u/6KKO2rN0XI4Qr23LNWtIBVV69
 n9HmGX+NL2+w4YpoB8D3JUTB+LTgPK7BJrN2toSBQADWlwTvdjfqiIaVNEt0UzDMQvF4XGV8CuM
 S/DQy75Xqgyg5UtgcIQzDMpdUkHDMyqITdAvGDs/Ps2CHGUI2FcBTcVsj/HMD
X-Received: by 2002:adf:dd8e:0:b0:213:bbe1:ba56 with SMTP id
 x14-20020adfdd8e000000b00213bbe1ba56mr36486990wrl.559.1654847968023; 
 Fri, 10 Jun 2022 00:59:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAhw2+JCqMUFaz0BZk5Un+3JcZDOZUBKU7hAG8uO68RqLY0bx6DYUnAzfYOsQIeHjb+dYKtQ==
X-Received: by 2002:adf:dd8e:0:b0:213:bbe1:ba56 with SMTP id
 x14-20020adfdd8e000000b00213bbe1ba56mr36486961wrl.559.1654847967718; 
 Fri, 10 Jun 2022 00:59:27 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c054b00b0039c7c4a542csm1740478wmc.47.2022.06.10.00.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:27 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <ani@anisinha.ca>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 48/54] hw/acpi/viot: build array of PCI host bridges before
 generating VIOT ACPI table
Message-ID: <20220610075631.367501-49-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Perform the generation of the VIOT ACPI table in 2 separate passes: the first pass
enumerates all of the PCI host bridges and adds the min_bus and max_bus information
to an array.

Once this is done the VIOT table header is generated using the size of the array
to calculate the node count, which means it is no longer necessary to use a
sub-array to hold the PCI host bridge range information along with viommu_off.

Finally the PCI host bridge array is iterated again to add the required entries
to the final VIOT ACPI table.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220525173232.31429-4-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/viot.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index 5dafcbf5ef..c32bbdd180 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -10,10 +10,9 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 
-struct viot_pci_ranges {
-    GArray *blob;
-    size_t count;
-    uint16_t output_node;
+struct viot_pci_host_range {
+    int min_bus;
+    int max_bus;
 };
 
 static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
@@ -44,8 +43,7 @@ static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
 /* Build PCI range for a given PCI host bridge */
 static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 {
-    struct viot_pci_ranges *pci_ranges = opaque;
-    GArray *blob = pci_ranges->blob;
+    GArray *pci_host_ranges = opaque;
 
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
@@ -55,9 +53,11 @@ static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 
             pci_bus_range(bus, &min_bus, &max_bus);
 
-            build_pci_host_range(blob, min_bus, max_bus,
-                                 pci_ranges->output_node);
-            pci_ranges->count++;
+            const struct viot_pci_host_range pci_host_range = {
+                .min_bus = min_bus,
+                .max_bus = max_bus,
+            };
+            g_array_append_val(pci_host_ranges, pci_host_range);
         }
     }
 
@@ -78,19 +78,19 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     int viommu_off = 48;
     AcpiTable table = { .sig = "VIOT", .rev = 0,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
-    struct viot_pci_ranges pci_ranges = {
-        .output_node = viommu_off,
-        .blob = g_array_new(false, true /* clear */, 1),
-    };
+    GArray *pci_host_ranges =  g_array_new(false, true,
+                                           sizeof(struct viot_pci_host_range));
+    struct viot_pci_host_range *pci_host_range;
+    int i;
 
     /* Build the list of PCI ranges that this viommu manages */
     object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
-                                   &pci_ranges);
+                                   pci_host_ranges);
 
     /* ACPI table header */
     acpi_table_begin(&table, table_data);
     /* Node count */
-    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
+    build_append_int_noprefix(table_data, pci_host_ranges->len + 1, 2);
     /* Node offset */
     build_append_int_noprefix(table_data, viommu_off, 2);
     /* Reserved */
@@ -111,9 +111,15 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     build_append_int_noprefix(table_data, 0, 8);
 
     /* PCI ranges found above */
-    g_array_append_vals(table_data, pci_ranges.blob->data,
-                        pci_ranges.blob->len);
-    g_array_free(pci_ranges.blob, true);
+    for (i = 0; i < pci_host_ranges->len; i++) {
+        pci_host_range = &g_array_index(pci_host_ranges,
+                                        struct viot_pci_host_range, i);
+
+        build_pci_host_range(table_data, pci_host_range->min_bus,
+                             pci_host_range->max_bus, viommu_off);
+    }
+
+    g_array_free(pci_host_ranges, true);
 
     acpi_table_end(linker, &table);
 }
-- 
MST


