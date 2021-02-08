Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D7314331
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:51:04 +0100 (CET)
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FN1-0007xp-2I
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l9ChN-0006f7-1u
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:59:53 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:33389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l9ChK-0003dU-PB
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:59:52 -0500
Received: by mail-oi1-x22f.google.com with SMTP id g84so3129566oib.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fRKahTa0cAuGbe7+6eE0PJ1L2BwpvGQJ5MBsypJqbPo=;
 b=DWG6306KdZRQ9JzljrElKclwU8+l3lqlp0armPa/ljL1y87s/bgW6b4Sr+nSd5ppTj
 9604lTJ/6Cym/aAZzSGumGrQKWKRcai1BHAMyVB6dAYpJKMEX7QzylQEKfklZ1VvexTm
 nI1so9RWaPehjsErzqN+XRqguuqZewrB5cuYrdM/MkQJzm+GIpiayJznuWjh9dpArTN0
 qWZpXrJwT6bduUqzJfze7fS+CH/quKx1R30qPmR+c75uPdqgHu9qkun72DAo1ykaWlwp
 ogSsZCmAZOkmtx9WP2z8T7H9htGWqZioGx442P6vl+j/aB4vs/CiThKUTafaYjLhDxa+
 0fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fRKahTa0cAuGbe7+6eE0PJ1L2BwpvGQJ5MBsypJqbPo=;
 b=rAyyCbLuSNIXo1TEB/qKjMJyqTOAB6HsEze/cjknQ6z25El6xfnXioIXdChTt9UMC7
 Z3/zDPnOPcG8MJKQK3CtRcS83KHp/b0IiDAsk842CyYtVrOnO2dsHE7RO4pfdRMsDIuM
 oxqii9YGddqM7YwvqGwn7MrGHrSFi2f4PVgg7y53Vb1JFjLcbByoOZ2a4We1bTgQVvTs
 SLGXLOZCvvd3ikPnS27sIK4uZFhVd4hYzzjO2WEK56NJzVXavXAsGTaEL97a/3uQ6XNC
 mkJKClpsKF0Z9upJ5wqbDTCs98n98oHVeZJ2SSqt6KWNCDLNhi+O5CbL3kkPO/xp6DDT
 qBJA==
X-Gm-Message-State: AOAM530MYT/kDYm1Gaw6V8hBpPTBWyylNMAOXIUsi0+rSAxTrC1q5VLn
 JV2VH2+tAmgWH+u0reNEZQdl+rkdl4iy0a7gUZRB+w==
X-Google-Smtp-Source: ABdhPJyjnWXisBm773WulCQI9EhdRmBgWu+BKQ6nQ6PqtP2UB8FAouYqVNMc07Su4RmzsBi6dms8abDZ+tSjMii4zdI=
X-Received: by 2002:a54:4886:: with SMTP id r6mr291053oic.54.1612814389579;
 Mon, 08 Feb 2021 11:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210204202915.15925-4-yuri.benditovich@daynix.com>
 <1f0f901c-8ad0-60a4-383f-851fc0f093ff@redhat.com>
