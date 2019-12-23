Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E581298E0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 17:46:48 +0100 (CET)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijQr0-0000D6-RH
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 11:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ijQls-0003Me-Dc
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ijQlq-0005Oi-EV
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:27 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20567
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ijQlq-0005Oa-Aj
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577119285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9epneyHKkAEq5gGDVE/gbeFue8BzwP7OkBM6QzY9Yk=;
 b=aDaBZlCMmYo+GyivV0N9wpYDgsI5reLaMNPlaUi7AEX1aXm1SbcYiktmWjxiXVhCs/UZZd
 U67m0SDfusU7/RDEark0SE0/skjCKtO1+V3yPlzvRXCG0fKIC4fdLBpLWW4bsLPhHf95o1
 aBhPcLL0s6i892IO9erYphfBVyYxQqw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-hIcEfgrnNguasYNEkE-dWQ-1; Mon, 23 Dec 2019 11:41:24 -0500
Received: by mail-qv1-f71.google.com with SMTP id v5so11676964qvn.21
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 08:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iiaP0RxMw50Y4u2HruPOoUKc+xP0ZRMmYrMUAAr8Wgg=;
 b=V+Q6UgneEG9e+n/VVnC93gqzANME5Iy3wL+UpO2BXWZY+lwgL9w9DdmUqhxZvNYzKT
 2QrT8E37pRFanEy9tu4jWUMgAVtVg+459t4RqJcvPYh3HHibgxw85eykWuP7IoNrmwsq
 Asc+pHVThcZoGDZHDsD2WBZ6zfFgZFFXvMP64hyItlvLEQDyaz3hz2wbzbyqEvxtjAfL
 9/Tik+HUrz/h7CkTtWseKCprGnoJr5ljLuLuqysvdLezqsJFAkcK0BEsLkO50t19QBM4
 c7u427ni6/qfcJj974WZrD79Iir68ifV2J8Ydod1LHL8QSxT4a52pK6XoHiPyz6NMuUf
 NvPw==
X-Gm-Message-State: APjAAAX8w+ygp7iYKSQO5K2L4U1EC7t/rvxwspL1oVh6C+qgib3ld8E5
 L6gIpJAwZloKD8puNIJvqmx4Sto3Jn4JXFcvHQG+sXAsOBEZuj5GqdShXKQPvxlybaqNeSNDpak
 2bOeGz6ViOPZ9qlg=
X-Received: by 2002:ac8:7592:: with SMTP id s18mr13775994qtq.378.1577119283636; 
 Mon, 23 Dec 2019 08:41:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxDBwL7xM0oyl/qZGP8ZuuY6jkVgPtMSy68e2FFngWPabobBcWO8K/jqRQdQ30aMr2EBOH+9g==
X-Received: by 2002:ac8:7592:: with SMTP id s18mr13775985qtq.378.1577119283499; 
 Mon, 23 Dec 2019 08:41:23 -0800 (PST)
Received: from redhat.com (bzq-109-64-31-13.red.bezeqint.net. [109.64.31.13])
 by smtp.gmail.com with ESMTPSA id
 k1sm2676164qtq.86.2019.12.23.08.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 08:41:22 -0800 (PST)
Date: Mon, 23 Dec 2019 11:41:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/27] virtio-input: convert to new virtio_delete_queue
Message-ID: <20191223141536.72682-6-mst@redhat.com>
References: <20191223141536.72682-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191223141536.72682-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: hIcEfgrnNguasYNEkE-dWQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Seems cleaner than using VQ index values.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/input/virtio-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index ec54e46ad6..9c013afddb 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -280,6 +280,7 @@ static void virtio_input_device_unrealize(DeviceState *=
dev, Error **errp)
 {
     VirtIOInputClass *vic =3D VIRTIO_INPUT_GET_CLASS(dev);
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
+    VirtIOInput *vinput =3D VIRTIO_INPUT(dev);
     Error *local_err =3D NULL;
=20
     if (vic->unrealize) {
@@ -289,8 +290,8 @@ static void virtio_input_device_unrealize(DeviceState *=
dev, Error **errp)
             return;
         }
     }
-    virtio_del_queue(vdev, 0);
-    virtio_del_queue(vdev, 1);
+    virtio_delete_queue(vinput->evt);
+    virtio_delete_queue(vinput->sts);
     virtio_cleanup(vdev);
 }
=20
--=20
MST


