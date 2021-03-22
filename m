Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB493452E2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:15:57 +0100 (CET)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTm8-0004ug-DK
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXF-0007EL-84
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXC-0001IS-9D
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oP0DWqO2hTVUoBgftUJivGqbVs8/LxKOJqfcj2wPLwU=;
 b=H8m4eKfNpNK454B6KdilL0Dhx740p6rQkWuAYCP0xzLu70fTGurORXtFp11j6CtGGHhFTL
 AEyeso55ib75eNjqDsKRmqLwwbVoHK7QDdXuSa8ueIwSKvcSXQ0rsttahN8gXZDnwUZap+
 HdG75lFlBAYO1iGiomKRtbrQ/7V/NLs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-wGuPFBfSNIe-FNHuQ00MvA-1; Mon, 22 Mar 2021 19:00:26 -0400
X-MC-Unique: wGuPFBfSNIe-FNHuQ00MvA-1
Received: by mail-wr1-f70.google.com with SMTP id p15so147091wre.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oP0DWqO2hTVUoBgftUJivGqbVs8/LxKOJqfcj2wPLwU=;
 b=IhSB+X4HkzT09ZtEdjg4CjYg35LCFu1CC1RGaXJz+wPfN7wMyoFyKjnNxlAqBQTTeW
 8vLjSiFwS+YwJPcnckWhlJvBFFW7o6VLeguxmeex61VL5mZOgYz4Ru8+7ur/RnDXR0aR
 z8kJqclVCAO3/eC6UPZFim3LSruhN1luN+eOMgQ6fjsgcoz/cI+/bCWRvcKaGRmKgxAy
 xqNSchOg85ObfU0uqbmoUIzVmJI/ku/jtd0pB9TXenpRcBESbjpwd5mUCnwAKO9bm1B5
 doGeYrxLSn1obrYMOJv66Jw9EJ9kI+LkWD8HRi5QLdPqTnjMql3NNrCIo+Vtbwh1MaEV
 7rqA==
X-Gm-Message-State: AOAM533IojIXTxHtzv70BMK7Yj0pawGh+H2x4NKHBptAGfa8PfWpZl1q
 8NpZesYc7nQ30swAkxhaF0cF2B1urYUbPqn3oCpf0TjgYgFNp4uHP2ZLvbBPkH69vqr1TtUFdoQ
 T1lzGqpKrL+i0503jWZX5YIS1vnruH1QPEu96u6O59wMiefCxAVQ9KO+ilMZ5
X-Received: by 2002:adf:b313:: with SMTP id j19mr823777wrd.188.1616454025262; 
 Mon, 22 Mar 2021 16:00:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyNFwZvzfCE0Hq/wN0YCXtwQzVtflOW5WR9UQM17iUw3iihNuZiOCmMsJESXI/FVIFzlZ1GQ==
X-Received: by 2002:adf:b313:: with SMTP id j19mr823750wrd.188.1616454024945; 
 Mon, 22 Mar 2021 16:00:24 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id z2sm24204646wrm.0.2021.03.22.16.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:24 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/19] pci: acpi: add _DSM method to PCI devices
Message-ID: <20210322225907.541943-14-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Implement _DSM according to:
    PCI Firmware Specification 3.1
    4.6.7.  DSM for Naming a PCI or PCI Express Device Under
            Operating Systems
and wire it up to cold and hot-plugged PCI devices.
Feature depends on ACPI hotplug being enabled (as that provides
PCI devices descriptions in ACPI and MMIO registers that are
reused to fetch acpi-index).

acpi-index should work for
  - cold plugged NICs:
      $QEMU -device e1000,acpi-index=100
         => 'eno100'
  - hot-plugged
      (monitor) device_add e1000,acpi-index=200,id=remove_me
         => 'eno200'
  - re-plugged
      (monitor) device_del remove_me
      (monitor) device_add e1000,acpi-index=1
         => 'eno1'

Windows also sees index under "PCI Label Id" field in properties
dialog but otherwise it doesn't seem to have any effect.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210315180102.3008391-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/pci.h |   1 +
 hw/i386/acpi-build.c  | 105 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index e514f179d8..b5deee0a9d 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -35,4 +35,5 @@ typedef struct AcpiMcfgInfo {
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id);
+Aml *aml_pci_device_dsm(void);
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e49fae2bfd..a95b42c8b3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -397,6 +397,13 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
                 );
                 aml_append(dev, method);
