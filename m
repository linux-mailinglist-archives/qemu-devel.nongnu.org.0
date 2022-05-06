Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34F251E06A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:54:28 +0200 (CEST)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4y3-0005Vb-N1
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4sf-0003dZ-60
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4sd-0005sX-FF
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwtM1BStAEsBHeSlCEBJdNlfvsyKrwHq7cqUECPsRI0=;
 b=iEjdPC5AGGsCO2ZcGMg3U5t0gVshHpDKgUAB1WSZ0uj5eosVWcGSTyDow498apyyHa4ewA
 hpV/zBCOokDnYddbVquijT+6akSBSxZJemkWvtYFqolCtGsrOS1FsAE2p7dj1QdHRZfn1O
 qySAQdeD5gLW/+2FC9Fqvp96Wak8B+g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-HmlYbjsZPfmIzRDwi2LAMw-1; Fri, 06 May 2022 16:48:47 -0400
X-MC-Unique: HmlYbjsZPfmIzRDwi2LAMw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52D0285A5BE;
 Fri,  6 May 2022 20:48:47 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA5AD463ECE;
 Fri,  6 May 2022 20:48:46 +0000 (UTC)
Subject: [PULL 08/11] vfio/common: remove spurious tpm-crb-cmd misalignment
 warning
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Berger <stefanb@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
Date: Fri, 06 May 2022 14:48:46 -0600
Message-ID: <165187012260.4166595.17350804429234248544.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Eric Auger <eric.auger@redhat.com>

The CRB command buffer currently is a RAM MemoryRegion and given
its base address alignment, it causes an error report on
vfio_listener_region_add(). This region could have been a RAM device
region, easing the detection of such safe situation but this option
was not well received. So let's add a helper function that uses the
memory region owner type to detect the situation is safe wrt
the assignment. Other device types can be checked here if such kind
of problem occurs again.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Link: https://lore.kernel.org/r/20220506132510.1847942-3-eric.auger@redhat.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c     |   27 ++++++++++++++++++++++++++-
 hw/vfio/trace-events |    1 +
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6065834717eb..cfcb71974a61 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -861,6 +862,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
+{
+    MemoryRegion *mr = section->mr;
+
+    if (!TPM_IS_CRB(mr->owner)) {
+        return false;
+    }
+
+    /* this is a known safe misaligned region, just trace for debug purpose */
+    trace_vfio_known_safe_misalignment(memory_region_name(mr),
+                                       section->offset_within_address_space,
+                                       section->offset_within_region,
+                                       qemu_real_host_page_size());
+    return true;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -884,7 +901,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
     if (unlikely((section->offset_within_address_space &
                   ~qemu_real_host_page_mask()) !=
                  (section->offset_within_region & ~qemu_real_host_page_mask()))) {
-        error_report("%s received unaligned region", __func__);
+        if (!vfio_known_safe_misalignment(section)) {
+            error_report("%s received unaligned region %s iova=0x%"PRIx64
+                         " offset_within_region=0x%"PRIx64
+                         " qemu_real_host_page_size=0x%"PRIxPTR,
+                         __func__, memory_region_name(section->mr),
+                         section->offset_within_address_space,
+                         section->offset_within_region,
+                         qemu_real_host_page_size());
+        }
         return;
     }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 0ef1b5f4a65f..582882db91c3 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
 vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
+vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uintptr_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_size=0x%"PRIxPTR ": cannot be mapped for DMA"
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64



