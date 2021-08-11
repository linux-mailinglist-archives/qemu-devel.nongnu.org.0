Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28B3E892D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 06:19:19 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDfi2-0007iG-Sa
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 00:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mDfhH-0006lQ-GE
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 00:18:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mDfhF-0000CS-Sb
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 00:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628655508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8H+NfB9BXnYbE3AUPimB/1YBmV5SuGhckMmB8FaIGMI=;
 b=QjYMLSTH8ZMFjVpDMtecgsdxWFrVABu84q95aqTg38HDzjDtfL7GnkTmhe2ahxogYb5n3B
 E9f1m/w98sHmjsaGIti3N826kyvjYZ7pLTiWSflpLdFW7yg1GfkZJea84+RRQvO4gDwGKh
 dBmSiNLy9SfAd3JTSnE2nUeQlDisiIo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-MYWZB2IxOiej1bSEh-4f6Q-1; Wed, 11 Aug 2021 00:18:27 -0400
X-MC-Unique: MYWZB2IxOiej1bSEh-4f6Q-1
Received: by mail-lf1-f71.google.com with SMTP id
 x186-20020a19c7c30000b02903b69bdbaa03so445547lff.2
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 21:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8H+NfB9BXnYbE3AUPimB/1YBmV5SuGhckMmB8FaIGMI=;
 b=MSjkrPIvCdVwxq4Yx6jYKaWZwWD5gwQg+OHFkQ95QPLeAAXc3tXeACQZ+DIeIBLZnP
 0+PuTTbGaYFs7sbEsUMVXBVmLitT8BHiheYBCF9EGF/xZNeOigFaJ+5Ha9W7+he8LpKB
 LhkZ1NenXs3WfxRBEosKbxlk5Nubb6wer/VQgqhzx9jN9zcFr++Q0+34h1wOZ1hUqVa2
 x2q9AIjC+QyJDlJy5iBG26jUgEnoxdaC2lMM5HvSJk9sErlXMSxQLX48fWdyt/WadmAL
 i0unnvdGB3t68ka18qGWYgPvYEfW+GGTS9G96P3InFE0NYSL2XBxGHJt7dx3dZy0etqA
 FdpQ==
X-Gm-Message-State: AOAM532VL4yo8hAAX2xeV69n8lwWjINFlf7pVlbZ+XvYtJGX3IR7uGYM
 fOmAm5bjS/Scc7d+f4ZiivYB8RwOhT41BBzM0HV0W+SRlre+0R1NTs9EU0Z8GJyPE1gDZYHY8dp
 sCResUQc/FjMCjuHAYQco/KYkfKEk/00=
X-Received: by 2002:a19:f719:: with SMTP id z25mr1573110lfe.339.1628655505471; 
 Tue, 10 Aug 2021 21:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsMuikGUKxyA5/iEXjD3wu9y0wghwpilsNussqZT9A7W4XK4wWq+Uzh2iCmbQDMIBYK4R4Hzlq/jq/4vIOfwE=
X-Received: by 2002:a19:f719:: with SMTP id z25mr1573097lfe.339.1628655505161; 
 Tue, 10 Aug 2021 21:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210809171342.18146-1-lvivier@redhat.com>
 <20210809171342.18146-2-lvivier@redhat.com>
In-Reply-To: <20210809171342.18146-2-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Aug 2021 12:18:14 +0800
Message-ID: <CACGkMEtmCDjUQUf_FXUFzNNtKeNojsj-+6zdHdLo=5rzi2zWsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virtio: failover: define the default device to use
 in case of error
