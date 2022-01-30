Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56D54A34DB
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 08:23:11 +0100 (CET)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE4YI-000436-Pl
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 02:23:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE45e-0005Bm-6S
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 01:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE45c-0002JY-DF
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 01:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643525608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XsHCx8jkGWVXzWCc3X6Rxis2vTEQvAEhfGe+XGRe7o=;
 b=bZvY1GvU4jRS/2R8ccrtCxvGhcw6W++RPl8pYckDlE4CI2HcczF+dC2bocqDfGw6PQF36a
 tjxU+UKt7wOF2w4kOsRiaArUwu5Secw4WFmEzwTDOakyyNvYScN3o2UiNFL0l02H3DEUqG
 UKBup8AtAUQHjeeYvV5D4XzSRH/SWzU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-NcQkUYPQOkqHperbPuTmrQ-1; Sun, 30 Jan 2022 01:53:25 -0500
X-MC-Unique: NcQkUYPQOkqHperbPuTmrQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 a10-20020a17090abe0a00b001b4df1f5a6eso6714474pjs.6
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 22:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1XsHCx8jkGWVXzWCc3X6Rxis2vTEQvAEhfGe+XGRe7o=;
 b=vRscOrJHXoRT4xVMMgG6XobigdV3L1OPW3eoRbxoyx60cEG6KriEqHysHPPCxfIMJ+
 DxlFWSMFSOIe8fu/FWEbJJXgrqTFcfPmuwY+gJAhKuae5EqfhdMKnBQkHeP3+XW51pU8
 SsYcIXDJ3UFwpRotJkx5fjJKaq5+s5mkCc4IEAsRTT2a4LM6U4j+I84T13JI5dz2f3uP
 AUd8JKy0JvjF/9kKpZaqMeVtYD39qGDOS5QSeH+Fc4Qbxu/Y0C9tvmPLWimrujsiPEiQ
 OOW8mdsoig31c4d9oWgS4iysrZql2FBmreFzT4V37pxuA3wIgEgjHjt5uUPqO+qDKfco
 tJMw==
X-Gm-Message-State: AOAM5328n2R5Eqa0k+4bWiAIsaHpsXvjXIiCR25OQ1P67zLXFNGmi3s3
 bp9lc8mRpVPcQtxOYGx28BrKOD7kxLs4LkTIIEfwUWvw/c208QFPHHJE1iCB+/FACP++nzPA4k/
 lJdKa4IohQIryOyE=
X-Received: by 2002:a17:902:c7ca:: with SMTP id
 r10mr15673360pla.158.1643525603948; 
 Sat, 29 Jan 2022 22:53:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyla5QSZaeXmBLMPoNV17DvZDq8eOr2BFCdesIut1Bj2a8bGVEh+MZL0HMG+i0AMtqCzgqKxA==
X-Received: by 2002:a17:902:c7ca:: with SMTP id
 r10mr15673329pla.158.1643525603660; 
 Sat, 29 Jan 2022 22:53:23 -0800 (PST)
Received: from [10.72.12.243] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 204sm2481400pfu.91.2022.01.29.22.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 22:53:23 -0800 (PST)
Message-ID: <a05fe05e-ff20-5f2b-ef95-c7db0e7b2670@redhat.com>
Date: Sun, 30 Jan 2022 14:53:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 30/31] vdpa: Move vhost_vdpa_get_iova_range to
 net/vhost-vdpa.c
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-31-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-31-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.098,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> Since it's a device property, it can be done in net/. This helps SVQ to
> allocate the rings in vdpa device initialization, rather than delay
> that.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 15 ---------------
>   net/vhost-vdpa.c       | 32 ++++++++++++++++++++++++--------


I don't understand here, since we will support device other than net?


>   2 files changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 75090d65e8..2491c05d29 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -350,19 +350,6 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>       return 0;
>   }
>   
> -static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> -{
> -    int ret = vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> -                              &v->iova_range);
> -    if (ret != 0) {
> -        v->iova_range.first = 0;
> -        v->iova_range.last = UINT64_MAX;
> -    }
> -
> -    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> -                                    v->iova_range.last);
> -}


Let's just export this instead?

Thanks


> -
>   static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> @@ -1295,8 +1282,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>           goto err;
>       }
>   
> -    vhost_vdpa_get_iova_range(v);
> -
>       if (vhost_vdpa_one_time_request(dev)) {
>           return 0;
>       }
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4befba5cc7..cc9cecf8d1 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -22,6 +22,7 @@
>   #include <sys/ioctl.h>
>   #include <err.h>
>   #include "standard-headers/linux/virtio_net.h"
> +#include "standard-headers/linux/vhost_types.h"
>   #include "monitor/monitor.h"
>   #include "hw/virtio/vhost.h"
>   
> @@ -187,13 +188,25 @@ static NetClientInfo net_vhost_vdpa_info = {
>           .check_peer_type = vhost_vdpa_check_peer_type,
>   };
>   
> +static void vhost_vdpa_get_iova_range(int fd,
> +                                      struct vhost_vdpa_iova_range *iova_range)
> +{
> +    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> +
> +    if (ret < 0) {
> +        iova_range->first = 0;
> +        iova_range->last = UINT64_MAX;
> +    }
> +}
> +
>   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
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
> +                                       struct vhost_vdpa_iova_range iova_range)
>   {
>       NetClientState *nc = NULL;
>       VhostVDPAState *s;
> @@ -211,6 +224,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>   
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
> +    s->vhost_vdpa.iova_range = iova_range;
>       ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
>       if (ret) {
>           qemu_del_net_client(nc);
> @@ -267,6 +281,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       g_autofree NetClientState **ncs = NULL;
>       NetClientState *nc;
>       int queue_pairs, i, has_cvq = 0;
> +    struct vhost_vdpa_iova_range iova_range;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -286,19 +301,20 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>           qemu_close(vdpa_device_fd);
>           return queue_pairs;
>       }
> +    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
>   
>       ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
>   
>       for (i = 0; i < queue_pairs; i++) {
>           ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                     vdpa_device_fd, i, 2, true);
> +                                     vdpa_device_fd, i, 2, true, iova_range);
>           if (!ncs[i])
>               goto err;
>       }
>   
>       if (has_cvq) {
>           nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                 vdpa_device_fd, i, 1, false);
> +                                 vdpa_device_fd, i, 1, false, iova_range);
>           if (!nc)
>               goto err;
>       }


