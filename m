Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F175B380DCD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:11:41 +0200 (CEST)
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaPd-0003Xu-0w
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIm-0006mU-S5
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIj-0005QS-9g
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gAqW+8N7iMGcapAeP6vWVExIRFMEhdprQula/BM34oc=;
 b=VGHbOGkUOqq2JbaV6J86PdqQqUlNYGdZK1syxeO5Vgu6Hp5ivC1wGlLdjpaKlPaJRosjil
 Y7yYTcBX+YPe4Hg0mag0c7wpfqZQJPWZtbauJHN2q5tQesVg4S17bFMTu22pnTNWzkyibP
 8ns9BYV0DZeFLvkdHj7i6GiTU4G8RX0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-FQaXXPXMM76wzkNzZwHsuw-1; Fri, 14 May 2021 12:04:30 -0400
X-MC-Unique: FQaXXPXMM76wzkNzZwHsuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cfb029017373d9f318so17189wmq.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gAqW+8N7iMGcapAeP6vWVExIRFMEhdprQula/BM34oc=;
 b=S5JJT2gkZFzdLgr5tC13aWvFS7JIWOGR/fSZeEylhMOMg3M2OFu4oZg72noAQXPnD/
 gs3x+brduRUOSJXFQJeFnV2zZIZoKBMsphRoywHY1UuAnJVQ/N4fMSdmiZxZHdCUwL7I
 SUzFfRfKgtDIfrc4j686WKeSUSrEbYiPhG5LQ78GdrucMlviZr9b8ZTx1rJml5p2OLgL
 aI3Z/o/4PpWd95XmigG9eBWv39aHMNMkY0RIghZLL32oDDJs+3AnI88+TSy2L1TxxnY4
 qxdLQxRdRAuoYRlU/Fo6GzVbc4w6Sp5LgMZl2o92H9P77iMNu7tGEtq+fX5UiJ7PwtCl
 FwYA==
X-Gm-Message-State: AOAM530C4MXNRzi0y3Jp0ZM0KT5XYj27hfUDEQbA8VllP5LR3IrVeiLt
 Ey/66HBkO4oqcod6HeUrfCb+fQwAb6yev0OzdXw1Stm69jPIMlUJf7DbmvrH1+2mr/XhN1olyFy
 J7RH0h+vYXmAHp8I26ZUHQhKCtt79jeXcsm5mYRc5OlWliohaeUnDQV3oekW0
X-Received: by 2002:adf:e404:: with SMTP id g4mr59506636wrm.240.1621008269112; 
 Fri, 14 May 2021 09:04:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye61BVi5AvNpBWDIHG6OW6asDk1aqGNtwbMRa2xBHhgAoWM6QibSnvqz/4J6cyrtTZ0p3w+w==
X-Received: by 2002:adf:e404:: with SMTP id g4mr59506613wrm.240.1621008268930; 
 Fri, 14 May 2021 09:04:28 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id y5sm6931593wrp.5.2021.05.14.09.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:28 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] virtio-blk: Fix rollback path in
 virtio_blk_data_plane_start()
Message-ID: <20210514160245.91918-9-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

When dataplane multiqueue support was added in QEMU 2.7, the path
that would rollback guest notifiers assignment in case of error
simply got dropped.

Later on, when Error was added to blk_set_aio_context() in QEMU 4.1,
another error path was introduced, but it ommits to rollback both
host and guest notifiers.

It seems cleaner to fix the rollback path in one go. The patch is
simple enough that it can be adjusted if backported to a pre-4.1
QEMU.

Fixes: 51b04ac5c6a6 ("virtio-blk: dataplane multiqueue support")
Cc: stefanha@redhat.com
Fixes: 97896a4887a0 ("block: Add Error to blk_set_aio_context()")
Cc: kwolf@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210407143501.244343-2-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index e9050c8987..d7b5c95d26 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -207,7 +207,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
                 virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
                 virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
             }
-            goto fail_guest_notifiers;
+            goto fail_host_notifiers;
         }
     }
 
@@ -221,7 +221,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     aio_context_release(old_context);
     if (r < 0) {
         error_report_err(local_err);
-        goto fail_guest_notifiers;
+        goto fail_aio_context;
     }
 
     /* Process queued requests before the ones in vring */
@@ -245,6 +245,13 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     aio_context_release(s->ctx);
     return 0;
 
+  fail_aio_context:
+    for (i = 0; i < nvqs; i++) {
+        virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
+    }
+  fail_host_notifiers:
+    k->set_guest_notifiers(qbus->parent, nvqs, false);
   fail_guest_notifiers:
     /*
      * If we failed to set up the guest notifiers queued requests will be
-- 
MST


