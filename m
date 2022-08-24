Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE13759F636
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:30:56 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmii-0001Cx-BG
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQmXl-0002YZ-1C
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQmXf-0006XO-Ha
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661332758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXzZ+895ahIG1kmaC26xyqiUuEYAlCe0+rjeNcOsji0=;
 b=QhmTqJu+Q9CeRST0R7Rvj/DfYwAK9mmsppNQppinJXLjHNi9Vfk8UPWMtR9O/tpI4WI83B
 2ETMYxUmctonMK98tHtelkCPN7cHyY5MgT7eOwa+E0eWZv04sMz8tkOrC/zf9j+V6ioAGF
 CFp3zlR0rkx4TXi36yz7/dFnKaW0Xa0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-Yc6Dht3GOJ2S0DHj0zNoRA-1; Wed, 24 Aug 2022 05:19:17 -0400
X-MC-Unique: Yc6Dht3GOJ2S0DHj0zNoRA-1
Received: by mail-qt1-f199.google.com with SMTP id
 fy12-20020a05622a5a0c00b00344569022f7so12451951qtb.17
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=aXzZ+895ahIG1kmaC26xyqiUuEYAlCe0+rjeNcOsji0=;
 b=kwjwdZ+sb6Vd+JCOuLPCl7zgSAdKvGLTJC8sRGdZgN02ygVpWztdXd+XVZWrW1/QIT
 3V7bGSp44qL4EsW/OctW699CUXlpRK4vSOsVuyqr+zYW5x3dpFCcaQ57snrPNa3lPTuR
 CtImiZ+aeRXbGbwcNxrFw1Bo4L8DUtUl7XXO8NvLxWwXxBTLlqrpHvqRaxb9yja/x6eQ
 SP7Du4PrwZuHeXNoCw9MzmI4+IbPr7WxjAni/aQa58XvjOLIYp9dhgEhEuQSDIGhtwcS
 z4nrUqvWaaP0RjOa9wUUmqiIFTspGOZzyombAF3VNJfcWsPSreRAM/vZaVcfB3M4ng7F
 rfKA==
X-Gm-Message-State: ACgBeo3ZrAcntFiTiXwg+0rfmsTeYYNuYArA+RO8+ibCacJ0D1jlRxLu
 DfiG0+4w9dI6UUAsxAeRqM9a2lLPOa23a+ZfNJ13Hlab8kv3MnyLbi6+DFlaUwxpHP8LbGEewhy
 L/wq9lWX2MAEkp7Z+Quoi2fOm+J9a7iU=
X-Received: by 2002:ad4:5bc7:0:b0:48b:e9ed:47a8 with SMTP id
 t7-20020ad45bc7000000b0048be9ed47a8mr23535773qvt.108.1661332756814; 
 Wed, 24 Aug 2022 02:19:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5s9IiDV/4eatTefg6NIJqXgiST5Z03c4W3HpCuz2XIegRlwVMHTmHHrTon/5sKkPIP/9ntpuIHx74cbMyrDeg=
X-Received: by 2002:ad4:5bc7:0:b0:48b:e9ed:47a8 with SMTP id
 t7-20020ad45bc7000000b0048be9ed47a8mr23535757qvt.108.1661332756597; Wed, 24
 Aug 2022 02:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-3-eperezma@redhat.com>
 <f517a073-fd73-0220-072c-ea054b643468@redhat.com>
 <CAJaqyWcGH-kAVw-yZ2CX-GuPYt1zL8FFJnjmWMcbi4r1NgyfcA@mail.gmail.com>
 <CACGkMEuNTBPSh2x6LVihCE=fg1zYAsnG4io2MBT32+PF9=omwQ@mail.gmail.com>
 <CAJaqyWdDYZscdShMpmvPJdCBDOyeoEUbOztTQDLHdqYwwdah6w@mail.gmail.com>
 <CACGkMEttkCfRAWQQT7APWeV1uZbzr5p+rr_HaeP+tK30dyeZZQ@mail.gmail.com>
In-Reply-To: <CACGkMEttkCfRAWQQT7APWeV1uZbzr5p+rr_HaeP+tK30dyeZZQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 24 Aug 2022 11:18:40 +0200
Message-ID: <CAJaqyWfUh0+dpMf=fF5kbpBGOG8T+GBJ8fT_85oDtK2mkb-DNQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] vdpa: Add vhost_vdpa_net_load_mq
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Wed, Aug 24, 2022 at 11:08 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Aug 24, 2022 at 5:06 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Wed, Aug 24, 2022 at 10:52 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > >
> > > On Wed, Aug 24, 2022 at 3:47 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Wed, Aug 24, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > > >
> > > > >
> > > > > =E5=9C=A8 2022/8/20 01:13, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > > > Same way as with the MAC, restore the expected number of queues=
 at
