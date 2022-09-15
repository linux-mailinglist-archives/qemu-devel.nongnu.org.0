Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4B5B928F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 04:14:13 +0200 (CEST)
Received: from localhost ([::1]:49772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYeOJ-0003Cg-Ny
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 22:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYeMf-0001qa-Gl
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 22:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYeMb-0007yV-Oc
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 22:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663207944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYQl78fuAUYqVfos5YIX84BXVyNQB0cNX2gOvtdKaAg=;
 b=TJa++2DZSoatgq7wRLPh0BKEWYGJDoi4To1XbboUtUjMQxaAA2/CLK8Y+6Nq2D+HfUC+vq
 0Zd4ldtYlVaEASo5MZwgrrKDEaNhM27YYeSIRZxovNfB5/jkAS8gRLDpBOPhqbkiGeaXsR
 mBFh/5BohqPoJEXoaT1L4yGPWTApVqI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-GL6NjLXMPfiEY4z-SpLlWQ-1; Wed, 14 Sep 2022 22:12:22 -0400
X-MC-Unique: GL6NjLXMPfiEY4z-SpLlWQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 a8-20020ab04948000000b003b5de1448d2so4610811uad.11
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 19:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AYQl78fuAUYqVfos5YIX84BXVyNQB0cNX2gOvtdKaAg=;
 b=kUIe+G/o2/lPZTTmqT9EaJe7S75Jpf9oQA/ur28dL6JFbtT9O4kQFtQiMl8NPYZ8F0
 JCAS82u4wRe7iCncHQs99o+trnTfFPFV4etuF7wmWUi9m5EyyvMaxXvHD0gTwSBd4UWs
 64ddtx7/aCXpkxJLKnN9YdRjhnBnosGIL85Wyb1XPueO6U57k5TAT+Ccw+UBN+kEyobx
 Gdes7j0i9eRUVZ8SiRpcmVF5eo8ylcGOXVnxbsQyw+PGhKb6El61S1tjnrujKzOd0khb
 yuTtSSDMXbDv+6bebi77dyy6LwdufWqsxfdgHJtjv4ujHFawKww8fiEziM0F0D6jqqwx
 AWyg==
X-Gm-Message-State: ACgBeo2/BvLq3IKAF45vXtTiHHeGlVqK4POnAiI42DdAw96SoaSfbJym
 9SnaA7dcrjj8aZdKbqCU6iJI2OaQuFdoI9/ssDTPOc96mpMiAx/a44rBLmwHPdjVE+vJ8XgT2oh
 YrE47LZ4VF1Z+BEEfahNJY5/rDytyCGg=
X-Received: by 2002:a05:6102:1341:b0:398:889e:7f28 with SMTP id
 j1-20020a056102134100b00398889e7f28mr6773616vsl.21.1663207942373; 
 Wed, 14 Sep 2022 19:12:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4nZrmkFA02QAfbUxBdq6mfXLdNpgvUrxDo3s7UM3iBYegry0swfBS2h03rGXPBkx/fTpzJgBNE9yOESRKxp1c=
X-Received: by 2002:a05:6102:1341:b0:398:889e:7f28 with SMTP id
 j1-20020a056102134100b00398889e7f28mr6773609vsl.21.1663207942125; Wed, 14 Sep
 2022 19:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
 <a14f5ebdefb82d7679841c1d5ddab54ec9406ea1.1662949366.git.kangjie.xu@linux.alibaba.com>
 <ac7dacaf-ea85-b608-4047-27254aefd97a@redhat.com>
 <1663136320.6336615-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1663136320.6336615-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 15 Sep 2022 10:12:11 +0800
Message-ID: <CACGkMEvSt0etgoVyPVTk1axV+mx30CigR6bhbNYt8oYTTC2=Dw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] vhost-net: vhost-user: update
 vhost_net_virtqueue_reset()
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: mst <mst@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Heng Qi <hengqi@linux.alibaba.com>, Kangjie Xu <kangjie.xu@linux.alibaba.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Sep 14, 2022 at 2:21 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrot=
e:
>
> On Wed, 14 Sep 2022 11:13:29 +0800, Jason Wang <jasowang@redhat.com> wrot=
e:
> >
> > =E5=9C=A8 2022/9/12 11:10, Kangjie Xu =E5=86=99=E9=81=93:
> > > Update vhost_net_virtqueue_reset() for vhost-user scenario.
> > >
> > > In order to reuse some functions, we process the idx for
> > > vhost-user scenario because vhost_get_vq_index behave
> > > differently for vhost-user.
> > >
> > > Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >   hw/net/vhost_net.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > >
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index ea896ea75b..25e5665489 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -545,6 +545,9 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev=
, NetClientState *nc,
> > >       assert(vhost_ops);
> > >
> > >       idx =3D vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> > > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER) {
> > > +        idx -=3D net->dev.vq_index;
> > > +    }
> >
> >
> > This looks tricky. Any reason we can't simply use vq_index for both
> > vhost-user and vhost-net?
>
>
> static int vhost_user_get_vq_index(struct vhost_dev *dev, int idx)
> {
>     assert(idx >=3D dev->vq_index && idx < dev->vq_index + dev->nvqs);
>
>     return idx;
> }
>
>
> static int vhost_kernel_get_vq_index(struct vhost_dev *dev, int idx)
> {
>     assert(idx >=3D dev->vq_index && idx < dev->vq_index + dev->nvqs);
>
>     return idx - dev->vq_index;
> }
>
> The implementation of these two callbacks is different. The structure of =
the two
> scenarios is different. We may need to do some optimizations in the futur=
e.

Yes, but what I meant is, you do

idx -=3D net->dev.vq_index;

and then

net->dev.vq_index + idx

This is a hint that we should have a better organization of the code.

Thanks

>
> Thanks.
>
>
> >
> > Thanks
> >
> >
> > >
> > >       if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP) {
> > >           file.index =3D idx;
> >
>


