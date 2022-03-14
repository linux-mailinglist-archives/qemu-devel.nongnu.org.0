Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5504D8B8B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:18:42 +0100 (CET)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpHF-00075F-O7
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:18:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTpCu-0003Hs-Fi
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:14:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTpCn-0005N7-Mj
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647281644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bf5Adp3r9CDdBqqSdKwru7VRQNqBLxmpV5B9kUsEfgs=;
 b=fw/SOc331EUBgaylPNsaPKBlAd+oO21vihJYO94C4DSXYkkrLHeL5TE5gkEKXYwRjV/c/4
 fG965dqsnPesjZ9ydZ6QBTLAwoDlmfTYT+6nLbHjZKQdKJH01j+ligHUR+jDZoi5cVwf/3
 7mmjkLCsolr8VAXWzjFVPAxvqpOmmBc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-TF5SWVMjOqqIEP0AwaRoOA-1; Mon, 14 Mar 2022 14:14:03 -0400
X-MC-Unique: TF5SWVMjOqqIEP0AwaRoOA-1
Received: by mail-qt1-f197.google.com with SMTP id
 h11-20020a05622a170b00b002e0769b9018so12212557qtk.14
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bf5Adp3r9CDdBqqSdKwru7VRQNqBLxmpV5B9kUsEfgs=;
 b=iYey7evqL8GPTP3XOQHlnnumVX/Yow3OvMmx+YSvTESMKIhyf2DX+G5mTXCYGWFZZd
 CZhHOt9/Buy6kbLYabMH8mBl27tm2KxjfU+UStaOBG/vx5f+mLqw1/knFpzgRtwi4cFc
 shvPg9VaaZYz3vGcjC02YSVKbVzlm3HxlAlTvbB/qljIWPuWgW5TkxXmkn6tz33WfYRF
 I6xTqNW04cDY1aJ4MUvaSpD9SlmWbzM2uEWkO2m600AAU7kRLOCRAzf5lChXJqxNTCp7
 fu8FrnLSwV/T4pOMhVwnZZJ8ofS/bfs0eTCOtaatC5l75mLEyjk0TaK0m5X6F3oA/QvX
 qD3A==
X-Gm-Message-State: AOAM5316vXw9bJiTa/gnKmGKvMgIMPuEMEPRdWwu0Kir6/68PytOmcEI
 9cBrpg6DKZVI/y3kUIonEYrQP87KfncHJ+L8d8KOD5lj/dwqbaXVCIfNiZP0rKI0Qiw/btYG87S
 xz1wOS/4ooPh3TjCaDx2AYfEMnC1WGMc=
X-Received: by 2002:ac8:7f0e:0:b0:2e1:b3cc:d9a5 with SMTP id
 f14-20020ac87f0e000000b002e1b3ccd9a5mr16917600qtk.403.1647281642654; 
 Mon, 14 Mar 2022 11:14:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHOgpKlFLeeZsqHOorAy7fzH+zViEw0A5XE/jeGLGuy0Xqx8m9bhiwDG91d2/aQXuNejtng0m91HexHfIr1N8=
X-Received: by 2002:ac8:7f0e:0:b0:2e1:b3cc:d9a5 with SMTP id
 f14-20020ac87f0e000000b002e1b3ccd9a5mr16917579qtk.403.1647281642381; Mon, 14
 Mar 2022 11:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220314173455.200342-1-eperezma@redhat.com>
 <20220314173455.200342-16-eperezma@redhat.com>
In-Reply-To: <20220314173455.200342-16-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 14 Mar 2022 19:13:26 +0100
Message-ID: <CAJaqyWcz=P2kPTRVP1vMNZn7mP8joC4h_B-Ly-PHKquEXT0faQ@mail.gmail.com>
Subject: Re: [PATCH v6 15/15] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: qemu-level <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 6:50 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Finally offering the possibility to enable SVQ from the command line.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  qapi/net.json    |  8 +++++++-
>  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 47 insertions(+), 9 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..271dfa7708 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -445,12 +445,18 @@
>  # @queues: number of queues to be created for multiqueue vhost-vdpa
>  #          (default: 1)
>  #
> +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.1)
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
>  # @NetClientDriver:
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 1e9fe47c03..def738998b 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -127,7 +127,11 @@ err_init:
>  static void vhost_vdpa_cleanup(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_dev *dev =3D s->vhost_vdpa.dev;
>
> +    if (dev && dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete=
);
> +    }
>      if (s->vhost_net) {
>          vhost_net_cleanup(s->vhost_net);
>          g_free(s->vhost_net);
> @@ -187,13 +191,23 @@ static NetClientInfo net_vhost_vdpa_info =3D {
>          .check_peer_type =3D vhost_vdpa_check_peer_type,
>  };
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
>  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> -                                           const char *device,
> -                                           const char *name,
> -                                           int vdpa_device_fd,
> -                                           int queue_pair_index,
> -                                           int nvqs,
> -                                           bool is_datapath)
> +                                       const char *device,
> +                                       const char *name,
> +                                       int vdpa_device_fd,
> +                                       int queue_pair_index,
> +                                       int nvqs,
> +                                       bool is_datapath,
> +                                       bool svq,
> +                                       VhostIOVATree *iova_tree)
>  {
>      NetClientState *nc =3D NULL;
>      VhostVDPAState *s;
> @@ -211,6 +225,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>
>      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
>      s->vhost_vdpa.index =3D queue_pair_index;
> +    s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> +    s->vhost_vdpa.iova_tree =3D iova_tree;
>      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index,=
 nvqs);
>      if (ret) {
>          qemu_del_net_client(nc);
> @@ -266,6 +282,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>      g_autofree NetClientState **ncs =3D NULL;
>      NetClientState *nc;
>      int queue_pairs, i, has_cvq =3D 0;
> +    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
>
>      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts =3D &netdev->u.vhost_vdpa;
> @@ -285,29 +302,44 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
>          qemu_close(vdpa_device_fd);
>          return queue_pairs;
>      }
> +    if (opts->x_svq) {
> +        struct vhost_vdpa_iova_range iova_range;
> +
> +        if (has_cvq) {
> +            error_setg(errp, "vdpa svq does not work with cvq");
> +            goto err_svq;
> +        }
> +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> +        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range.l=
ast);
> +    }
>
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
> +                                 vdpa_device_fd, i, 1, false, opts->x_sv=
q,
> +                                 iova_tree);
>          if (!nc)
>              goto err;
>      }
>
> +    iova_tree =3D NULL;
>      return 0;
>
>  err:
>      if (i) {
>          qemu_del_net_client(ncs[0]);
>      }
> +
> +err_svq:
>      qemu_close(vdpa_device_fd);
>
>      return -1;
> --
> 2.27.0
>
>

Sorry, I added this last one by mistake. Do I need to resend the
series to delete it?

Thanks!


