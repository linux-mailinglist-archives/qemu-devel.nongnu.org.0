Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1853F600
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 08:20:37 +0200 (CEST)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nySZw-0003Oz-6o
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 02:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nySTO-0001CH-DX
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nySTM-0006gd-HH
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654582426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXdT1ynIXE+uNOo3Ad/+n917+ztkyqevXTi+8HXQlxM=;
 b=MPaUwgEf1phnSPQowUUY5a14IUymymn1GEli8kII3jhLfFX8FJQh23izxhmT7dTgsheNia
 6cjHbe2/xN5qSoOIVw5xlgFAQB7JbH5Sw5N6yv/5QQinOFmwHUl5st6yTijpCMKGlx12lp
 ujlcG1Mq5WC8fs1Ifc3EEdWtI3ABgl8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-9sMkUseIMt-LWDGLthTtsg-1; Tue, 07 Jun 2022 02:13:43 -0400
X-MC-Unique: 9sMkUseIMt-LWDGLthTtsg-1
Received: by mail-pg1-f200.google.com with SMTP id
 72-20020a63014b000000b003fce454aaf2so6396620pgb.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 23:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HXdT1ynIXE+uNOo3Ad/+n917+ztkyqevXTi+8HXQlxM=;
 b=5oTxX+QAQQScEagfwSPC9Cz0D9q+tj2M3Xk0Cqj31mPkg0z9aHGEHY8590nE8pjnM7
 rKb3+dqir1Ee8cZB7hSRa83WGvSsyrh3Ukln1yFOQzVEjzCjPbSa98d1Ocn5Qw9YsZz6
 +7PyDpUOrOWfV/QJMQRrk0JQNOHXPvosVlFhQafn5JB9KYBe5FSvs2qxNM9/RuZL11p2
 TSW+aYNwSn5YMb2qUD79pAxs4ou0NZKCYwT9rWyNp2BnDLM4X7ispqrMm8TptqfOwI9j
 7ZoQf7PxY6V8sTa4g7dpYEsrZGCXbBBP+UIfNIJx7RC+5OgW62ce34p5dntoZJKp23RI
 2z4g==
X-Gm-Message-State: AOAM531YQ9AZRpRHlwHwLnRMhu5v+kHSnsEmzi4bzOhVfqJ5fXspCDr8
 bSeODFcc6rNw8wSYntNuDXELKnWTl05Pfbdkk8e19ZbF4BYGDPHJ8zSQjH6e8kmaLcJDtnDUBWp
 +Vj33SHM6mtg6Xqo=
X-Received: by 2002:a17:903:28c:b0:167:6127:ed99 with SMTP id
 j12-20020a170903028c00b001676127ed99mr15781421plr.94.1654582421063; 
 Mon, 06 Jun 2022 23:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRLunu7/idRsF6GzrkFCahsUBCwUBRUVhtlihDXoubhD6AXaIAgKw7oUQhROniAOzT6RaQtA==
X-Received: by 2002:a17:903:28c:b0:167:6127:ed99 with SMTP id
 j12-20020a170903028c00b001676127ed99mr15781404plr.94.1654582420809; 
 Mon, 06 Jun 2022 23:13:40 -0700 (PDT)