+                method = aml_method("_DSM", 4, AML_SERIALIZED);
+                aml_append(method,
+                    aml_return(aml_call6("PDSM", aml_arg(0), aml_arg(1),
+                                         aml_arg(2), aml_arg(3),
+                                         aml_name("BSEL"), aml_name("_SUN")))
+                );
+                aml_append(dev, method);
                 aml_append(parent_scope, dev);
 
                 build_append_pcihp_notify_entry(notify_method, slot);
@@ -424,6 +431,16 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
         aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
 
+        if (bsel) {
+            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+            method = aml_method("_DSM", 4, AML_SERIALIZED);
+            aml_append(method, aml_return(
+                aml_call6("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
+                          aml_arg(3), aml_name("BSEL"), aml_name("_SUN"))
+            ));
+            aml_append(dev, method);
+        }
+
         if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
             /* add VGA specific AML methods */
             int s3d;
@@ -446,9 +463,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
         } else if (hotplug_enabled_dev) {
-            /* add _SUN/_EJ0 to make slot hotpluggable  */
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-
+            /* add _EJ0 to make slot hotpluggable  */
             method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             aml_append(method,
                 aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
@@ -511,6 +526,88 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     qobject_unref(bsel);
 }
 
+Aml *aml_pci_device_dsm(void)
+{
+    Aml *method, *UUID, *ifctx, *ifctx1, *ifctx2, *ifctx3, *elsectx;
+    Aml *acpi_index = aml_local(0);
+    Aml *zero = aml_int(0);
+    Aml *bnum = aml_arg(4);
+    Aml *func = aml_arg(2);
+    Aml *rev = aml_arg(1);
+    Aml *sun = aml_arg(5);
+
+    method = aml_method("PDSM", 6, AML_SERIALIZED);
+
+    /*
+     * PCI Firmware Specification 3.1
+     * 4.6.  _DSM Definitions for PCI
+     */
+    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
+    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
+    {
+        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sun), acpi_index));
+        ifctx1 = aml_if(aml_equal(func, zero));
+        {
+            uint8_t byte_list[1];
+
+            ifctx2 = aml_if(aml_equal(rev, aml_int(2)));
+            {
+                /*
+                 * advertise function 7 if device has acpi-index
+                 * acpi_index values:
+                 *            0: not present (default value)
+                 *     FFFFFFFF: not supported (old QEMU without PIDX reg)
+                 *        other: device's acpi-index
+                 */
+                ifctx3 = aml_if(aml_lnot(
+                    aml_or(aml_equal(acpi_index, zero),
+                           aml_equal(acpi_index, aml_int(0xFFFFFFFF)), NULL)
+                ));
+                {
+                    byte_list[0] =
+                        1 /* have supported functions */ |
+                        1 << 7 /* support for function 7 */
+                    ;
+                    aml_append(ifctx3, aml_return(aml_buffer(1, byte_list)));
+                }
+                aml_append(ifctx2, ifctx3);
+             }
+             aml_append(ifctx1, ifctx2);
+
+             byte_list[0] = 0; /* nothing supported */
+             aml_append(ifctx1, aml_return(aml_buffer(1, byte_list)));
+         }
+         aml_append(ifctx, ifctx1);
+         elsectx = aml_else();
+         /*
+          * PCI Firmware Specification 3.1
+          * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
+          *        Operating Systems
+          */
+         ifctx1 = aml_if(aml_equal(func, aml_int(7)));
+         {
+             Aml *pkg = aml_package(2);
+             Aml *ret = aml_local(1);
+
+             aml_append(pkg, zero);
+             /*
+              * optional, if not impl. should return null string
+              */
+             aml_append(pkg, aml_string("%s", ""));
+             aml_append(ifctx1, aml_store(pkg, ret));
+             /*
+              * update acpi-index to actual value
+              */
+             aml_append(ifctx1, aml_store(acpi_index, aml_index(ret, zero)));
+             aml_append(ifctx1, aml_return(ret));
+         }
+         aml_append(elsectx, ifctx1);
+         aml_append(ifctx, elsectx);
+    }
+    aml_append(method, ifctx);
+    return method;
+}
+
 /**
  * build_prt_entry:
  * @link_name: link name for PCI route entry
@@ -1195,6 +1292,8 @@ static void build_piix4_pci_hotplug(Aml *table)
     aml_append(method, aml_return(aml_local(0)));
     aml_append(scope, method);
 
+    aml_append(scope, aml_pci_device_dsm());
+
     aml_append(table, scope);
 }
 
-- 
MST


