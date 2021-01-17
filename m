Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897AB2F9181
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 10:06:11 +0100 (CET)
Received: from localhost ([::1]:37854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l140g-0001rB-6I
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 04:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l13yx-0001IA-D5
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 04:04:23 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:44913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l13yu-0007bx-NK
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 04:04:23 -0500
Received: by mail-ot1-x32b.google.com with SMTP id r9so13231438otk.11
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 01:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F7fwKXqIvYRnjyVjYMHmj1+dR+6EMZ5xELm0BLc2wi4=;
 b=emYU/s/nG1/rUvJ3NsBOB00Uw6oe7ovDkMJOS0IE50/8BPSfgZhkP0ejAcb2puhUBX
 pcaPS6t8hVnJPt0vXEpvY/g+ZR9x9BMJV7VMwMWYKUYqyhnSX51MmHBvaP0A7K5rc7KF
 OygaV5iShpVQV4K1Tx5XDs+AtJIOU0MRUlOA5oA3S59u9UOvfSkD6wQR1VJIPZSTqiF/
 KrLX4l8d4W7Q2R4S75YOUTCYmL0hhr0v4xcBPCFFO9McPQoToWpRZrRhVwE/Uwl+RtAa
 R1MYwFUbZb0l7rk0rwtHbaVRdLqP7Esb/lHGa75aqvWdBpElMI1yPK64sVpNZ98ywRHk
 9l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F7fwKXqIvYRnjyVjYMHmj1+dR+6EMZ5xELm0BLc2wi4=;
 b=RveZnr22OsqksahD+B8BcoOucjH3NpSOoiIsCAWNW9NdABfb05e8pDUPPju5h82ZAF
 7eq6Svoy1RyH/chz3xIc7lcg/y3pj8uwQLWNzGwF0BUFGYlirOXumw/zEQHEsQ12VHbb
 xOuJUSH8NCofnwPqoKCTkCkn4bYDi9g6twgxTWhcFPMIzjzkNdixfhQOueBk9ubnFa1x
 fIckHDrP54j9qoPEbD7UnkdjJokA2Ciarstv3GvTHoQdOwKF0BFGEM7Vc/ii0ztl2aWg
 dOwrkhXOB7TcByzMkYxR0k9hmCkUfy4cSLbCZsvQ5djOtASdrrbXmhZdtT6d45rVSDbZ
 SWoQ==
X-Gm-Message-State: AOAM532vLQ2Wf4Ql31Etz+72Q+TpDyCEN8X4YAzaFrj0tFxhZLSDLv4q
 Oyxey/byb806gihiPuatSJdyBUCqvdF6cutygpfVAg==
X-Google-Smtp-Source: ABdhPJyLsxy/34zwYyCpRNSnD3B3gYCou75elsXaG+62VVt4MrJfmm6wA6j4aFyRIbn9R9Yw/lGNeYzEJsPiRFVaajo=
X-Received: by 2002:a9d:67c7:: with SMTP id c7mr14590261otn.27.1610874258495; 
 Sun, 17 Jan 2021 01:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20210114211612.387052-1-andrew@daynix.com>
 <20210114211612.387052-6-andrew@daynix.com>
 <266f9040-542e-199e-1903-fb871ae3ad81@redhat.com>
In-Reply-To: <266f9040-542e-199e-1903-fb871ae3ad81@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 17 Jan 2021 11:04:07 +0200
Message-ID: <CAOEp5Oe0ZDRxSVaO4Q=YiJ3LTmXzcoUot1y1WhD97SsN=-oTgg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/6] virtio-net: Added eBPF RSS to virtio-net.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::32b;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 9:20 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/15 =E4=B8=8A=E5=8D=885:16, Andrew Melnychenko wrote:
> > From: Andrew <andrew@daynix.com>
> >
> > When RSS is enabled the device tries to load the eBPF program
> > to select RX virtqueue in the TUN. If eBPF can be loaded
> > the RSS will function also with vhost (works with kernel 5.8 and later)=
.
> > Software RSS is used as a fallback with vhost=3Doff when eBPF can't be =
loaded
> > or when hash population requested by the guest.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >   hw/net/vhost_net.c             |   2 +
> >   hw/net/virtio-net.c            | 125 +++++++++++++++++++++++++++++++-=
-
> >   include/hw/virtio/virtio-net.h |   4 ++
> >   net/vhost-vdpa.c               |   2 +
> >   4 files changed, 129 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 24d555e764..16124f99c3 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -71,6 +71,8 @@ static const int user_feature_bits[] =3D {
> >       VIRTIO_NET_F_MTU,
> >       VIRTIO_F_IOMMU_PLATFORM,
> >       VIRTIO_F_RING_PACKED,
> > +    VIRTIO_NET_F_RSS,
> > +    VIRTIO_NET_F_HASH_REPORT,
> >
> >       /* This bit implies RARP isn't sent by QEMU out of band */
> >       VIRTIO_NET_F_GUEST_ANNOUNCE,
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 09ceb02c9d..37016fc73a 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -691,6 +691,19 @@ static void virtio_net_set_queues(VirtIONet *n)
> >
> >   static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
> >
> > +static uint64_t fix_ebpf_vhost_features(uint64_t features)
> > +{
> > +    /* If vhost=3Don & CONFIG_EBPF doesn't set - disable RSS feature *=
/
>
>
> I still think we should not clear feature silently. This may break
> migraiton if the feature is cleared on destination.

Do I understand it correctly that if we do not clear features silently
and implement a graceful drop to vhost=3Doff when we can't do what we
need with vhost - then we do not need to add any migration blocker?

>
>
> > +    uint64_t ret =3D features;
> > +#ifndef CONFIG_EBPF
> > +    virtio_clear_feature(&ret, VIRTIO_NET_F_RSS);
> > +#endif
> > +    /* for now, there is no solution for populating the hash from eBPF=
 */
> > +    virtio_clear_feature(&ret, VIRTIO_NET_F_HASH_REPORT);
> > +
> > +    return ret;
> > +}
> > +
> >   static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t =
features,
> >                                           Error **errp)
> >   {
> > @@ -725,9 +738,9 @@ static uint64_t virtio_net_get_features(VirtIODevic=
e *vdev, uint64_t features,
> >           return features;
> >       }
> >
> > -    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
> > -    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
> > -    features =3D vhost_net_get_features(get_vhost_net(nc->peer), featu=
res);
> > +    features =3D fix_ebpf_vhost_features(
> > +            vhost_net_get_features(get_vhost_net(nc->peer), features))=
;
> > +
> >       vdev->backend_features =3D features;
> >
> >       if (n->mtu_bypass_backend &&
> > @@ -1151,12 +1164,79 @@ static int virtio_net_handle_announce(VirtIONet=
 *n, uint8_t cmd,
> >       }
> >   }
> >
> > +static void virtio_net_detach_epbf_rss(VirtIONet *n);
> > +
> >   static void virtio_net_disable_rss(VirtIONet *n)
> >   {
> >       if (n->rss_data.enabled) {
> >           trace_virtio_net_rss_disable();
> >       }
> >       n->rss_data.enabled =3D false;
> > +
> > +    virtio_net_detach_epbf_rss(n);
> > +}
> > +
> > +static bool virtio_net_attach_ebpf_to_backend(NICState *nic, int prog_=
fd)
> > +{
> > +    NetClientState *nc =3D qemu_get_peer(qemu_get_queue(nic), 0);
> > +    if (nc =3D=3D NULL || nc->info->set_steering_ebpf =3D=3D NULL) {
> > +        return false;
> > +    }
> > +
> > +    return nc->info->set_steering_ebpf(nc, prog_fd);
> > +}
> > +
> > +static void rss_data_to_rss_config(struct VirtioNetRssData *data,
> > +                                   struct EBPFRSSConfig *config)
> > +{
> > +    config->redirect =3D data->redirect;
> > +    config->populate_hash =3D data->populate_hash;
> > +    config->hash_types =3D data->hash_types;
> > +    config->indirections_len =3D data->indirections_len;
> > +    config->default_queue =3D data->default_queue;
> > +}
> > +
> > +static bool virtio_net_attach_epbf_rss(VirtIONet *n)
> > +{
> > +    struct EBPFRSSConfig config =3D {};
> > +
> > +    if (!ebpf_rss_is_loaded(&n->ebpf_rss)) {
> > +        return false;
> > +    }
> > +
> > +    rss_data_to_rss_config(&n->rss_data, &config);
> > +
> > +    if (!ebpf_rss_set_all(&n->ebpf_rss, &config,
> > +                          n->rss_data.indirections_table, n->rss_data.=
key)) {
> > +        return false;
> > +    }
> > +
> > +    if (!virtio_net_attach_ebpf_to_backend(n->nic, n->ebpf_rss.program=
_fd)) {
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static void virtio_net_detach_epbf_rss(VirtIONet *n)
> > +{
> > +    virtio_net_attach_ebpf_to_backend(n->nic, -1);
> > +}
> > +
> > +static bool virtio_net_load_ebpf(VirtIONet *n)
> > +{
> > +    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> > +        /* backend does't support steering ebpf */
> > +        return false;
> > +    }
> > +
> > +    return ebpf_rss_load(&n->ebpf_rss);
> > +}
> > +
> > +static void virtio_net_unload_ebpf(VirtIONet *n)
> > +{
> > +    virtio_net_attach_ebpf_to_backend(n->nic, -1);
> > +    ebpf_rss_unload(&n->ebpf_rss);
> >   }
> >
> >   static uint16_t virtio_net_handle_rss(VirtIONet *n,
> > @@ -1271,6 +1351,25 @@ static uint16_t virtio_net_handle_rss(VirtIONet =
*n,
> >           goto error;
> >       }
> >       n->rss_data.enabled =3D true;
> > +
> > +    if (!n->rss_data.populate_hash) {
> > +        if (!virtio_net_attach_epbf_rss(n)) {
> > +            /* EBPF must be loaded for vhost */
> > +            if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
> > +                warn_report("Can't load eBPF RSS for vhost");
> > +                goto error;
>
>
> How about stop the vhost in this case?
>
> Thanks
>
>

