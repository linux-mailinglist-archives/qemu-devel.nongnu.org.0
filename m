Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195201298DF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 17:46:45 +0100 (CET)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijQqx-0000Dj-Gj
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 11:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ijQlr-0003Md-Pk
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ijQlp-0005OP-9Q
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47741
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ijQlp-0005OJ-4X
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577119284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nm5rBDcoCplmlWRAfpJUTX03Lt2BWA14BTGdBKMUPBs=;
 b=b57DsYfiJZ903mLTRnSiCdrGshccHEUzj1DQwHBk5TFZVmfI2Pl/rKpvCXJAY3FTXNkmqN
 HM8cVR984goXDour+49CyRjSZXTlbfsox+3eDK23h6JjB7HQrJi/xNIgNC2Y8hqRcn7Pql
 NkqzHbUQT3EhEkWPxPUBN3l7EnCdUlU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-JDzYbS3mMXWs5ISQddgl9A-1; Mon, 23 Dec 2019 11:41:23 -0500
Received: by mail-qt1-f197.google.com with SMTP id l1so11398908qtp.21
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 08:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SV/3gkt55AkXiObd4ttRVZfM0Ouiap0tkA8DR2mthfg=;
 b=AKEwWlvv1x3mEwPqsJtL8OjtJzq4zj97odcyEIRAHfA2H0rqi+qMrNPWSgJ0uqklZd
 mwjhubKWPtadj4DRKAQayFOI2CWrHsPgjzp9ux8sdXWr4JdJfAM/nrl3JiIz2CdQ7xfw
 yeR6lUPAKXuESV2AH1lRV+5HlHmtqk2Nx2mhysftr83w1elk1xBUrFgRZ4zk5XrUDgHj
 Kc80I2dcFyHqV0uPLs/78ak72mnpwN2rDALuKyf0RagRWqVa36c8pYB4nwPF3MxlITut
 TbHOqM/KLdnQFH4ycN2gX/cuJUeNjCczSdW2WIxg1GMqnfmQXYECZASzYU8ho8CnkXSw
 hwkg==
X-Gm-Message-State: APjAAAVhZskvltpLAzSOOX4RsioS9Ld1yKsbk/mSB7JKbDivwvpa3SYF
 EefSMNh0MdSDGPEfVz9oIZ78Mwe6iAHYowvbBHOlW2syczG53S1cgoSFXYmbRJg/zjxHFHHHjvV
 ng7U3n/A5tHYFV00=
X-Received: by 2002:ad4:446b:: with SMTP id s11mr24696548qvt.148.1577119280998; 
 Mon, 23 Dec 2019 08:41:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyx+5pBtb5Fi/g1axmxpeTnUBPqmXEN0nQzahhYJEQ6mhMTYF12U0BoAbZ0didia4ruvwhgbA==
X-Received: by 2002:ad4:446b:: with SMTP id s11mr24696464qvt.148.1577119279659; 
 Mon, 23 Dec 2019 08:41:19 -0800 (PST)
Received: from redhat.com (bzq-109-64-31-13.red.bezeqint.net. [109.64.31.13])
 by smtp.gmail.com with ESMTPSA id
 o7sm5905682qkd.119.2019.12.23.08.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 08:41:18 -0800 (PST)
Date: Mon, 23 Dec 2019 11:41:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/27] virtio-serial-bus: fix memory leak while attach
 virtio-serial-bus
Message-ID: <20191223141536.72682-5-mst@redhat.com>
References: <20191223141536.72682-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191223141536.72682-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: JDzYbS3mMXWs5ISQddgl9A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Amit Shah <amit@kernel.org>,
 Pan Nengyuan <pannengyuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Euler Robot <euler.robot@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

ivqs/ovqs/c_ivq/c_ovq is forgot to cleanup in
virtio_serial_device_unrealize, the memory leak stack is as bellow:

Direct leak of 1290240 byte(s) in 180 object(s) allocated from:
    #0 0x7fc9bfc27560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
    #1 0x7fc9bed6f015 in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x50015)
    #2 0x5650e02b83e7 in virtio_add_queue hw/virtio/virtio.c:2327
    #3 0x5650e02847b5 in virtio_serial_device_realize hw/char/virtio-serial=
-bus.c:1089
    #4 0x5650e02b56a7 in virtio_device_realize hw/virtio/virtio.c:3504
    #5 0x5650e03bf031 in device_set_realized hw/core/qdev.c:876
    #6 0x5650e0531efd in property_set_bool qom/object.c:2080
    #7 0x5650e053650e in object_property_set_qobject qom/qom-qobject.c:26
    #8 0x5650e0533e14 in object_property_set_bool qom/object.c:1338
    #9 0x5650e04c0e37 in virtio_pci_realize hw/virtio/virtio-pci.c:1801

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <1575444716-17632-3-git-send-email-pannengyuan@huawei.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/char/virtio-serial-bus.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 33259042a9..e1cbce3ba3 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1126,9 +1126,17 @@ static void virtio_serial_device_unrealize(DeviceSta=
te *dev, Error **errp)
 {
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
     VirtIOSerial *vser =3D VIRTIO_SERIAL(dev);
+    int i;
=20
     QLIST_REMOVE(vser, next);
=20
+    virtio_delete_queue(vser->c_ivq);
+    virtio_delete_queue(vser->c_ovq);
+    for (i =3D 0; i < vser->bus.max_nr_ports; i++) {
+        virtio_delete_queue(vser->ivqs[i]);
+        virtio_delete_queue(vser->ovqs[i]);
+    }
+
     g_free(vser->ivqs);
     g_free(vser->ovqs);
     g_free(vser->ports_map);
--=20
MST


