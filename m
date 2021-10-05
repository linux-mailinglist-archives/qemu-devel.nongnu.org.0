Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB276422DF7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:29:21 +0200 (CEST)
Received: from localhost ([::1]:47352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnJg-0005s4-RM
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmts-0001EF-7z
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmto-0005om-5j
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6qYsjx2thlrSC+Rpf1F8d62tJ8rgin8MMtTqkd/rDY=;
 b=P2zIZk5yiwQ0rwtBC/KAAerEb5C4Y0yq0TYEIvZwsiiyL5cSDXqskaqDHqa8+O+WUB6TJj
 uNSedOmYhJxO+poAZwyLY1HUH5lLFTLrAZ/3HUrpLsoWvRVkrCK7pZ86uQcjmGU3gftwuS
 d9expD5AT2KgNJbkwsXmEQqE7kyh2dU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-S3qykfYBM4KOkFO2v_RH8A-1; Tue, 05 Oct 2021 12:02:34 -0400
X-MC-Unique: S3qykfYBM4KOkFO2v_RH8A-1
Received: by mail-wm1-f69.google.com with SMTP id
 129-20020a1c1987000000b0030cd1616fbfso1494595wmz.3
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n6qYsjx2thlrSC+Rpf1F8d62tJ8rgin8MMtTqkd/rDY=;
 b=5FnZ1ZbRKYWtck2lXeyuZORTsXIQttjbfCrKEKvThMkotTgdCrjmOHPcDfjhnTAQnR
 uTKFJ8Z9cN5X6VzjSEdEww0xUZGDP6qmZ5yNMA0miyIUEBl/TvUrviqpVK01JY/wQFDB
 yLqcx28/efVIg4p5Rj7zzJbNsepMboC3TZax+eLB1MTbXjzu7GnTBZ9b9OahwzeGtg41
 7U2b64Nwc7OKyi5u29soPcpagl0R18bVPoTLqtWK5JQHkO4KM/SbQ4HLhmTsegFTg7Ea
 B375vG0y6Piy1OwRI8lCG6HMt+RiyUJqIv/FKuAGQvOaV+M2bezOe18c5gK864lItx8Z
 0rvA==
X-Gm-Message-State: AOAM532gWyqmmYMB2P95kPVBITafaqRRb+wGUtylkSGZOSANaIiXLLv9
 zgoHElaCDsNpjhPeYllMrqDoJutYH7rI3Yqp9at5339oVz5/vRfEyYZ51rKUa5byCWY+3M6E8YA
 EeJojzBzNejZcmjmAkyz6UdTgAi5pVDhLAVm9pWC7JsE2+6A52jeM3AM2TqV0
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr22849665wrr.371.1633449752959; 
 Tue, 05 Oct 2021 09:02:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAz0M7oi8ssmtZaoDdhFuY0Jz5XrtPt9UwhmSJbCAPJlDsRqgltuzA0Lgc+biwmrOvrmldNg==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr22849633wrr.371.1633449752757; 
 Tue, 05 Oct 2021 09:02:32 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id u5sm18917658wrg.57.2021.10.05.09.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:29 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/57] acpi: vmgenid_build_acpi: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-27-mst@redhat.com>
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
Message-Id: <20210924122802.1455362-13-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/vmgenid.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 4f41a13ea0..0c9f158ac9 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -29,6 +29,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
     uint32_t vgia_offset;
     QemuUUID guid_le;
+    AcpiTable table = { .sig = "SSDT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = "VMGENID" };
 
     /* Fill in the GUID values.  These need to be converted to little-endian
      * first, since that's what the guest expects
@@ -42,12 +44,10 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     g_array_insert_vals(guid, VMGENID_GUID_OFFSET, guid_le.data,
                         ARRAY_SIZE(guid_le.data));
 
-    /* Put this in a separate SSDT table */
+    /* Put VMGNEID into a separate SSDT table */
+    acpi_table_begin(&table, table_data);
     ssdt = init_aml_allocator();
 
-    /* Reserve space for header */
-    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
-
     /* Storage for the GUID address */
     vgia_offset = table_data->len +
         build_append_named_dword(ssdt->buf, "VGIA");
@@ -116,9 +116,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
         ACPI_BUILD_TABLE_FILE, vgia_offset, sizeof(uint32_t),
         VMGENID_GUID_FW_CFG_FILE, 0);
 
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - ssdt->buf->len),
-        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID");
+    /* must be called after above command to ensure correct table checksum */
+    acpi_table_end(linker, &table);
     free_aml_allocator();
 }
 
-- 
MST


