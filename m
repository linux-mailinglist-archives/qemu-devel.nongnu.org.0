Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07344851B1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:19:14 +0100 (CET)
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n54K1-0007vB-Nl
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:19:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n54HI-0006V3-2X
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:16:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n54HG-0005sb-I0
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641381378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r9zC7M5WU3HIfYXMrcJMuu9Hb4ElgxiIKFOGc1F5cB4=;
 b=HJ+yKDLXOr5UJtWrpaKc1zHEtEsx9c8UqA1LkG8NfziCAVnQsUcXFHvhH43ktaZ+AaOYrN
 xzUgCOx1xbRt6gK91PYcuM8jgraheyFkOWlKRPwLwkROFDI5ksS8bb6HdJj9lwGz30vEY9
 tdKRHh+GFU3sRjTNKwZvIoMoTVIYsCI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-Ir8T-PUkP0qaHZlaYdspkw-1; Wed, 05 Jan 2022 06:16:17 -0500
X-MC-Unique: Ir8T-PUkP0qaHZlaYdspkw-1
Received: by mail-wr1-f71.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso12542357wrg.11
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 03:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r9zC7M5WU3HIfYXMrcJMuu9Hb4ElgxiIKFOGc1F5cB4=;
 b=5KwCXrXmdrsqHYGtvUCt8JenIRFiTBFYu9nsTMF7AuUV1xNm+8AByeIZ2ecjsLsgOd
 iSPo/OfHE/FHrGlBuuvcelOf/SFnx9y7zDw5rNBmfEttBQDMYvaBLqFjuQE6lTR1kyEI
 7ggSbYGmQaDKQ04gNSKw6+lDryVYXYY0uC925uScWiHIiXKsTkKeECbhn8swClRP9ZP7
 FK8AMVRQtThurTOy8EpegixNjjrCFiGji5Ve4DhK5Sc/+AdY2vy4l5jTP/xiqi9Qc8xy
 vqa2d5Aie0daFrgcwaOapCENmQdQb3Um0shOMmShMEsE0LX6v0GGMWW194ks6D1RMrPt
 AHeg==
X-Gm-Message-State: AOAM5316LrmncpZ0rEsUmqfZsYkRfBPnMm2uiAKAwzeMEf8duNSzhMVg
 iV4Xe/ocebPghfQa6BsgamGFO8hEwzj1MjDP8vKLw0E6AuwjotJEsQ+yEn4glqSpFyRsLsVXx/y
 5N4DNwUtYufHI8Hc=
X-Received: by 2002:a05:6000:1b0c:: with SMTP id
 f12mr1999986wrz.230.1641381376721; 
 Wed, 05 Jan 2022 03:16:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT/JKGHQDn77533b+VWiykJ3o7dLpx4JCwrfUuONMd+Wbd/OtzMqpH9XHDbIsUgUrAtvv1Mg==
X-Received: by 2002:a05:6000:1b0c:: with SMTP id
 f12mr1999960wrz.230.1641381376515; 
 Wed, 05 Jan 2022 03:16:16 -0800 (PST)
Received: from steredhat (host-79-51-11-180.retail.telecomitalia.it.
 [79.51.11.180])
 by smtp.gmail.com with ESMTPSA id q8sm40519614wrx.59.2022.01.05.03.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 03:16:15 -0800 (PST)
Date: Wed, 5 Jan 2022 12:16:12 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC 06/10] vdpa-dev: implement the unrealize interface
Message-ID: <20220105111612.epxi3w3ebsaye5mm@steredhat>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-7-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220105005900.860-7-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, yechuan@huawei.com, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 08:58:56AM +0800, Longpeng(Mike) wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Implements the .unrealize interface.
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/vdpa-dev.c | 22 +++++++++++++++++++++-
> 1 file changed, 21 insertions(+), 1 deletion(-)
>
>diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>index 2d534d837a..4e4dd3d201 100644
>--- a/hw/virtio/vdpa-dev.c
>+++ b/hw/virtio/vdpa-dev.c
>@@ -133,9 +133,29 @@ out:
>     close(fd);
> }
>
>+static void vhost_vdpa_vdev_unrealize(VhostVdpaDevice *s)
>+{
>+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
>+    int i;
>+
>+    for (i = 0; i < s->num_queues; i++) {
                       ^
`s->num_queues` seems uninitialized to me, maybe we could just remove 
the num_queues field from VhostVdpaDevice, and use `s->dev.nvqs` as in 
vhost_vdpa_device_realize().

>+        virtio_delete_queue(s->virtqs[i]);
>+    }
>+    g_free(s->virtqs);
>+    virtio_cleanup(vdev);
>+
>+    g_free(s->config);
>+}
>+
> static void vhost_vdpa_device_unrealize(DeviceState *dev)
> {
>-    return;
>+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>+
>+    virtio_set_status(vdev, 0);
>+    vhost_dev_cleanup(&s->dev);

If we will use `s->dev.nvqs` in vhost_vdpa_vdev_unrealize(), we should 
call vhost_dev_cleanup() after it, just before close() as we already do 
in the error path of vhost_vdpa_device_realize().

>+    vhost_vdpa_vdev_unrealize(s);
>+    close(s->vdpa.device_fd);
> }
>
> static void
>-- 
>2.23.0
>


