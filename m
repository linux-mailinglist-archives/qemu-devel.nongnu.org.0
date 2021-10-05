Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D71422E0B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:34:48 +0200 (CEST)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnOx-0005BO-It
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtF-0000mG-Uj
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtE-0005PV-86
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rct0JANkkDI5GIKB26klU3//BV/Oq9xx5ob6TEYXS/U=;
 b=VkUv/e715DCRCK02ouoY2ExuOH+yYjePTvrfcEoasl7NIepI182QTQCRhbUoCDa68skbk0
 9mmcycTNyR3YIzsula7IfuzcWMn+nFh/yWCCwi+T/uo4+v9mylATJ5WZ2ruTk+9w9TYAQg
 C+zTAd3nxQO8V+D8aAZebVt9oZlUu/k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-1S0WBL32OyGb6dje1olnjA-1; Tue, 05 Oct 2021 12:01:57 -0400
X-MC-Unique: 1S0WBL32OyGb6dje1olnjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z194-20020a1c7ecb000000b0030b7ccea080so1486762wmc.8
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rct0JANkkDI5GIKB26klU3//BV/Oq9xx5ob6TEYXS/U=;
 b=RPa+1gcPSAhf3G4dStG4A/d9VxnCwfT/UFZybHV46QDNQ7bmyJbCnUeGaZQ9nIozLo
 lBIVtxGoB7C+YRcy69LXYKAnfDgxRY0KHhQjNrwcjl6cQYP31pXbOmDf3WbC64UKNVm3
 G3J9VIEqgCE7LYon9LihGoGmLYtSNbHZ0P1q5rOJdfvezDhaVe0liCxitFy2RZ0/s6lX
 K3W4N8kqTbL2481LeigSNjwWKQmKGeiawOY30CqY64/G9Wk65ryBM/MyJ5jWWkl5X6Fx
 BuClJ8amuBWfdKdkr7EvZYOP+cB0dYJGjAFwc0YaCHAvS9s+YtcEQe+TqhpL3oErcatD
 G4NA==
X-Gm-Message-State: AOAM531C5RZMxRiUP5Ahv414Lzh3ToYUnP02Z6LG4T0EnH9rP0yG0H7u
 dgcxTwPS+kCasSrIJFNyTeGYMVY5HEKnR+cJ4nmZLYJwB5HzV5ELQIWx9xANe+g1xtkJUH1on86
 i50NHilJewDNgn5wiXBIzBVIegBlymTOgMBSwMRFZdsnZ7/trDXGsp/AGoKPT
X-Received: by 2002:a1c:1f86:: with SMTP id f128mr4370675wmf.124.1633449715556; 
 Tue, 05 Oct 2021 09:01:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi0j32N1RVV63zlKIm4niFHbdQoVOxjv7+F7HQt4dm8sbw5lddibcMAEAcORgm7JwZjBwprw==
X-Received: by 2002:a1c:1f86:: with SMTP id f128mr4370624wmf.124.1633449715176; 
 Tue, 05 Oct 2021 09:01:55 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id o12sm2998168wms.15.2021.10.05.09.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:53 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/57] acpi: build_fadt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-20-mst@redhat.com>
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
Message-Id: <20210924122802.1455362-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/aml-build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index ec870f53ba..4d0ff6e5f3 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1982,9 +1982,10 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
 {
     int off;
-    int fadt_start = tbl->len;
+    AcpiTable table = { .sig = "FACP", .rev = f->rev,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    acpi_data_push(tbl, sizeof(AcpiTableHeader));
+    acpi_table_begin(&table, tbl);
 
     /* FACS address to be filled by Guest linker at runtime */
     off = tbl->len;
@@ -2048,7 +2049,7 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
 
     if (f->rev == 1) {
-        goto build_hdr;
+        goto done;
     }
 
     build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
@@ -2085,7 +2086,7 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
 
     if (f->rev <= 4) {
-        goto build_hdr;
+        goto done;
     }
 
     /* SLEEP_CONTROL_REG */
@@ -2096,9 +2097,8 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     /* TODO: extra fields need to be added to support revisions above rev5 */
     assert(f->rev == 5);
 
-build_hdr:
-    build_header(linker, tbl, (void *)(tbl->data + fadt_start),
-                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
+done:
+    acpi_table_end(linker, &table);
 }
 
 #ifdef CONFIG_TPM
-- 
MST


