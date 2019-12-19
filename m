Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277812638B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 14:32:00 +0100 (CET)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihvuI-0005RF-OU
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 08:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ihvpb-0000RH-RB
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:27:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ihvpa-0001C9-NW
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:27:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27655
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ihvpa-00017u-IQ
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576762025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ky3AoPDK1Dl90THjFQNp/2P2m3Le5A8fcjpKsYSUby0=;
 b=Kzb45lGVVn+8JEIOR0qj5WbLgl/AYQ9fk9v9bfiMhe8PMyIO4wJH4Fb2tid+AxafWqeTI/
 wSqE15eSKFTx8hHw+hS0weSMNhfde9niJKU9LAJ/b5D4Te8b2TESkQoVS90YYG3cfPbRk5
 4NsX3bGoP9G7OB6PDuzwhtrKi5vZl2w=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-mxoiEXsIPfCC_AdFbdEjJg-1; Thu, 19 Dec 2019 08:27:02 -0500
Received: by mail-qt1-f198.google.com with SMTP id d9so3653605qtq.13
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 05:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S797ekb1koe77yVikHhjJoQQO+mcOVBkg02x1T+LNQw=;
 b=GVo8bFEjjWacauG18Md/4SmIXtSctaKyt9FftWt7owK/QqCKvuJ/HhgiTSNQxE0mmc
 G3ehvH34EaJj55nGwFoVxr0Ipqqh8tTYHGY/rFxngStNiUWmv3fa5AHDOgiyjOL7OtW4
 fnHvi7V8wUk6u26DU0rTwY5bp8vQeApPN6p2f6NXpSEXgqGztBEO2Qs7q1W1w1rjsQAk
 iN4iCVI/XS7jEXibq0SPA0/XHfAmMOmT/qeTBK9SyZfCj2YDtVs10tSyWQyRQmsfCBfa
 kjxJcQm9i/CgjH9ieXzB/e5hhzD4q95qlKAJnOk2qFJz1XZeOSei9WRJiMJYaWhK3VOF
 KUfg==
X-Gm-Message-State: APjAAAWpPC83iI0XCxsQhBT7d1UKEULOd2Db7hBxdJ/6VX7D5CPxDRXs
 kyQhyx6kcQQ8/rrIvUFPt5Wlm0CgBIuCBeHVjcTNoboc1gASF3ztsHHvPSJlIu7DjoOBdJcf5yy
 EQt3Kn6rUAJvpXDI=
X-Received: by 2002:a05:620a:13e3:: with SMTP id
 h3mr7884033qkl.319.1576762022013; 
 Thu, 19 Dec 2019 05:27:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxP5nXIgzLiDhJp7TyIiAZd7j377ox4jE3fyAsWjIbW1+ja4EK4UWWXxAYOaiTuxN96v7RURA==
X-Received: by 2002:a05:620a:13e3:: with SMTP id
 h3mr7884017qkl.319.1576762021793; 
 Thu, 19 Dec 2019 05:27:01 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id u15sm1699900qku.67.2019.12.19.05.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 05:27:01 -0800 (PST)
Date: Thu, 19 Dec 2019 08:26:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] virtio: add ability to delete vq through a pointer
Message-ID: <20191219132621.16595-2-mst@redhat.com>
References: <20191219132621.16595-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191219132621.16595-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: mxoiEXsIPfCC_AdFbdEjJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Devices tend to maintain vq pointers, allow deleting them trough a vq point=
er.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 include/hw/virtio/virtio.h |  2 ++
 hw/virtio/virtio.c         | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index c32a815303..e18756d50d 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -183,6 +183,8 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int que=
ue_size,
=20
 void virtio_del_queue(VirtIODevice *vdev, int n);
=20
+void virtio_delete_queue(VirtQueue *vq);
+
 void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
                     unsigned int len);
 void virtqueue_flush(VirtQueue *vq, unsigned int count);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 04716b5f6c..31dd140990 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2330,17 +2330,22 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int=
 queue_size,
     return &vdev->vq[i];
 }
=20
+void virtio_delete_queue(VirtQueue *vq)
+{
+    vq->vring.num =3D 0;
+    vq->vring.num_default =3D 0;
+    vq->handle_output =3D NULL;
+    vq->handle_aio_output =3D NULL;
+    g_free(vq->used_elems);
+}
+
 void virtio_del_queue(VirtIODevice *vdev, int n)
 {
     if (n < 0 || n >=3D VIRTIO_QUEUE_MAX) {
         abort();
     }
=20
-    vdev->vq[n].vring.num =3D 0;
-    vdev->vq[n].vring.num_default =3D 0;
-    vdev->vq[n].handle_output =3D NULL;
-    vdev->vq[n].handle_aio_output =3D NULL;
-    g_free(vdev->vq[n].used_elems);
+    virtio_delete_queue(&vdev->vq[n]);
 }
=20
 static void virtio_set_isr(VirtIODevice *vdev, int value)
--=20
MST


