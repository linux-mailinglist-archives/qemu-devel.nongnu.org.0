Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C507F2F9229
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:55:44 +0100 (CET)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16ek-0006Zu-9E
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vw-0001ZO-3K
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vu-0008De-8o
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610883993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cv8NCSnDR61r/aUfo07trvUlRljwOTJNatKWO9Bv3Hg=;
 b=Vfe1vBcDZCHx6ZyNOvSsHtwT/fPi0+lFJASv/8uGbbTXXZTS8B5lyIM92MC7ZoddeEQd4u
 NcLWLvAZr7G7/fucjoWVvQwT4+tZAzUMT4U6G6NnDWYB/9Wh6ohf8wJI1XEyAZfttD4TEG
 xL5iJglrM6iiHWOz/kfVQ5zoA2dvV6g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-Ni2Jh-PDMu2M6DUCbTW2pg-1; Sun, 17 Jan 2021 06:46:31 -0500
X-MC-Unique: Ni2Jh-PDMu2M6DUCbTW2pg-1
Received: by mail-wr1-f71.google.com with SMTP id u14so6791568wrr.15
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cv8NCSnDR61r/aUfo07trvUlRljwOTJNatKWO9Bv3Hg=;
 b=sSlA+ukVsPcK1X+RCMQzCJEcbz+/4ero7jEL9iVRR6sM90JP+xdMnf0/6mGzM4tJwy
 rKemdQKxfJ9kdOaguV2bhY1we3tOMcOb7P6WwPf5HF5ZPAemR6dzDqOEuCuVv7Dx4NhB
 mDe88QPZxKC30sT7jZM4MuSeFXx10hYDfWz5vuaoQPWK596yRKZKH7Gdg8AHO8HSstgy
 T8qTNJ3ovwh+8G2a25Dht5Ntl00uAW7OofK14CHrLQimuqmUjm9y6Q96Hh0I0aD8XDAg
 9ru2PT9I3UpajxZ6x8vgxJ12qsYP2F8EFuNr2WfYEmQ1AI7ik8+qvyjUU4uS15B4temm
 HElg==
X-Gm-Message-State: AOAM531KBjrBuohOVvWwiqfodpf4KQ7Z1ky4zq+lJ34sMIo3z8QAcTRu
 Iuf3jxrS5F2hYdXZ+ZzM/55hks5mNETQ06337ffSvEtBjJHN9GWtztxgLq/5Y8vRjEZO8fQBoAF
 OglBjyJjYU6L8E1FusM+QGSxW3nJ8KPVUKGowsnERsRLmCz1MjnDxtnB0PKVO
X-Received: by 2002:adf:ded1:: with SMTP id i17mr21064910wrn.190.1610883990123; 
 Sun, 17 Jan 2021 03:46:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya7GxmacKoZ5ewNMETUO4uvI3qANJnhHbW7tMU9BaIAUVmNl4BZZD+HA8WSeaFiqicPAp7Mg==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr21064888wrn.190.1610883989951; 
 Sun, 17 Jan 2021 03:46:29 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 g5sm23726445wro.60.2021.01.17.03.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:29 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] acpi: Add addr offset in build_crs
Message-ID: <20210117114519.539647-6-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

AML needs Address Translation offset to describe how a bridge translates
addresses accross the bridge when using an address descriptor, and
especially on ARM, the translation offset of pio resource is usually
non zero.

Therefore, it's necessary to pass offset for pio, mmio32, mmio64 and bus
number into build_crs.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20210114100643.10617-4-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |  4 +++-
 hw/acpi/aml-build.c         | 18 ++++++++++--------
 hw/i386/acpi-build.c        |  3 ++-
 hw/pci-host/gpex-acpi.c     |  3 ++-
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index e727bea1bc..54a5aec4d7 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -452,7 +452,9 @@ void crs_replace_with_free_ranges(GPtrArray *ranges,
 void crs_range_set_init(CrsRangeSet *range_set);
 void crs_range_set_free(CrsRangeSet *range_set);
 
-Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set);
+Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
+               uint32_t mmio32_offset, uint64_t mmio64_offset,
+               uint16_t bus_nr_offset);
 
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f976aa667b..7b6ebb0cc8 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2076,7 +2076,9 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
                  tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
 }
 
-Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
+Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
+               uint32_t mmio32_offset, uint64_t mmio64_offset,
+               uint16_t bus_nr_offset)
 {
     Aml *crs = aml_resource_template();
     CrsRangeSet temp_range_set;
@@ -2189,10 +2191,10 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
     for (i = 0; i < temp_range_set.io_ranges->len; i++) {
         entry = g_ptr_array_index(temp_range_set.io_ranges, i);
         aml_append(crs,
-                   aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
-                               AML_POS_DECODE, AML_ENTIRE_RANGE,
-                               0, entry->base, entry->limit, 0,
-                               entry->limit - entry->base + 1));
+                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
+                                AML_POS_DECODE, AML_ENTIRE_RANGE,
+                                0, entry->base, entry->limit, io_offset,
+                                entry->limit - entry->base + 1));
         crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
     }
 
@@ -2205,7 +2207,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
                    aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
                                     AML_MAX_FIXED, AML_NON_CACHEABLE,
                                     AML_READ_WRITE,
-                                    0, entry->base, entry->limit, 0,
+                                    0, entry->base, entry->limit, mmio32_offset,
                                     entry->limit - entry->base + 1));
         crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
     }
@@ -2217,7 +2219,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
                    aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
                                     AML_MAX_FIXED, AML_NON_CACHEABLE,
                                     AML_READ_WRITE,
-                                    0, entry->base, entry->limit, 0,
+                                    0, entry->base, entry->limit, mmio64_offset,
                                     entry->limit - entry->base + 1));
         crs_range_insert(range_set->mem_64bit_ranges,
                          entry->base, entry->limit);
@@ -2230,7 +2232,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
                             0,
                             pci_bus_num(host->bus),
                             max_bus,
-                            0,
+                            bus_nr_offset,
                             max_bus - pci_bus_num(host->bus) + 1));
 
     return crs;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f18b71dea9..f56d699c7f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1360,7 +1360,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             }
 
             aml_append(dev, build_prt(false));
-            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
+            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
+                            0, 0, 0, 0);
             aml_append(dev, aml_name_decl("_CRS", crs));
             aml_append(scope, dev);
             aml_append(dsdt, scope);
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 7f20ee1c98..11b3db8f71 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -168,7 +168,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
              * 1. The resources the pci-brige/pcie-root-port need.
              * 2. The resources the devices behind pxb need.
              */
-            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
+            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
+                            cfg->pio.base, 0, 0, 0);
             aml_append(dev, aml_name_decl("_CRS", crs));
 
             acpi_dsdt_add_pci_osc(dev);
-- 
MST


