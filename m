Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C107F53F5E7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 08:12:14 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nySRp-0007jD-BW
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 02:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nySLe-00068V-Hj
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:05:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nySLb-0005Xs-Ef
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654581945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y63HKTvr22vwPm6ap6YvycidgBdGrZC4KWOj2NAOHRM=;
 b=Z8KXJVcapFOjCD84hsiRTN4+a+oMRnUZ9wTmHnxgf/FdE5PJnreMCsDBh457aRgVv+YxFs
 GseSGRe9G2RWqAnvjzTZHB7tBeUk/RhZQ2lz5CJF/EjGfShjgFWkOBKBt3YT1eD/sbZ9o7
 0vN0ytiNbpZy2C/Odor4EHiu40fu8hg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-p3T0z8tjMDifUN2PSLmgdA-1; Tue, 07 Jun 2022 02:05:44 -0400
X-MC-Unique: p3T0z8tjMDifUN2PSLmgdA-1
Received: by mail-pj1-f70.google.com with SMTP id
 j8-20020a17090a3e0800b001e3425c05c4so7338416pjc.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 23:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y63HKTvr22vwPm6ap6YvycidgBdGrZC4KWOj2NAOHRM=;
 b=ucRiuBa98q8lNslm/oPRXvPRIgF6G5v4Mj92Arvq4LOYP0boci2xmvtO+Q655aQx07
 6CrPYYjklDni7HyDcUcaJveVHD4t6tOhvOmaLj6Q1BPo2YKKdmIs32eqjSSm8FqW/L3E
 lZruHFBlByqS+0UdcguEqciAe5rDqajrtClBi7oSn5mVxOLKuXCIOow9yDsHJRb7Qa2d
 MXeHSZ7MlBrlvyrCGdARcPMcx4fc9InpDZP68Qa3joTSnJKe2bO8mnWlP/v6rB9r1VgK
 jOQ3JXBNGbS/IfgeL7hxBe7tcK8Vphw0XcbIDavVLP+51yCoaO2xgNMaO3Z2fSMH4Qzj
 G+oA==
X-Gm-Message-State: AOAM532GD+KyMVH7rpbHnRN5779KaVeWjhj5xPAb/axnvyTggphuST/n
 xR5wBW5vB4t2UcWr0JDGam1hJrygZVFxvr/5oEmv7gvh5rxvNAp58/wP1FkiQgau6G8S11fF9tD
 xqojYPlPtj/sFKJg=
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr27931926pfe.0.1654581943110; 
 Mon, 06 Jun 2022 23:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylkCTg9ahO0HLj9jByUrBFdQXYMnCN0wmUvyntZoTMqk6ODK5NrpdRr3SjqzNj3xfGX6U0fw==
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr27931854pfe.0.1654581942144; 
 Mon, 06 Jun 2022 23:05:42 -0700 (PDT)
Received: from [10.72.13.149] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a170902ea4a00b00163e459be9asm4542492plg.136.2022.06.06.23.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 23:05:41 -0700 (PDT)
Message-ID: <050a3bc5-911b-4478-1d5c-8064a1c2fae4@redhat.com>
Date: Tue, 7 Jun 2022 14:05:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v8 03/21] vdpa: control virtqueue support on shadow
 virtqueue
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220519191306.821774-4-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/5/20 03:12, Eugenio Pérez 写道:
> Introduce the control virtqueue support for vDPA shadow virtqueue. This
> is needed for advanced networking features like multiqueue.
>
> To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR and
> VIRTIO_NET_CTRL_MQ are implemented. If vDPA device is started with SVQ
> support and virtio-net driver changes MAC or the number of queues
> virtio-net device model will be updated with the new one.
>
> Others cvq commands could be added here straightforwardly but they have
> been not tested.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index df1e69ee72..ef12fc284c 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -11,6 +11,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "clients.h"
> +#include "hw/virtio/virtio-net.h"
>   #include "net/vhost_net.h"
>   #include "net/vhost-vdpa.h"
>   #include "hw/virtio/vhost-vdpa.h"
> @@ -187,6 +188,46 @@ static NetClientInfo net_vhost_vdpa_info = {
>           .check_peer_type = vhost_vdpa_check_peer_type,
>   };
>   
> +static void vhost_vdpa_net_handle_ctrl(VirtIODevice *vdev,
> +                                       const VirtQueueElement *elem)
> +{
> +    struct virtio_net_ctrl_hdr ctrl;
> +    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
> +    size_t s;
> +    struct iovec in = {
> +        .iov_base = &status,
> +        .iov_len = sizeof(status),
> +    };
> +
> +    s = iov_to_buf(elem->out_sg, elem->out_num, 0, &ctrl, sizeof(ctrl.class));
> +    if (s != sizeof(ctrl.class)) {
> +        return;
> +    }
> +
> +    switch (ctrl.class) {
> +    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> +    case VIRTIO_NET_CTRL_MQ:
> +        break;
> +    default:
> +        return;
> +    };


I think we can probably remove the whitelist here since it is expected 
to work for any kind of command?

Thanks


> +
> +    s = iov_to_buf(elem->in_sg, elem->in_num, 0, &status, sizeof(status));
> +    if (s != sizeof(status) || status != VIRTIO_NET_OK) {
> +        return;
> +    }
> +
> +    status = VIRTIO_NET_ERR;
> +    virtio_net_handle_ctrl_iov(vdev, &in, 1, elem->out_sg, elem->out_num);
> +    if (status != VIRTIO_NET_OK) {
> +        error_report("Bad CVQ processing in model");
> +    }
> +}
> +
> +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
> +    .used_elem_handler = vhost_vdpa_net_handle_ctrl,
> +};
> +
>   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                              const char *device,
>                                              const char *name,
> @@ -211,6 +252,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>   
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
> +    if (!is_datapath) {
> +        s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
> +    }
>       ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
>       if (ret) {
>           qemu_del_net_client(nc);


