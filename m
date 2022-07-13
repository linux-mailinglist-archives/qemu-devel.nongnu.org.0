Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956E5572E14
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 08:23:59 +0200 (CEST)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVmw-0005wU-GE
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 02:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBVi4-0002UU-Jx
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:18:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBVi0-0000HL-W9
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657693131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Ww9buU/UqAx12eXW6nbUL3hZME0KpFt5Bs0Fitdmec=;
 b=gLHxepZVVtyxRSY53plfoQm0UN9GVsnJ7/NjHfstVcnlwwfu+j50JAcJv2nLPJg/ByHN/x
 NRo0USc5RT0pmslQ0SAgzm+POf58QPgwJXP9kSkHY5pAoz7SLNePKH9Q7jGH2AaAxzPmjQ
 Sc82uRIJX2tzvy0NHI2C/l98+AYVQ2w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-7Bc6R7KwMXyVNfRkQ9oCGw-1; Wed, 13 Jul 2022 02:18:50 -0400
X-MC-Unique: 7Bc6R7KwMXyVNfRkQ9oCGw-1
Received: by mail-qk1-f198.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so9314107qko.18
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 23:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Ww9buU/UqAx12eXW6nbUL3hZME0KpFt5Bs0Fitdmec=;
 b=hz/nNQfEToXCZgB9H/TX5PSpIHOJ5b3WNPqbcGN8Wlu/ybIb/9LFDtCrB1wgGEJeEO
 zJO7b2UKe/tZUZumSG9OM+4f2ElSqxP0PSZsMD2aHw3Z6rzvWlhTCMdtgK5Dk/DRiFYI
 8zQd1dbeB3C27jIo/Ey+JqJdUMuayKgaxRQgr2fGjlyrGY7hf69ruYCHpmtohy2kMDj8
 Kx74pnhU4xcfgwpeMBQ5u3BIyPesDKmyQo7NpbanFXmXx3wJQtk8pjJMpwzrNWqEaDIy
 TK0/l8TjcDrrVCikQCQ30a6tl1W7tHIXD/70MAe3zCqspUh84rguKfvJKdBque9cP1cH
 nE3w==
X-Gm-Message-State: AJIora/UdNeBIKWzE2Des4cwIq4PswBPFwbg/ai35HbmhRQAsty4O6sm
 pluiKt/hHlQE0iKxNp5s+lHsQ8PXETZ+4PQWtBGECrbf/zhTP55QwsxN/srRkzls5ZjAHlvPvqo
 pqe1YHT53ME1gu0S10RFQv51nBGnctpE=
X-Received: by 2002:a05:6214:628:b0:472:f9df:970f with SMTP id
 a8-20020a056214062800b00472f9df970fmr1473464qvx.64.1657693129566; 
 Tue, 12 Jul 2022 23:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tBtA1knk6MpwBZHP2FEWEYYOxEhPO4NKuLqcHVlHeHd5GLHeXoBKXtqDi1Vh52LaC1EPhzXBey78ZV+JYmE00=
X-Received: by 2002:a05:6214:628:b0:472:f9df:970f with SMTP id
 a8-20020a056214062800b00472f9df970fmr1473433qvx.64.1657693129304; Tue, 12 Jul
 2022 23:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-4-eperezma@redhat.com>
 <20220713014746-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220713014746-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 13 Jul 2022 08:18:13 +0200
Message-ID: <CAJaqyWdMnGw+j2-4A--YJ1XbpvYaVQERoKBYLfs3_XN2Bpzv_w@mail.gmail.com>
Subject: Re: [RFC PATCH v9 03/23] vdpa: delay set_vring_ready after DRIVER_OK
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>
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

On Wed, Jul 13, 2022 at 7:52 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jul 06, 2022 at 08:39:48PM +0200, Eugenio P=C3=A9rez wrote:
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
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Not a comment on this patch specifically, but generally:
>
> You should know that lots of existing drivers are buggy and
> try to poke at the VQs before DRIVER_OK. We are doing our best
> to fix them but it's taking forever. For now it's a good
> idea to support such drivers even if they are out of spec.

I think vhost-vdpa should not need to explicitly handle it, since it
is started after DRIVER_OK. But I think it's a good idea to perform a
fast test. I think those kicks will go to the device's ioeventfd and
the specific virtqueue's handle_output callback.

> You do that by starting on the first kick in absence of DRIVER_OK.
> Further, adding buffers before DRIVER_OK is actually allowed,
> as long as you don't kick.
>

SVQ adds all the buffers after the guest's driver_ok and after set
driver_ok to the device. What it does is to send CVQ buffers before
enabling the data queues with VHOST_VDPA_SET_VRING_ENABLE. Only CVQ is
enabled at this point, but DRIVER_OK has already been sent.

Or am I missing something?

Thanks!

>
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
> >      } else {
> >          vhost_vdpa_reset_device(dev);
> >          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                     VIRTIO_CONFIG_S_DRIVER);
> >          memory_listener_unregister(&v->listener);
> > -
> > -        return 0;
> >      }
> > +
> > +    return 0;
> >  }
> >
> >  static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t bas=
e,
> > --
> > 2.31.1
>