In-Reply-To: <1f0f901c-8ad0-60a4-383f-851fc0f093ff@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 8 Feb 2021 21:59:38 +0200
Message-ID: <CAOEp5Oco51MuLDEsxFrLtVpOWa1r7vrwLstAkJozfbt+AbVauQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap
 netdev
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::22f;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x22f.google.com
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
Cc: Yan Vugenfirer <yan@daynix.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 8, 2021 at 6:11 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/2/5 =E4=B8=8A=E5=8D=884:29, Yuri Benditovich wrote:
> > Currently virtio-net silently clears features if they are
> > not supported by respective vhost. This may create migration
> > problems in future if vhost features on the source and destination
> > are different. Implement graceful fallback to no-vhost mode
> > when some acked features contradict with vhost. The decision is
> > taken on set_features call and the vhost will be disabled
> > till next reset (or migration).
> > Such fallback is currently enabled only for TAP netdev.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > ---
> >   hw/net/virtio-net.c | 58 ++++++++++++++++++++++++++++++++++++++------=
-
> >   1 file changed, 50 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 5150f295e8..b353060e63 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -515,6 +515,15 @@ static RxFilterInfo *virtio_net_query_rxfilter(Net=
ClientState *nc)
> >       return info;
> >   }
> >
> > +static void virtio_net_allow_vhost(VirtIONet *n, bool allow)
> > +{
> > +    int i;
> > +    for (i =3D 0; i < n->max_queues; i++) {
> > +        NetClientState *nc =3D qemu_get_subqueue(n->nic, i)->peer;
> > +        nc->vhost_net_disabled =3D !allow;
> > +    }
> > +}
> > +
> >   static void virtio_net_reset(VirtIODevice *vdev)
> >   {
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> > @@ -552,6 +561,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
> >               assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
> >           }
> >       }
> > +    virtio_net_allow_vhost(n, true);
> >   }
> >
> >   static void peer_test_vnet_hdr(VirtIONet *n)
> > @@ -689,6 +699,15 @@ static void virtio_net_set_queues(VirtIONet *n)
> >       }
> >   }
> >
> > +static bool can_disable_vhost(VirtIONet *n)
> > +{
> > +    NetClientState *peer =3D qemu_get_queue(n->nic)->peer;
> > +    if (!get_vhost_net(peer)) {
> > +        return false;
> > +    }
> > +    return !peer || peer->info->type =3D=3D NET_CLIENT_DRIVER_TAP;
> > +}
> > +
> >   static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
> >
> >   static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t =
features,
> > @@ -725,14 +744,14 @@ static uint64_t virtio_net_get_features(VirtIODev=
ice *vdev, uint64_t features,
> >           return features;
> >       }
> >
> > -    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
> > -    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
> > -    features =3D vhost_net_get_features(get_vhost_net(nc->peer), featu=
res);
> > -    vdev->backend_features =3D features;
> > +    vdev->backend_features =3D vhost_net_get_features(get_vhost_net(nc=
->peer), features);
> >
> > -    if (n->mtu_bypass_backend &&
> > -            (n->host_features & 1ULL << VIRTIO_NET_F_MTU)) {
> > -        features |=3D (1ULL << VIRTIO_NET_F_MTU);
> > +    if (!can_disable_vhost(n)) {
> > +        features =3D vdev->backend_features;
> > +        if (n->mtu_bypass_backend &&
> > +                (n->host_features & 1ULL << VIRTIO_NET_F_MTU)) {
> > +            features |=3D (1ULL << VIRTIO_NET_F_MTU);
> > +        }
> >       }
> >
> >       return features;
> > @@ -872,10 +891,25 @@ static void failover_add_primary(VirtIONet *n, Er=
ror **errp)
> >       error_propagate(errp, err);
> >   }
> >
> > +static bool check_vhost_features(VirtIONet *n, uint64_t features)
> > +{
> > +    NetClientState *nc =3D qemu_get_queue(n->nic);
> > +    uint64_t filtered;
> > +    if (n->rss_data.redirect) {
> > +        return false;
> > +    }
> > +    filtered =3D vhost_net_get_features(get_vhost_net(nc->peer), featu=
res);
> > +    if (filtered !=3D features) {
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +
> >   static void virtio_net_set_features(VirtIODevice *vdev, uint64_t feat=
ures)
> >   {
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       Error *err =3D NULL;
> > +    bool disable_vhost =3D false;
> >       int i;
> >
> >       if (n->mtu_bypass_backend &&
> > @@ -894,13 +928,21 @@ static void virtio_net_set_features(VirtIODevice =
*vdev, uint64_t features)
> >                                                     VIRTIO_F_VERSION_1)=
,
> >                                  virtio_has_feature(features,
> >                                                     VIRTIO_NET_F_HASH_R=
EPORT));
> > -
> >       n->rsc4_enabled =3D virtio_has_feature(features, VIRTIO_NET_F_RSC=
_EXT) &&
> >           virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO4);
> >       n->rsc6_enabled =3D virtio_has_feature(features, VIRTIO_NET_F_RSC=
_EXT) &&
> >           virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO6);
> >       n->rss_data.redirect =3D virtio_has_feature(features, VIRTIO_NET_=
F_RSS);
> >
> > +    if (can_disable_vhost(n)) {
> > +        disable_vhost =3D !check_vhost_features(n, features);
> > +    }
> > +    if (disable_vhost) {
> > +        warn_report("Some of requested features aren't supported by vh=
ost, "
> > +                    "vhost is turned off till next reset");
> > +        virtio_net_allow_vhost(n, false);
> > +    }
>
>
> This looks more complicated than I expected. See
> virtio_net_vhost_status() we had a fallback there:
>
>          r =3D vhost_net_start(vdev, n->nic->ncs, queues);
>          if (r < 0) {
>              error_report("unable to start vhost net: %d: "
>                           "falling back on userspace virtio", -r);
>              n->vhost_started =3D 0;
>          }
>
> I wonder if we can simply depends on this (which is proved to be work
> for the past years) by not clearing dev->acked_features like:
>
> if (!can_disable_vhost(n)) {
>      features =3D vhost_net_get_features(get_vhost_net(nc->peer), feature=
s);
> } else {
>      vdev->backend_features =3D features;
> }
>
> Then we probably don't need other tricks.

Of course we can.
But I would prefer to make things more clear, i.e. make
get_vhost_net() always return a meaningful result, even (as an
example) in procedures called from set_feature() after the
vhost_disabled is set.
Otherwise people can rely on get_vhost_net() and call its methods
which potentially can do something that we do not expect.
In some places in the code (also in future) we'll need to check not
only get_vhost_net() but also is_vhost_disabled. IMO, not too elegant,
but possible.
Of course, being a decision maker, you can request to do it simpler
and do not maintain a consistent result of get_vhost_net().
But then please tell it explicitly.

>
> Thanks
>
>
> > +
> >       if (n->has_vnet_hdr) {
> >           n->curr_guest_offloads =3D
> >               virtio_net_guest_offloads_by_features(features);
>

