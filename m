Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF55898EE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:02:53 +0200 (CEST)
Received: from localhost ([::1]:48586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJVoi-00042p-Ls
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJVeq-0003PF-90
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJVeo-0006wT-9a
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659599557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8F0S6LKNOGe0vGnCxY64jodkA263GuoIQL9zPEblVo0=;
 b=V2xdk2V3w9rI3RGWxFmjbOtGpJpbT45BHo/LfIJcO3loYSBzyvtrKsnq4CTRd71QSvfWas
 WpGhKB50fPu8pgRtnYqscyA5oBvOzukKDRYHMds2Y9ZhR7mmUUqRdRKg9I5H9b3Pk7JBV4
 6kqD8v4dgRC7Jx0iYcjb9dPJ1yzsJxg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620--wybcHDxOUuvgAiUhK6R5Q-1; Thu, 04 Aug 2022 03:52:36 -0400
X-MC-Unique: -wybcHDxOUuvgAiUhK6R5Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 p6-20020a0c8c86000000b004731e63c75bso11436196qvb.10
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8F0S6LKNOGe0vGnCxY64jodkA263GuoIQL9zPEblVo0=;
 b=VrFuEuU/zNc9JtKwGtiO9195WU6J0jPfJ3gdvz4jdyPp6/wA7gw3hBWKiB1WhwlUXW
 upD0HE41dGrBDoajWTD1egc8JYdUsRbUP3KciJpasiCqzWhCwyioKfs5Q0eX/wZTFU7Q
 w+mvilmM78WZletJvu4H1FNioICFn2RBybUJv1Odqwt2KF6l9PNyCtbgWmdQIaWvOLJ5
 qZDysFh3725mpdbQ6ah7fdW79IndjjC8BXZqThQKQhEuU0juJnNlLCiamZ31Rj/R5oCE
 dg1sO5+IrVUju3Fp6jIgYIPdcHggQ1/dfhmGFL1iX2JQXKtoAJ8CwVIn3O1WnyXjksLp
 A4wg==
X-Gm-Message-State: ACgBeo0IJawWoY2nu8VN2+g1seqcxQQ2DRJA7Z0FmEKB5V4o373H1Suh
 +1HnnXLYvmR+z8hdiAdLGlW9u61LFVrxkbkVx3MezaHEPKp02L57s1BYqlQtynnMymH0vZB+7yL
 /LbPo8GIqUQNwczSfkRtS9cgnBvtUM/4=
X-Received: by 2002:a05:622a:110f:b0:31e:e0ae:a734 with SMTP id
 e15-20020a05622a110f00b0031ee0aea734mr460091qty.495.1659599555731; 
 Thu, 04 Aug 2022 00:52:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR75aAwbdfHLU6s3SaSU/UUeQWjFDM6Z/PynWnM5uITHZk/mGdwFmveZqryri6JJlbW8y3+579zJnBtqmN4yxus=
X-Received: by 2002:a05:622a:110f:b0:31e:e0ae:a734 with SMTP id
 e15-20020a05622a110f00b0031ee0aea734mr460065qty.495.1659599555414; Thu, 04
 Aug 2022 00:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220803171821.481336-1-eperezma@redhat.com>
 <20220803171821.481336-7-eperezma@redhat.com>
 <c25c142f-ad9d-a5cf-9837-5570d563ad07@redhat.com>
In-Reply-To: <c25c142f-ad9d-a5cf-9837-5570d563ad07@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 09:51:59 +0200
Message-ID: <CAJaqyWd8ddjFLk=C=Mw_6o2=+0w=ior5fvCV2jSMx7LodVnmAA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] vhost_net: Add NetClientInfo prepare callback
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm list <kvm@vger.kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 4, 2022 at 6:46 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/4 01:18, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > This is used by the backend to perform actions before the device is
> > started.
> >
> > In particular, vdpa will use it to isolate CVQ in its own ASID if
> > possible, and start SVQ unconditionally only in CVQ.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/net/net.h  | 2 ++
> >   hw/net/vhost_net.c | 4 ++++
> >   2 files changed, 6 insertions(+)
> >
> > diff --git a/include/net/net.h b/include/net/net.h
> > index a8d47309cd..efa6448886 100644
> > --- a/include/net/net.h
> > +++ b/include/net/net.h
> > @@ -44,6 +44,7 @@ typedef struct NICConf {
> >
> >   typedef void (NetPoll)(NetClientState *, bool enable);
> >   typedef bool (NetCanReceive)(NetClientState *);
> > +typedef void (NetPrepare)(NetClientState *);
> >   typedef int (NetLoad)(NetClientState *);
> >   typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_=
t);
> >   typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec =
*, int);
> > @@ -72,6 +73,7 @@ typedef struct NetClientInfo {
> >       NetReceive *receive_raw;
> >       NetReceiveIOV *receive_iov;
> >       NetCanReceive *can_receive;
> > +    NetPrepare *prepare;
> >       NetLoad *load;
> >       NetCleanup *cleanup;
> >       LinkStatusChanged *link_status_changed;
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index a9bf72dcda..bbbb6d759b 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -244,6 +244,10 @@ static int vhost_net_start_one(struct vhost_net *n=
et,
> >       struct vhost_vring_file file =3D { };
> >       int r;
> >
> > +    if (net->nc->info->prepare) {
> > +        net->nc->info->prepare(net->nc);
> > +    }
>
>
> Any chance we can reuse load()?
>

We would be setting the ASID of CVQ after DRIVER_OK, vring
addresses... if we move to load.

Thanks!

> Thanks
>
>
> > +
> >       r =3D vhost_dev_enable_notifiers(&net->dev, dev);
> >       if (r < 0) {
> >           goto fail_notifiers;
>


