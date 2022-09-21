Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5152D5BF647
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 08:27:49 +0200 (CEST)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oatD2-0004Ir-5B
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 02:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oat1b-0007cj-UK
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 02:15:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oat1X-0001n5-6A
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 02:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663740954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dn6M375cPBD66CswMP+3x4DxvF8Fm3Pu6MLlP4dtBq0=;
 b=DdNKK0P0YFiQuZRvlY3lfPHr54YBJfjl6ywXE2pU8amT9xLUhyPhYB3Em2V+Ng49yNHLh7
 6AkkdYuCyx6d+W4FAyZ/pkVYG0NHOZC/X4HczanMeKjkJ1YQRA6Hk+f9R7uKAzpLWmTuBS
 RzfgHetK+nS/0XSL9+gRF1AO2dvgP+Q=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-ap6qRYHnNDWQH8V11tAH2g-1; Wed, 21 Sep 2022 02:15:53 -0400
X-MC-Unique: ap6qRYHnNDWQH8V11tAH2g-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-10e88633e1cso2916942fac.21
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 23:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=dn6M375cPBD66CswMP+3x4DxvF8Fm3Pu6MLlP4dtBq0=;
 b=i+r/brkEGsKmPvaZsIHckbb8OmxZu4KnsUqSd3QFzrDm1rZ8bFr8mZPwmmQsldStGa
 J9rt2PPECZfAnLTf+5p/eYLUEXWbbXeB0Cbro5WHWNV2jS80EDdjy2IxcMdXZlYl46UT
 SkBhKqFrYiQv4qCuKY7D4vscCHfq54JXJwvKbjg1kBq1NCs435ycs9QQLR74DksQR2PS
 7JGWhPv6ncOsfoRimgIxgD0k7c81HaiWo+kRv2MQ6Az5VrMJYQKCjSmCGB0pGQ/AgktT
 tmlmEije3AMczz9fsjuP/FAg83ckj5zEtmd80oQQnUB/MCDdGU3pNAUsnbg3yw38LJEW
 5BRw==
X-Gm-Message-State: ACrzQf3xcHlDV4uh26xRU1izVPCMYeao01PJxnWfmz/UC6NGyc9UTz2+
 dzAz23ty0fJrLYaZRT2yr1/TKb98V8iyKKZ2codChs2aCeoBBHhsO5x+U7ADeUz5eDFfTQXzUPT
 TEjlN/PLcz8wSfM3ncDOgTc67vC/icbE=
X-Received: by 2002:a05:6830:1550:b0:659:68f7:492b with SMTP id
 l16-20020a056830155000b0065968f7492bmr11572113otp.237.1663740952254; 
 Tue, 20 Sep 2022 23:15:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SazW7FWAibtMOUL0YDhDEUvCD1BlY10t0JZLENShgG7VJt3n9wq87cnbqLotDoEm2dOMnriNrg6XFkb+wsD4=
X-Received: by 2002:a05:6830:1550:b0:659:68f7:492b with SMTP id
 l16-20020a056830155000b0065968f7492bmr11572106otp.237.1663740951969; Tue, 20
 Sep 2022 23:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220920011007.1972418-1-liuhaiwei9699@126.com>
 <CACGkMEuWDZzyBWOuAUVgxkUjBytStWC4U9RD0yWw49RS6RG6HA@mail.gmail.com>
 <CACGkMEuR9-311m3W4F9RSpnEuhGONQFoS5Ns6JErO56R7OU=dA@mail.gmail.com>
 <20220920080533-mutt-send-email-mst@kernel.org>
 <CACGkMEs+ExUGQMmqqx1_OTskDNeh4mULN_tFSvuLKb0nEdWASA@mail.gmail.com>
 <20220920235236-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220920235236-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 21 Sep 2022 14:15:41 +0800
