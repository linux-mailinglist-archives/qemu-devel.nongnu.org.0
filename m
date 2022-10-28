Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47D610EA8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:36:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMiC-0006mp-B6; Fri, 28 Oct 2022 06:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooMi7-0006lg-E4; Fri, 28 Oct 2022 06:35:35 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooMi5-0001jN-Pf; Fri, 28 Oct 2022 06:35:35 -0400
Received: by mail-ed1-x532.google.com with SMTP id a5so7212676edb.11;
 Fri, 28 Oct 2022 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjyyw6XSUvwVzBhL8WZKkTOeS8jyps+AR2UJlYWQ3zA=;
 b=ZdygQ7GZAFpUsMCLjc1nqC0+GDRsdXWukUMqPXF63SKq7nrUGi6BrQhuLv+84u97M5
 etD6o8asQCsdcvVnvTY4dYvd3AF1HecC9GRZ6HojRdRhdmNR0iv8gVh/aRT6a1gUSU8E
 ST4DW1EnG6KBsYeCR7Tf/JcJgTj4SFvJIc89Sh1B5UX6HW62ntPHTjQEe9F97pFKdixM
 Q/U5GEsGkX7psYa/swxY9wk8NUYGX1jvXHCGricw/WCuldb1Vug9qikG674/Ot3/mf0y
 FA1HA6BOWXyjcKLiTMi47OuTMCtaecBKRY1Ejr+7Ygm3LCTwbc+jv6MnM+z/5wHgzb39
 2wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjyyw6XSUvwVzBhL8WZKkTOeS8jyps+AR2UJlYWQ3zA=;
 b=5TORlt8TpbOgsljMzO92H6bNTYdjZXkC1u+SA5QOjiGOW615jFL066dZVkt2No0JWC
 ajB0YMszsiyuAMrvv6AV7L7hmfArnssqyIraRiQ3jzrPTZZO3rvzNnsWTJVRvnVpC1y+
 L19V953RQGE1WR0b+WEtBQ6R58BAN4AO2LPiGDWYIKjkJr3kx5de+N6Czjx+PXKpxwru
 AzR9uLEU4LjCRmN/yx2qZl5hU8emqVO0YkY44GMHnqH8+dgd16qx/7sme0okJdbGiI43
 0Ngp0dAsdSLicXxzP2uNvUlopPHeQW7maDZ9qMbNZZRWto2UyJcihTdlIpu6tSmeLDIc
 fErA==
X-Gm-Message-State: ACrzQf3kxHbsSKV4nWhmQPwqCxvwSoD6RX646RC02zFvSzodhK31XDFo
 PCct4Y4zCIuk0Imi5s2ZeAfYrmhyy9I=
X-Google-Smtp-Source: AMsMyM7FlzSUqRxrHkPo5Va1RZIhnkJoqBD4tizYoXfci8rmMdqaWukxF+zLFoV1uIcdVwB1/HtceQ==
X-Received: by 2002:a05:6402:40d0:b0:462:7b99:d424 with SMTP id
 z16-20020a05640240d000b004627b99d424mr9809679edb.62.1666953331765; 
 Fri, 28 Oct 2022 03:35:31 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b0078128c89439sm2050527ejo.6.2022.10.28.03.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:35:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than south
 bridges
Date: Fri, 28 Oct 2022 12:34:19 +0200
Message-Id: <20221028103419.93398-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028103419.93398-1-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
AML generation has been moved into the south bridges and since the
machines define themselves primarily through their north bridges, let's
switch to resolving the north bridges for AML generation instead. This
also allows for easier experimentation with different south bridges in
the "pc" machine, e.g. with PIIX4 and VT82xx.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 73d8a59737..d9eaa5fc4d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -60,6 +60,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci-host/i440fx.h"
 #include "hw/pci-host/q35.h"
 #include "hw/i386/x86-iommu.h"
 
@@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
            Range *pci_hole, Range *pci_hole64, MachineState *machine)
 {
-    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
-    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
+    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
+    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
     CrsRangeEntry *entry;
     Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
     CrsRangeSet crs_range_set;
@@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
 
-    assert(!!piix != !!lpc);
+    assert(!!i440fx != !!q35);
 
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
     build_dbg_aml(dsdt);
-    if (piix) {
+    if (i440fx) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
@@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_piix4_pci0_int(dsdt);
-    } else if (lpc) {
+    } else if (q35) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-- 
2.38.1


