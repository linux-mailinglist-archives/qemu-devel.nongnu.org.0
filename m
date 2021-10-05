Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D97422E8C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:54:52 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXniN-000722-Gt
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmwE-0002UR-SZ
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmwD-0007q4-1O
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mu9xnyW+1taNhY3PRRzUfTRjJRG2AuAujyDOpNuF+30=;
 b=I/qGz48EcIejhMyktZuQISyFEYF9VMR7oyoPJjozcRGU5kOB17KVSD91LGopjovg7Sbnv6
 pQyQ32JkIDalM1Lt5DNOJ6wI+Ae1VkBL9cHzBDocnA8ql8FvlUq1hGn0IH1vg1/zIB4E6v
 HJ7wrR6hWrIgndS6yI/xIaLDO/Gyu1s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-909-QsX7Pxip4Wzmu4MA-g-1; Tue, 05 Oct 2021 12:02:14 -0400
X-MC-Unique: 909-QsX7Pxip4Wzmu4MA-g-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so2192415wrb.14
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mu9xnyW+1taNhY3PRRzUfTRjJRG2AuAujyDOpNuF+30=;
 b=TmHeH+aNz2DHH/eHSjMqAt35WtIj2Th0c4HvlR8a6KA/ET0duzwWFm7ObzrrUCsLzK
 G9jQ43XfoFZ6KAOWiFnwNlpniFoYex/NfImNpxijGVDxe4MI0PL55D/+Loq+53ruF1zK
 Qk5MYmIrktkFXePGDPfZxRRE33F9pqh6NGGsSlPWeTPX6hOTH6Lf90VNbFUNhfOru+Ow
 UXf8SMWSEENkteWlPjB1Z3uRcGp5Wu9zo189ebe/Fk/rWqGOPjBh9ln7u1UhuRxo5MXk
 aONaBTdPBZFuJpyCucgZFd4oM2DwEivKZRXnMap0MAKsGoqL4IF/qvHl/6MxWGsW49q5
 jWvg==
X-Gm-Message-State: AOAM530uSENZKU1JKG08hftR/nAEqTIxhG4ouASr57E8Sorw8UNv0GDl
 HeyWrFAzPUFPp7noXqDHJNDN170xmlFl9fFYIFnYsmb0H7huvVtA19fO3v3OksAjIc4NbU/+4qo
 GG57d3hkgaO98YrY3YO/nvyZzcGg3n+3OQOqRFcaPlMtxclpl0NaPB1TZ5fX2
X-Received: by 2002:adf:a292:: with SMTP id s18mr3881233wra.42.1633449732454; 
 Tue, 05 Oct 2021 09:02:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzUVlGszHLJnPwykD3Uvmewm9caC3u2yYJVb7DWtFdcuxNtbdjd+rGHKI9D0K+3uT6At85MA==
X-Received: by 2002:adf:a292:: with SMTP id s18mr3880687wra.42.1633449728657; 
 Tue, 05 Oct 2021 09:02:08 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id c7sm3140606wmq.13.2021.10.05.09.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:07 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/57] acpi: build_mcfg: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-23-mst@redhat.com>
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index 75b1103ec4..20b70dcd81 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -28,19 +28,20 @@
 #include "hw/acpi/pci.h"
 #include "hw/pci/pcie_host.h"
 
+/*
+ * PCI Firmware Specification, Revision 3.0
+ * 4.1.2 MCFG Table Description.
+ */
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id)
 {
-    int mcfg_start = table_data->len;
+    AcpiTable table = { .sig = "MCFG", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
+
+    acpi_table_begin(&table, table_data);
 
-    /*
-     * PCI Firmware Specification, Revision 3.0
-     * 4.1.2 MCFG Table Description.
-     */
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
     /* Reserved */
     build_append_int_noprefix(table_data, 0, 8);
-
     /*
      * Memory Mapped Enhanced Configuration Space Base Address Allocation
      * Structure
@@ -56,6 +57,5 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
     /* Reserved */
     build_append_int_noprefix(table_data, 0, 4);
 
-    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
-                 "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
-- 
MST


