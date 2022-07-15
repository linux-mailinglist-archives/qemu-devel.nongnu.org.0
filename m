Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D1575A40
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 06:17:09 +0200 (CEST)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCClG-00044z-1Y
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 00:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCi8-00017x-8l
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 00:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCChk-0001vd-QD
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 00:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657858408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBWC+SqBleLnsgwBbOFRWRNF57by5pqvR2iKv0jpFrk=;
 b=du1hdjdBvj0n2sNqEFfDml1dIUMLW6/jHmbtaQ16Koz8cc6fGiHs2erP5LPBsP7Zcj4okQ
 F3GUFJV1aXaF+W3TltGOdU14ZPZWtr+FjVH3niveH7JWrvlEzglfwtT/4uYR709qDBxgif
 fkaKQEPx13t3VyydK88dJRU8VQR6Utg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-BtvutKm1ObWAmdvC_PZutQ-1; Fri, 15 Jul 2022 00:13:21 -0400
X-MC-Unique: BtvutKm1ObWAmdvC_PZutQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 t7-20020ac243a7000000b00489e8cb9450so1439717lfl.21
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 21:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rBWC+SqBleLnsgwBbOFRWRNF57by5pqvR2iKv0jpFrk=;
 b=t7klL+k0G74L4gLCRoxeFGc1dqF7bNXaAFBdrhO0taIo1nMMlz1d6fGovFx+z4ZNLz
 ShiJxucek2yJCn+YNRuIUdSDbxFKCxNqLgL7Oza1+qqpbksl7MYDqDT/Luf0SreOgB0z
 BaZlZsH0cD1HJOAzV1XvHFCBw6wrhd1dGOpX5VKKzfmii7fBY6pf2UhcRrH8RukrUmyP
 uR5F2MVvMaCX39xI9tRU7IxFr8HUjHGRXOLm8TNutaVBzkarVzvdoouccwGP/nU3T4ql
 z3a89hnsp7ZHeb3h26P+dFk9xSHO4mRiFvaqA1KFdKyMaKmlwlHFr6UGNFgbGC9chGCa
 xxvQ==
X-Gm-Message-State: AJIora/7Nz6DWDubrQdWyiq9q6fOKU6CXr4l1Au6B3hRbQvlxlhZMSUz
 zCXM84lvNauz1AvXvDVYtU6V3BwvvqWe2Fmt9/wpdWdD1tYv3oDCaPhLGPgkmH0KUS4T5caTHd8
 3EgEoE6q58YIGDFaqq9B8zqqLkb5oLdI=
X-Received: by 2002:ac2:50d1:0:b0:489:fb36:cde1 with SMTP id
 h17-20020ac250d1000000b00489fb36cde1mr6550042lfm.411.1657858399390; 
 Thu, 14 Jul 2022 21:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNtc/4Aw8/gSSSnp/H1qV4PJiuqRFOIfL9LygP4WjA9MKo40XRT7EMUBfiZxMMRywTiDL7xLYKuKfKwGG3ujw=
X-Received: by 2002:ac2:50d1:0:b0:489:fb36:cde1 with SMTP id
 h17-20020ac250d1000000b00489fb36cde1mr6550035lfm.411.1657858399175; Thu, 14
 Jul 2022 21:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-20-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-20-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Jul 2022 12:13:08 +0800
Message-ID: <CACGkMEvrZoSHAfD1h5Enji2FXmGx3Lpw9Gy3WSerOpiGznqR6A@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
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

On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Finally offering the possibility to enable SVQ from the command line.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/net.json    |  9 +++++-
>  net/vhost-vdpa.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 77 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 9af11e9a3b..75ba2cb989 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -445,12 +445,19 @@
>  # @queues: number of queues to be created for multiqueue vhost-vdpa
>  #          (default: 1)
>  #
> +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.1)
> +#         (default: false)
> +#
> +# Features:
> +# @unstable: Member @x-svq is experimental.
> +#
>  # Since: 5.1
>  ##
>  { 'struct': 'NetdevVhostVDPAOptions',
>    'data': {
>      '*vhostdev':     'str',
> -    '*queues':       'int' } }
> +    '*queues':       'int',
> +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
>
>  ##
>  # @NetdevVmnetHostOptions:
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 7ccf9eaf4d..85148a5114 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -75,6 +75,28 @@ const int vdpa_feature_bits[] =3D {
>      VHOST_INVALID_FEATURE_BIT
>  };
>
> +/** Supported device specific feature bits with SVQ */
> +static const uint64_t vdpa_svq_device_features =3D
> +    BIT_ULL(VIRTIO_NET_F_CSUM) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |
> +    BIT_ULL(VIRTIO_NET_F_MTU) |
> +    BIT_ULL(VIRTIO_NET_F_MAC) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_TSO4) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_TSO6) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_ECN) |
> +    BIT_ULL(VIRTIO_NET_F_GUEST_UFO) |
> +    BIT_ULL(VIRTIO_NET_F_HOST_TSO4) |
> +    BIT_ULL(VIRTIO_NET_F_HOST_TSO6) |
> +    BIT_ULL(VIRTIO_NET_F_HOST_ECN) |
> +    BIT_ULL(VIRTIO_NET_F_HOST_UFO) |
> +    BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
> +    BIT_ULL(VIRTIO_NET_F_STATUS) |
> +    BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
> +    BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
> +    BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
> +    BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> +    BIT_ULL(VIRTIO_NET_F_STANDBY);

