Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB50956B631
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:02:10 +0200 (CEST)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9koL-0005gY-T1
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9kjj-0001AN-9M
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:57:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9kjg-0003YH-DR
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657274239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXFJgg+DWZ0qwwbiliv5fi12vLk4283in98kFWNyF9w=;
 b=ggtSdon2T/hIYviBi8BDGHaKBmUcH181dUrTYWZGuKioO1TytZ1cvghVsGNbbPmiAnsu5R
 w1M/WJqidMqjYPbY0zeXwZvlEC/ukJt96PW2qPF+hv9bfZw3Fz2NVdxq6DxZYiooJvkaBr
 Q0U2WD+1+jx/PqoY/JtBfvHcXypHdZw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-I8UMnH88Mp2yEc9yF5mGPQ-1; Fri, 08 Jul 2022 05:57:18 -0400
X-MC-Unique: I8UMnH88Mp2yEc9yF5mGPQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 u2-20020ac80502000000b002f94701339eso18077995qtg.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MXFJgg+DWZ0qwwbiliv5fi12vLk4283in98kFWNyF9w=;
 b=rRCMZ9d6gVOWznISMjsY7wiZsx32hymtmDfyAKaqoEVcaPoAV9dHEN5h0a2zEjFzAs
 1WSMuEqYIZkrBnk2AI+Uwzuedkjs6WW8qsHfkBSTpGAgAuWsYceeYlp91SlyDfUETEuN
 utFQy7NZBXTPWw9PY7RDGpZFd6mTMoMfu2Qig1WCcNKU5AN1KGodlUArTU9F2L7ejmWK
 Sa5nwA0UkxVVTvskX7ZA9eza1MEqI5oB1G3TqH1vw1mpV2CMCdhsweXyk5thNSYGRl+u
 dM4TU93NGwTSin2Qe7aROIdbWvPvUhZrNfjvMtXRsD0btky1RmmYNZxc/1k4qpJwjara
 NytQ==
X-Gm-Message-State: AJIora8RWlRdKruk1rUJjWrJmmRUmJRV0D9RL1lYZ8jk6lfB9uTpjN7h
 L9KmKTTkm4DkwDyyxKC9ABC4Vz8/grnohA6Gg8woES31LNZYcJ6PSI47cDMMdu1hSLLr/colLbf
 CWFmxfx+fHdhA2UPY1xJ0BxESCeFZLSU=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr1945634qvb.2.1657274237584; 
 Fri, 08 Jul 2022 02:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sKL9OR5vKVC8JFynSl/PQMPFd5l8LBHSlWArrm7mzkNfTYRC3LCm034SvNoL0kp8RrYh1B6tt7h5oNOpJxde4=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr1945621qvb.2.1657274237393; Fri, 08 Jul
 2022 02:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-4-eperezma@redhat.com>
 <CACGkMEv361=0fJY-x2=xARkDKYWgZcAUrQD=jds=m30GvPzR_g@mail.gmail.com>
In-Reply-To: <CACGkMEv361=0fJY-x2=xARkDKYWgZcAUrQD=jds=m30GvPzR_g@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 8 Jul 2022 11:56:41 +0200
Message-ID: <CAJaqyWcQV9dUvFP8FNxyuneRDnC0OQ0CPsdPbC+Bxbx3-HrGyA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 03/23] vdpa: delay set_vring_ready after DRIVER_OK
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Fri, Jul 8, 2022 at 11:06 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Jul 7, 2022 at 2:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > To restore the device in the destination of a live migration we send th=
e
> > commands through control virtqueue. For a device to read CVQ it must
> > have received DRIVER_OK status bit.
> >
> > However this open a window where the device could start receiving
> > packets in rx queue 0 before it receive the RSS configuration. To avoid
> > that, we will not send vring_enable until all configuration is used by
> > the device.
> >
> > As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.
>
> I wonder if it's better to delay this to the series that implements
> migration since the shadow cvq doesn't depends on this?
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 66f054a12c..2ee8009594 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -728,13 +728,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_d=
ev *dev, int idx)
> >      return idx;
> >  }
> >
> > +/**
> > + * Set ready all vring of the device
> > + *
> > + * @dev: Vhost device
> > + */
> >  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> >  {
> >      int i;
> >      trace_vhost_vdpa_set_vring_ready(dev);
> > -    for (i =3D 0; i < dev->nvqs; ++i) {
> > +    for (i =3D 0; i < dev->vq_index_end; ++i) {
> >          struct vhost_vring_state state =3D {
> > -            .index =3D dev->vq_index + i,
> > +            .index =3D i,
>
> Looks like a cleanup or bugfix which deserves a separate patch?
>
> >              .num =3D 1,
> >          };
> >          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> > @@ -1097,7 +1102,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
> >          if (unlikely(!ok)) {
> >              return -1;
> >          }
> > -        vhost_vdpa_set_vring_ready(dev);
> >      } else {
> >          ok =3D vhost_vdpa_svqs_stop(dev);
> >          if (unlikely(!ok)) {
> > @@ -1111,16 +1115,22 @@ static int vhost_vdpa_dev_start(struct vhost_de=
v *dev, bool started)
> >      }
> >
> >      if (started) {
> > +        int r;
> > +
> >          memory_listener_register(&v->listener, &address_space_memory);
> > -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > +        r =3D vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > +        if (unlikely(r)) {
> > +            return r;
> > +        }
> > +        vhost_vdpa_set_vring_ready(dev);
>
> Interesting, does this mean we only enable the last two queues without
> this patch?
>

The function vhost_vdpa_set_vring_ready is changed in this patch.
Instead of enabling only the vrings of the device, it enables all the
vrings of the device, from 0 to dev->vq_index_end.

In the case of networking, vq_index_end changes depending on how CVQ
and MQ are negotiated or not, so we should be safe here.

Based on your comments it's clear that this is an unexpected change
and I need to add that description to the patch message :).

Thanks!