Message-ID: <CACGkMEvduPNTbsSHMg3qZnKdQD7SyhVG7eZZambekixGmOrqyg@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: set the max of queue size to 4096
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: liuhaiwei <liuhaiwei9699@126.com>, qemu-devel <qemu-devel@nongnu.org>, 
 liuhaiwei <liuhaiwei@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 21, 2022 at 11:57 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 21, 2022 at 10:59:50AM +0800, Jason Wang wrote:
> > On Tue, Sep 20, 2022 at 8:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Sep 20, 2022 at 10:03:23AM +0800, Jason Wang wrote:
> > > > On Tue, Sep 20, 2022 at 9:38 AM Jason Wang <jasowang@redhat.com> wrote:
> > > > >
> > > > > On Tue, Sep 20, 2022 at 9:10 AM liuhaiwei <liuhaiwei9699@126.com> wrote:
> > > > > >
> > > > > > From: liuhaiwei <liuhaiwei@inspur.com>
> > > > > >
> > > > > > the limit of maximum of rx_queue_size and tx_queue to 1024 is so small as to affect our network performance when using the  virtio-net and vhost ,
> > > > > > we cannot set the maximum size beyond 1k.
> > > > > > why not enlarge the maximum size (such as 4096) when using the vhost backend?
> > > > >
> > > > > As Michael mentioned, there's a limitation in the kernel UIO_MAXIOV.
> > > > > We need to find way to overcome that limit first.
> > > >
> > > > Btw, this probably means the skb needs to be built by vhost-net
> > > > itself, instead of tuntap.
> > > >
> > > > Thanks
> > >
> > > That might help vhost-net but it won't help virtio-net.
> > >
> > > IMO the right fix is to add a separate limit on s/g size
> > > to the spec. Block and scsi already have it, seems
> > > reasonable to add it for others too.
> >
> > I wonder if it would be simpler to tie the limit to the virtqueue size.
>
> Simpler but wrong I think. As another example for RX we do not need s/g
> at all with mergeable.

But this is not forbidden by the spec if I was not wrong.

> At the same time deep queues are needed
> to avoid underruns.
>
>
>
> > Having individual limits seems to complicate the migration compatibility anyhow.
> >
> > Thanks
>
> I don't see how it's materially different from queue size.

Yes.

> We need interfaces for that, that we lack now, userspace is
> expected to guess a subset available on both ends.
>

Ok.

Thanks

