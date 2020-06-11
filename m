Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968191F6F09
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:52:40 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjUBj-0000MM-LE
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAF-0001Z4-14
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20552
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAD-0001Nl-3F
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a73EkG8U8D9BCjCFB5TiIhzQ4MU/D3Nfp+b25PES2l0=;
 b=dqERvpkF9hxT7AtAZRjPtjbYyfvG1A8u8lYdmF2vG/NY0uSWFrtHbfO+HawQQ4EvirXTUz
 kx2VPxiWzcvwSSOEgYYyT+Fq74QIfnTeVr/brK8muCqvpjN9yj6zM6F7awcNWvLv16Ezxt
 GeyrOIx3y60I+Vlf96oGBdb5wBMcGh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-8lKXVV2-PXaMhC1e5HeTQg-1; Thu, 11 Jun 2020 15:45:33 -0400
X-MC-Unique: 8lKXVV2-PXaMhC1e5HeTQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FA0B8015CE;
 Thu, 11 Jun 2020 19:45:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D50BF8FF6A;
 Thu, 11 Jun 2020 19:45:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 050/115] megasas: use unsigned type for positive numeric fields
Date: Thu, 11 Jun 2020 15:43:44 -0400
Message-Id: <20200611194449.31468-51-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Darren Kenny <darren.kenny@oracle.com>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Use unsigned type for the MegasasState fields which hold positive
numeric values.

Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20200513192540.1583887-4-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/megasas.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index b531d88a9b..634af0bbb8 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -86,34 +86,34 @@ typedef struct MegasasState {
     MemoryRegion queue_io;
     uint32_t frame_hi;
 
-    int fw_state;
+    uint32_t fw_state;
     uint32_t fw_sge;
     uint32_t fw_cmds;
     uint32_t flags;
-    int fw_luns;
-    int intr_mask;
-    int doorbell;
-    int busy;
-    int diag;
-    int adp_reset;
+    uint32_t fw_luns;
+    uint32_t intr_mask;
+    uint32_t doorbell;
+    uint32_t busy;
+    uint32_t diag;
+    uint32_t adp_reset;
     OnOffAuto msi;
     OnOffAuto msix;
 
     MegasasCmd *event_cmd;
-    int event_locale;
+    uint16_t event_locale;
     int event_class;
-    int event_count;
-    int shutdown_event;
-    int boot_event;
+    uint32_t event_count;
+    uint32_t shutdown_event;
+    uint32_t boot_event;
 
     uint64_t sas_addr;
     char *hba_serial;
 
     uint64_t reply_queue_pa;
     void *reply_queue;
-    int reply_queue_len;
+    uint16_t reply_queue_len;
     uint16_t reply_queue_head;
-    int reply_queue_tail;
+    uint16_t reply_queue_tail;
     uint64_t consumer_pa;
     uint64_t producer_pa;
 
@@ -2259,9 +2259,9 @@ static const VMStateDescription vmstate_megasas_gen1 = {
         VMSTATE_PCI_DEVICE(parent_obj, MegasasState),
         VMSTATE_MSIX(parent_obj, MegasasState),
 
-        VMSTATE_INT32(fw_state, MegasasState),
-        VMSTATE_INT32(intr_mask, MegasasState),
-        VMSTATE_INT32(doorbell, MegasasState),
+        VMSTATE_UINT32(fw_state, MegasasState),
+        VMSTATE_UINT32(intr_mask, MegasasState),
+        VMSTATE_UINT32(doorbell, MegasasState),
         VMSTATE_UINT64(reply_queue_pa, MegasasState),
         VMSTATE_UINT64(consumer_pa, MegasasState),
         VMSTATE_UINT64(producer_pa, MegasasState),
@@ -2278,9 +2278,9 @@ static const VMStateDescription vmstate_megasas_gen2 = {
         VMSTATE_PCI_DEVICE(parent_obj, MegasasState),
         VMSTATE_MSIX(parent_obj, MegasasState),
 
-        VMSTATE_INT32(fw_state, MegasasState),
-        VMSTATE_INT32(intr_mask, MegasasState),
-        VMSTATE_INT32(doorbell, MegasasState),
+        VMSTATE_UINT32(fw_state, MegasasState),
+        VMSTATE_UINT32(intr_mask, MegasasState),
+        VMSTATE_UINT32(doorbell, MegasasState),
         VMSTATE_UINT64(reply_queue_pa, MegasasState),
         VMSTATE_UINT64(consumer_pa, MegasasState),
         VMSTATE_UINT64(producer_pa, MegasasState),
-- 
2.26.2



