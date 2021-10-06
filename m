Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01D0424398
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:00:00 +0200 (CEST)
Received: from localhost ([::1]:48758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAGu-0002QX-1o
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA7B-0004Ew-JO
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA79-0007Wd-4v
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633538994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAMHwyEPSOT7TJ8wVCCF5DgrBGt0mBuF7+qovAFjDW4=;
 b=RzOu/xhjgVXm+DgS3xjfcobaRUhQGf3qzEZcdwRteCAuTDQ3qkVm4AFJmhWyunysl/PIJo
 2yTh4kvB3SpGwltxk9vPrw4gOHvTVnalcQq3Q/1z6VSdcoEGoH7vXar4JE/+OFFqXI/b3B
 JJdqE8P0Ivs/7xkfPb5/FfkPP3jg0Eg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-GwEvMTplP66E42r_-GQgNQ-1; Wed, 06 Oct 2021 12:49:52 -0400
X-MC-Unique: GwEvMTplP66E42r_-GQgNQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso2557906wrc.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAMHwyEPSOT7TJ8wVCCF5DgrBGt0mBuF7+qovAFjDW4=;
 b=NSGRLHPfS016+8s5tCLlGBzRMHGayDFY7FhvGQPWUvfczAIGbAO3ioi8qg7km51nW0
 f/B5DpbTG4PT/FDp/m3vS7mBNmVoNSfSwQbVhEF7JPH3+sC5r4e6VPDMH89F5Jmz9Xqp
 jE8EUu8ZPZtT9G3zsWFjeo4JE3U5s1HEva2Ci/XmDwpno52PsS9FX2yrd1cRDgL3QR2O
 efBxy0WrmuuX679bjrWsyyWNFu+B2xMHp2b0DrwBgiigi0L/wknGgwkAW87lFYTsqaFk
 8ImY6yo9oVQp2D9iXY/AaoZxW8g2O0bc862I6IUDBU8UT2mY9F6Ob5GWCxe5nw+p94wK
 IjbQ==
X-Gm-Message-State: AOAM533ECayUHEz+EQ35Q4C3zXrjR6M1hN5XPUig5KXtj8aQjgya1KRb
 1Ynm9EMHIvalT1zgUpbMK/73mnYBVv8OYxkKZs3fj6Ock0cO3XC26O0B3cKu5LNcHhSfY/H5EuU
 Ts3H66rGe6B5EHJDmTW4O3zPH1DoyWsS/byrK8uxuzFfcFu8FzIPZ4uq36LHHt4hu
X-Received: by 2002:a05:6000:15c4:: with SMTP id
 y4mr29709451wry.177.1633538991164; 
 Wed, 06 Oct 2021 09:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx088Od+UzGJjUsyPDFDGtFyPV4u0VVM3HCBTBkz5LB87TvNgTYW80kboCbqGF8FMgT3NMulw==
X-Received: by 2002:a05:6000:15c4:: with SMTP id
 y4mr29709408wry.177.1633538990835; 
 Wed, 06 Oct 2021 09:49:50 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 61sm21482602wrl.94.2021.10.06.09.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:49:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] block/nvme: Pass BDRVNVMeState* handle to
 nvme_free_queue_pair()
Date: Wed,  6 Oct 2021 18:49:30 +0200
Message-Id: <20211006164931.172349-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006164931.172349-1-philmd@redhat.com>
References: <20211006164931.172349-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next commit we want to access BDRVNVMeState from
nvme_free_queue_pair() callee. Pass it along first.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index e4f336d79c2..6e476f54b9f 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -183,19 +183,19 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
     return r == 0;
 }
 
-static void nvme_free_queue(NVMeQueue *q)
+static void nvme_free_queue(BDRVNVMeState *s, NVMeQueue *q)
 {
     qemu_vfree(q->queue);
 }
 
-static void nvme_free_queue_pair(NVMeQueuePair *q)
+static void nvme_free_queue_pair(BDRVNVMeState *s, NVMeQueuePair *q)
 {
     trace_nvme_free_queue_pair(q->index, q, &q->cq, &q->sq);
     if (q->completion_bh) {
         qemu_bh_delete(q->completion_bh);
     }
-    nvme_free_queue(&q->sq);
-    nvme_free_queue(&q->cq);
+    nvme_free_queue(s, &q->sq);
+    nvme_free_queue(s, &q->cq);
     qemu_vfree(q->prp_list_pages);
     qemu_mutex_destroy(&q->lock);
     g_free(q);
@@ -270,7 +270,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
 
     return q;
 fail:
-    nvme_free_queue_pair(q);
+    nvme_free_queue_pair(s, q);
     return NULL;
 }
 
@@ -693,7 +693,7 @@ static bool nvme_add_io_queue(BlockDriverState *bs, Error **errp)
     s->queue_count++;
     return true;
 out_error:
-    nvme_free_queue_pair(q);
+    nvme_free_queue_pair(s, q);
     return false;
 }
 
@@ -918,7 +918,7 @@ static void nvme_close(BlockDriverState *bs)
     BDRVNVMeState *s = bs->opaque;
 
     for (unsigned i = 0; i < s->queue_count; ++i) {
-        nvme_free_queue_pair(s->queues[i]);
+        nvme_free_queue_pair(s, s->queues[i]);
     }
     g_free(s->queues);
     aio_set_event_notifier(bdrv_get_aio_context(bs),
-- 
2.31.1


