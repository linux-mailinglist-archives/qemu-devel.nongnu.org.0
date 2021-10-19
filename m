Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3174334DE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:38:33 +0200 (CEST)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnRw-0001M3-AD
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAo-0000Gt-8U
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAY-0002K4-7k
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiJ0iHIZ1ouAmADpp/YMcXYNacyY5H2Zjhw9Phv+fQ0=;
 b=hPUL3plVbmTiiqvRQWHZNHbkjUvGJ0/RrGwFEpEIggrdH8yDswsxKr/4o5aoDrj38q5yYq
 Xuw0joBbLtCxPIyR8PICBPSWwX8TDr2OR7wTa9CapBWvQpjflHbYL97ETnDR23OtrOEz8E
 EMe1QgFLVkr046MGOBTwbUvsxbcamHU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-apHvNFdZOlu2RRa2rDeoEg-1; Tue, 19 Oct 2021 07:20:32 -0400
X-MC-Unique: apHvNFdZOlu2RRa2rDeoEg-1
Received: by mail-ed1-f72.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so17280327edq.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QiJ0iHIZ1ouAmADpp/YMcXYNacyY5H2Zjhw9Phv+fQ0=;
 b=pQcDwPCLU2ypEEIJWuomQXpkVs/aGacHUBDcCa6cwDFgY5dedhbeuUAR+MKR3TWMO+
 XIDt0Q8ezbF0ukmiF+q89zbGTBAEwKQC3/a29vO6mqxEqkKhv/s2zKqreeO1F5ZuwiqW
 k3pmfPE8ZKHkZPakgkN+navvoia5dRCYTWKc1yD5TQHnSTlMpUKLOCPsxO3fEMawzBXx
 7Gfi1S2/UKQvI3NeS4x2f8yS0LdzWlG7tS2ZJ3bq2TI0twnA8jBVe32rCzz50yZyJH9J
 9QrpU724st2OX14EPeazMZrtnSB2+85EoSpq1j5twS0aosXUynBHF3jRAuKoHKDdyP24
 38gw==
X-Gm-Message-State: AOAM533kiiodCVCk8gPPStM5xdzw8amh/bwMZiiLCO69DfPvBXgH7HiX
 tejJewls2MF7jkZqPhxIIxQgBhvgX/S1GAB+LRMr5vfZPfDZxASrnrhdhyU3pia+2AmWOaXtq6S
 P8HAWXO5WHnu4MQfRwLFLkEHZzOdJR8s3KJYursGM+roUElmWcMfVbMaNJFYZ
X-Received: by 2002:a17:906:a382:: with SMTP id
 k2mr35626781ejz.454.1634642430830; 
 Tue, 19 Oct 2021 04:20:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOLqLi92e1f9WPcRVbfPzvmG62YcOx7ArAhySXGwg7CDdN7jxoVFaT4Y2/dhEwBPQa6Jd6yQ==
X-Received: by 2002:a17:906:a382:: with SMTP id
 k2mr35626751ejz.454.1634642430596; 
 Tue, 19 Oct 2021 04:20:30 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id t19sm10197186ejb.115.2021.10.19.04.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:30 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/29] vdpa: Add vhost_vdpa_section_end
Message-ID: <20211019111923.679826-18-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Abstract this operation, that will be reused when validating the region
against the iova range that the device supports.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211014141236.923287-3-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ea1aa71ad8..be7c63b4ba 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -24,6 +24,19 @@
 #include "trace.h"
 #include "qemu-common.h"
 
+/*
+ * Return one past the end of the end of section. Be careful with uint64_t
+ * conversions!
+ */
+static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
+{
+    Int128 llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+
+    return llend;
+}
+
 static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
@@ -160,10 +173,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
     }
 
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
-
+    llend = vhost_vdpa_section_end(section);
     if (int128_ge(int128_make64(iova), llend)) {
         return;
     }
@@ -221,9 +231,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     }
 
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    llend = vhost_vdpa_section_end(section);
 
     trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
 
-- 
MST


