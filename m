Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4213159F625
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:25:19 +0200 (CEST)
Received: from localhost ([::1]:40914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmdR-0004n8-VW
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmMo-0000xm-Dq
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:08:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmMl-0004rq-J0
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661332081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cWP0mcR9FSxCMPQJmq6hIt0VpmZPEQArQw/WIgtMoU=;
 b=RlJ2B0VdyEm7dBfDcCIwcKEk+5BaEyBcxHkbpiQzSuKyEUs1Or8rvtsNwVsTxt15RTSnA/
 yUZ1fXuxbEMTx7W/+05C1vXTIUuY97+6Q5QlIGnhukvcgeL7Cdl+RP2eheOFBBwDiH4Y4V
 Ua2wPQxa0+5Yloc0UI9/CZW0pTzcHoo=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-J2_GLZgnN4WHnexpd0qO9w-1; Wed, 24 Aug 2022 05:08:00 -0400
X-MC-Unique: J2_GLZgnN4WHnexpd0qO9w-1
Received: by mail-lj1-f198.google.com with SMTP id
 k21-20020a2e2415000000b00261e34257b2so138212ljk.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=9cWP0mcR9FSxCMPQJmq6hIt0VpmZPEQArQw/WIgtMoU=;
 b=zBpykAyR2XiQtJyb4P2RtJtFAFmjgP3u0+eY9JQZmBsP8kcWm9a9hAU45usp66jBWG
 PJ8nbaitSl8GVMSvhNtl6JvGBG5MbWpXs8WLw1Dg4QS8Ew8WRM8HzpTeLvzWyO4VBICv
 hJzVGZpmcARgz+hSjjRVSZxafzSybkbb8meQeGD7RR/ip+UAj5W16QfK9698bEU/VEfb
 BqHsrQIO3BZmCVmpKAeIGa8R+oyQqVr/cvLZgFdcVE/rlduFBnyfYj5eYeRW1ZjUmQy4
 Wtb3w0eb0oOU9az9uTVpDJ+RJidxViLKD6E8ij1vhs2vqQW7RNoXYZv1lid3hluYrS+P
 CK0A==
X-Gm-Message-State: ACgBeo0dYMTiKwgh6oYMbarZmpTei+b+qGa2GoBaOvRy3zln+h0h92+g
 A4jb96BuAbgq0hyKOLsPlQ1H9QSUpK7lxZFbDfOMric9xQJ679sNZ0Sbdp4Z/aYIirotHzsHdkC
 kUv/UVLGfYZOvLGpTiJE9LlYyBrdtzUc=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr7899880ljq.496.1661332078741; 
 Wed, 24 Aug 2022 02:07:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4du6998OoyCaGzhV2EoJWFc+InvOF+l3jbD4dVZdNmibHmCCJS1G6fv4OynA3cs8VfR373fXQAWdo4kzEpzM8=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr7899864ljq.496.1661332078473; Wed, 24
 Aug 2022 02:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-3-eperezma@redhat.com>
 <f517a073-fd73-0220-072c-ea054b643468@redhat.com>
 <CAJaqyWcGH-kAVw-yZ2CX-GuPYt1zL8FFJnjmWMcbi4r1NgyfcA@mail.gmail.com>
 <CACGkMEuNTBPSh2x6LVihCE=fg1zYAsnG4io2MBT32+PF9=omwQ@mail.gmail.com>
 <CAJaqyWdDYZscdShMpmvPJdCBDOyeoEUbOztTQDLHdqYwwdah6w@mail.gmail.com>
In-Reply-To: <CAJaqyWdDYZscdShMpmvPJdCBDOyeoEUbOztTQDLHdqYwwdah6w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 24 Aug 2022 17:07:47 +0800
Message-ID: <CACGkMEttkCfRAWQQT7APWeV1uZbzr5p+rr_HaeP+tK30dyeZZQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] vdpa: Add vhost_vdpa_net_load_mq
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Aug 24, 2022 at 5:06 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Aug 24, 2022 at 10:52 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Aug 24, 2022 at 3:47 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Wed, Aug 24, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > >
> > > > =E5=9C=A8 2022/8/20 01:13, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > > Same way as with the MAC, restore the expected number of queues a=
t
> > > > > device's start.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >   net/vhost-vdpa.c | 33 +++++++++++++++++++++++++++++++++
> > > > >   1 file changed, 33 insertions(+)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 1e0dbfcced..96fd3bc835 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -391,6 +391,35 @@ static int vhost_vdpa_net_load_mac(VhostVDPA=
State *s,
> > > > >       return 0;
> > > > >   }
> > > > >
> > > > > +static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
> > > > > +                                  const VirtIONet *n)
> > > > > +{
> > > > > +    uint64_t features =3D n->parent_obj.guest_features;
> > > > > +    ssize_t dev_written;
> > > > > +    void *cursor =3D s->cvq_cmd_out_buffer;
> > > > > +    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
> > > > > +        return 0;
> > > > > +    }
> > > > > +
> > > > > +    *(struct virtio_net_ctrl_hdr *)cursor =3D (struct virtio_net=
_ctrl_hdr) {
> > > > > +        .class =3D VIRTIO_NET_CTRL_MQ,
> > > > > +        .cmd =3D VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
> > > > > +    };
> > > > > +    cursor +=3D sizeof(struct virtio_net_ctrl_hdr);
> > > > > +    *(struct virtio_net_ctrl_mq *)cursor =3D (struct virtio_net_=
ctrl_mq) {
> > > > > +        .virtqueue_pairs =3D cpu_to_le16(n->curr_queue_pairs),
> > > > > +    };
> > > >
> > > >
> > > > Such casting is not elegant, let's just prepare buffer and then do =
the
> > > > copy inside vhost_vdpa_net_cvq_add()?
> > > >
> > >
> > > I'm not sure what you propose here. I can pre-fill a buffer in the
> > > stack and then do an extra copy in vhost_vdpa_net_cvq_add. The
> > > compiler should be able to optimize it, but I'm not sure if it
> > > simplifies the code.
> > >
> > > We can have a dedicated buffer for mac, another for mq, and one for
> > > each different command, and map all of them at the device's start. Bu=
t
> > > this seems too much overhead to me.
> >
> > Considering we may need to support and restore a lot of other fields,
> > this looks a little complicated.
> >
> > I meant the caller can simply do:
> >
> > struct virtio_net_ctrl_mq mq =3D { ...};
> >
> > Then we do
> >
> > vhost_vdpa_net_cvq_add(&mq, sizeof(mq), ...);
> >
> > Then we can do memcpy inside vhost_vdpa_net_cvq_add() and hide the
> > cmd_out_buffer etc from the caller.
> >
>
> We need to add the ctrl header too. But yes, that is feasible, something =
like:
>
> vhost_vdpa_net_cvq_add(&ctrl, &mq, sizeof(mq), ...);
>
> > >
> > > Some alternatives that come to my mind:
> > >
> > > * Declare a struct with both virtio_net_ctrl_hdr and each of the
> > > control commands (using unions?), and cast s->cvq_cmd_out_buffer
> > > accordingly.
> > > * Declare a struct with all of the supported commands one after
> > > another, and let qemu fill and send these accordingly.
> > >
> > > >
> > > > > +    cursor +=3D sizeof(struct virtio_net_ctrl_mq);
> > > > > +
> > > > > +    dev_written =3D vhost_vdpa_net_cvq_add(s, cursor - s->cvq_cm=
d_out_buffer,
> > > > > +                                             sizeof(virtio_net_c=
trl_ack));
> > > > > +    if (unlikely(dev_written < 0)) {
> > > > > +        return dev_written;
> > > > > +    }
> > > > > +
> > > > > +    return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) !=3D V=
IRTIO_NET_OK;
> > > >
> > > >
> > > > So I think we should have a dedicated buffer just for ack, then the=
re's
> > > > no need for such casting.
> > > >
> > >
> > > You mean to declare cvq_cmd_in_buffer as virtio_net_ctrl_ack type
> > > directly and map it to the device?
> >
> > Kind of, considering the ack is the only kind of structure in the near
> > future, can we simply use the structure virtio_net_ctl_ack?
> >
>
> Almost, but we need to map to the device in a page size. And I think
> it's better to allocate a whole page for that, so it does not share
> memory with qemu.

I guess using a union will solve the problem?

Thanks

>
> Other than that, yes, I think it can be declared as virtio_net_ctl_ack di=
rectly.
>
> Thanks!
>


