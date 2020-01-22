Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E0144B93
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 07:02:49 +0100 (CET)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu96F-0002Iu-OW
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 01:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iu8wC-0007r7-PI
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 00:52:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iu8wB-0004iC-Kn
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 00:52:24 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22672
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iu8wB-0004hz-Gg
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 00:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579672343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBcIJ+XtEg+ynI5J149ubW51ZuYdwReRoLvMT6MynBM=;
 b=WmwOoTFM7pDbelGqHGahA1sxg1do2/9UOrUOS8Xq0tz5tduYJn7woxSklOIIY3IwUkXMSi
 xbuWZFzoUueBM6+9B2C6Pd7M4yv50y6kTPD/PuveUGi4gDI/TZRzz7Tc2f9vfAD5h5x0bO
 ERQxoMuSPMM52Q84qSriKc1hlAe/BzQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-3cYK1LSgMXCLpfu_kOt8sg-1; Wed, 22 Jan 2020 00:52:21 -0500
Received: by mail-wr1-f72.google.com with SMTP id f10so2558673wro.14
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 21:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=crW7LUnM5y+vbTajSaV+13MSOoh5cZCcUuqLsKZn8gg=;
 b=eRKedrgIvVoiPoc/Z6JIKMZ4FhBcJ1KEb9WIaKxoObWrC38ZlBaqHWLHhfE8O9F4z4
 Z5H/0U9ZD31Qsyn9LPCz5ZUvycUdVV74Ey0EtdiJykX2a2lbWHTF/3PySGxv6HYq7Ps4
 D+/gfodpPnPHWzqXLJX06ipynQ2drxxu37UWllL48AP+/HrPSLUfGnpd5XYgBGnNbSFQ
 pMLtK5kOAUqjOhNtPXAHsjkLxZ99O1HuvN3oKL+Lb7nN1CZ42CPTILc8Hn92WdsODaRq
 x+dNIEhfStbfJgXH4AjRLSmXD11ErYl2LKe72L5tkTn+vEkSgiUsNuO0/gXBTt5aA2Bp
 raxA==
X-Gm-Message-State: APjAAAUphjO2F2LS8qxUZroEfieDPlzhZxRUrInVd7QHCMC/JQVLkC0f
 imNJs7fN+vM5ohrKsxGvHmYSFBOhajcchoJyIIzRbXqKLhGhibmD9z+0WlILaOjSjIk/7fmlO33
 zBmhGyh3JnN8bSaA=
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr8729642wrw.193.1579672339612; 
 Tue, 21 Jan 2020 21:52:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzD1MlErhdZ5m4C0FDaw4hNRzK0dz17IeiQUKYmnA6WWFF9OSnMDS2DBuYISZFOfipOZAinug==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr8729631wrw.193.1579672339455; 
 Tue, 21 Jan 2020 21:52:19 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
 by smtp.gmail.com with ESMTPSA id
 u7sm2450601wmj.3.2020.01.21.21.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 21:52:18 -0800 (PST)
Date: Wed, 22 Jan 2020 00:52:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/17] virtio-9p-device: convert to new virtio_delete_queue
Message-ID: <20200122055115.429945-12-mst@redhat.com>
References: <20200122055115.429945-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200122055115.429945-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: 3cYK1LSgMXCLpfu_kOt8sg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Pan Nengyuan <pannengyuan@huawei.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Use virtio_delete_queue to make it more clear.

Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Message-Id: <20200117060927.51996-3-pannengyuan@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/virtio-9p-device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index ba35892940..1d1c50409c 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -218,7 +218,7 @@ static void virtio_9p_device_unrealize(DeviceState *dev=
, Error **errp)
     V9fsVirtioState *v =3D VIRTIO_9P(dev);
     V9fsState *s =3D &v->state;
=20
-    virtio_del_queue(vdev, 0);
+    virtio_delete_queue(v->vq);
     virtio_cleanup(vdev);
     v9fs_device_unrealize_common(s, errp);
 }
--=20
MST