Received: from [10.72.13.149] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a17090b079500b001e0d4169365sm13553351pjz.17.2022.06.06.23.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 23:13:40 -0700 (PDT)
Message-ID: <fba403b1-b06d-9d19-204e-f9fcf737d856@redhat.com>
Date: Tue, 7 Jun 2022 14:13:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v8 01/21] virtio-net: Expose ctrl virtqueue logic
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
 <20220519191306.821774-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220519191306.821774-2-eperezma@redhat.com>
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
> This allows external vhost-net devices to modify the state of the
> VirtIO device model once vhost-vdpa device has acknowledge the control
> commands.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/virtio-net.h |  4 ++
>   hw/net/virtio-net.c            | 84 ++++++++++++++++++++--------------
>   2 files changed, 53 insertions(+), 35 deletions(-)
>
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index eb87032627..cd31b7f67d 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -218,6 +218,10 @@ struct VirtIONet {
>       struct EBPFRSSContext ebpf_rss;
>   };
>   
> +unsigned virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
> +                                    const struct iovec *in_sg, size_t in_num,
> +                                    const struct iovec *out_sg,
> +                                    unsigned out_num);
>   void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
>                                      const char *type);
>   
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 7ad948ee7c..0e350154ec 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1434,57 +1434,71 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
>       return VIRTIO_NET_OK;
>   }
>   
> -static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> +unsigned virtio_net_handle_ctrl_iov(VirtIODevice *vdev,


Should we use size_t here?

Thanks


> +                                    const struct iovec *in_sg, size_t in_num,
> +                                    const struct iovec *out_sg,
> +                                    unsigned out_num)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
>       struct virtio_net_ctrl_hdr ctrl;
>       virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
> -    VirtQueueElement *elem;
>       size_t s;
>       struct iovec *iov, *iov2;
> -    unsigned int iov_cnt;
> +
> +    if (iov_size(in_sg, in_num) < sizeof(status) ||
> +        iov_size(out_sg, out_num) < sizeof(ctrl)) {
> +        virtio_error(vdev, "virtio-net ctrl missing headers");
> +        return 0;
> +    }
> +
> +    iov2 = iov = g_memdup2(out_sg, sizeof(struct iovec) * out_num);
> +    s = iov_to_buf(iov, out_num, 0, &ctrl, sizeof(ctrl));
> +    iov_discard_front(&iov, &out_num, sizeof(ctrl));
> +    if (s != sizeof(ctrl)) {
> +        status = VIRTIO_NET_ERR;
> +    } else if (ctrl.class == VIRTIO_NET_CTRL_RX) {
> +        status = virtio_net_handle_rx_mode(n, ctrl.cmd, iov, out_num);
> +    } else if (ctrl.class == VIRTIO_NET_CTRL_MAC) {
> +        status = virtio_net_handle_mac(n, ctrl.cmd, iov, out_num);
> +    } else if (ctrl.class == VIRTIO_NET_CTRL_VLAN) {
> +        status = virtio_net_handle_vlan_table(n, ctrl.cmd, iov, out_num);
> +    } else if (ctrl.class == VIRTIO_NET_CTRL_ANNOUNCE) {
> +        status = virtio_net_handle_announce(n, ctrl.cmd, iov, out_num);
> +    } else if (ctrl.class == VIRTIO_NET_CTRL_MQ) {
> +        status = virtio_net_handle_mq(n, ctrl.cmd, iov, out_num);
> +    } else if (ctrl.class == VIRTIO_NET_CTRL_GUEST_OFFLOADS) {
> +        status = virtio_net_handle_offloads(n, ctrl.cmd, iov, out_num);
> +    }
> +
> +    s = iov_from_buf(in_sg, in_num, 0, &status, sizeof(status));
> +    assert(s == sizeof(status));
> +
> +    g_free(iov2);
> +    return sizeof(status);
> +}
> +
> +static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    VirtQueueElement *elem;
>   
>       for (;;) {
> +        unsigned written;
>           elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
>           if (!elem) {
>               break;
>           }
> -        if (iov_size(elem->in_sg, elem->in_num) < sizeof(status) ||
> -            iov_size(elem->out_sg, elem->out_num) < sizeof(ctrl)) {
> -            virtio_error(vdev, "virtio-net ctrl missing headers");
> +
> +        written = virtio_net_handle_ctrl_iov(vdev, elem->in_sg, elem->in_num,
> +                                             elem->out_sg, elem->out_num);
> +        if (written > 0) {
> +            virtqueue_push(vq, elem, written);
> +            virtio_notify(vdev, vq);
> +            g_free(elem);
> +        } else {
>               virtqueue_detach_element(vq, elem, 0);
>               g_free(elem);
>               break;
>           }
> -
> -        iov_cnt = elem->out_num;
> -        iov2 = iov = g_memdup2(elem->out_sg,
> -                               sizeof(struct iovec) * elem->out_num);
> -        s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
> -        iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
> -        if (s != sizeof(ctrl)) {
> -            status = VIRTIO_NET_ERR;
> -        } else if (ctrl.class == VIRTIO_NET_CTRL_RX) {
> -            status = virtio_net_handle_rx_mode(n, ctrl.cmd, iov, iov_cnt);
> -        } else if (ctrl.class == VIRTIO_NET_CTRL_MAC) {
> -            status = virtio_net_handle_mac(n, ctrl.cmd, iov, iov_cnt);
> -        } else if (ctrl.class == VIRTIO_NET_CTRL_VLAN) {
> -            status = virtio_net_handle_vlan_table(n, ctrl.cmd, iov, iov_cnt);
> -        } else if (ctrl.class == VIRTIO_NET_CTRL_ANNOUNCE) {
> -            status = virtio_net_handle_announce(n, ctrl.cmd, iov, iov_cnt);
> -        } else if (ctrl.class == VIRTIO_NET_CTRL_MQ) {
> -            status = virtio_net_handle_mq(n, ctrl.cmd, iov, iov_cnt);
> -        } else if (ctrl.class == VIRTIO_NET_CTRL_GUEST_OFFLOADS) {
> -            status = virtio_net_handle_offloads(n, ctrl.cmd, iov, iov_cnt);
> -        }
> -
> -        s = iov_from_buf(elem->in_sg, elem->in_num, 0, &status, sizeof(status));
> -        assert(s == sizeof(status));
> -
> -        virtqueue_push(vq, elem, sizeof(status));
> -        virtio_notify(vdev, vq);
> -        g_free(iov2);
> -        g_free(elem);
>       }
>   }
>   


