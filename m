Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8184DCB77
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:31:45 +0100 (CET)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUt2O-0003DN-Pu
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:31:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nUsxc-0007yb-Vt
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nUsxa-0004Aq-0i
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647534405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XRZzgPg79a1cSzBOAwtxcS65FO1PtFFdg/W31XKMDNQ=;
 b=IBLEsT97Ep39Pl3sh5z7RKJbW0Evvri5zBhpcfJJg4B1XoQ+MUhs9ghOzhLwEYk9O8Q2Rc
 RC/miY1lrQdlzSz6FzmCN0xp9EkiqXckHeRrRGeIxcM711N8ol3nzcTen8oui0/tYVWoQ3
 MMaNjJU2aIPIZSp8njO7uh0BK8Wcsvk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-YrtJx5Q9PCKreDHy2uy_sQ-1; Thu, 17 Mar 2022 12:26:44 -0400
X-MC-Unique: YrtJx5Q9PCKreDHy2uy_sQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 a66-20020ae9e845000000b0067b308a9f56so3647676qkg.21
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XRZzgPg79a1cSzBOAwtxcS65FO1PtFFdg/W31XKMDNQ=;
 b=LQrl6Xys//J+p8Xu0aU7VfYPRKLmi/1JVGZq6JXdQPgP2ckwrhTJegR2mfo3nQ2rGy
 JrNNAnUDTbTGsXhANsKMhyvM3xOVPuH9EnMmlb/oAOfTSfhnPnbs1HQtMMbn7Fo+OvY5
 EjXPX5xwVS2gBfqNsvCh2AIzODV6J4B3n/uoX1r7M5PUJ6/imGpiqeFfeao+wgOWqfvl
 nBk5u+Wn7rAUraulFqEh0BVAmZHYg8SwJujM9SCxVwFHltqj5TZpYjVVsxn6NXajytIe
 m8suwYCFliicVYRuxEtuowTBc7S7b0K99wagJcR/ciXsoSnnRGESSIIiG6Re1T77ADe+
 7acA==
X-Gm-Message-State: AOAM532ZCSl5KwlFPn/xeKNCAvxrJgPpbWaJWN1B1a4hi0II1xLfHCUi
 xXs+0fwdggk4D2DGwM/IoIxyeG+rQeP2UDHjKgxU7MoagYVTGCyaxnPmuXHzNEGkr+GDKOntuoW
 uBU0ttRRMawh/S2hR7F9XczfApT58+WXspoLXNpJNwt0qHEvDaOYXPWBrnhBao8psiPM=
X-Received: by 2002:a05:622a:145:b0:2e1:b932:d019 with SMTP id
 v5-20020a05622a014500b002e1b932d019mr4394267qtw.46.1647534403229; 
 Thu, 17 Mar 2022 09:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCKGDFTut7aUgL8Jl4CNUOKDRRcin0aE71dn3+WOGshQh2v19UTcqJGPV7WP0LFxbij30TJg==
X-Received: by 2002:a05:622a:145:b0:2e1:b932:d019 with SMTP id
 v5-20020a05622a014500b002e1b932d019mr4394240qtw.46.1647534402763; 
 Thu, 17 Mar 2022 09:26:42 -0700 (PDT)
Received: from step1.redhat.com (host-87-12-25-126.business.telecomitalia.it.
 [87.12.25.126]) by smtp.gmail.com with ESMTPSA id
 v1-20020a05620a440100b0067d3fc2eaa6sm2869986qkp.96.2022.03.17.09.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 09:26:41 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/rbd: fix write zeroes with growing images
Date: Thu, 17 Mar 2022 17:26:38 +0100
Message-Id: <20220317162638.41192-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit d24f80234b ("block/rbd: increase dynamically the image size")
added a workaround to support growing images (eg. qcow2), resizing
the image before write operations that exceed the current size.

We recently added support for write zeroes and without the
workaround we can have problems with qcow2.

So let's move the resize into qemu_rbd_start_co() and do it when
the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 block/rbd.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 8f183eba2a..6caf35cbba 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
 
     assert(!qiov || qiov->size == bytes);
 
+    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
+        /*
+         * RBD APIs don't allow us to write more than actual size, so in order
+         * to support growing images, we resize the image before write
+         * operations that exceed the current size.
+         */
+        if (offset + bytes > s->image_size) {
+            int r = qemu_rbd_resize(bs, offset + bytes);
+            if (r < 0) {
+                return r;
+            }
+        }
+    }
+
     r = rbd_aio_create_completion(&task,
                                   (rbd_callback_t) qemu_rbd_completion_cb, &c);
     if (r < 0) {
@@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
                                  int64_t bytes, QEMUIOVector *qiov,
                                  BdrvRequestFlags flags)
 {
-    BDRVRBDState *s = bs->opaque;
-    /*
-     * RBD APIs don't allow us to write more than actual size, so in order
-     * to support growing images, we resize the image before write
-     * operations that exceed the current size.
-     */
-    if (offset + bytes > s->image_size) {
-        int r = qemu_rbd_resize(bs, offset + bytes);
-        if (r < 0) {
-            return r;
-        }
-    }
     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
 }
 
-- 
2.35.1


