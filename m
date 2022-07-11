Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A556FAC4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:21:47 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApbu-0002bI-Uk
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApZq-0000iU-Dd
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApZn-0005pU-SJ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657531175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tC0eGTO3zKPHqcrDLRp/b0jTlg+dO+r+uI5rYo2skhU=;
 b=YpVBDvorC0Fqi5o4GB2/Laaj6NjofLVx3uNLCfJUVyiEzeMtB1zpkvMLd/YrGOPOecePsf
 lzb4CYyo3S4LJITbXuK9KU6LNQy9VGOmfuQLP+H+1wO3w5cxHxcVtskVQ6g6WdBmhen/SK
 zbUt6s5Ed36NkrQdUE8LR/HInurref8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-VpJiQrq3MESAEc1rUB3eNg-1; Mon, 11 Jul 2022 05:19:34 -0400
X-MC-Unique: VpJiQrq3MESAEc1rUB3eNg-1
Received: by mail-pj1-f69.google.com with SMTP id
 g2-20020a17090a128200b001ef7dea7928so3245101pja.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tC0eGTO3zKPHqcrDLRp/b0jTlg+dO+r+uI5rYo2skhU=;
 b=4P58+zdv0sLZVrz48KvWPKd55VToixfmfC47af060lmzmc2guRCS1gq5yXiXo7BM6i
 1RAxzgUDTIqtFPUCzlS+ZDYqg/J4SCrsgzzq0Ek/+VY+70R9gE0XEDVNItPnmSKZQbyr
 pVSe//sSYqPfmnGnoyFIYW1/Qvlf3mW7PdH+BDmccZ2O9XOO0LG93a40RLZXhO2NZl+F
 UGhtOBZQh9t99hbKTCEa9kLnVjLPXt5qKqp5glAvCH9iE49C1hM8NL6xf+P3xciS6CCM
 IrDc33fmVrqMcKpsUDY0W6T/gU3PpYaFqo5Nima3zjlXbdTAPMvvr8zrVkMAwrKrUtjf
 Gdeg==
X-Gm-Message-State: AJIora8LJwloiE8mWNz+3NSEYTRKmuvMd6LKZVgdUwdcRpv249Z3oy5F
 dZFCEEEW0bevuemvwFhcXoYie4Kfj+pv4Em7RzU/xXrZvVdoHZcru096JPB5lni5mMzB1FvUHOO
 iRMec0UGnP/nahII=
X-Received: by 2002:a17:902:e80e:b0:16c:3257:1ca5 with SMTP id
 u14-20020a170902e80e00b0016c32571ca5mr11722451plg.161.1657531172910; 
 Mon, 11 Jul 2022 02:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHyhNkA0Y80A/h+YawRYMhsewFN0PRiK1AMwkRKfu1DP2IKBGm7Kb6OsTMT6ColHqJgfOo6w==
X-Received: by 2002:a17:902:e80e:b0:16c:3257:1ca5 with SMTP id
 u14-20020a170902e80e00b0016c32571ca5mr11722421plg.161.1657531172640; 
 Mon, 11 Jul 2022 02:19:32 -0700 (PDT)
Received: from [10.72.13.128] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 k10-20020aa7998a000000b0052ab47dd0d5sm4237749pfh.63.2022.07.11.02.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:19:32 -0700 (PDT)
Message-ID: <cac07706-7753-c3bd-e3f7-5ef48e190f1d@redhat.com>
Date: Mon, 11 Jul 2022 17:19:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 14/23] vhost: add vhost_svq_poll
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-15-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-15-eperezma@redhat.com>
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


在 2022/7/7 02:39, Eugenio Pérez 写道:
> It allows the Shadow Control VirtQueue to wait the device to use the commands
> that restore the net device state after a live migration.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  1 +
>   hw/virtio/vhost-shadow-virtqueue.c | 54 ++++++++++++++++++++++++++++--
>   2 files changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index d01d2370db..c8668fbdd6 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -100,6 +100,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
>                            const VirtQueueElement *elem, uint32_t len);
>   int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
>                        size_t out_num, size_t in_num, void *opaque);
> +ssize_t vhost_svq_poll(VhostShadowVirtqueue *svq);
>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>   void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
>   void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index bd9e34b413..ed7f1d0bc9 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -10,6 +10,8 @@
>   #include "qemu/osdep.h"
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   
> +#include <glib/gpoll.h>
> +
>   #include "qemu/error-report.h"
>   #include "qapi/error.h"
>   #include "qemu/main-loop.h"
> @@ -490,10 +492,11 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
>       }
>   }
>   
> -static void vhost_svq_flush(VhostShadowVirtqueue *svq,
> -                            bool check_for_avail_queue)
> +static size_t vhost_svq_flush(VhostShadowVirtqueue *svq,
> +                              bool check_for_avail_queue)
>   {
>       VirtQueue *vq = svq->vq;
> +    size_t ret = 0;
>   
>       /* Forward as many used buffers as possible. */
>       do {
> @@ -510,7 +513,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>                            "More than %u used buffers obtained in a %u size SVQ",
>                            i, svq->vring.num);
>                   virtqueue_flush(vq, svq->vring.num);
> -                return;
> +                return ret;
>               }
>   
>               svq_elem = vhost_svq_get_buf(svq, &len);
> @@ -520,6 +523,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>   
>               elem = g_steal_pointer(&svq_elem.opaque);
>               virtqueue_fill(vq, elem, len, i++);
> +            ret++;
>           }
>   
>           virtqueue_flush(vq, i);
> @@ -533,6 +537,50 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>               vhost_handle_guest_kick(svq);
>           }
>       } while (!vhost_svq_enable_notification(svq));
> +
> +    return ret;
> +}
> +
> +/**
> + * Poll the SVQ for device used buffers.
> + *
> + * This function race with main event loop SVQ polling, so extra
> + * synchronization is needed.
> + *
> + * Return the number of descriptors read from the device.
> + */
> +ssize_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> +{
> +    int fd = event_notifier_get_fd(&svq->hdev_call);
> +    GPollFD poll_fd = {
> +        .fd = fd,
> +        .events = G_IO_IN,
> +    };
> +    assert(fd >= 0);
> +    int r = g_poll(&poll_fd, 1, -1);


Any reason we can't simply (busy) polling the used ring here? It might 
help to reduce the latency (and it is what kernel driver uses).

Thanks


> +
> +    if (unlikely(r < 0)) {
> +        error_report("Cannot poll device call fd "G_POLLFD_FORMAT": (%d) %s",
> +                     poll_fd.fd, errno, g_strerror(errno));
> +        return -errno;
> +    }
> +
> +    if (r == 0) {
> +        return 0;
> +    }
> +
> +    if (unlikely(poll_fd.revents & ~(G_IO_IN))) {
> +        error_report(
> +            "Error polling device call fd "G_POLLFD_FORMAT": revents=%d",
> +            poll_fd.fd, poll_fd.revents);
> +        return -1;
> +    }
> +
> +    /*
> +     * Max return value of vhost_svq_flush is (uint16_t)-1, so it's safe to
> +     * convert to ssize_t.
> +     */
> +    return vhost_svq_flush(svq, false);
>   }
>   
>   /**


