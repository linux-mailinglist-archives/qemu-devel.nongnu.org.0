Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC516C69C6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:44:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfLEm-0003x2-5l; Thu, 23 Mar 2023 09:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfLEj-0003vT-U4; Thu, 23 Mar 2023 09:44:13 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfLEi-00045X-4b; Thu, 23 Mar 2023 09:44:13 -0400
Received: by mail-ed1-x535.google.com with SMTP id y4so86858924edo.2;
 Thu, 23 Mar 2023 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679579050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZfX6hzdmslBpzK/oLezbGbbunUpJ7IENOhg7HXj/Uw=;
 b=nfYzXP5Y/CbidlxAru1x5YVDxIQlOd3DpgKND+WY6wl5fk0LhXz0cFdWlnbE1FLvjz
 +SlkbWGfrw800pgIFT4agDDIQiOD6J53Kl6sHaxr6EpM62YgETYLmr/JWw8KP31Tzph1
 JofQBPykI1ybnbx+U0bC7xb4SiEjw2Qz/jNNjky5YyZWGuJKZ3kKMyy+7kjL+ptlut1/
 axhEYTpiRAlMuZ33rolK9PC6gcIHBWghJaHmJFPp19DrKFAPIhlNnHEtHo+WqjFRUWcW
 WhaAAV0UcOoS+VIZTjyEq9vhLy2z0G9ufDMpGj+vheb36c1Do4qvDAZzNx4AgB2BqXSI
 VywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679579050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZfX6hzdmslBpzK/oLezbGbbunUpJ7IENOhg7HXj/Uw=;
 b=rdhbQB8YnLP1DllNd93cFq0wSHf/4sW3DZ/iIJ7ZJi84sbBYM/nqfpqr35RKt45v+1
 2rEw57PJy1sPBL5+E680qGZiECPLNyQ/lbeedPxBcKcPeN0lA5HQB64QPW2Mw2Lz/KKx
 xykzboCDE7NNyLbcN4I93J4qwYUVI7ZQt3wzzFmeu8jVJ04rlvOmZTWYU4P33KHbGaJE
 xPnysksRWhpWted4GLtco8eZ9c6ad1bcXoh4wzQoPXYsDqtZtyteqaZ48/A+jWtnZS3b
 ags7XFgxozLg4qDasmBgne2BhrkADYTqcqJgpr7FbWLwIX7UXgQ1sDJ+oGE0tKHtq+CJ
 bGSg==
X-Gm-Message-State: AO0yUKWO0YbM+1lha205MX2my0FQ+LqZeDz159Jeh1nq50rUelWi3A3d
 yY2+O0gdzfm4/DMkfqbN63iLY8rd3yA6R4qHXfY=
X-Google-Smtp-Source: AK7set+2bbBb4x6POMbWwXZiaSHh3eDYO51Kmfch6y59Nm6/Qvf0ST6dBBN+MYwjbk8jc2naJCrDWO8yPsD/2IpRtEM=
X-Received: by 2002:a17:906:7193:b0:87f:e5af:416e with SMTP id
 h19-20020a170906719300b0087fe5af416emr5466027ejk.7.1679579049840; Thu, 23 Mar
 2023 06:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230323052828.6545-1-faithilikerun@gmail.com>
 <20230323052828.6545-3-faithilikerun@gmail.com>
 <a826f507-d216-adfb-1212-4d577db0ce9f@bjorling.me>
In-Reply-To: <a826f507-d216-adfb-1212-4d577db0ce9f@bjorling.me>
From: Sam Li <faithilikerun@gmail.com>
Date: Thu, 23 Mar 2023 21:43:43 +0800
Message-ID: <CAAAx-8L5RBeMmcL8UvxNNc8aYCeGMwKm4O65EiFcKCMmdZo4FQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] virtio-blk: add zoned storage emulation for zoned
 devices
To: =?UTF-8?Q?Matias_Bj=C3=B8rling?= <m@bjorling.me>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 kvm@vger.kernel.org, 
 hare@suse.de, Paolo Bonzini <pbonzini@redhat.com>, dmitry.fomichev@wdc.com, 
 Hanna Reitz <hreitz@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=faithilikerun@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Matias Bj=C3=B8rling <m@bjorling.me> =E4=BA=8E2023=E5=B9=B43=E6=9C=8823=E6=
