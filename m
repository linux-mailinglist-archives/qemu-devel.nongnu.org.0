Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E35422E1E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:37:41 +0200 (CEST)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnRk-0002GL-4u
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuD-0001KF-3y
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmu7-00064C-M1
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O14S/Nap5OwplpMPbE33Eg7WKkAgoaoLhJvZHDTVT6Q=;
 b=S00wStVOylPwJ4iQl1yMY5NCjfHmt1mpiqzDrGxYjaNvhNTYpyXfQcuw62xul97SwsiY5d
 ausF73zGPHdJd80UFD/1fZu1tgGfLuiD0m6gXUP/Eeg9SrxT3nBTaj9EGWt5uSU1FVkVE4
 MnQ9Dlq3xzd9IPaQtBIH2V1jap+5TqE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-JU4Yf8oXM_eomN67LWv2lg-1; Tue, 05 Oct 2021 12:02:54 -0400
X-MC-Unique: JU4Yf8oXM_eomN67LWv2lg-1
Received: by mail-wr1-f71.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5923444wrh.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O14S/Nap5OwplpMPbE33Eg7WKkAgoaoLhJvZHDTVT6Q=;
 b=clMgasPfRHdwol/emn44/rTcyCS8DV72T67+0+zJAt0c4gLCmFkXeV3j10LTqdu8bH
 fcfmrNiBvsVOp2h9LMVaxAcK+0h+gxozQxit/otxC7I0HM2liCAmzJQ+9l7mnzWIse5i
 7wRjsYVa0SCauX0cduZmKasoOCuSe6Sn8pZSupbUf0M+dfevve8ciddWI1Xy5v+UmBKl
 4ibtsA+0FIu5s5SPai2judRvyoGB3I5JhL/GFE3aZ2CI2iRNVs7Mamagg13Sh6Fer9lG
 ZKEue1f+TdEe5h0NsVhNWeSNYnT57+VNsjhlkoz09ACjZFiU1VbLsN6FyoGJUff2fIeP
 CIXA==
X-Gm-Message-State: AOAM531wcYwuaPTQ3ok0PxyIfNZ0e09fKRod97Uc+68dRD4/HU5v+cMS
 1dmgeaOYtF3oIJ+4a3DswQL8uFi0UgP0UAmtEwSRUrKXA5+bk5j86boaNRGkH8VlsCFfJHajwc+
 0fRuybdaUNQ8AU9hzYn8AKW+AKqPImcnGVU2HYvXYwWB/rpN8QreixDrkfYTc
X-Received: by 2002:adf:9bd3:: with SMTP id e19mr23156062wrc.167.1633449769179; 
 Tue, 05 Oct 2021 09:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFaRiC1qEA/NELnvelfZlSrZYUUDNymopJiIaBKWOq3W3zulO++wUccNyoKkA5mX4ygMMA3g==
X-Received: by 2002:adf:9bd3:: with SMTP id e19mr23155634wrc.167.1633449766187; 
 Tue, 05 Oct 2021 09:02:46 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id w1sm2248213wmc.19.2021.10.05.09.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:44 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/57] acpi: build_hpet: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-29-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

while at it convert build_hpet() to endian agnostic
build_append_FOO() API

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210924122802.1455362-15-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 13 -------------
 hw/i386/acpi-build.c        | 26 ++++++++++++++++++--------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index f6d2ca172b..4d8f8b34b0 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -358,19 +358,6 @@ struct AcpiGenericTimerTable {
 } QEMU_PACKED;
 typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 
-/*
- * HPET Description Table
- */
-struct Acpi20Hpet {
-    ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
-    uint32_t           timer_block_id;
-    struct AcpiGenericAddress addr;
-    uint8_t            hpet_number;
-    uint16_t           min_tick;
-    uint8_t            page_protect;
-} QEMU_PACKED;
-typedef struct Acpi20Hpet Acpi20Hpet;
-
 /*
  * SRAT (NUMA topology description) table
  */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e17451bc6d..12d743d529 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1871,22 +1871,32 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     free_aml_allocator();
 }
 
+/*
+ * IA-PC HPET (High Precision Event Timers) Specification (Revision: 1.0a)
+ * 3.2.4The ACPI 2.0 HPET Description Table (HPET)
+ */
 static void
 build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
            const char *oem_table_id)
 {
-    Acpi20Hpet *hpet;
-    int hpet_start = table_data->len;
+    AcpiTable table = { .sig = "HPET", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    hpet = acpi_data_push(table_data, sizeof(*hpet));
+    acpi_table_begin(&table, table_data);
     /* Note timer_block_id value must be kept in sync with value advertised by
      * emulated hpet
      */
-    hpet->timer_block_id = cpu_to_le32(0x8086a201);
-    hpet->addr.address = cpu_to_le64(HPET_BASE);
-    build_header(linker, table_data,
-                 (void *)(table_data->data + hpet_start),
-                 "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
+    /* Event Timer Block ID */
+    build_append_int_noprefix(table_data, 0x8086a201, 4);
+    /* BASE_ADDRESS */
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0, 0, 0, HPET_BASE);
+    /* HPET Number */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Main Counter Minimum Clock_tick in Periodic Mode */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Page Protection And OEM Attribute */
+    build_append_int_noprefix(table_data, 0, 1);
+    acpi_table_end(linker, &table);
 }
 
 #ifdef CONFIG_TPM
-- 
MST


