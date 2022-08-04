Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05594589946
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:28:03 +0200 (CEST)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWD2-0007E8-NI
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJW57-0001t1-Vx
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJW52-0002sV-Ro
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659601183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+uVsdYY01swaMcRVhQwA9Xz8YWRnQfBQAXLYoDHP99I=;
 b=UEYRhIKbDrPPeflVIa/Sw/939X74kIMxCRHqDUx0OZfBXBm0htzFk5ShGhtJQU6rgYIjJc
 i/Izp0w33As2eCl8yVRu/Y1e80c0XOIunyTTlWVgg/aUSSxpq36W0pCnfa9WQ2sToDJ90C
 V/PjZPVkG5efSmyPGlxe5F0mHsN6AZg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-E6zKL1O-OqaX-L6Vp_MjRw-1; Thu, 04 Aug 2022 04:19:42 -0400
X-MC-Unique: E6zKL1O-OqaX-L6Vp_MjRw-1
Received: by mail-qk1-f200.google.com with SMTP id
 de4-20020a05620a370400b006a9711bd9f8so15229598qkb.9
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 01:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+uVsdYY01swaMcRVhQwA9Xz8YWRnQfBQAXLYoDHP99I=;
 b=erOYnJAUh5p7xyRZaKAUZfVClAEAgYErxM3feV9mgSJBRePmq+t6ClhELJH2R3Dubb
 zonqtaxUD1sPKNREDQjS3zmKAYsdaLac3Rodf7yodjzRzulCQWxaG+t6ZTja9BNZh3Z0
 nnfooV0ytG+EhntBM6R6Ueg2Raf3o/AGa+m/19dX9O8PucgMZcf4w78C9MK27H6LPVSe
 gyyFpTbWVs7lf1NswOGSFWwoNSWbZ9yMqDE2rlTO7lkiYa3bd+NfxuUKtWih4gqLFLmC
 TztG0lZGF+TgKWSOEjYijbkKW35l4Y6QcOT+F/GDEAb4ut8R8hqFjiu9ogj+fFOVWwd8
 NRbQ==
X-Gm-Message-State: ACgBeo2QiRykTJTtePMOgXwO++VkX5/cooY9gsm5PEf8pOfuJgeW+///
 pyIsFNST2yEqjzzMGqtTzPoK7UCaVIP6YVWmnkdKn0zFnHBWA6wU1agBHg2ahvf3fJQIcumdSn9
 wbeIKjWt76EO8tOjK/3IbLvhYXJSeh48=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr467089qkl.559.1659601180207; 
 Thu, 04 Aug 2022 01:19:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7tr8jO23K7C/hw7Amb/GPmi6U5Q7QmTj4N2+ofLWYpyu7UW+4lfbfbvTZ8HqmzYTr5fUlwKojkSsctPN/fK9Q=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr467069qkl.559.1659601179893; Thu, 04
 Aug 2022 01:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-7-eperezma@redhat.com>
 <47e1e277-34e9-b043-0a74-bf2b67391c6a@redhat.com>
 <CAJaqyWc2+H0t1tgfmh6kgShJ9Obq46oUxX998YvRvQRfj3+eCA@mail.gmail.com>
 <CACGkMEuQ0cYAaGf6T+m_WuaK1n58XxGXney3jx5mDni78BqbYQ@mail.gmail.com>
In-Reply-To: <CACGkMEuQ0cYAaGf6T+m_WuaK1n58XxGXney3jx5mDni78BqbYQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 10:19:03 +0200
Message-ID: <CAJaqyWeQSLY7dPyaoAZaKtVQ9j8f7HnDk3eNcCTY5hK9cBKs+g@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] vdpa: Make vhost_vdpa_net_cvq_map_elem accept
 any out sg
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
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

On Thu, Aug 4, 2022 at 9:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Aug 4, 2022 at 3:39 PM Eugenio Perez Martin <eperezma@redhat.com>=
 wrote:
