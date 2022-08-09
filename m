Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A058D4E3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:53:27 +0200 (CEST)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLK3J-0008OV-NF
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJzT-0004I0-FA
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJzP-0001Ze-NW
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660031361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARyQ00xqhz7lBWfdHWQHCDdnFnzD6ywR6uYuP2YQlek=;
 b=GhX/+iNq1Hpxd73QLdTbdzT9AV1r6Y7POFimEYn0Blb624d0h+wy1JHc31tVbnf9kyQrJL
 CApKyIYGc+RVTBV6DIZDVqQFf7l2hvx8KMLaAlGBgqVySy3BJksxdhz9qwXLmCMDT7GHQE
 8O7s7T4Sg+KTpYVVtZ3ymVeX0gpJJXE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-ps6V1_duOrWvzyHAnXwTbA-1; Tue, 09 Aug 2022 03:49:17 -0400
X-MC-Unique: ps6V1_duOrWvzyHAnXwTbA-1
Received: by mail-lj1-f197.google.com with SMTP id
 q5-20020a2e84c5000000b0025ec9ff93c8so1933223ljh.15
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ARyQ00xqhz7lBWfdHWQHCDdnFnzD6ywR6uYuP2YQlek=;
 b=7jjNaGLZWDE5f2uleiVxewyqaPnUsrmfsOHcUP72n9Nq93GmpuJepSvazEJg4qf9ib
 gtrFYnwSJbeC5wOzl3T/DFcqGCkK36lC3bTo8xMShYBLfDN6uR7udEBYHx+jYEGOFKQ6
 TZ5SxN8nEkyVh7R8rylRfVpDxYFiT3AjXFUEwxZbDpxt6YQbboskF8RqIld0H+DPrkNF
 twVutJS8u6Xwj0wOFuzlwd/7GXaUjbhvLLE5c338giqMUlQM79wFRB+BSOmzLJbUTe2N
 ChcwvEeULC7FfDDvhprRSPCQp7TZe7OW89ikx+rXLKlIYa6mgFt0vxT+iBrsvJLXO7uS
 4VBQ==
X-Gm-Message-State: ACgBeo30Y3KSyi1cJMNVAcJK4hF8J50+mMP5rB3xV7V4P9YeI6lHIECf
 GPtFFx4My2NL80xUMs6Qc43BB6kEsmejzlzNa8YAQRepPv4sljc9DHNf9BDT2HvU995sNut/hji
 aQLrKVPRDCwE3TGc1NFHnMHvFHGJnTYc=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr7295608ljk.243.1660031355808; 
 Tue, 09 Aug 2022 00:49:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4oSZuHeL3ZmJVNT3HoWyi/OeicuKOa2Dy4w0n5yzN4j303eZp3qNUqIEOT/n9yfvkpBs+7ND1i9KMw2R/jsdI=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr7295602ljk.243.1660031355531; Tue, 09
 Aug 2022 00:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-12-eperezma@redhat.com>
 <CACGkMEuYuAJ2ZnmRzeO95=Hd8pC_N=YhPnO4KfBW9jV5Tac2Sw@mail.gmail.com>
 <CAJaqyWfZ_qbVZN3Fcjf2bN4M7bjzjjb4k+0gmNCrHptq-M2eMw@mail.gmail.com>
In-Reply-To: <CAJaqyWfZ_qbVZN3Fcjf2bN4M7bjzjjb4k+0gmNCrHptq-M2eMw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 15:49:04 +0800
Message-ID: <CACGkMEsxLFx2uE=m6znPsvyru=z0uhX3XyAj_Nico2VUVtqjVA@mail.gmail.com>
Subject: Re: [PATCH v7 11/12] vdpa: Add virtio-net mac address via CVQ at start
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Aug 9, 2022 at 3:36 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Aug 9, 2022 at 9:16 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> > >
> > > This is needed so the destination vdpa device see the same state a th=
e
> > > guest set in the source.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > > v6:
> > > * Map and unmap command buffers at the start and end of device usage.
> > >
> > > v5:
> > > * Rename s/start/load/
> > > * Use independent NetClientInfo to only add load callback on cvq.
> > > ---
> > >  net/vhost-vdpa.c | 43 +++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 10843e6d97..4f1524c2e9 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -363,11 +363,54 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPA=
State *s, size_t out_len,
> > >      return vhost_svq_poll(svq);
> > >  }
> > >
> > > +static int vhost_vdpa_net_load(NetClientState *nc)
> > > +{
> > > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > > +    VirtIONet *n;
> > > +    uint64_t features;
> > > +
> > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > +
> > > +    if (!v->shadow_vqs_enabled) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    n =3D VIRTIO_NET(v->dev->vdev);
> > > +    features =3D v->dev->vdev->host_features;
> > > +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> > > +        const struct virtio_net_ctrl_hdr ctrl =3D {
> > > +            .class =3D VIRTIO_NET_CTRL_MAC,
> > > +            .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
> > > +        };
> >
> > Can we build this directly from the cmd_out_buffer?
> >
> > > +        char *cursor =3D s->cvq_cmd_out_buffer;
> > > +        ssize_t dev_written;
> > > +        virtio_net_ctrl_ack state;
> >
> > I think we can read the status directly from the cmd_in_buffer.
> >
>
> Directly casting it to virtio_net_ctrl_ack? Sure.

Yes.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > > +
> > > +        memcpy(cursor, &ctrl, sizeof(ctrl));
> > > +        cursor +=3D sizeof(ctrl);
> > > +        memcpy(cursor, n->mac, sizeof(n->mac));
> > > +        cursor +=3D sizeof(n->mac);
> > > +
> > > +        dev_written =3D vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + siz=
eof(n->mac),
> > > +                                             sizeof(state));
> > > +        if (unlikely(dev_written < 0)) {
> > > +            return dev_written;
> > > +        }
> > > +
> > > +        memcpy(&state, s->cvq_cmd_in_buffer, sizeof(state));
> > > +        return state =3D=3D VIRTIO_NET_OK ? 0 : -1;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > >      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> > >      .size =3D sizeof(VhostVDPAState),
> > >      .receive =3D vhost_vdpa_receive,
> > >      .prepare =3D vhost_vdpa_net_cvq_prepare,
> > > +    .load =3D vhost_vdpa_net_load,
> > >      .stop =3D vhost_vdpa_net_cvq_stop,
> > >      .cleanup =3D vhost_vdpa_cleanup,
> > >      .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> > > --
> > > 2.31.1
> > >
> >
>


