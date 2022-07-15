Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2546575B52
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 08:15:56 +0200 (CEST)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCEcF-0001oM-PR
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 02:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCEWR-0004Cn-Fu
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCEWN-0000pF-EG
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657865390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3k8iWEMUenCsOcZ06oCfklcrD8PvSCcMcHeo6wcj6rI=;
 b=J9JIS/WrItQ1qEXKzMllGACFHDBvwqfhY6SgD7r0kLLcmc8F/nTZo1RdkFMF1V+2tq8ITh
 mDKERPrXJx4sTkqUKGbOvYovApxX+oNq6bQwh9d3mYq+CMNbM+J7SkiIgj3H1ZT3nGdnnx
 KRZAHOERctA/w0MIQ6CYLkd1FJx1USs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-v2WxLqUXPRaXufytzkeB7Q-1; Fri, 15 Jul 2022 02:09:49 -0400
X-MC-Unique: v2WxLqUXPRaXufytzkeB7Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 e128-20020a376986000000b006af6adf035cso2753078qkc.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 23:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3k8iWEMUenCsOcZ06oCfklcrD8PvSCcMcHeo6wcj6rI=;
 b=sedxYkZSn8/ptzfeZZtD2uAJ3mdrD47eKEt3wXbqfTD+oCDxteJHdSXwOOiOpTj4cK
 tVmQbg3tcbw5JKn2Fr28rQ9W7oAXy348jLKlx+iEGzcZoV0VKuKjm0kCJDER1umFIHE9
 bJ8Aob9Ylh2Rcu8/WVgrLWrvKXb30OiMl/xZpIsd83g3IgAo9ZxZd8+7TeW2hTwfcr0i
 LxnUtRcClQqUuspm9UJTGlGaX9F/HXma05eYIRXG403rkClPduoLpuQmIgUE5fOHPY4q
 2+z8AmIxGx/9a9JRXBJwuUFZ6249X6xzqgrVlmdEKiSx2MoBGJB1xKUUXL0JvMr2QijE
 t4Eg==
X-Gm-Message-State: AJIora/oAsiojWF9YszTTI1UM7FZ6cTdlWB1ugZkPbd0ekk+3A11x0pp
 yT8piLqU9h3iKgWMFjFolqKDLEM01E/SOI7cQxYKCZmi6yiHm31qx8ZSAesCdsvSNqzeSvQguSF
 rSE1szibPBI/xz2OAzn4w/v77cI3PjJ8=
X-Received: by 2002:a05:6214:628:b0:472:f9df:970f with SMTP id
 a8-20020a056214062800b00472f9df970fmr10492840qvx.64.1657865388601; 
 Thu, 14 Jul 2022 23:09:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uk7DHZZSOCEG+5Xopgx6FF+S49PKhMwwhuYyKHGlHtAfCMKLaAfCpeuqHCPOPGYXeTj2775/1gbs0jhyQgnyQ=
X-Received: by 2002:a05:6214:628:b0:472:f9df:970f with SMTP id
 a8-20020a056214062800b00472f9df970fmr10492821qvx.64.1657865388363; Thu, 14
 Jul 2022 23:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-20-eperezma@redhat.com>
 <CACGkMEvrZoSHAfD1h5Enji2FXmGx3Lpw9Gy3WSerOpiGznqR6A@mail.gmail.com>
In-Reply-To: <CACGkMEvrZoSHAfD1h5Enji2FXmGx3Lpw9Gy3WSerOpiGznqR6A@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Jul 2022 08:09:12 +0200
Message-ID: <CAJaqyWcWG9AKzXaUXDw4O0cPj8M1SVxvL_OxULe4E05OnK=Qug@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
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

