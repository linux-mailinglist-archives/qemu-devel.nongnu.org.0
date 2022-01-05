Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8331F484FF5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:23:24 +0100 (CET)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52Vv-0002aT-78
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:23:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n52U0-0001Me-IL
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:21:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n52Tu-0007sb-2J
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641374477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DAaO+UMh98M/up0WbsNABW+SyWCfdojewIvbvbhtT58=;
 b=ImMebw1eFMTqCz598uDOFJRzWITxHHFdwaeDMFHVaFlkt4qEnnf8DcbWG4sNjuuVXRvwfm
 loHCdN5KMxoFH8eFf35cTsiBfgE6BlVzr4FIvJaWF4vlhC9ft9ycsXlL8KoWdRrFnMCplt
 5cyzJLq4bw86pkqa2fCdIwwLN0dBQtc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-z__2pdU5OvGrOd47dTma-w-1; Wed, 05 Jan 2022 04:21:16 -0500
X-MC-Unique: z__2pdU5OvGrOd47dTma-w-1
Received: by mail-lj1-f198.google.com with SMTP id
 z9-20020a2e3509000000b0022d8e7f5889so11803590ljz.16
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAaO+UMh98M/up0WbsNABW+SyWCfdojewIvbvbhtT58=;
 b=zqfH7tH+xqBZZwWMzwUF0APvDNtvc+D/YuCw4SvF4g8xIbhMX7dEyUkHvkzkiNwCsh
 EV4d/HpC0digkqr+KGHBM3Tp3yLUQs5T7JtMIVcRrlQx2Yug70WFN3MVYeIC8fovFkXx
 MiWj6sDS8FZW9jMmxu10/4tD4CWCBWCBK3aIpYv8hNaQEmCTLz1P9EZWSAZEJDohfmQH
 W4gPmyphy+lgYDt0K0QVTLp+gIToudUR1lSgyRltZvoQTqfJNyqTTeR1kVNV3LUQR2LB
 ojclifUOUyVtNZOd8nhilmbYYvvXMTg4daRkHb+7Y8f/8SN3xEyhgQ8jxzVlUpPnqJ0y
 hxfA==
X-Gm-Message-State: AOAM532k1GTkzCttzN4PjRiKsC+AH4/I0WNTMQM9XOzjwkDXwm/6yqLQ
 4yOjZS8ca+l1sy3wP2NdXCmU8vo1bBC1LlOG5sLkZ/jaIwlmF0FcXpie3wVA89BNbAgC0MTbYMK
 Q1m30jHKDkKHr7Da9uv+GuQz2JsnwtS4=
X-Received: by 2002:a05:6512:68a:: with SMTP id
 t10mr48468168lfe.84.1641374474748; 
 Wed, 05 Jan 2022 01:21:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0WeSpudaOaX4cFRbPD3BjRmzDeMocuSfUhdk4nyTdd0zoR2uyfbw+u7ltG0qQmzPPkDMTi1w2hjeEjBea2C8=
X-Received: by 2002:a05:6512:68a:: with SMTP id
 t10mr48468142lfe.84.1641374474436; 
 Wed, 05 Jan 2022 01:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
 <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
 <20220105030025-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220105030025-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 5 Jan 2022 17:21:02 +0800
Message-ID: <CACGkMEuJryvBzAZOaqP4QV=aj0Rf95C_kWpg9dh4tsQXdbEUaw@mail.gmail.com>
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Yechuan <yechuan@huawei.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini <pbonzini@redhat.com>, "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 5, 2022 at 5:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jan 05, 2022 at 03:54:13PM +0800, Jason Wang wrote:
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
>
> Some hardware may be more limited. E.g. there could be a bunch of vqs
> which don't need a dedicated interrupt. Or device could support a single
> interrupt shared between VQs.

Right, but in the worst case, we may just waste some eventfds?

Or if we want to be optimized in the case you mentioned above, we need
to know the association among vectors and vqs which requires more
extensions.

1) API to know which vectors does a dedicated VQ belong
2) the kick eventfd is set based on the vectors but not vq

And such mappings are not static, e.g IFCVF requesting MSI-X vectors
during DRIVER_OK.

Thanks

>
>
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


