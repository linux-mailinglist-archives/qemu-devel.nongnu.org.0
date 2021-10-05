Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3D422E47
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:46:46 +0200 (CEST)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnaX-00008u-A6
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvW-0002FO-PW
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvU-0007Fb-Pe
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0PANg3UMhdpM5Nn2b2Ias45rHv5Z0AE9cqmvr/cfJ94=;
 b=eRQpuxlY8K+MdDtMspamtD41CrRqn558nptFr1kFeEODM0zjiSxhf2eh5zulPGsc2IQohl
 +6dda6EjSfIOsHCQg9tTzUsXy444JpuFFZoWAVE6TSxcaI5E/zd4Idl5ZrSClzTF/vztg8
 sRI6NlSebJq8w4ZvmcSSduqLut3TdwQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-NOll4cHTMXWA_zv7nIw2wQ-1; Tue, 05 Oct 2021 12:04:16 -0400
X-MC-Unique: NOll4cHTMXWA_zv7nIw2wQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f11-20020a7bcd0b000000b0030d72d5d0bcso1460702wmj.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0PANg3UMhdpM5Nn2b2Ias45rHv5Z0AE9cqmvr/cfJ94=;
 b=0fzvbVExdyslOAflfPMdzUNSMmwL/bXEOeOb2U5D9KoOC2pqDb4rV2IvknOo8Gh6hl
 9eP5v9oNc6AhlycgpnGRNW77FzeEQnAkpUpYK8QfIngUxGiSwfg7MNYQjIunyaHypDmy
 a/i4Y7pUJFk/npTTP7KteCyt6ILbqx5eNWHvh+BhgrJz0kTUapouBaRObLIAMV+fU7Qg
 1awdD9iex0ptmay3zc4dDrGM/04jNUeQ5lY2FtMAFT8SWDcZnIy0WKKzWz6uLHvcMoIB
 sDLGE+L26FcAq/4CHP1FR397DVprW0XPiH+3hjd1EkOCv8+IPv3TpM+cWoFjxXfZsiYC
 x2mA==
X-Gm-Message-State: AOAM531iXqdywvRlsEGzQ2K+kWA7o7m3VYhlryfVsyy6R8+ttVg2SFCv
 WgCGcMNlK0scOZ2rM6miFFEogVu/HHZMRFkOp5SnoJx1JSMLY0/h2fjd5bbnJ9iiNVVX2SycABH
 SfBEe/z5dle9kIR1j9VP+Wh9OQlpvIjC6gDt3xBjZOg7IGOzvz/0R6VTrS6oj
X-Received: by 2002:a1c:f219:: with SMTP id s25mr4234734wmc.31.1633449854129; 
 Tue, 05 Oct 2021 09:04:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0+PxQeHiVrzwrdMfuz55qMMgu71CBU9mb4TG7AwDd9Lg44xU2W9rV9iXsUCRehAal01Yw1Q==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr4234700wmc.31.1633449853861; 
 Tue, 05 Oct 2021 09:04:13 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id q10sm2275160wmq.12.2021.10.05.09.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:13 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 47/57] acpi: build_facs: use build_append_int_noprefix() API
 to compose table
Message-ID: <20211005155946.513818-48-mst@redhat.com>
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
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Drop usage of packed structures and explicit endian
conversions when building table and use endian agnostic
build_append_int_noprefix() API to build it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-34-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 14 --------------
 hw/i386/acpi-build.c        | 18 ++++++++++++++----
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 0b375e7589..1a0774edd6 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -117,18 +117,4 @@ typedef struct AcpiFadtData {
 #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
 #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
 
-/*
- * ACPI 1.0 Firmware ACPI Control Structure (FACS)
- */
-struct AcpiFacsDescriptorRev1 {
-    uint32_t signature;           /* ACPI Signature */
-    uint32_t length;                 /* Length of structure, in bytes */
-    uint32_t hardware_signature;     /* Hardware configuration signature */
-    uint32_t firmware_waking_vector; /* ACPI OS waking vector */
-    uint32_t global_lock;            /* Global Lock */
-    uint32_t flags;
-    uint8_t  resverved3 [40];        /* Reserved - must be zero */
-} QEMU_PACKED;
-typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
-
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d9e2b5dc30..81418b7911 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -345,13 +345,23 @@ static void acpi_align_size(GArray *blob, unsigned align)
     g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
 }
 
-/* FACS */
+/*
+ * ACPI spec 1.0b,
+ * 5.2.6 Firmware ACPI Control Structure
+ */
 static void
 build_facs(GArray *table_data)
 {
-    AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
-    memcpy(&facs->signature, "FACS", 4);
-    facs->length = cpu_to_le32(sizeof(*facs));
+    const char *sig = "FACS";
+    const uint8_t reserved[40] = {};
+
+    g_array_append_vals(table_data, sig, 4); /* Signature */
+    build_append_int_noprefix(table_data, 64, 4); /* Length */
+    build_append_int_noprefix(table_data, 0, 4); /* Hardware Signature */
+    build_append_int_noprefix(table_data, 0, 4); /* Firmware Waking Vector */
+    build_append_int_noprefix(table_data, 0, 4); /* Global Lock */
+    build_append_int_noprefix(table_data, 0, 4); /* Flags */
+    g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
-- 
MST


