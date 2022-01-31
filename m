Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8DD4A4AC0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:39:31 +0100 (CET)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYm9-0000au-W6
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:39:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEYi0-0004LJ-0I
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEYhw-0007yk-VG
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643643303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJWjGyVdEAlXp8V3hhCM2dkGpVUsWJvxLfsiRq2dIbM=;
 b=TxL0b3rWMolckyJ0UEZlVtIxB45iP0zCvRARysbhp9q9FAtROqqZreT3yohF9SZw9G2Jdw
 2vJumtZjMR6fJId+z99NmQJjWShy3UgrAxPkZuyBopnolOkrYmn/moFi7zYDEQoZNjEuxx
 +prrtS39rMOp6RtQaLPsc0bQvmN4ouA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-365WnxIUPN65I2sBpSiOpQ-1; Mon, 31 Jan 2022 10:35:01 -0500
X-MC-Unique: 365WnxIUPN65I2sBpSiOpQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 g2-20020a0562141cc200b004123b0abe18so13076443qvd.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 07:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zJWjGyVdEAlXp8V3hhCM2dkGpVUsWJvxLfsiRq2dIbM=;
 b=M4u6QkJ60ZIaWpk4dc5Gom+E1anhYd4d4rSagtRyfjbJKBBlVHWUYB+TR50/wKiGP3
 CBvjWvFiob/ruJgDDitwJPIKJDyWmo7H/yJvkZX2Q4VXRoATg+cqjKWsRBrq9NRroQGO
 tBgNDhk/A9LD7SeQ2YGM8ugSDsQGtfDUyT/oJcASdDom64oLzbzgzLBbnszQZDfEacA/
 XBZtyx+chiG0FFCugFgkKYl9ofhUN4S5IW0VFDpmps7JKesFBfjkGXottqUdHfbsPirl
 HQKfJoRSOn4X8B1VPSj5qYTmxBYSdpCjDz8ldnfwwFXbjJPm3pkFoywhZEy7TNcagYoR
 Nz8A==
X-Gm-Message-State: AOAM532Vuq2p9k9YCOSN4ipxMeughaOB8hrdNc7gN3gnbgM2dPNg7I1Z
 /WP02+s6rPh0A+nLdKcTDUTcLQ+0mC9xbVuQgvY/gJGM4iP2RaNBbQ0s7uCCMBehRuK4iQjvdQk
 6N6yZxXQZ1nX4D4dEnROHk7lx76n73Vk=
X-Received: by 2002:a05:620a:1996:: with SMTP id
 bm22mr13248619qkb.764.1643643300429; 
 Mon, 31 Jan 2022 07:35:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxg0Z2UqunZRjgNiiMj1tCIiDnsn7gEWJTjIyhoYH+qVCILhEAIJYY1VyzHWfO2LmebgAzo3bZIS01BSt5Yyow=
X-Received: by 2002:a05:620a:1996:: with SMTP id
 bm22mr13248585qkb.764.1643643300138; 
 Mon, 31 Jan 2022 07:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-10-eperezma@redhat.com>
 <cbfbd909-4ee8-8ad2-effd-4b9f60270581@redhat.com>
In-Reply-To: <cbfbd909-4ee8-8ad2-effd-4b9f60270581@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 16:34:24 +0100
Message-ID: <CAJaqyWda5sBw9VGBrz8g60OJ07Eeq45RRYu9vwgOPZFwten9rw@mail.gmail.com>
Subject: Re: [PATCH 09/31] vhost-vdpa: Take into account SVQ in
 vhost_vdpa_set_vring_call
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 29, 2022 at 9:06 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++--
> >   1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 18de14f0fb..029f98feee 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -687,13 +687,29 @@ static int vhost_vdpa_set_vring_kick(struct vhost=
_dev *dev,
> >       }
> >   }
> >
> > -static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> > -                                       struct vhost_vring_file *file)
> > +static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
> > +                                         struct vhost_vring_file *file=
)
> >   {
> >       trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >   }
> >
> > +static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> > +                                     struct vhost_vring_file *file)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        int vdpa_idx =3D vhost_vdpa_get_vq_index(dev, file->index);
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 vdpa_idx);
> > +
> > +        vhost_svq_set_guest_call_notifier(svq, file->fd);
>
>
> Two questions here (had similar questions for vring kick):
>
> 1) Any reason that we setup the eventfd for vhost-vdpa in
> vhost_vdpa_svq_setup() not here?
>

I'm not sure what you mean.

The guest->SVQ call and kick fds are set here and at
vhost_vdpa_set_vring_kick. The event notifier handler of the guest ->
SVQ kick_fd is set at vhost_vdpa_set_vring_kick /
vhost_svq_set_svq_kick_fd. The guest -> SVQ call fd has no event
notifier handler since we don't poll it.

On the other hand, the connection SVQ <-> device uses the same fds
from the beginning to the end, and they will not change with, for
example, call fd masking. That's why it's setup from
vhost_vdpa_svq_setup. Delaying to vhost_vdpa_set_vring_call would make
us add way more logic there.

> 2) The call could be disabled by using -1 as the fd, I don't see any
> code to deal with that.
>

Right, I didn't take that into account. vhost-kernel takes also -1 as
kick_fd to unbind, so SVQ can be reworked to take that into account
for sure.

Thanks!

> Thanks
>
>
> > +        return 0;
> > +    } else {
> > +        return vhost_vdpa_set_vring_dev_call(dev, file);
> > +    }
> > +}
> > +
> >   /**
> >    * Set shadow virtqueue descriptors to the device
> >    *
>


