Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D942307E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:03:12 +0200 (CEST)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpiZ-0007Xu-7R
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpe3-0004UT-CI
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpe1-0004oz-Jt
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633460308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8Ls47LDQwx5EUQb8VoETc5nYTSCXK17qEkxYGf41pg=;
 b=XoTuGRPT5Rv52ifVAFdsac09hFRR+Y9INDCw8m7SU9T4QqTKl2QdyumfjVh/56qTFbJ8A6
 RJLFvisxBdk2hZBXGAp5sp7XSoLJ7oqgzKgAnj2kEVjW+qZhjG24DGJMG2e7Zbl2cVbNJe
 TJQz8NDH1CW4EYR+L5GdfEt3WQIEBYs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-D46nVmCiPASQG7FRI7NgQg-1; Tue, 05 Oct 2021 14:58:28 -0400
X-MC-Unique: D46nVmCiPASQG7FRI7NgQg-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adff5c2000000b00160b12639a5so79021wrp.3
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 11:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8Ls47LDQwx5EUQb8VoETc5nYTSCXK17qEkxYGf41pg=;
 b=rPbUfiJOXFnbP8ZV1K9yUgzc7pQ8Z+1az1XRK7CZhOQnxlRidPR1QinHs5Fc6iSmhE
 0Eyy9Nn2XsAgZNKCWe3QaECG9ZAx6lcqosMfEZetKTdBK51C0+6VQMzXo/MAQelIAfXs
 ORVBTqW6gTsx5O125mHCtLLKA+sfX0VTxPEmdXnr01oX1yKGSsLdHnMwEUxPG0S3jCPt
 bJ0opeS6Vsf+Ibp3VcXocAqLcsWJSvz/weLZKi1X7xcJJ0aSZZ5Sc3Si5F/OFkp9GvQy
 fN0Y3lvahhvhwg2Cs7ycANlAeRiJakWhWp5cSA13B0I6eOeMVNHz5oLVVWlBMSr76czy
 oSlw==
X-Gm-Message-State: AOAM533eHiH8WzQlyYQ0ebOnE6vt/p+nPQ4whUyljJmSFg2Q+Xm2yXAJ
 qVS4qUiSrwYTxxhG+PzuAOMrFcPAQBICDXo50t1b36U12tGkazJpGDswKMQb3I5ficMrxVyjLTd
 2zhX4IItjj+xaZN//6xVkV3/cDfjtCRZcknCQaZFUrKE1bZrpfSdUxauKR8IMvycs
X-Received: by 2002:a05:600c:1d18:: with SMTP id
 l24mr5322791wms.98.1633460306550; 
 Tue, 05 Oct 2021 11:58:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpsLJqgIzOS/1WvaTqnMG9oMbi3+E5hwQvvcTn6XEkKxOy/03Y3mE4/cRQ/NQW8J6HO7v/5w==
X-Received: by 2002:a05:600c:1d18:: with SMTP id
 l24mr5322754wms.98.1633460306278; 
 Tue, 05 Oct 2021 11:58:26 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id u17sm4364007wrw.85.2021.10.05.11.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 11:58:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] hw/block/virtio-blk: Use automatic AIO context lock
Date: Tue,  5 Oct 2021 20:58:07 +0200
Message-Id: <20211005185807.4134557-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005185807.4134557-1-philmd@redhat.com>
References: <20211005185807.4134557-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the automatic AIO context acquire/release in virtio_blk_reset().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/virtio-blk.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7cc9c..2dd6428e7b3 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -896,24 +896,22 @@ static void virtio_blk_dma_restart_cb(void *opaque, bool running,
 static void virtio_blk_reset(VirtIODevice *vdev)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
-    AioContext *ctx;
     VirtIOBlockReq *req;
 
-    ctx = blk_get_aio_context(s->blk);
-    aio_context_acquire(ctx);
-    blk_drain(s->blk);
-
-    /* We drop queued requests after blk_drain() because blk_drain() itself can
-     * produce them. */
-    while (s->rq) {
-        req = s->rq;
-        s->rq = req->next;
-        virtqueue_detach_element(req->vq, &req->elem, 0);
-        virtio_blk_free_request(req);
+    WITH_AIO_CONTEXT_ACQUIRE_GUARD(blk_get_aio_context(s->blk)) {
+        blk_drain(s->blk);
+        /*
+         * We drop queued requests after blk_drain() because
+         * blk_drain() itself can produce them.
+         */
+        while (s->rq) {
+            req = s->rq;
+            s->rq = req->next;
+            virtqueue_detach_element(req->vq, &req->elem, 0);
+            virtio_blk_free_request(req);
+        }
     }
 
-    aio_context_release(ctx);
-
     assert(!s->dataplane_started);
     blk_set_enable_write_cache(s->blk, s->original_wce);
 }
-- 
2.31.1