> >
> > On Thu, Aug 4, 2022 at 6:17 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > So its generic enough to accept any out sg buffer and we can inject
> > > > NIC state messages.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > > v5: Accept out sg instead of dev_buffers[]
> > > > ---
> > > >   net/vhost-vdpa.c | 13 +++++++------
> > > >   1 file changed, 7 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 33bf3d6409..2421bca347 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -302,16 +302,16 @@ dma_map_err:
> > > >   }
> > > >
> > > >   /**
> > > > - * Copy the guest element into a dedicated buffer suitable to be s=
ent to NIC
> > > > + * Maps out sg and in buffer into dedicated buffers suitable to be=
 sent to NIC
> > > >    */
> > > > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > > > -                                        VirtQueueElement *elem,
> > > > -                                        size_t *out_len)
> > > > +static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
> > > > +                                      const struct iovec *out, siz=
e_t out_num,
> > > > +                                      size_t *out_len)
> > >
> > >
> > > This still looks not genreal as there's no guarantee that we won't ha=
ve
> > > command-in-specific-data. One example is that Ali is working on the
> > > virtio-net statistics fetching from the control virtqueue.
> > >
> > > So it looks to me we'd better have a general bounce_map here that acc=
epts:
> > >
> > > 1) out_sg and out_num
> > > 2) in_sg and in_num
> > >
> >
> > We don't need to pass in_sg for that: The only useful information is
> > its size.
>
> What if we support stats in the future where it extends the ctrl command:
>
>          u8 command;
>          u8 command-specific-data[];
>          u8 ack;
> +        u8 command-specific-data-reply[];
>
> in
>
> https://lists.oasis-open.org/archives/virtio-dev/202203/msg00000.html
>

The guest will expose an in descriptor in whatever layout it wants.
QEMU reads its layout into a VirtQueueElement in_num and in_sg
members, in qemu's (and SVQ) address space.

Since we don't want the guest to be able to modify the in buffer
maliciously, we offer the device a bounce in buffer. Since the in
buffer still contains no information, we only need its size, so we can
"allocate and map" an equivalent one for the device and memset to 0.
For simplicity, we allocate one page, so no need for iovec
complexities.

After the device has written in it, we get the written len and verify
the information. If VIRTIO_NET_OK, we copy that to the guest's in
buffer, using the iov_from_buf right after out: tag at
vhost_vdpa_net_handle_ctrl_avail. Instead of copy from the stack
"(status, sizeof(status))" variable, we copy from
(s->cvq_cmd_in_buffer, written_len).

Note that this is still not enough for stats. We also need a way to:
* Update the virtio-net device model stats. virtio_net_handle_ctrl_iov
would try to write the virtio-net stats to in buffer, not to update
the device model stat.
* Update the stats on the destination. Another ctrl command? Intercept
them via svq and simply sum source stats + current device stats? I'd
say the second is better as it saves effort to the device, but maybe
it's not.

That's why I think this command should be left out at the moment, to
do the modifications is not hard but we should agree on how to do them
first.

> > Since the exposed buffer is an in one, it's enough to expose
> > the s->cvq_cmd_in_buffer buffer in full. The caller already knows the
> > device will write to it, so the only missing piece is to return the
> > written length at vhost_vdpa_net_cvq_add.
> >
> > Is one page the right buffer size for the in buffer?
>
> We can start from this.
>
> > Is it worth
> > worrying about it before implementing the stat control command in qemu
> > virtio-net?
>
> If it's not complex, it's better to do that from the beginning,
> otherwise the user may be surprised and we need extra work. Anyhow, we
> should support at least ack which is an in_sg.
>
> >
> > > In this level, we'd better not have any special care about the in as =
the
> > > ack.
> >
> > We need to care about it. If a property has not been updated in the
> > vdpa device (it returned VIRTIO_NET_ERR), we must not update the
> > device model.
>
> Yes, but what I meant is at the level of bouncing itself. If we met
> VIRTIO_NET_ERR, we should propagate it to the guest as well?
>

Yes we have, if not the guest thinks the command succeeds. Isn't it?

Thanks!

> Thanks
>
> >
> > We can move the processing from vhost_vdpa_net_cvq_add to
> > vhost_vdpa_net_load and vhost_vdpa_net_handle_ctrl_avail, but the code
> > gets duplicated then.
> >
> > > And we need do bouncing:
> > >
> > > 1) for out buffer, during map
> > > 2) for in buffer during unmap
> > >
> >
> > We can move the copy of the in_buffer to the unmap for sure.
> >
> > Thanks!
> >
> > > Thanks
> > >
> > >
> > > >   {
> > > >       size_t in_copied;
> > > >       bool ok;
> > > >
> > > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, el=
em->out_num,
> > > > +    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
> > > >                                   vhost_vdpa_net_cvq_cmd_len(),
> > > >                                   s->cvq_cmd_out_buffer, out_len, f=
alse);
> > > >       if (unlikely(!ok)) {
> > > > @@ -435,7 +435,8 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vho=
stShadowVirtqueue *svq,
> > > >       };
> > > >       bool ok;
> > > >
> > > > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, &dev_buffers[0].io=
v_len);
> > > > +    ok =3D vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_nu=
m,
> > > > +                                   &dev_buffers[0].iov_len);
> > > >       if (unlikely(!ok)) {
> > > >           goto out;
> > > >       }
> > >
> >
>