=97=A5=E5=91=A8=E5=9B=9B 21:39=E5=86=99=E9=81=93=EF=BC=9A
>
> On 23/03/2023 06.28, Sam Li wrote:
> > This patch extends virtio-blk emulation to handle zoned device commands
> > by calling the new block layer APIs to perform zoned device I/O on
> > behalf of the guest. It supports Report Zone, four zone oparations (ope=
n,
> > close, finish, reset), and Append Zone.
> >
> > The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
> > support zoned block devices. Regular block devices(conventional zones)
> > will not be set.
> >
> > The guest os can use blktests, fio to test those commands on zoned devi=
ces.
> > Furthermore, using zonefs to test zone append write is also supported.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >   hw/block/virtio-blk-common.c |   2 +
> >   hw/block/virtio-blk.c        | 389 ++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 391 insertions(+)
> >
> > diff --git a/hw/block/virtio-blk-common.c b/hw/block/virtio-blk-common.=
c
> > index ac52d7c176..e2f8e2f6da 100644
> > --- a/hw/block/virtio-blk-common.c
> > +++ b/hw/block/virtio-blk-common.c
> > @@ -29,6 +29,8 @@ static const VirtIOFeature feature_sizes[] =3D {
> >        .end =3D endof(struct virtio_blk_config, discard_sector_alignmen=
t)},
> >       {.flags =3D 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
> >        .end =3D endof(struct virtio_blk_config, write_zeroes_may_unmap)=
},
> > +    {.flags =3D 1ULL << VIRTIO_BLK_F_ZONED,
> > +     .end =3D endof(struct virtio_blk_config, zoned)},
> >       {}
> >   };
>
> I used the qemu monitor to expect the state of the devices, and on the
> zoned block device specific entries, the zoned device feature shows up
> in the "unknown-features" field (info virtio-status <device>)
>
> What is missing is an entry in the blk_feature_map structure within
> hw/virtio/virtio-qmp.c. The below fixes it up.
>
> diff --git i/hw/virtio/virtio-qmp.c w/hw/virtio/virtio-qmp.c
> index b70148aba9..3efa529bab 100644
> --- i/hw/virtio/virtio-qmp.c
> +++ w/hw/virtio/virtio-qmp.c
> @@ -176,6 +176,8 @@ static const qmp_virtio_feature_map_t
> virtio_blk_feature_map[] =3D {
>               "VIRTIO_BLK_F_DISCARD: Discard command supported"),
>       FEATURE_ENTRY(VIRTIO_BLK_F_WRITE_ZEROES, \
>               "VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported"=
),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_ZONED, \
> +            "VIRTIO_BLK_F_ZONED: Zoned block device"),
>   #ifndef VIRTIO_BLK_NO_LEGACY
>       FEATURE_ENTRY(VIRTIO_BLK_F_BARRIER, \
>               "VIRTIO_BLK_F_BARRIER: Request barriers supported"),
>
> Which then lets qemu report the support like this:
>
> (qemu) info virtio-status /machine/peripheral/virtblk0/virtio-backend
> /machine/peripheral/virtblk0/virtio-backend:
>    device_name:             virtio-blk
>    device_id:               2
>    vhost_started:           false
>    bus_name:                (null)
>    broken:                  false
>    disabled:                false
>    disable_legacy_check:    false
>    started:                 true
>    use_started:             true
>    start_on_kick:           false
>    use_guest_notifier_mask: true
>    vm_running:              true
>    num_vqs:                 4
>    queue_sel:               3
>    isr:                     1
>    endianness:              little
>    status:
>          VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found,
>          VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device,
>          VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete,
>          VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready
>    Guest features:
>          VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled,
>          VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported,
>          VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)
>          VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and ...,
>          VIRTIO_BLK_F_FLUSH: Flush command supported,
>          VIRTIO_BLK_F_ZONED: Zoned block device,
>          VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported,
>          VIRTIO_BLK_F_MQ: Multiqueue supported,
>          VIRTIO_BLK_F_TOPOLOGY: Topology information available,
>          VIRTIO_BLK_F_BLK_SIZE: Block size of disk available,
>          VIRTIO_BLK_F_GEOMETRY: Legacy geometry available,
>          VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max
>    unknown-features(0x0000010000000000)
>    Host features:
>          VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled,
>          VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported,
>          VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy),
>          VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts,
>          VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device ...,
>          VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol ...,
>          VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and w...,
>          VIRTIO_BLK_F_FLUSH: Flush command supported,
>          VIRTIO_BLK_F_ZONED: Zoned block device,
>          VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported,
>          VIRTIO_BLK_F_MQ: Multiqueue supported,
>          VIRTIO_BLK_F_TOPOLOGY: Topology information available,
>          VIRTIO_BLK_F_BLK_SIZE: Block size of disk available,
>          VIRTIO_BLK_F_GEOMETRY: Legacy geometry available,
>          VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max
>    unknown-features(0x0000010000000000)
>    Backend features:

Great!

>
> Cheers, Matias