We need to have a plan for the full feature support like

indirect, event_index, and packed.

I can help in developing some of these if you wish.

Thanks

> +
>  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -133,9 +155,13 @@ err_init:
>  static void vhost_vdpa_cleanup(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_dev *dev =3D &s->vhost_net->dev;
>
>      qemu_vfree(s->cvq_cmd_out_buffer);
>      qemu_vfree(s->cvq_cmd_in_buffer);
> +    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete=
);
> +    }
>      if (s->vhost_net) {
>          vhost_net_cleanup(s->vhost_net);
>          g_free(s->vhost_net);
> @@ -437,7 +463,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>                                             int vdpa_device_fd,
>                                             int queue_pair_index,
>                                             int nvqs,
> -                                           bool is_datapath)
> +                                           bool is_datapath,
> +                                           bool svq,
> +                                           VhostIOVATree *iova_tree)
>  {
>      NetClientState *nc =3D NULL;
>      VhostVDPAState *s;
> @@ -455,6 +483,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>
>      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
>      s->vhost_vdpa.index =3D queue_pair_index;
> +    s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> +    s->vhost_vdpa.iova_tree =3D iova_tree;
>      if (!is_datapath) {
>          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_size=
(),
>                                              vhost_vdpa_net_cvq_cmd_page_=
len());
> @@ -465,6 +495,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>
>          s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
>          s->vhost_vdpa.shadow_vq_ops_opaque =3D s;
> +        error_setg(&s->vhost_vdpa.migration_blocker,
> +                   "Migration disabled: vhost-vdpa uses CVQ.");
>      }
>      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index,=
 nvqs);
>      if (ret) {
> @@ -474,6 +506,14 @@ static NetClientState *net_vhost_vdpa_init(NetClient=
State *peer,
>      return nc;
>  }
>
> +static int vhost_vdpa_get_iova_range(int fd,
> +                                     struct vhost_vdpa_iova_range *iova_=
range)
> +{
> +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> +
> +    return ret < 0 ? -errno : 0;
> +}
> +
>  static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **e=
rrp)
>  {
>      int ret =3D ioctl(fd, VHOST_GET_FEATURES, features);
> @@ -524,6 +564,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>      uint64_t features;
>      int vdpa_device_fd;
>      g_autofree NetClientState **ncs =3D NULL;
> +    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
>      NetClientState *nc;
>      int queue_pairs, r, i, has_cvq =3D 0;
>
> @@ -551,22 +592,45 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
>          return queue_pairs;
>      }
>
> +    if (opts->x_svq) {
> +        struct vhost_vdpa_iova_range iova_range;
> +
> +        uint64_t invalid_dev_features =3D
> +            features & ~vdpa_svq_device_features &
> +            /* Transport are all accepted at this point */
> +            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
> +                             VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F=
_START);
> +
> +        if (invalid_dev_features) {
> +            error_setg(errp, "vdpa svq does not work with features 0x%" =
PRIx64,
> +                       invalid_dev_features);
> +            goto err_svq;
> +        }
> +
> +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> +        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range.l=
ast);
> +    }
> +
>      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
>
>      for (i =3D 0; i < queue_pairs; i++) {
>          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                     vdpa_device_fd, i, 2, true);
> +                                     vdpa_device_fd, i, 2, true, opts->x=
_svq,
> +                                     iova_tree);
>          if (!ncs[i])
>              goto err;
>      }
>
>      if (has_cvq) {
>          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                 vdpa_device_fd, i, 1, false);
> +                                 vdpa_device_fd, i, 1, false,
> +                                 opts->x_svq, iova_tree);
>          if (!nc)
>              goto err;
>      }
>
> +    /* iova_tree ownership belongs to last NetClientState */
> +    g_steal_pointer(&iova_tree);
>      return 0;
>
>  err:
> @@ -575,6 +639,8 @@ err:
>              qemu_del_net_client(ncs[i]);
>          }
>      }
> +
> +err_svq:
>      qemu_close(vdpa_device_fd);
>
>      return -1;
> --
> 2.31.1
>


