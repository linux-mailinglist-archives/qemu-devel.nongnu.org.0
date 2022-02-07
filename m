Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663994AB36B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 04:28:26 +0100 (CET)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGuhV-0006GI-0c
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 22:28:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nGucw-0005Zj-0Y
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 22:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nGucs-0000ti-9I
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 22:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644204216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Zeudz3HsQx2ydeU0AeKWuOcXhG+dwzxLaNhwhSGQz4=;
 b=cS3KqvCO4t3aPsmnb/UoVeOuLWch3kW28apSaYMQ7d0kPitnWRbInhxtXGrAevyzYPcqAT
 6+Tmv0/YD/EKLwi0YCRGIgDCAX8Ky8jlthUd+xDZ+pB3Hz4qalXCJcdvei/dhz9O/vxJn2
 fsQyzdQ8m4EsnuAWSGj1waHIWabKsJw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-iNyHcLCNMtSi1lp1rMuOFw-1; Sun, 06 Feb 2022 22:23:35 -0500
X-MC-Unique: iNyHcLCNMtSi1lp1rMuOFw-1
Received: by mail-lj1-f198.google.com with SMTP id
 w18-20020a2e3012000000b00243d87d415eso3879034ljw.18
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 19:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Zeudz3HsQx2ydeU0AeKWuOcXhG+dwzxLaNhwhSGQz4=;
 b=6orkwip164PRy4izFJVagTrHw9CvabDeDT//HkuiU/MDKZIeNHsL75faG3EmQoQH8B
 4DaDXGmeUhxElq8E3PD0xjNrzHTxXaVyoPjpJo7gTbbkFod5ZVwS7GeJSsLek7NrZyJn
 4m57Xb1U90rCNZLuYHGUtDrioNuED5ghrzcrVkiIo4xp6F6byZnvWHcOzncZ0yn2TXRm
 Tlvdhl4hVhIlXZEdYaihgxeYSU/jvyqQVJyu68E0kVpaV1rWAyqamL97dkAqjTODu/to
 nX8uJUQsAaRPrk5rXY6zATj9Bz2jrlwyitnPFKyBbEO14zgv4H0QsCHOPQdYgVbYLwhl
 CODA==
X-Gm-Message-State: AOAM531bnibKeBdU6k/LvXDD9RCdnC402O1XxR7RoePv+Q1XQIJ+bJAW
 qNDfKMOWsblOKoNK4wLS3SXSP6G2tEGx81jdtz4IkMfcgl2UUPTPez7Mwn/+3VMsRWdwwz2hgqI
 b+15afqpUrAMaFVJvLUlPi7RHCAdv2tI=
X-Received: by 2002:ac2:4acf:: with SMTP id m15mr7091565lfp.580.1644204213668; 
 Sun, 06 Feb 2022 19:23:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjNwl8DEajJA8RzSWQp2TSyo2bIHh9ll8ro16tlpPv1CG0RDUa80unYEYgflaag2ZUpubAaYq5WDt3s7icAlk=
X-Received: by 2002:ac2:4acf:: with SMTP id m15mr7091551lfp.580.1644204213363; 
 Sun, 06 Feb 2022 19:23:33 -0800 (PST)
MIME-Version: 1.0
References: <20220205160349.712-1-gdawar@xilinx.com>
In-Reply-To: <20220205160349.712-1-gdawar@xilinx.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Feb 2022 11:23:22 +0800
Message-ID: <CACGkMEsG09WvptG_MuxKQyzZrFeZS8EBbXba+Gf7z+C9VDFROA@mail.gmail.com>
Subject: Re: [RFC PATCH] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
To: gautam.dawar@xilinx.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 eperezma <eperezma@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 tanujk@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 6, 2022 at 12:04 AM <gautam.dawar@xilinx.com> wrote:
>
> From: Gautam Dawar <gdawar@xilinx.com>
>
> Hi All,
>
> The VIRTIO_F_IN_ORDER feature is implemented by DPDK's virtio_net
> driver but not by the Linux kernel's virtio_net driver.
> However, this feature still can't be tested using vhost-vdpa with
> hardware devices that implement it as VIRTIO_F_IN_ORDER isn't defined
> in kernel's virtio_config.h header file.
> This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit for
> vhost-vdpa backend when the underlying device supports this feature.
> This would be useful for benchmarking the performance improvements
> for HW devices that implement this feature. At the same time, it
> shouldn't have any negative impact as vhost-vdpa backend doesn't
> involve any userspace virtqueue operations.
> In the final patch, instead of making a direct change in
> virtio_config.h, it will be pushed in the kernel and then QEMU's
> file will be synced with it, as usual.
>
> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
> ---
>  hw/net/virtio-net.c                            | 10 ++++++++++
>  include/standard-headers/linux/virtio_config.h |  6 ++++++
>  net/vhost-vdpa.c                               |  1 +
>  3 files changed, 17 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index cf8ab0f8af..a1089d06f6 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3507,11 +3507,21 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>      nc->rxfilter_notify_enabled = 1;
>
>     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        uint64_t features = BIT_ULL(VIRTIO_F_IN_ORDER);
>          struct virtio_net_config netcfg = {};
> +
>          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
>          vhost_net_set_config(get_vhost_net(nc->peer),
>              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
> +
> +       /*
> +         * For vhost-vdpa, if underlying device supports IN_ORDER feature,
> +         * make it available for negotiation.
> +         */
> +       features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> +       n->host_features |= features;

I wonder, instead of doing hacks here, it would be better to implement
IN_ORDER in qemu?

Note that DPDK has already supported IN_ORDER, so we don't even need
to touch kernel virtio drivers to test it.

>      }
> +
>      QTAILQ_INIT(&n->rsc_chains);
>      n->qdev = dev;
>
> diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
> index 22e3a85f67..9ec3a8b54b 100644
> --- a/include/standard-headers/linux/virtio_config.h
> +++ b/include/standard-headers/linux/virtio_config.h
> @@ -80,6 +80,12 @@
>  /* This feature indicates support for the packed virtqueue layout. */
>  #define VIRTIO_F_RING_PACKED           34
>
> +/*
> + * Inorder feature indicates that all buffers are used by the device
> + * in the same order in which they have been made available.
> + */
> +#define VIRTIO_F_IN_ORDER 35

This need to be done in the following steps:

1) a kernel patch to just add this feature bit
2) sync the kernel header using scripts/update-linux-headers.sh

> +
>  /*
>   * This feature indicates that memory accesses by the driver and the
>   * device are ordered in a way described by the platform.
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 25dd6dd975..2886cba5ec 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -62,6 +62,7 @@ const int vdpa_feature_bits[] = {
>      VIRTIO_NET_F_CTRL_VQ,
>      VIRTIO_F_IOMMU_PLATFORM,
>      VIRTIO_F_RING_PACKED,
> +    VIRTIO_F_IN_ORDER,
>      VIRTIO_NET_F_RSS,
>      VIRTIO_NET_F_HASH_REPORT,
>      VIRTIO_NET_F_GUEST_ANNOUNCE,

This needs to be done in a separated patch.

Thanks

> --
> 2.30.1
>


