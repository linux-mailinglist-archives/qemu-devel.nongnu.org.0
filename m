Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9186551FED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:11:44 +0200 (CEST)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3J43-0003FT-AP
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J1r-0002H4-L2
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:09:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J1n-0007vc-N2
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655737762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y5DvdTGb2RhcK7Z7WQlzd+J7ZdtdywWHBvO8SabowZ0=;
 b=XGRAx2MnHPxuln+wBN421IGEN54K57iLIWxfkqHSEFOpc69o2GNjnl4WC4/OtO/SK6uiIP
 JtsEquw5FW0RAGCnidtHroP3bLosI0jwbLi9bcwskVKV4bB5Mvts79Beo7IZ67xylhWgxy
 v0A7sGOFBh6i8wfILKkvgE1ISWwIvJc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-S2qO8gBaOaGrq6PCMnd9_Q-1; Mon, 20 Jun 2022 11:09:20 -0400
X-MC-Unique: S2qO8gBaOaGrq6PCMnd9_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 560968316FB
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 15:09:20 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C02B40314B;
 Mon, 20 Jun 2022 15:09:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH] migration: Remove RDMA_UNREGISTRATION_EXAMPLE
Date: Mon, 20 Jun 2022 17:09:18 +0200
Message-Id: <20220620150918.57471-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Nobody has ever showed up to unregister individual pages, and another
set of patches written by Daniel P. Berrangé <berrange@redhat.com>
just remove qemu_rdma_signal_unregister() function needed here.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 672d1958a9..8504152f39 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1370,30 +1370,6 @@ const char *print_wrid(int wrid)
     return wrid_desc[wrid];
 }
 
-/*
- * RDMA requires memory registration (mlock/pinning), but this is not good for
- * overcommitment.
- *
- * In preparation for the future where LRU information or workload-specific
- * writable writable working set memory access behavior is available to QEMU
- * it would be nice to have in place the ability to UN-register/UN-pin
- * particular memory regions from the RDMA hardware when it is determine that
- * those regions of memory will likely not be accessed again in the near future.
- *
- * While we do not yet have such information right now, the following
- * compile-time option allows us to perform a non-optimized version of this
- * behavior.
- *
- * By uncommenting this option, you will cause *all* RDMA transfers to be
- * unregistered immediately after the transfer completes on both sides of the
- * connection. This has no effect in 'rdma-pin-all' mode, only regular mode.
- *
- * This will have a terrible impact on migration performance, so until future
- * workload information or LRU information is available, do not attempt to use
- * this feature except for basic testing.
- */
-/* #define RDMA_UNREGISTRATION_EXAMPLE */
-
 /*
  * Perform a non-optimized memory unregistration after every transfer
  * for demonstration purposes, only if pin-all is not requested.
@@ -1571,18 +1547,6 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, struct ibv_cq *cq,
         if (rdma->nb_sent > 0) {
             rdma->nb_sent--;
         }
-
-        if (!rdma->pin_all) {
-            /*
-             * FYI: If one wanted to signal a specific chunk to be unregistered
-             * using LRU or workload-specific information, this is the function
-             * you would call to do so. That chunk would then get asynchronously
-             * unregistered later.
-             */
-#ifdef RDMA_UNREGISTRATION_EXAMPLE
-            qemu_rdma_signal_unregister(rdma, index, chunk, wc.wr_id);
-#endif
-        }
     } else {
         trace_qemu_rdma_poll_other(print_wrid(wr_id), wr_id, rdma->nb_sent);
     }
@@ -2137,11 +2101,6 @@ retry:
 
     chunk_end = ram_chunk_end(block, chunk + chunks);
 
-    if (!rdma->pin_all) {
-#ifdef RDMA_UNREGISTRATION_EXAMPLE
-        qemu_rdma_unregister_waiting(rdma);
-#endif
-    }
 
     while (test_bit(chunk, block->transit_bitmap)) {
         (void)count;
-- 
2.35.3


