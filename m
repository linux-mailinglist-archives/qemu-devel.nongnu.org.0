Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D95555364
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 20:42:33 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o45J7-00028Q-6f
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 14:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45GF-0007Vq-T6
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45GC-0002Bq-5u
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655923167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f01KN6D3ybCuZtXxqbhgGmA11QdmFrIBHP/8pOhtUDc=;
 b=WW1U9Osvf01X9QmLCpH9Zp2xca/Qs1qBQtPXzMPYCytclQb1bqMrpNM303/6erg5OeOlk6
 z7AMNnkRxZIfwqe13EzNgIy5DQ42N7KI1o5G5lRRqfRD6FPGXiUq27luNXzuKtq0hQC+og
 amcMl1b8rKV4m6QG8BVYBhlWX3noWvs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-As4vyobMNO-9op2IpszmAg-1; Wed, 22 Jun 2022 14:39:25 -0400
X-MC-Unique: As4vyobMNO-9op2IpszmAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6371318E0052;
 Wed, 22 Jun 2022 18:39:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7623D1678F;
 Wed, 22 Jun 2022 18:39:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 01/33] migration: Remove RDMA_UNREGISTRATION_EXAMPLE
Date: Wed, 22 Jun 2022 19:38:45 +0100
Message-Id: <20220622183917.155308-2-dgilbert@redhat.com>
In-Reply-To: <20220622183917.155308-1-dgilbert@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

From: Juan Quintela <quintela@redhat.com>

Nobody has ever showed up to unregister individual pages, and another
set of patches written by Daniel P. Berrangé <berrange@redhat.com>
just remove qemu_rdma_signal_unregister() function needed here.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.36.1


