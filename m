Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2DC422E8A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:54:44 +0200 (CEST)
Received: from localhost ([::1]:52708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXniF-0006fR-F8
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmui-0001i2-7e
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmug-0006Z9-8n
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PTZ0QEKaqIGauDOtftBKPDb8LmMe7stdH5L6Fe5udyY=;
 b=a2Gf9+rpHUGuHMVPETTjJpvhRVlXVR1dR8RAAod/LoSo7i3WKxJbAHzbpCIQ8Q0ckU5kir
 zV9/OCWpKe6RtDVtDwaZNHj+UhABrfujBY7JBoggQlPZaBPKVrXbJxF+UL9FuW3A9KAOeU
 bS7yzeUkSHmuO3bEhXTs9Yo1CU/0vs4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-7HL3FJaxOEK_MlcJLiAUOw-1; Tue, 05 Oct 2021 12:03:27 -0400
X-MC-Unique: 7HL3FJaxOEK_MlcJLiAUOw-1
Received: by mail-wm1-f72.google.com with SMTP id
 x3-20020a05600c21c300b0030d2b0fb3b4so7772285wmj.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PTZ0QEKaqIGauDOtftBKPDb8LmMe7stdH5L6Fe5udyY=;
 b=GFeCBGIpcsTsq4jBcT4ltjkssms+OR7q5onBtsutUMJ/f0Lu83UDpNiKhMydF4uLSn
 2wc/Vfu1LFuZ3mwkEJxadUHIQhAg5/rewqgH2ua0U5KuTsm7w+oz1t1JLJA/RCdaxSog
 yYpVBt8winwR6+dhtAa5UZOK5N4Za2dnzeAbsTS1zt5adv3wG1EgKHCPqINs2eZOZ0y5
 54LcDhVnDFiA5l7lny23/49skqp8c4dZAKxYctrmojZEw0c1u0RyzoMujofDADrtRFCi
 G2LgT9v0aC2cAXr/OvFhdt3L0BHemsTSuFxjrK0efxUR/Ynq/dW/r/XdCXVi9qFmALBW
 zkPg==
X-Gm-Message-State: AOAM530xjxYI/Uut9KVLJhnbciX+tFEtx0ndD4ceIaf5THlYd8lkh303
 59dJaSHX4YjQLt/kanHG4W+Vp99Wy4qt+WBUF1tdhaueTDuS09CEz9I+kNb5a1JpZmKPjVFKc6z
 e9BKYwO+lX4lVqMd8o3z36QVmBGyhRf7Lf1yWPTo8VGB9GXR71FcIOxHKWq7v
X-Received: by 2002:adf:9b91:: with SMTP id d17mr16923541wrc.131.1633449804079; 
 Tue, 05 Oct 2021 09:03:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypHUfhAE7VxUcSbesdFU3JJjdD0Ibk884neWAmTOpYmuORA6tSJYzmAXmexg9eI4OXJoA23Q==
X-Received: by 2002:adf:9b91:: with SMTP id d17mr16923340wrc.131.1633449802612; 
 Tue, 05 Oct 2021 09:03:22 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id c204sm2455716wme.11.2021.10.05.09.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:21 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/57] acpi: build_amd_iommu: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-35-mst@redhat.com>
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-21-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e5cc4f7daa..d9e2b5dc30 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2341,12 +2341,12 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
                 const char *oem_table_id)
 {
     int ivhd_table_len = 24;
-    int iommu_start = table_data->len;
     AMDVIState *s = AMD_IOMMU_DEVICE(x86_iommu_get_default());
     GArray *ivhd_blob = g_array_new(false, true, 1);
+    AcpiTable table = { .sig = "IVRS", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
 
-    /* IVRS header */
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_table_begin(&table, table_data);
     /* IVinfo - IO virtualization information common to all
      * IOMMU units in a system
      */
@@ -2431,10 +2431,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
                                  0x48,                      /* special device */
                                  8);
     }
-
-    build_header(linker, table_data, (void *)(table_data->data + iommu_start),
-                 "IVRS", table_data->len - iommu_start, 1, oem_id,
-                 oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 typedef
-- 
MST


