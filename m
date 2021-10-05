Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF982422E4F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:47:53 +0200 (CEST)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnbc-0002wr-OE
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmv7-00021W-4V
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmv4-0006rU-8w
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R4wGL6P6mQ8b+hHluivUshpdu4ZjMd9sQXmFz3Odljs=;
 b=OMXVDK+R4JeTtFDJIbFIsqZ4RAqbp+RcXl4MvfyQnXvmrzcKlyvCChwiq72dFW1n3GD7rV
 mgSqdmbbovd9Ca9X2YADOb6ERMUYTJ2vScLKGtiYt+kGUg/v7dUzaqaZ22dUAehUSFVAYH
 AOgxRFzlGOm9A/2hmA/6qJthhoaqSg4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-GWO7COwAOtWGDOIxfxqU6A-1; Tue, 05 Oct 2021 12:03:52 -0400
X-MC-Unique: GWO7COwAOtWGDOIxfxqU6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so1504615wmq.1
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R4wGL6P6mQ8b+hHluivUshpdu4ZjMd9sQXmFz3Odljs=;
 b=2R7RPA23mAhXOlG0bWSsMDekchk/ubMdI6KiIImv2cddp4HCLNmEL6ayvOQF/bxRby
 l2tsc136I9sJ/sXqyCos90BZd1BW+/32srbCHI262E+ovoNyraFtsZIJc1h4wlFWSl/L
 swRopy10j8q5z25/vekz9fESZulBR1nuRCFG/uZ0Grr13joeV1G/CH0dck4XoI3KNKMK
 TU4/Au1aH2vTr5FTPwyqnkJ09o3C8XEEBhRhOWV83vf4B5h/DwaOgdEeNHcJW2db7JlE
 lu8luuRmUmihQw1/h1iaWpPoa7mgdWXdscMn2Ak+5F2OPB1OXwXWtp08Pzh7JKiO40FE
 pmQg==
X-Gm-Message-State: AOAM533AKTBdjbYzbyUzfrGQ8QisJ6VaOZ7c7DOxaV7+8JEG33Rvp92E
 RCXGj2G4zLofXrg07BQeLlQPjOqwCQip9+7DyHO+3xAy99yGw7eRrqmTSi9UGyjw98JTmHqPeSV
 zQ2Fwk8vKnnQZheBfGTFW6DEDbH+7jEmgKaLjwD20DPTOPiANj3VsQ/WnpObj
X-Received: by 2002:adf:bc48:: with SMTP id a8mr2437566wrh.19.1633449830784;
 Tue, 05 Oct 2021 09:03:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjDIvzfQiZtkQoQSan22UGJLft3XPPgEWl48cmC1lDkFfg3wUcRWZlLm/VGQnQYYUJuQqEUA==
X-Received: by 2002:adf:bc48:: with SMTP id a8mr2437528wrh.19.1633449830530;
 Tue, 05 Oct 2021 09:03:50 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id t15sm8836412wru.6.2021.10.05.09.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:49 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/57] acpi: arm: virt: build_dsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-42-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-28-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a9a78d904a..4b9687439d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -729,10 +729,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
+    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
+    acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
-    /* Reserve space for header */
-    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
 
     /* When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
      * While UEFI can use libfdt to disable the RTC device node in the DTB that
@@ -779,12 +780,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     aml_append(dsdt, scope);
 
-    /* copy AML table into ACPI tables blob and patch header there */
+    /* copy AML table into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 2, vms->oem_id,
-                 vms->oem_table_id);
+
+    acpi_table_end(linker, &table);
     free_aml_allocator();
 }
 
-- 
MST