To: Laurent Vivier <lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 1:14 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> If the guest driver doesn't support the STANDBY feature, by default
> we keep the virtio-net device and don't hotplug the VFIO device,
> but in some cases, user can prefer to use the VFIO device rather
> than the virtio-net one. We can't unplug the virtio-net device
> (because on migration it is expected on the destination side)
> but we can force the guest driver to be disabled. Then, we can
> hotplug the VFIO device that will be unplugged before the migration
> like in the normal failover migration but without the failover device.
>
> This patch adds a new property to virtio-net device: "failover-default".
>
> By default, "failover-default" is set to true and thus the default NIC
> to use if the failover cannot be enabled is the virtio-net device
> (this is what is done until now with the virtio-net failover).
>
> If "failover-default" is set to false, in case of error, the virtio-net
> device is not the default anymore and the failover primary device
> is used instead.
>
> If the STANDBY feature is supported by guest and host, the virtio-net
> failover acts as usual.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  include/hw/virtio/virtio-net.h |  1 +
>  hw/net/virtio-net.c            | 49 +++++++++++++++++++++++++++++-----
>  2 files changed, 44 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index 824a69c23f06..ab77930a327e 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -208,6 +208,7 @@ struct VirtIONet {
>      /* primary failover device is hidden*/
>      bool failover_primary_hidden;
>      bool failover;
> +    bool failover_default;
>      DeviceListener primary_listener;
>      Notifier migration_state;
>      VirtioNetRssData rss_data;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee52a..972c03232a96 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -935,12 +935,23 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>          memset(n->vlans, 0xff, MAX_VLAN >> 3);
>      }
>
> -    if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
> -        qapi_event_send_failover_negotiated(n->netclient_name);
> -        qatomic_set(&n->failover_primary_hidden, false);
> -        failover_add_primary(n, &err);
> -        if (err) {
> -            warn_report_err(err);
> +    /*
> +     * if the virtio-net driver has the STANDBY feature, we can plug the primary
> +     * if not but is not the default failover device,
> +     * we need to plug the primary alone and the virtio-net driver will
> +     * be disabled in the validate_features() function but validate_features()
> +     * is only available with virtio 1.0 spec
> +     */
> +    if (n->failover) {
> +        if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY) ||
> +           (virtio_has_feature(features, VIRTIO_F_VERSION_1) &&

I think STANDY implies VERSION_1.

And if we do this, it means it doesn't work for legacy drivers.

Not sure if it's an issue.

Thanks

> +            !n->failover_default)) {
> +            qapi_event_send_failover_negotiated(n->netclient_name);
> +            qatomic_set(&n->failover_primary_hidden, false);
> +            failover_add_primary(n, &err);
> +            if (err) {
> +                warn_report_err(err);
> +            }
>          }
>      }
>  }
> @@ -3625,9 +3636,34 @@ static Property virtio_net_properties[] = {
>      DEFINE_PROP_INT32("speed", VirtIONet, net_conf.speed, SPEED_UNKNOWN),
>      DEFINE_PROP_STRING("duplex", VirtIONet, net_conf.duplex_str),
>      DEFINE_PROP_BOOL("failover", VirtIONet, failover, false),
> +    DEFINE_PROP_BOOL("failover-default", VirtIONet, failover_default, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +/* validate_features() is only available with VIRTIO_F_VERSION_1 */
> +static int failover_validate_features(VirtIODevice *vdev)
> +{
> +    VirtIONet *n = VIRTIO_NET(vdev);
> +
> +    /*
> +     * If the guest driver doesn't support the STANDBY feature, by default
> +     * we keep the virtio-net device and don't hotplug the VFIO device,
> +     * but in some cases, user can prefer to use the VFIO device rather
> +     * than the virtio-net one. We can't unplug the virtio-net device
> +     * (because on migration it is expected on the destination side)
> +     * but we can force the guest driver to be disabled. In this case, We can
> +     * hotplug the VFIO device that will be unplugged before the migration
> +     * like in the normal failover migration but without the failover device.
> +     */
> +    if (n->failover && !n->failover_default &&
> +        !virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
> +        /* disable virtio-net */
> +        return -ENODEV;
> +    }
> +
> +    return 0;
> +}
> +
>  static void virtio_net_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -3651,6 +3687,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
>      vdc->post_load = virtio_net_post_load_virtio;
>      vdc->vmsd = &vmstate_virtio_net_device;
>      vdc->primary_unplug_pending = primary_unplug_pending;
> +    vdc->validate_features = failover_validate_features;
>  }
>
>  static const TypeInfo virtio_net_info = {
> --
> 2.31.1
>


