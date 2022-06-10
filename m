Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF3546117
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:10:21 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaeq-0000LW-OB
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXv-0001tT-V5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXs-0006OH-LW
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BvSCk+gp0FY+trDsLWt66bGN2C04X9sZi/rII2QilmY=;
 b=XICRXL1FIz2Q1JZMEJktmO2TXQYdtCATWJmEPdTSRtMddLVytFQKPOPfX47a7v7dQOIUFl
 FmVCrnhOK3R6lf63Nvm0oJ/tG953svemKjvvLkwLqEUHDcxPDPtGzqvL8Ig/lvOAEDuKnh
 KwaLnwK9XgTVEQ8OmwN2YkQaUF+lbhw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-O0y7nogCPGG_tK6cEffQpw-1; Fri, 10 Jun 2022 03:58:57 -0400
X-MC-Unique: O0y7nogCPGG_tK6cEffQpw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e9-20020a5d5949000000b00216ffb6df18so4193976wri.14
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BvSCk+gp0FY+trDsLWt66bGN2C04X9sZi/rII2QilmY=;
 b=Ern9GtZyNDmSmjWAXAzBeFUtCyumTZIjeTYJKM0Nmxnwy1T3Eps4Q0yqgIwjY8m26V
 hOj2DzylIAa6UTBewhZK/1mZ0gnUGjbcfoAF3hIOCC+oJneokg5wzbV1oImhkSsEnb5z
 Qvtakqe1ZO5hddGy8b0z2Ga/WIpzYtu5Z4PMH3amsdPv/pIhMPG+8gKG6IpVB9m8BRDu
 igVDcYQv8aHWLrZ4Z5vITWjwnAzn80CixBJayNhVrUIhApyuk5IZYcpLxGQAZ2ypKheI
 gz/kBooQ2p0Kn5B9TAKA3OfgGu204tlj9IGc8b3wvqxSTc9bgwTd8qSETk1T/2GylVkz
 7GVQ==
X-Gm-Message-State: AOAM531ND3rQz6iCrvqpU8y4U4Twgit/kdpwEHjQTp9Tyt59Ob7iyoI0
 nVz7ynaB0/3LrZY+iObZ/qE4N14pyQ9tb4y50tZk4atGSoDJ336asJCehkiN4Kp7KmRrX2/LvFQ
 BwO5Lf9S2bEnTYkPY1ovznQCv44ZAEqOLmQVFMrO44z7fNTCisaXjOuk2mBQF
X-Received: by 2002:adf:df8e:0:b0:210:2e5c:695d with SMTP id
 z14-20020adfdf8e000000b002102e5c695dmr43353752wrl.423.1654847934766; 
 Fri, 10 Jun 2022 00:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCZ9+C2Q1dd6SnDMU8CgIhmjot5zf6DPtlsn6mgBe0psnCY0rjuGE6LjQ8RM36lZZiVK38jg==
X-Received: by 2002:adf:df8e:0:b0:210:2e5c:695d with SMTP id
 z14-20020adfdf8e000000b002102e5c695dmr43353723wrl.423.1654847934448; 
 Fri, 10 Jun 2022 00:58:54 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b0039c3056c3dfsm2651208wms.27.2022.06.10.00.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:54 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 37/54] hw/acpi/cxl: Pass in the CXLState directly rather than
 MachineState
Message-ID: <20220610075631.367501-38-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Refactoring step on path to moving all CXL state out of
MachineState.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
Message-Id: <20220608145440.26106-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/cxl.h | 5 +++--
 hw/acpi/cxl.c         | 9 ++++-----
 hw/i386/acpi-build.c  | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
index 0c496538c0..acf4418886 100644
--- a/include/hw/acpi/cxl.h
+++ b/include/hw/acpi/cxl.h
@@ -19,10 +19,11 @@
 #define HW_ACPI_CXL_H
 
 #include "hw/acpi/bios-linker-loader.h"
+#include "hw/cxl/cxl.h"
 
-void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
+void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
                     BIOSLinker *linker, const char *oem_id,
-                    const char *oem_table_id);
+                    const char *oem_table_id, CXLState *cxl_state);
 void build_cxl_osc_method(Aml *dev);
 
 #endif
diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 31d5235136..2bf8c07993 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -65,9 +65,8 @@ static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
  * Interleave ways encoding in CXL 2.0 ECN: 3, 6, 12 and 16-way memory
  * interleaving.
  */
-static void cedt_build_cfmws(GArray *table_data, MachineState *ms)
+static void cedt_build_cfmws(GArray *table_data, CXLState *cxls)
 {
-    CXLState *cxls = ms->cxl_devices_state;
     GList *it;
 
     for (it = cxls->fixed_windows; it; it = it->next) {
@@ -129,9 +128,9 @@ static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
     return 0;
 }
 
-void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
+void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
                     BIOSLinker *linker, const char *oem_id,
-                    const char *oem_table_id)
+                    const char *oem_table_id, CXLState *cxl_state)
 {
     Aml *cedt;
     AcpiTable table = { .sig = "CEDT", .rev = 1, .oem_id = oem_id,
@@ -144,7 +143,7 @@ void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
     /* reserve space for CEDT header */
 
     object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb, cedt);
-    cedt_build_cfmws(cedt->buf, ms);
+    cedt_build_cfmws(cedt->buf, cxl_state);
 
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, cedt->buf->data, cedt->buf->len);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f41e14a469..663c34b9d1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2615,8 +2615,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                           x86ms->oem_id, x86ms->oem_table_id);
     }
     if (machine->cxl_devices_state->is_enabled) {
-        cxl_build_cedt(machine, table_offsets, tables_blob, tables->linker,
-                       x86ms->oem_id, x86ms->oem_table_id);
+        cxl_build_cedt(table_offsets, tables_blob, tables->linker,
+                       x86ms->oem_id, x86ms->oem_table_id, machine->cxl_devices_state);
     }
 
     acpi_add_table(table_offsets, tables_blob);
-- 
MST


