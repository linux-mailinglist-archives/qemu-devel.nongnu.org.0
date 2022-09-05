Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9D5ACD9F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:28:14 +0200 (CEST)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV7Si-00073R-4B
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV7PR-0004yH-Hn
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV7PN-00046G-Uh
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662366280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHurEbVzOQ7tg/2WcSS5BQzWsOYQNjRsuTGRU9lTk8Y=;
 b=K6RiNBWwAKGZlEGgIZheIRiMSPXC1HUboinHKiE7Oz1mgE0UG6+MsJFU3i03GNXuxIoFIK
 wB+Nj3G2s8njPHxaCvknicazoR+hXPMg72MDmNiRf3ZcbneGDB7o4GNMAtq03YJsGMFyv2
 a3v+bW4NjIK4LGXfso0jYC5x7o8CtYM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-EouZbZqYMji88YHzUF93WQ-1; Mon, 05 Sep 2022 04:24:37 -0400
X-MC-Unique: EouZbZqYMji88YHzUF93WQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 k16-20020a635a50000000b0042986056df6so4107979pgm.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 01:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KHurEbVzOQ7tg/2WcSS5BQzWsOYQNjRsuTGRU9lTk8Y=;
 b=I939lfMWTNI15GCHVDdd7m/LprHmt/Bzx96skoTeoYnKRUV8x7FLoYL1lLxmR0NNhb
 BAlQtTv9vLK0LrxVRFnPc5O1N2hAKO3DB4ggOne6q/r8ABjSzYQfLbX1n67ml85hVJxd
 oKC73DQoSesn688UcOVu/+1vodtUF140eBTJ6UMm72bNCb5Ie+cEfxsjQ+k8YKAlxLdK
 l1GK8r0bAboexmwRgot74RB9z1epMJb6zZboTjkFqkKUG5bCw0zsVMLpAisETQJktyRx
 Z2YYz0uteEUTtPBpYETTc4SRw3lMqHdProBzdkY57zslZSt+zyh2whIp4UElATuR3yJM
 PQYg==
X-Gm-Message-State: ACgBeo1FAt53QwlqvEauw12+JyQs5R3AAalNSDdIQFpI1ATH21KYt1mc
 jTihHrqq5HzmM5M8l6lPu+iIzvMcTR6gSNA4zkxW3vdDvAqYKUWZeQKCKH3c5gODBQ3IdhyvnAk
 k5A9cFjON5a3nznE=
X-Received: by 2002:a17:902:f641:b0:172:9642:1bf1 with SMTP id
 m1-20020a170902f64100b0017296421bf1mr48537379plg.36.1662366276925; 
 Mon, 05 Sep 2022 01:24:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6g/FW8P3knNELp6um9lm3KSW4+kl3f2ZpOj+rGpY+B44ntVNy6jG38FfPJHIZZYOj2p2sxdg==
X-Received: by 2002:a17:902:f641:b0:172:9642:1bf1 with SMTP id
 m1-20020a170902f64100b0017296421bf1mr48537358plg.36.1662366276680; 
 Mon, 05 Sep 2022 01:24:36 -0700 (PDT)
Received: from [10.72.13.239] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a170902e80500b00173164792aasm1364730plg.127.2022.09.05.01.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 01:24:35 -0700 (PDT)
Message-ID: <db9c8bcd-01f0-d9de-18f6-63f03a00e830@redhat.com>
Date: Mon, 5 Sep 2022 16:24:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 11/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <6c20c0a02ed0e08565bf3692cef476ba52332720.1661414345.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <6c20c0a02ed0e08565bf3692cef476ba52332720.1661414345.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/8/25 16:08, Kangjie Xu 写道:
> Introduce vhost_net_virtqueue_restart(), which can restart the
> specific virtqueue when the vhost net started running before.
> If it fails to restart the virtqueue, the device will be stopped.
>
> Here we do not reuse vhost_net_start_one() or vhost_dev_start()
> because they work at queue pair level. The mem table and features
> do not change, so we can call the vhost_virtqueue_start() to
> restart a specific queue.
>
> This patch only considers the case of vhost-kernel, when
> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/vhost_net.c      | 52 +++++++++++++++++++++++++++++++++++++++++
>   include/net/vhost_net.h |  2 ++
>   2 files changed, 54 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index be51be98b3..0716f6cd96 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -536,3 +536,55 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>   
>       vhost_virtqueue_unmap(&net->dev, vdev, net->dev.vqs + idx, idx);
>   }
> +
> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
> +                                int vq_index)
> +{
> +    VHostNetState *net = get_vhost_net(nc->peer);
> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
> +    struct vhost_vring_file file = { };
> +    int idx, r;
> +
> +    if (!net->dev.started) {
> +        return 0;
> +    }


Should we return error in this case?

Thanks


> +
> +    /* should only be called after backend is connected */
> +    assert(vhost_ops);
> +
> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> +
> +    r = vhost_virtqueue_start(&net->dev,
> +                              vdev,
> +                              net->dev.vqs + idx,
> +                              net->dev.vq_index + idx);
> +    if (r < 0) {
> +        goto err_start;
> +    }
> +
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
> +        file.index = idx;
> +        file.fd = net->backend;
> +        r = vhost_net_set_backend(&net->dev, &file);
> +        if (r < 0) {
> +            r = -errno;
> +            goto err_start;
> +        }
> +    }
> +
> +    return 0;
> +
> +err_start:
> +    error_report("Error when restarting the queue.");
> +
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
> +        file.fd = -1;
> +        file.index = idx;
> +        int r = vhost_net_set_backend(&net->dev, &file);
> +        assert(r >= 0);
> +    }
> +
> +    vhost_dev_stop(&net->dev, vdev);
> +
> +    return r;
> +}
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 85d85a4957..40b9a40074 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -50,4 +50,6 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>   
>   void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>                                  int vq_index);
> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
> +                                int vq_index);
>   #endif


