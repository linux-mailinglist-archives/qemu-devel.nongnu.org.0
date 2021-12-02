Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5834666ED
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 16:43:25 +0100 (CET)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msoF2-0002Ji-8q
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 10:43:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mso9X-0000nB-T2
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 10:37:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mso9V-0002IA-7u
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 10:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638459459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tv6ZgPeF9JqTqvfrT/Nt5ske7VQh6DKKAYcNLfnUvF0=;
 b=Mqxi5WADCm02Py7f+EYk0BqGRGGUCscpDsQLn75n9DepWZclg80VPyeckQvlEmUhk+dBGX
 FG0lhiaOD9sdabHZ4Vzef17ml+Okn/asL5uPTk2G++oPOWCVykPgxiZea1op9nSqexWpvH
 hdawqosb1XFJ/Q/iIg2ycPlo0DH3Bws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-tuIF1GbzP5eXzS-jg1-eyg-1; Thu, 02 Dec 2021 10:37:38 -0500
X-MC-Unique: tuIF1GbzP5eXzS-jg1-eyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AF5B83DD2C;
 Thu,  2 Dec 2021 15:37:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A08401836B;
 Thu,  2 Dec 2021 15:36:22 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] virtio-blk: drop unused virtio_blk_handle_vq() return
 value
Date: Thu,  2 Dec 2021 15:33:59 +0000
Message-Id: <20211202153402.604951-4-stefanha@redhat.com>
In-Reply-To: <20211202153402.604951-1-stefanha@redhat.com>
References: <20211202153402.604951-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Peter Lieven <pl@kamp.de>,
 Stefan Weil <sw@weilnetz.de>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The return value of virtio_blk_handle_vq() is no longer used. Get rid of
it. This is a step towards unifying the dataplane and non-dataplane
virtqueue handler functions.

Prepare virtio_blk_handle_output() to be used by both dataplane and
non-dataplane by making the condition for starting ioeventfd more
specific. This way it won't trigger when dataplane has already been
started.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-blk.h |  2 +-
 hw/block/virtio-blk.c          | 14 +++-----------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 29655a406d..d311c57cca 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -90,7 +90,7 @@ typedef struct MultiReqBuffer {
     bool is_write;
 } MultiReqBuffer;
 
-bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
+void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
 void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh);
 
 #endif
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7cc9..82676cdd01 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -767,12 +767,11 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     return 0;
 }
 
-bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
+void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
 {
     VirtIOBlockReq *req;
     MultiReqBuffer mrb = {};
     bool suppress_notifications = virtio_queue_get_notification(vq);
-    bool progress = false;
 
     aio_context_acquire(blk_get_aio_context(s->blk));
     blk_io_plug(s->blk);
@@ -783,7 +782,6 @@ bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
         }
 
         while ((req = virtio_blk_get_request(s, vq))) {
-            progress = true;
             if (virtio_blk_handle_request(req, &mrb)) {
                 virtqueue_detach_element(req->vq, &req->elem, 0);
                 virtio_blk_free_request(req);
@@ -802,19 +800,13 @@ bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
 
     blk_io_unplug(s->blk);
     aio_context_release(blk_get_aio_context(s->blk));
-    return progress;
-}
-
-static void virtio_blk_handle_output_do(VirtIOBlock *s, VirtQueue *vq)
-{
-    virtio_blk_handle_vq(s, vq);
 }
 
 static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOBlock *s = (VirtIOBlock *)vdev;
 
-    if (s->dataplane) {
+    if (s->dataplane && !s->dataplane_started) {
         /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
          * dataplane here instead of waiting for .set_status().
          */
@@ -823,7 +815,7 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
             return;
         }
     }
-    virtio_blk_handle_output_do(s, vq);
+    virtio_blk_handle_vq(s, vq);
 }
 
 void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
-- 
2.33.1