> > >
> > >
> > >
> > > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > > Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
> > > > > > Signed-off-by: liuhaiwei <liuhaiwei@inspur.com>
> > > > > > ---
> > > > > >  hw/net/virtio-net.c        | 47 +++++++++++++++++++++++++++-----------
> > > > > >  hw/virtio/virtio.c         |  8 +++++--
> > > > > >  include/hw/virtio/virtio.h |  1 +
> > > > > >  3 files changed, 41 insertions(+), 15 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > index dd0d056fde..4b56484855 100644
> > > > > > --- a/hw/net/virtio-net.c
> > > > > > +++ b/hw/net/virtio-net.c
> > > > > > @@ -52,12 +52,11 @@
> > > > > >  #define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> > > > > >
> > > > > >  /* previously fixed value */
> > > > > > -#define VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE 256
> > > > > > -#define VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE 256
> > > > > > +#define VIRTIO_NET_VHOST_USER_DEFAULT_SIZE 2048
> > > > > >
> > > > > >  /* for now, only allow larger queue_pairs; with virtio-1, guest can downsize */
> > > > > > -#define VIRTIO_NET_RX_QUEUE_MIN_SIZE VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE
> > > > > > -#define VIRTIO_NET_TX_QUEUE_MIN_SIZE VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE
> > > > > > +#define VIRTIO_NET_RX_QUEUE_MIN_SIZE 256
> > > > > > +#define VIRTIO_NET_TX_QUEUE_MIN_SIZE 256
> > > > > >
> > > > > >  #define VIRTIO_NET_IP4_ADDR_SIZE   8        /* ipv4 saddr + daddr */
> > > > > >
> > > > > > @@ -594,6 +593,28 @@ static int peer_has_ufo(VirtIONet *n)
> > > > > >      return n->has_ufo;
> > > > > >  }
> > > > > >
> > > > > > +static void virtio_net_set_default_queue_size(VirtIONet *n)
> > > > > > +{
> > > > > > +    NetClientState *peer = n->nic_conf.peers.ncs[0];
> > > > > > +
> > > > > > +    /* Default value is 0 if not set */
> > > > > > +    if (n->net_conf.rx_queue_size == 0) {
> > > > > > +        if (peer && peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> > > > > > +            n->net_conf.rx_queue_size = VIRTIO_NET_VHOST_USER_DEFAULT_SIZE;
> > > > > > +        } else {
> > > > > > +            n->net_conf.rx_queue_size = VIRTIO_NET_VQ_MAX_SIZE;
> > > > > > +        }
> > > > > > +    }
> > > > > > +
> > > > > > +    if (n->net_conf.tx_queue_size == 0) {
> > > > > > +        if (peer && peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> > > > > > +            n->net_conf.tx_queue_size = VIRTIO_NET_VHOST_USER_DEFAULT_SIZE;
> > > > > > +        } else {
> > > > > > +            n->net_conf.tx_queue_size = VIRTIO_NET_VQ_MAX_SIZE;
> > > > > > +        }
> > > > > > +    }
> > > > > > +}
> > > > > > +
> > > > > >  static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
> > > > > >                                         int version_1, int hash_report)
> > > > > >  {
> > > > > > @@ -633,7 +654,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
> > > > > >       * size.
> > > > > >       */
> > > > > >      if (!peer) {
> > > > > > -        return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> > > > > > +        return VIRTIO_NET_VQ_MAX_SIZE;
> > > > > >      }
> > > > > >
> > > > > >      switch(peer->info->type) {
> > > > > > @@ -641,7 +662,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
> > > > > >      case NET_CLIENT_DRIVER_VHOST_VDPA:
> > > > > >          return VIRTQUEUE_MAX_SIZE;
> > > > > >      default:
> > > > > > -        return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> > > > > > +        return VIRTIO_NET_VQ_MAX_SIZE;
> > > > > >      };
> > > > > >  }
> > > > > >
> > > > > > @@ -3450,30 +3471,30 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > > > > >
> > > > > >      virtio_net_set_config_size(n, n->host_features);
> > > > > >      virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
> > > > > > -
> > > > > > +    virtio_net_set_default_queue_size(n);
> > > > > >      /*
> > > > > >       * We set a lower limit on RX queue size to what it always was.
> > > > > >       * Guests that want a smaller ring can always resize it without
> > > > > >       * help from us (using virtio 1 and up).
> > > > > >       */
> > > > > >      if (n->net_conf.rx_queue_size < VIRTIO_NET_RX_QUEUE_MIN_SIZE ||
> > > > > > -        n->net_conf.rx_queue_size > VIRTQUEUE_MAX_SIZE ||
> > > > > > +        n->net_conf.rx_queue_size > VIRTIO_NET_VQ_MAX_SIZE ||
> > > > > >          !is_power_of_2(n->net_conf.rx_queue_size)) {
> > > > > >          error_setg(errp, "Invalid rx_queue_size (= %" PRIu16 "), "
> > > > > >                     "must be a power of 2 between %d and %d.",
> > > > > >                     n->net_conf.rx_queue_size, VIRTIO_NET_RX_QUEUE_MIN_SIZE,
> > > > > > -                   VIRTQUEUE_MAX_SIZE);
> > > > > > +                   VIRTIO_NET_VQ_MAX_SIZE );
> > > > > >          virtio_cleanup(vdev);
> > > > > >          return;
> > > > > >      }
> > > > > >
> > > > > >      if (n->net_conf.tx_queue_size < VIRTIO_NET_TX_QUEUE_MIN_SIZE ||
> > > > > > -        n->net_conf.tx_queue_size > VIRTQUEUE_MAX_SIZE ||
> > > > > > +        n->net_conf.tx_queue_size > VIRTIO_NET_VQ_MAX_SIZE ||
> > > > > >          !is_power_of_2(n->net_conf.tx_queue_size)) {
> > > > > >          error_setg(errp, "Invalid tx_queue_size (= %" PRIu16 "), "
> > > > > >                     "must be a power of 2 between %d and %d",
> > > > > >                     n->net_conf.tx_queue_size, VIRTIO_NET_TX_QUEUE_MIN_SIZE,
> > > > > > -                   VIRTQUEUE_MAX_SIZE);
> > > > > > +                   VIRTIO_NET_VQ_MAX_SIZE);
> > > > > >          virtio_cleanup(vdev);
> > > > > >          return;
> > > > > >      }
> > > > > > @@ -3751,9 +3772,9 @@ static Property virtio_net_properties[] = {
> > > > > >      DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
> > > > > >      DEFINE_PROP_STRING("tx", VirtIONet, net_conf.tx),
> > > > > >      DEFINE_PROP_UINT16("rx_queue_size", VirtIONet, net_conf.rx_queue_size,
> > > > > > -                       VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE),
> > > > > > +                       0),
> > > > > >      DEFINE_PROP_UINT16("tx_queue_size", VirtIONet, net_conf.tx_queue_size,
> > > > > > -                       VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE),
> > > > > > +                       0),
> > > > > >      DEFINE_PROP_UINT16("host_mtu", VirtIONet, net_conf.mtu, 0),
> > > > > >      DEFINE_PROP_BOOL("x-mtu-bypass-backend", VirtIONet, mtu_bypass_backend,
> > > > > >                       true),
> > > > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > > > index 5d607aeaa0..ad9dfa20e7 100644
> > > > > > --- a/hw/virtio/virtio.c
> > > > > > +++ b/hw/virtio/virtio.c
> > > > > > @@ -2286,11 +2286,15 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
> > > > > >
> > > > > >  void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
> > > > > >  {
> > > > > > +    int vq_max_size = VIRTQUEUE_MAX_SIZE;
> > > > > > +    if (!strcmp(vdev->name, "virtio-net")) {
> > > > > > +        vq_max_size = VIRTIO_NET_VQ_MAX_SIZE;
> > > > > > +    }
> > > > > >      /* Don't allow guest to flip queue between existent and
> > > > > >       * nonexistent states, or to set it to an invalid size.
> > > > > >       */
> > > > > >      if (!!num != !!vdev->vq[n].vring.num ||
> > > > > > -        num > VIRTQUEUE_MAX_SIZE ||
> > > > > > +        num > vq_max_size ||
> > > > > >          num < 0) {
> > > > > >          return;
> > > > > >      }
> > > > > > @@ -2423,7 +2427,7 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
> > > > > >              break;
> > > > > >      }
> > > > > >
> > > > > > -    if (i == VIRTIO_QUEUE_MAX || queue_size > VIRTQUEUE_MAX_SIZE)
> > > > > > +    if (i == VIRTIO_QUEUE_MAX )
> > > > > >          abort();
> > > > > >
> > > > > >      vdev->vq[i].vring.num = queue_size;
> > > > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > > > > index db1c0ddf6b..1f4d2eb5d7 100644
> > > > > > --- a/include/hw/virtio/virtio.h
> > > > > > +++ b/include/hw/virtio/virtio.h
> > > > > > @@ -50,6 +50,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *features,
> > > > > >  typedef struct VirtQueue VirtQueue;
> > > > > >
> > > > > >  #define VIRTQUEUE_MAX_SIZE 1024
> > > > > > +#define VIRTIO_NET_VQ_MAX_SIZE (4096)
> > > > > >
> > > > > >  typedef struct VirtQueueElement
> > > > > >  {
> > > > > > --
> > > > > > 2.27.0
> > > > > >
> > >
>