> > > > > > device's start.
> > > > > >
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > ---
> > > > > >   net/vhost-vdpa.c | 33 +++++++++++++++++++++++++++++++++
> > > > > >   1 file changed, 33 insertions(+)
> > > > > >
> > > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > > index 1e0dbfcced..96fd3bc835 100644
> > > > > > --- a/net/vhost-vdpa.c
> > > > > > +++ b/net/vhost-vdpa.c
> > > > > > @@ -391,6 +391,35 @@ static int vhost_vdpa_net_load_mac(VhostVD=
PAState *s,
> > > > > >       return 0;
> > > > > >   }
> > > > > >
> > > > > > +static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
> > > > > > +                                  const VirtIONet *n)
> > > > > > +{
> > > > > > +    uint64_t features =3D n->parent_obj.guest_features;
> > > > > > +    ssize_t dev_written;
> > > > > > +    void *cursor =3D s->cvq_cmd_out_buffer;
> > > > > > +    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
> > > > > > +        return 0;
> > > > > > +    }
> > > > > > +
> > > > > > +    *(struct virtio_net_ctrl_hdr *)cursor =3D (struct virtio_n=
et_ctrl_hdr) {
> > > > > > +        .class =3D VIRTIO_NET_CTRL_MQ,
> > > > > > +        .cmd =3D VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
> > > > > > +    };
> > > > > > +    cursor +=3D sizeof(struct virtio_net_ctrl_hdr);
> > > > > > +    *(struct virtio_net_ctrl_mq *)cursor =3D (struct virtio_ne=
t_ctrl_mq) {
> > > > > > +        .virtqueue_pairs =3D cpu_to_le16(n->curr_queue_pairs),
> > > > > > +    };
> > > > >
> > > > >
> > > > > Such casting is not elegant, let's just prepare buffer and then d=
o the
> > > > > copy inside vhost_vdpa_net_cvq_add()?
> > > > >
> > > >
> > > > I'm not sure what you propose here. I can pre-fill a buffer in the
> > > > stack and then do an extra copy in vhost_vdpa_net_cvq_add. The
> > > > compiler should be able to optimize it, but I'm not sure if it
> > > > simplifies the code.
> > > >
> > > > We can have a dedicated buffer for mac, another for mq, and one for
> > > > each different command, and map all of them at the device's start. =
But
> > > > this seems too much overhead to me.
> > >
> > > Considering we may need to support and restore a lot of other fields,
> > > this looks a little complicated.
> > >
> > > I meant the caller can simply do:
> > >
> > > struct virtio_net_ctrl_mq mq =3D { ...};
> > >
> > > Then we do
> > >
> > > vhost_vdpa_net_cvq_add(&mq, sizeof(mq), ...);
> > >
> > > Then we can do memcpy inside vhost_vdpa_net_cvq_add() and hide the
> > > cmd_out_buffer etc from the caller.
> > >
> >
> > We need to add the ctrl header too. But yes, that is feasible, somethin=
g like:
> >
> > vhost_vdpa_net_cvq_add(&ctrl, &mq, sizeof(mq), ...);
> >
> > > >
> > > > Some alternatives that come to my mind:
> > > >
> > > > * Declare a struct with both virtio_net_ctrl_hdr and each of the
> > > > control commands (using unions?), and cast s->cvq_cmd_out_buffer
> > > > accordingly.
> > > > * Declare a struct with all of the supported commands one after
> > > > another, and let qemu fill and send these accordingly.
> > > >
> > > > >
> > > > > > +    cursor +=3D sizeof(struct virtio_net_ctrl_mq);
> > > > > > +
> > > > > > +    dev_written =3D vhost_vdpa_net_cvq_add(s, cursor - s->cvq_=
cmd_out_buffer,
> > > > > > +                                             sizeof(virtio_net=
_ctrl_ack));
> > > > > > +    if (unlikely(dev_written < 0)) {
> > > > > > +        return dev_written;
> > > > > > +    }
> > > > > > +
> > > > > > +    return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) !=3D=
 VIRTIO_NET_OK;
> > > > >
> > > > >
> > > > > So I think we should have a dedicated buffer just for ack, then t=
here's
> > > > > no need for such casting.
> > > > >
> > > >
> > > > You mean to declare cvq_cmd_in_buffer as virtio_net_ctrl_ack type
> > > > directly and map it to the device?
> > >
> > > Kind of, considering the ack is the only kind of structure in the nea=
r
> > > future, can we simply use the structure virtio_net_ctl_ack?
> > >
> >
> > Almost, but we need to map to the device in a page size. And I think
> > it's better to allocate a whole page for that, so it does not share
> > memory with qemu.
>
> I guess using a union will solve the problem?
>

It was more a nitpick than a problem, pointing out the need to
allocate a whole page casting it or not to virtio_net_ctrl_ack. In
other words, we must init status as "status =3D
g_malloc0(real_host_page_size())", not "g_malloc0(sizeof(*status))".

But I think the union is a good idea. The problem is that
qemu_real_host_page_size is not a constant so we cannot declare a type
with that.

> Thanks
>
> >
> > Other than that, yes, I think it can be declared as virtio_net_ctl_ack =
directly.
> >
> > Thanks!
> >
>


