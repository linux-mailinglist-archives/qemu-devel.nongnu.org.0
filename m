Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12394484FD1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:11:50 +0100 (CET)
Received: from localhost ([::1]:52542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52Ki-0000ux-0U
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:11:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n52IQ-00009G-B9
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n52IN-00041c-JN
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641373763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B8D84Hnp3EtvDtKd1eXKCenG9w7tkqdBFqy4eQCGl2g=;
 b=brZQnnr/LdOO1ZK0Mvr7vl1dJZi5xcYOom4AnLbLrzrdqg8CBe8smyj8V/v2XfVN47nSEP
 2uZfnsSTbJ9ODqUbQMvQEnbubwgQeVUOW7nybLyBVENCVMD4s/+G3y9HnI5y3Wgul8edXU
 THWKYQgCsYUzZ0sVcLgvIoQOC6Bngng=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-IQq3KiN_PEa8bOxQautjNg-1; Wed, 05 Jan 2022 04:09:20 -0500
X-MC-Unique: IQq3KiN_PEa8bOxQautjNg-1
Received: by mail-lf1-f70.google.com with SMTP id
 r21-20020ac25f95000000b004259e6ab262so9146800lfe.6
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8D84Hnp3EtvDtKd1eXKCenG9w7tkqdBFqy4eQCGl2g=;
 b=4vzAYEBJ1gKX19bEZrRj4i4aep4leN7nD9V0/yriecGGokOjobVOtKdattZ1RsnHdy
 wq34vtj0M4/EJxaNCAF5REZ7l1lhWzVO0uh2V0gXtU0UMbz/H+5QtN+YA3ci4/PsBwwU
 IyUxMrxiElEfvMwnGC012tZvYEBOi80NXjVGRvERrAzdj8hWFT4IYhgnqZ84UNoY3vl5
 nlUXAnQoy6Jt4tJjicPJ6ZhdADP60VspJkufZUMtCUG0Oz9lV3MdeqSIUilGj2gpSArf
 cMhonNqP5x1gIM6C0bUPwzSc+cWcvuvjlwR/gdoYTvYRx3EqykYgPB/ZhTjs5f1jolmz
 ebxQ==
X-Gm-Message-State: AOAM533RuyOJWv0WbnIOTq6xSztCni4BRzHlRGbeQH5JqsPV/V1aZj00
 JNM1rX8xil6+1Fo4O6NfsworZeIoPCEnwgrmnSweV6XoNnJRsJuZFXQs6g0fMldo92XoTehofQi
 W7WBBMqkZts/dS1pE/uZGCy5XADrau80=
X-Received: by 2002:a2e:a40c:: with SMTP id p12mr44399871ljn.369.1641373758526; 
 Wed, 05 Jan 2022 01:09:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPPZjL+AkWZr56edIorYhP8wBt2uxe5cDr0JNd3h7ALgGKOPy3zOiXc4piqU2k+byQLLXNQ6Jx6qtMC8p2W7o=
X-Received: by 2002:a2e:a40c:: with SMTP id p12mr44399851ljn.369.1641373758263; 
 Wed, 05 Jan 2022 01:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
 <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
 <1d157f74fdac49ff8ae734808bd3c518@huawei.com>
In-Reply-To: <1d157f74fdac49ff8ae734808bd3c518@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 5 Jan 2022 17:09:07 +0800
Message-ID: <CACGkMEukEBFYrmJjj-jXR_UdamFbjrFkj7PbdfQJOGMzekAvSg@mail.gmail.com>
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 5, 2022 at 4:37 PM Longpeng (Mike, Cloud Infrastructure
Service Product Dept.) <longpeng2@huawei.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang [mailto:jasowang@redhat.com]
> > Sent: Wednesday, January 5, 2022 3:54 PM
> > To: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>; Stefan Hajnoczi <stefanha@redhat.com>; Stefano
> > Garzarella <sgarzare@redhat.com>; Cornelia Huck <cohuck@redhat.com>; pbonzini
> > <pbonzini@redhat.com>; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> > <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>; qemu-devel
> > <qemu-devel@nongnu.org>
> > Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
> >
> > On Wed, Jan 5, 2022 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Jan 05, 2022 at 12:35:53PM +0800, Jason Wang wrote:
> > > > On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> > > > >
> > > > > From: Longpeng <longpeng2@huawei.com>
> > > > >
> > > > > To support generic vdpa deivce, we need add the following ioctls:
> > > > > - GET_VECTORS_NUM: the count of vectors that supported
> > > >
> > > > Does this mean MSI vectors? If yes, it looks like a layer violation:
> > > > vhost is transport independent.
> > >
> > > Well *guest* needs to know how many vectors device supports.
> > > I don't think there's a way around that. Do you?
> >
> > We have VHOST_SET_VRING/CONFIG_CALL which is per vq. I think we can
> > simply assume #vqs + 1?
> >
> > > Otherwise guests will at best be suboptimal.
> > >
> > > >  And it reveals device implementation
> > > > details which block (cross vendor) migration.
> > > >
> > > > Thanks
> > >
> > > Not necessarily, userspace can hide this from guest if it
> > > wants to, just validate.
> >
> > If we can hide it at vhost/uAPI level, it would be even better?
> >
>
> Not only MSI vectors, but also queue-size, #vqs, etc.

MSI is PCI specific, we have non PCI vDPA parent e.g VDUSE/simulator/mlx5

And it's something that is not guaranteed to be not changed. E.g some
drivers may choose to allocate MSI during set_status() which can fail
for various reasons.

>
> Maybe the vhost level could expose the hardware's real capabilities
> and let the userspace (QEMU) do the hiding? The userspace know how
> to process them.

#MSI vectors is much more easier to be mediated than queue-size and #vqs.

For interrupts, we've already had VHOST_SET_X_KICK, we can keep
allocating eventfd based on #MSI vectors to make it work with any
number of MSI vectors that the virtual device had.

For queue-size, it's Ok to have a new uAPI but it's not a must, Qemu
can simply fail if SET_VRING_NUM fail.

For #vqs, it's OK to have a new uAPI since the emulated virtio-pci
device requires knowledge the #vqs in the config space. (still not a
must, we can enumerate #vqs per device type)

For the config size, it's OK but not a must, technically we can simply
relay what guest write to vhost-vdpa. It's just because current Qemu
require to have it during virtio device initialization.

Thanks

>
> > Thanks
> >
> > >
> > >
> > > > > - GET_CONFIG_SIZE: the size of the virtio config space
> > > > > - GET_VQS_NUM: the count of virtqueues that exported
> > > > >
> > > > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > > > ---
> > > > >  linux-headers/linux/vhost.h | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > >
> > > > > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> > > > > index c998860d7b..c5edd75d15 100644
> > > > > --- a/linux-headers/linux/vhost.h
> > > > > +++ b/linux-headers/linux/vhost.h
> > > > > @@ -150,4 +150,14 @@
> > > > >  /* Get the valid iova range */
> > > > >  #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
> > > > >                                              struct vhost_vdpa_iova_range)
> > > > > +
> > > > > +/* Get the number of vectors */
> > > > > +#define VHOST_VDPA_GET_VECTORS_NUM     _IOR(VHOST_VIRTIO, 0x79, int)
> > > > > +
> > > > > +/* Get the virtio config size */
> > > > > +#define VHOST_VDPA_GET_CONFIG_SIZE     _IOR(VHOST_VIRTIO, 0x80, int)
> > > > > +
> > > > > +/* Get the number of virtqueues */
> > > > > +#define VHOST_VDPA_GET_VQS_NUM         _IOR(VHOST_VIRTIO, 0x81, int)
> > > > > +
> > > > >  #endif
> > > > > --
> > > > > 2.23.0
> > > > >
> > >
>