On Fri, Jul 15, 2022 at 6:13 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > Finally offering the possibility to enable SVQ from the command line.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Acked-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  qapi/net.json    |  9 +++++-
> >  net/vhost-vdpa.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 77 insertions(+), 4 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 9af11e9a3b..75ba2cb989 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -445,12 +445,19 @@
> >  # @queues: number of queues to be created for multiqueue vhost-vdpa
> >  #          (default: 1)
> >  #
> > +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.=
1)
> > +#         (default: false)
> > +#
> > +# Features:
> > +# @unstable: Member @x-svq is experimental.
> > +#
> >  # Since: 5.1
> >  ##
> >  { 'struct': 'NetdevVhostVDPAOptions',
> >    'data': {
> >      '*vhostdev':     'str',
> > -    '*queues':       'int' } }
> > +    '*queues':       'int',
> > +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
> >
> >  ##
> >  # @NetdevVmnetHostOptions:
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 7ccf9eaf4d..85148a5114 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -75,6 +75,28 @@ const int vdpa_feature_bits[] =3D {
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > +/** Supported device specific feature bits with SVQ */
> > +static const uint64_t vdpa_svq_device_features =3D
> > +    BIT_ULL(VIRTIO_NET_F_CSUM) |
> > +    BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |
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
> > +    BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
> > +    BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
> > +    BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > +    BIT_ULL(VIRTIO_NET_F_STANDBY);
>
> We need to have a plan for the full feature support like
>
> indirect, event_index, and packed.
>

Event idx is almost straightforward to develop. Packed has more code
but it's equally doable. In order it should not be hard too.

Indirect is a little bit more complicated because of the indirect
table. I guess we will need to either allocate a big buffer where we
can obtain indirect tables and cvq buffers, or allocate & map them
individually.

Note that we can half-support them. To enable them in the guest's
vring is as easy as to accept that feature in SVQ, and SVQ can easily
translate one format to another. I know the interesting part is the
shadow vring to speed the communication with the device, but it's
still a first step in that direction if needed.

> I can help in developing some of these if you wish.
>

We could plan for the next release cycle for sure.

Thanks!

> Thanks
>
> > +
> >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > @@ -133,9 +155,13 @@ err_init:
> >  static void vhost_vdpa_cleanup(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_dev *dev =3D &s->vhost_net->dev;
> >
> >      qemu_vfree(s->cvq_cmd_out_buffer);
> >      qemu_vfree(s->cvq_cmd_in_buffer);
> > +    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_dele=
te);
> > +    }
> >      if (s->vhost_net) {
> >          vhost_net_cleanup(s->vhost_net);
> >          g_free(s->vhost_net);
> > @@ -437,7 +463,9 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >                                             int vdpa_device_fd,
> >                                             int queue_pair_index,
> >                                             int nvqs,
> > -                                           bool is_datapath)
> > +                                           bool is_datapath,
> > +                                           bool svq,
> > +                                           VhostIOVATree *iova_tree)
> >  {
> >      NetClientState *nc =3D NULL;
> >      VhostVDPAState *s;
> > @@ -455,6 +483,8 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >
> >      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >      s->vhost_vdpa.index =3D queue_pair_index;
> > +    s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > +    s->vhost_vdpa.iova_tree =3D iova_tree;
> >      if (!is_datapath) {
> >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_si=
ze(),
> >                                              vhost_vdpa_net_cvq_cmd_pag=
e_len());
> > @@ -465,6 +495,8 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >
> >          s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> >          s->vhost_vdpa.shadow_vq_ops_opaque =3D s;
> > +        error_setg(&s->vhost_vdpa.migration_blocker,
> > +                   "Migration disabled: vhost-vdpa uses CVQ.");
> >      }
> >      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_inde=
x, nvqs);
> >      if (ret) {
> > @@ -474,6 +506,14 @@ static NetClientState *net_vhost_vdpa_init(NetClie=
ntState *peer,
> >      return nc;
> >  }
> >
> > +static int vhost_vdpa_get_iova_range(int fd,
> > +                                     struct vhost_vdpa_iova_range *iov=
a_range)
> > +{
> > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > +
> > +    return ret < 0 ? -errno : 0;
> > +}
> > +
> >  static int vhost_vdpa_get_features(int fd, uint64_t *features, Error *=
*errp)
> >  {
> >      int ret =3D ioctl(fd, VHOST_GET_FEATURES, features);
> > @@ -524,6 +564,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >      uint64_t features;
> >      int vdpa_device_fd;
> >      g_autofree NetClientState **ncs =3D NULL;
> > +    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >      NetClientState *nc;
> >      int queue_pairs, r, i, has_cvq =3D 0;
> >
> > @@ -551,22 +592,45 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >          return queue_pairs;
> >      }
> >
> > +    if (opts->x_svq) {
> > +        struct vhost_vdpa_iova_range iova_range;
> > +
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
> > +            goto err_svq;
> > +        }
> > +
> > +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > +        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range=
.last);
> > +    }
> > +
> >      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> >
> >      for (i =3D 0; i < queue_pairs; i++) {
> >          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                     vdpa_device_fd, i, 2, true);
> > +                                     vdpa_device_fd, i, 2, true, opts-=
>x_svq,
> > +                                     iova_tree);
> >          if (!ncs[i])
> >              goto err;
> >      }
> >
> >      if (has_cvq) {
> >          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                 vdpa_device_fd, i, 1, false);
> > +                                 vdpa_device_fd, i, 1, false,
> > +                                 opts->x_svq, iova_tree);
> >          if (!nc)
> >              goto err;
> >      }
> >
> > +    /* iova_tree ownership belongs to last NetClientState */
> > +    g_steal_pointer(&iova_tree);
> >      return 0;
> >
> >  err:
> > @@ -575,6 +639,8 @@ err:
> >              qemu_del_net_client(ncs[i]);
> >          }
> >      }
> > +
> > +err_svq:
> >      qemu_close(vdpa_device_fd);
> >
> >      return -1;
> > --
> > 2.31.1
> >
>


