Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAAF65B12B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:31:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJ0g-00078H-2q; Mon, 02 Jan 2023 06:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0d-00077u-Oh
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0c-00080U-8L
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672658977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgBlRhIgOZOPZH7qzz7ywSmK47hj7d/oFGkRU7+f2PU=;
 b=jHR1jcQ34zwRlibolhyu6bBdii/UqUn60tdpdKvZCd6Chu7wn/6ugLZdfbc6ooaCBILGaq
 l/GWRkEYsTwrxsgeY/iRBBYtHV0G7rwFnPlHnQaMpFWObb0ST2+FP/FP/S17pBHaZltt++
 D7XBY3Kg5nVZgAZey7YJvXgeWbc5IAk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-xo9k7LMUMHimf9Q_8vfmNQ-1; Mon, 02 Jan 2023 06:29:32 -0500
X-MC-Unique: xo9k7LMUMHimf9Q_8vfmNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE30D85A588;
 Mon,  2 Jan 2023 11:29:31 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F30D40C2064;
 Mon,  2 Jan 2023 11:29:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [GIT PULL 3/4] virtio-mem: Fix typo in function name
Date: Mon,  2 Jan 2023 12:29:20 +0100
Message-Id: <20230102112921.68077-4-david@redhat.com>
In-Reply-To: <20230102112921.68077-1-david@redhat.com>
References: <20230102112921.68077-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221228130956.80515-1-philmd@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 2b0271442b..1ed1f5a4af 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -207,7 +207,7 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
  *
  * Returns false if the intersection is empty, otherwise returns true.
  */
-static bool virito_mem_intersect_memory_section(MemoryRegionSection *s,
+static bool virtio_mem_intersect_memory_section(MemoryRegionSection *s,
                                                 uint64_t offset, uint64_t size)
 {
     uint64_t start = MAX(s->offset_within_region, offset);
@@ -245,7 +245,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
                                       first_bit + 1) - 1;
         size = (last_bit - first_bit + 1) * vmem->block_size;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             break;
         }
         ret = cb(&tmp, arg);
@@ -277,7 +277,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
                                  first_bit + 1) - 1;
         size = (last_bit - first_bit + 1) * vmem->block_size;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             break;
         }
         ret = cb(&tmp, arg);
@@ -313,7 +313,7 @@ static void virtio_mem_notify_unplug(VirtIOMEM *vmem, uint64_t offset,
     QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
         MemoryRegionSection tmp = *rdl->section;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             continue;
         }
         rdl->notify_discard(rdl, &tmp);
@@ -329,7 +329,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
     QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
         MemoryRegionSection tmp = *rdl->section;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             continue;
         }
         ret = rdl->notify_populate(rdl, &tmp);
@@ -346,7 +346,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
             if (rdl2 == rdl) {
                 break;
             }
-            if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
                 continue;
             }
             rdl2->notify_discard(rdl2, &tmp);
-- 
2.39.0


