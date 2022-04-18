Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5BB504F1F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 12:57:50 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngP4m-0003i9-H1
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 06:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngP32-0002sn-WE
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 06:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngP2y-0003Ow-Q3
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 06:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650279355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09e7e2FkEGVg9OX9BdlpxBDFFBPw1J1j+lev9B6gEYw=;
 b=Y9oechlZnbjtY6a+hTV1k3j1Kv/hrbsrrY5u0HSPkpj8aXAa+OTvoqzWtUvFYrH/Rli/V8
 5+587ngmIj86S1o7cyrfEXwQccfVWJpNzmxBm9fxlc+BBdLhK2HYT4jbyxXL46o9LaUAYu
 nB+jvZLtKDAqdELWMLWLI8t4Ryc/YiE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-id2fE7wVNuOxgBkgkbgrSA-1; Mon, 18 Apr 2022 06:55:52 -0400
X-MC-Unique: id2fE7wVNuOxgBkgkbgrSA-1
Received: by mail-qv1-f70.google.com with SMTP id
 j7-20020a05621419c700b004461f75de48so9859416qvc.10
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 03:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=09e7e2FkEGVg9OX9BdlpxBDFFBPw1J1j+lev9B6gEYw=;
 b=SjbrjcOdHIaDGf2rl6baE/Wl86oDs1uSC4gFfqv0W0Bw3Tok4tD2dDDibsfb3ZNKZI
 jr6a4cmZKLKAxk5j63i4QZieWkznHGOEQSdAldp4CsJaNIYwe5CzVk+OlSH53gNXRJPW
 OLCAwxQJ50gUtlbtAGCOkcx4XrQqformNYdqqqjw7xu8ggOSj/wYwSFnm7QF5OY4FjWn
 dSG6niqyG9yrOTeSafTespL1Nqadanr1cUJEsu3TIRWUOrR8qkta3HVYVxhpV3NUdskr
 iW4/xNdI5oFIo5XWTGJjwp5/zJhoka0HGt4Ua3wlpRTZPG7Aj99Jl7QDuL01iR791cxQ
 Lvrg==
X-Gm-Message-State: AOAM533u4ceAXmGyITbGMPyq5jrUIIYRgEF2ExQRrPn+odlUdWSr7XUZ
 D6EQf8iL9t9Jmz5lV3bvtRskG+ZBUQRcScv5VljVwn0gQsFNKps+b1T315JMK0pojA63Qq0Au1t
 dRILmd0vDWHO+xLx2qhHu+EjW2Zwmk2s=
X-Received: by 2002:ac8:5913:0:b0:2f1:f114:6b44 with SMTP id
 19-20020ac85913000000b002f1f1146b44mr6586394qty.403.1650279351917; 
 Mon, 18 Apr 2022 03:55:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX8+iBXKRvyP0+/wqGdgbaqenySuhuU0DUaV526B+cZd/saLj8Kp1E5KCv61j9pokQbBYec0jaLDDul9Qfwzs=
X-Received: by 2002:ac8:5913:0:b0:2f1:f114:6b44 with SMTP id
 19-20020ac85913000000b002f1f1146b44mr6586379qty.403.1650279351674; Mon, 18
 Apr 2022 03:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-17-eperezma@redhat.com>
 <CACGkMEsyZ1UuYR=B=o3dBcSszOFSs8poKhRrUq75LrpnGbciuA@mail.gmail.com>
In-Reply-To: <CACGkMEsyZ1UuYR=B=o3dBcSszOFSs8poKhRrUq75LrpnGbciuA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Apr 2022 12:55:15 +0200
Message-ID: <CAJaqyWdopGHVM-fa5nPa8310mnTQDmtxyxME+fT+m8tS6WcNxw@mail.gmail.com>
Subject: Re: [RFC PATCH v7 16/25] vdpa: control virtqueue support on shadow
 virtqueue
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Apr 14, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > Introduce the control virtqueue support for vDPA shadow virtqueue. This
> > is needed for advanced networking features like multiqueue.
> >
> > To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR and
> > VIRTIO_NET_CTRL_MQ are implemented. If vDPA device is started with SVQ
> > support and virtio-net driver changes MAC or the number of queues
> > virtio-net device model will be updated with the new one.
> >
> > Others cvq commands could be added here straightforwardly but they have
> > been not tested.
>
> If I understand the code correctly, the cvq can still see all the
> guest mappings. I wonder if it's simpler to:
>
> 1) find a way to reuse the ctrl handler in virtio-net.c

It's reused, that's why virtio_net_handle_ctrl_iov is extracted from
virtio_net_handle_ctrl.

> 2) do not expose all the guest memory to shadow cvq.
>

It can be done that way actually, but it would include a map and unmap
for each control command call. I'll explore that approach, thanks!

> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 77 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index a8dde49198..38e6912255 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -11,6 +11,7 @@
> >
> >  #include "qemu/osdep.h"
> >  #include "clients.h"
> > +#include "hw/virtio/virtio-net.h"
> >  #include "net/vhost_net.h"
> >  #include "net/vhost-vdpa.h"
> >  #include "hw/virtio/vhost-vdpa.h"
> > @@ -69,6 +70,30 @@ const int vdpa_feature_bits[] =3D {
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > +/** Supported device specific feature bits with SVQ */
> > +static const uint64_t vdpa_svq_device_features =3D
> > +    BIT_ULL(VIRTIO_NET_F_CSUM) |
> > +    BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |
> > +    BIT_ULL(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) |
> > +    BIT_ULL(VIRTIO_NET_F_MTU) |
> > +    BIT_ULL(VIRTIO_NET_F_MAC) |
> > +    BIT_ULL(VIRTIO_NET_F_GUEST_TSO4) |
> > +    BIT_ULL(VIRTIO_NET_F_GUEST_TSO6) |
> > +    BIT_ULL(VIRTIO_NET_F_GUEST_ECN) |
> > +    BIT_ULL(VIRTIO_NET_F_GUEST_UFO) |
> > +    BIT_ULL(VIRTIO_NET_F_HOST_TSO4) |
> > +    BIT_ULL(VIRTIO_NET_F_HOST_TSO6) |
> > +    BIT_ULL(VIRTIO_NET_F_HOST_ECN) |
> > +    BIT_ULL(VIRTIO_NET_F_HOST_UFO) |
> > +    BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
> > +    BIT_ULL(VIRTIO_NET_F_STATUS) |
> > +    BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
> > +    BIT_ULL(VIRTIO_NET_F_MQ) |
> > +    BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
> > +    BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
> > +    BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > +    BIT_ULL(VIRTIO_NET_F_STANDBY);
>
> I wonder what's the reason for having a dedicated feature whitelist for S=
VQ?
>

We cannot be sure that future commands do not require modifications to
qemu. Same as with the switch, I can dedicate time to test all of the
currently supported cvq commands and delete this.

> > +
> >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > @@ -196,6 +221,46 @@ static int vhost_vdpa_get_iova_range(int fd,
> >      return ret < 0 ? -errno : 0;
> >  }
> >
> > +static void vhost_vdpa_net_handle_ctrl(VirtIODevice *vdev,
> > +                                       const VirtQueueElement *elem)
> > +{
> > +    struct virtio_net_ctrl_hdr ctrl;
> > +    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > +    size_t s;
> > +    struct iovec in =3D {
> > +        .iov_base =3D &status,
> > +        .iov_len =3D sizeof(status),
> > +    };
> > +
> > +    s =3D iov_to_buf(elem->out_sg, elem->out_num, 0, &ctrl, sizeof(ctr=
l.class));
> > +    if (s !=3D sizeof(ctrl.class)) {
> > +        return;
> > +    }
> > +
> > +    switch (ctrl.class) {
> > +    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> > +    case VIRTIO_NET_CTRL_MQ:
> > +        break;
> > +    default:
> > +        return;
> > +    };
>
> Any reason that we only support those two commands?
>

Lack of testing, basically. I can try to test all of them for the next
patch series.

> > +
> > +    s =3D iov_to_buf(elem->in_sg, elem->in_num, 0, &status, sizeof(sta=
tus));
> > +    if (s !=3D sizeof(status) || status !=3D VIRTIO_NET_OK) {
> > +        return;
> > +    }
> > +
> > +    status =3D VIRTIO_NET_ERR;
> > +    virtio_net_handle_ctrl_iov(vdev, &in, 1, elem->out_sg, elem->out_n=
um);
> > +    if (status !=3D VIRTIO_NET_OK) {
>
> status is guaranteed to be VIRTIO_NET_ERROR, so we hit the error for sure=
?
>

Status is modified through "in" iovec virtio_net_handle_ctrl_iov
parameter, but it is not immediate just seeing this piece of code in
isolation. I can try to make it clearer.

Thanks!

> Thanks
>
> > +        error_report("Bad CVQ processing in model");
> > +    }
> > +}
> > +
> > +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
> > +    .used_elem_handler =3D vhost_vdpa_net_handle_ctrl,
> > +};
> > +
> >  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> >                                         const char *device,
> >                                         const char *name,
> > @@ -225,6 +290,9 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >      s->vhost_vdpa.iova_tree =3D iova_tree ? vhost_iova_tree_acquire(io=
va_tree) :
> >                                NULL;
> > +    if (!is_datapath) {
> > +        s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> > +    }
> >      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_inde=
x, nvqs);
> >      if (ret) {
> >          if (iova_tree) {
> > @@ -315,9 +383,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, cons=
t char *name,
> >      }
> >      if (opts->x_svq) {
> >          struct vhost_vdpa_iova_range iova_range;
> > -
> > -        if (has_cvq) {
> > -            error_setg(errp, "vdpa svq does not work with cvq");
> > +        uint64_t invalid_dev_features =3D
> > +            features & ~vdpa_svq_device_features &
> > +            /* Transport are all accepted at this point */
> > +            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
> > +                             VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT=
_F_START);
> > +
> > +        if (invalid_dev_features) {
> > +            error_setg(errp, "vdpa svq does not work with features 0x%=
" PRIx64,
> > +                       invalid_dev_features);
> >              goto err_svq;
> >          }
> >          vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > --
> > 2.27.0
> >
>


