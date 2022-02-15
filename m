Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292604B6FB0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 16:26:07 +0100 (CET)
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJziP-00088v-Q9
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 10:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJzfN-0007Qe-D7
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJzfJ-0008VH-BI
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644938562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYgYD26q4PlHgyOEC+8nEf7MxYAReO/7AACXWBnZnr0=;
 b=iriZmT9TwIpmHjsJnlrl1t/pXD8bTZCB4/DEtazVsF+uyCuk0Do8A9Tf449SEqD1cS7OAD
 cYiFxwzwNPqA4WbMmHycqaADau9OjMs+sssUJqiP0sjl/Y9K6fLbUzeW/M5VQ0btvU8j+f
 w4n4i1QDhCtNrC01MghyJwrqCZCo/7c=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-j0Bx4YtdP9WVXDbnVslMgg-1; Tue, 15 Feb 2022 10:22:41 -0500
X-MC-Unique: j0Bx4YtdP9WVXDbnVslMgg-1
Received: by mail-qv1-f71.google.com with SMTP id
 l3-20020a0ce503000000b0042c0129c766so14160976qvm.20
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 07:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bYgYD26q4PlHgyOEC+8nEf7MxYAReO/7AACXWBnZnr0=;
 b=aR+0RypJ8GuKpme873HkjhrflJCN9NhxnicPDTklKk2mPbabfPTte5Fkanl1JVHhUS
 rD6jalfQi5u/uWdFV7IIJHZaC5Q45Es5ZM4DvU5TlO42h0Ib6QIjEDe+slpuMBpE+bFb
 3xxj9V4w4ZFa9IYxkS80wi4kXJp1r+U0qsrt5B8DCgwrSwfGlkzdVgIuFWgUPAKrqIlR
 s9w/6S8KeIRmJhekqoBOmiOOuG7Qw5Br2hH4cewgccDHwYlqYbq7amui7YOtFU0qDE66
 82GjZA3FoZZhooo4xGLZRZLMuVRjuNkb9EkVsdwd8z4zhN1sFxddfsdiQgqN/1ENvmTz
 X01A==
X-Gm-Message-State: AOAM531HN5j3ZlCNYtUMcfMo2VOe1PjWkOfdS+P+qhmK9S1t4rroVb8m
 pAWpl0ONcUawl+5lJ9bRM6ZtJH8F5Yanp35Z/0OVRxEBoHWndszT1LBW+9gUeHQnpm7FSfZ0Hse
 J73Ru7WQRQPE4k4ap3U0BKjgKDQHGzB0=
X-Received: by 2002:ad4:5c4c:: with SMTP id a12mr3016368qva.119.1644938560560; 
 Tue, 15 Feb 2022 07:22:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf7SyYmXGpq29IYGxU8d9VUE1lQk908lSW8vqKKhsVcO1cyG9SXM4btniTNeAMf9SZFN/sMw9GJnctpc6G2IE=
X-Received: by 2002:ad4:5c4c:: with SMTP id a12mr3016349qva.119.1644938560384; 
 Tue, 15 Feb 2022 07:22:40 -0800 (PST)
MIME-Version: 1.0
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
In-Reply-To: <20220215072231.2498-3-gdawar@xilinx.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 15 Feb 2022 16:22:04 +0100
Message-ID: <CAJaqyWcGqfrEjRzDR0dqyB8xDTjMBRr8XfBXJPiSgu3-8wWW4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
To: Gautam Dawar <gautam.dawar@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Michael Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 martinh@xilinx.com, Harpreet Singh Anand <hanand@xilinx.com>,
 tanujk@xilinx.com, pabloc@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 8:23 AM Gautam Dawar <gautam.dawar@xilinx.com> wrot=
e:
>
> This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
> for vhost-vdpa backend when the underlying device supports this
> feature.
> This would aid in reaping performance benefits with HW devices
> that implement this feature. At the same time, it shouldn't have
> any negative impact as vhost-vdpa backend doesn't involve any
> userspace virtqueue operations.
>
> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
> ---
>  hw/net/virtio-net.c | 10 ++++++++++
>  net/vhost-vdpa.c    |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index cf8ab0f8af..a1089d06f6 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3507,11 +3507,21 @@ static void virtio_net_device_realize(DeviceState=
 *dev, Error **errp)
>      nc->rxfilter_notify_enabled =3D 1;
>
>     if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_V=
DPA) {
> +        uint64_t features =3D BIT_ULL(VIRTIO_F_IN_ORDER);

If more users arise, we could declare a set of features that can be
bypassed as long as the backend doesn't use userspace networking in
virtio.h/.c. Out_of_qemu_tree_valid_features?

But I think it is better to restrict the changes here at the moment.

>          struct virtio_net_config netcfg =3D {};
> +
>          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
>          vhost_net_set_config(get_vhost_net(nc->peer),
>              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTE=
R);
> +
> +       /*
> +         * For vhost-vdpa, if underlying device supports IN_ORDER featur=
e,
> +         * make it available for negotiation.
> +         */
> +       features =3D vhost_net_get_features(get_vhost_net(nc->peer), feat=
ures);
> +       n->host_features |=3D features;
>      }
> +
>      QTAILQ_INIT(&n->rsc_chains);
>      n->qdev =3D dev;
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 25dd6dd975..2886cba5ec 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -62,6 +62,7 @@ const int vdpa_feature_bits[] =3D {
>      VIRTIO_NET_F_CTRL_VQ,
>      VIRTIO_F_IOMMU_PLATFORM,
>      VIRTIO_F_RING_PACKED,
> +    VIRTIO_F_IN_ORDER,
>      VIRTIO_NET_F_RSS,
>      VIRTIO_NET_F_HASH_REPORT,
>      VIRTIO_NET_F_GUEST_ANNOUNCE,
> --
> 2.30.1
>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>


