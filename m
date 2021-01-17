Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763D2F922F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:58:50 +0100 (CET)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16hk-0000bO-Ib
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16WA-0001qO-Bz
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vz-0008GB-E8
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610883998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yM0UVe2zhRG2MUk1cz+zM7uKYIy9ql8KcLv5si30cN4=;
 b=bUJMXpsBlzhV6HBVJBuv9ArQ7r1r2RzFgnIF78BLbmA83WjCjDrMNxapIs2m2HyFtZBpA2
 KA+Y2iMnx1KUztF7Z5Z+9+GFOpUt1RkSwC8pzFjJW10rIx2acTcRCLZyBcQjZIjNMi0Tmc
 STbOCrI6TTDzof2UiXMvkB9FSbPzH/I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-BlhPcC2DMzqBiEPIsO5Mdg-1; Sun, 17 Jan 2021 06:46:36 -0500
X-MC-Unique: BlhPcC2DMzqBiEPIsO5Mdg-1
Received: by mail-wr1-f72.google.com with SMTP id n11so6775031wro.7
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yM0UVe2zhRG2MUk1cz+zM7uKYIy9ql8KcLv5si30cN4=;
 b=rRdf33KP1jF8NKY9CILWbMxhKRUaJoYC2RQvbUdi259/s28BFqiZpOqFTuzSIIW2JA
 vt8V5/061FgGTLHo5BBdyu/7B1xCsGZ5DgzSNrXSvEprNhLwU/n916sm84RQ24jaYSiz
 +geMgmdKieFfgZUDKdlx7nYKRsSdyBNmMsSTBZKgxk7gZ7THIAhgYiGeOkvqtI4sdMWk
 YGF3EHNx9KX1vV890gDtzOjAJosh1ilTfqca3eh7sRDCaJHI0miOoKcZpNQChuAeCTy6
 fCAGn2/hUXmBxgOPMguBzjh01xE/MixBUH4263R/tGQGewt4+54IYWtKeEgIA44hoavV
 O0WA==
X-Gm-Message-State: AOAM532ol4czE9okT9DPNJbMn5wzFmP5QmQe8UYFoXJH4lVFstiRMeQF
 YyTVORQEFXyUnHC1ZFG2/BYrkquDp0kIXo9qJW6SEO65Nj77UVE3HtZdJAW/elKTKh7AD379EEG
 bnpoA8DjofmJqbRQWAAlfXnsJiy/O07NizrObU0KzWjfjmuIVNsPKyWqOWmtI
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr21148312wrt.287.1610883995029; 
 Sun, 17 Jan 2021 03:46:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyx4aVfeK9iUe6JySlrW1Xad/q55NKd51w06jwB5qKj0AcUfJsOuyJJe4xKMsdCg9R5paDWnA==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr21148297wrt.287.1610883994819; 
 Sun, 17 Jan 2021 03:46:34 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 c2sm18233915wrt.87.2021.01.17.03.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:34 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] acpi/gpex: Exclude pxb's resources from PCI0
Message-ID: <20210117114519.539647-8-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yubo Miao <miaoyubo@huawei.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jiahui Cen <cenjiahui@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

Exclude the resources of extra root bridges from PCI0's _CRS. Otherwise,
the resource windows would overlap in guest, and the IO resource window
would fail to be registered.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20210114100643.10617-6-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 64 +++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index cb13e75d2f..446912d771 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -146,6 +146,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     Aml *method, *crs, *dev, *rbuf;
     PCIBus *bus = cfg->bus;
     CrsRangeSet crs_range_set;
+    CrsRangeEntry *entry;
+    int i;
 
     /* start to construct the tables for pxb */
     crs_range_set_init(&crs_range_set);
@@ -193,7 +195,6 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             aml_append(scope, dev);
         }
     }
-    crs_range_set_free(&crs_range_set);
 
     /* tables for the main */
     dev = aml_device("%s", "PCI0");
@@ -211,36 +212,55 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(method, aml_return(aml_int(cfg->ecam.base)));
     aml_append(dev, method);
 
+    /*
+     * At this point crs_range_set has all the ranges used by pci
+     * busses *other* than PCI0.  These ranges will be excluded from
+     * the PCI0._CRS.
+     */
     rbuf = aml_resource_template();
     aml_append(rbuf,
         aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
                             0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
                             nr_pcie_buses));
     if (cfg->mmio32.size) {
-        aml_append(rbuf,
-                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                                    cfg->mmio32.base,
-                                    cfg->mmio32.base + cfg->mmio32.size - 1,
-                                    0x0000,
-                                    cfg->mmio32.size));
+        crs_replace_with_free_ranges(crs_range_set.mem_ranges,
+                                     cfg->mmio32.base,
+                                     cfg->mmio32.base + cfg->mmio32.size - 1);
+        for (i = 0; i < crs_range_set.mem_ranges->len; i++) {
+            entry = g_ptr_array_index(crs_range_set.mem_ranges, i);
+            aml_append(rbuf,
+                aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                                 AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                                 entry->base, entry->limit,
+                                 0x0000, entry->limit - entry->base + 1));
+        }
     }
     if (cfg->pio.size) {
-        aml_append(rbuf,
-                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                                AML_ENTIRE_RANGE, 0x0000, 0x0000,
-                                cfg->pio.size - 1,
-                                cfg->pio.base,
-                                cfg->pio.size));
+        crs_replace_with_free_ranges(crs_range_set.io_ranges,
+                                     0x0000,
+                                     cfg->pio.size - 1);
+        for (i = 0; i < crs_range_set.io_ranges->len; i++) {
+            entry = g_ptr_array_index(crs_range_set.io_ranges, i);
+            aml_append(rbuf,
+                aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                             AML_ENTIRE_RANGE, 0x0000, entry->base,
+                             entry->limit, cfg->pio.base,
+                             entry->limit - entry->base + 1));
+        }
     }
     if (cfg->mmio64.size) {
-        aml_append(rbuf,
-                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                                    cfg->mmio64.base,
-                                    cfg->mmio64.base + cfg->mmio64.size - 1,
-                                    0x0000,
-                                    cfg->mmio64.size));
+        crs_replace_with_free_ranges(crs_range_set.mem_64bit_ranges,
+                                     cfg->mmio64.base,
+                                     cfg->mmio64.base + cfg->mmio64.size - 1);
+        for (i = 0; i < crs_range_set.mem_64bit_ranges->len; i++) {
+            entry = g_ptr_array_index(crs_range_set.mem_64bit_ranges, i);
+            aml_append(rbuf,
+                aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                                 AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                                 entry->base,
+                                 entry->limit, 0x0000,
+                                 entry->limit - entry->base + 1));
+        }
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
@@ -259,4 +279,6 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(dev_res0, aml_name_decl("_CRS", crs));
     aml_append(dev, dev_res0);
     aml_append(scope, dev);
+
+    crs_range_set_free(&crs_range_set);
 }
-- 
MST


