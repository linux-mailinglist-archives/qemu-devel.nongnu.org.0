Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8205B7F16
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 04:42:04 +0200 (CEST)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYILi-0005DF-T6
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 22:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIIf-0002s1-Mz
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIIb-0005wf-Iy
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663123128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lPdsTfpHG68/95FZzDes7fj2OdjCDim1uw2tfetd9s=;
 b=EWe0ARg6sjoqMyEg/RNtgwsFb7cSb4dhHWVg2g60c03Ty5RZ8jyZSQqSiTLAL0z97bbwLE
 Jp6E7uuzpe8elIHAbpZk+Uq+rIJ5lUwGQxl6qO/0axUp14pypxo6FoFguURpjJ1Mvx1vKb
 dxweTnBr7666Q81YHsT4riucBaND40s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-XxMt-qk8OkmjsT8WOdXkaw-1; Tue, 13 Sep 2022 22:38:47 -0400
X-MC-Unique: XxMt-qk8OkmjsT8WOdXkaw-1
Received: by mail-pj1-f69.google.com with SMTP id
 v9-20020a17090a4ec900b00200bba6b0a1so5335136pjl.5
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 19:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5lPdsTfpHG68/95FZzDes7fj2OdjCDim1uw2tfetd9s=;
 b=o4hOq5u9qLYse3xmog6WE1FXWXX143q1mnGxoEp66PZl46+6gm5Ebb2m0uiFOLm1JJ
 2G0R4Y2sKU93eqFCLLtuWQakRBBXg641SRBtfXiQjSQhz6UqYruNPG+f5mgL/k+Lc5Xe
 LK7LjbvJt6Ro001bbwXp0rW/JVCyJrsQ+PwR31JTXuMLgJa4JzHXGLfcHJrXDXoIyWDH
 ZUpUM7fkgKNJhmG9CtXU3adhNL0D1nOjoATvhJR4G9tdxCxLgg4Wiyq/v9jKLn3u3GWO
 UfVsanpX3WLQBW551PnMaEODYOxTLk8w62w03qz7vcde05bk1sHMaj64sxuoTePaTn41
 LoJg==
X-Gm-Message-State: ACgBeo36DnCzpkUxf6pTmpGHcFxgJJakaExJcR6K+BdvSt5sgvjW2x/W
 beJQYPgeuDKxjzOOSXSzn5xEPPf49HzTkI1/NAq/h2rhAz1AhlAI0nyH9bG/8R+VWxqj2KSXz8X
 nurMDuMs/fcW0ZFw=
X-Received: by 2002:a05:6a00:24d4:b0:541:11bd:dd24 with SMTP id
 d20-20020a056a0024d400b0054111bddd24mr21406995pfv.66.1663123124596; 
 Tue, 13 Sep 2022 19:38:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4NxbQtQqzNc6BdoPlcILWfNrfyuLNHz4TFV7hLgaxF/jaNV6JqdcOQwAyI6cPg/yxI5psMNw==
X-Received: by 2002:a05:6a00:24d4:b0:541:11bd:dd24 with SMTP id
 d20-20020a056a0024d400b0054111bddd24mr21406970pfv.66.1663123124293; 
 Tue, 13 Sep 2022 19:38:44 -0700 (PDT)
Received: from [10.72.13.238] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 r3-20020aa79623000000b0053e57b0a233sm8624937pfg.164.2022.09.13.19.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 19:38:43 -0700 (PDT)
Message-ID: <e32d887f-3118-f027-1cfa-08576505ec79@redhat.com>
Date: Wed, 14 Sep 2022 10:38:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 14/15] virtio-net: support queue_enable
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
 <43fe5810e5587e068b0b3fb62f6e15975cd75f30.1662916759.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <43fe5810e5587e068b0b3fb62f6e15975cd75f30.1662916759.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.628, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/9/12 01:22, Kangjie Xu 写道:
> Support queue_enable in vhost-kernel scenario. It can be called when
> a vq reset operation has been performed and the vq is restared.
>
> It should be noted that we can restart the vq when the vhost has
> already started. When launching a new vhost device, the vhost is not
> started and all vqs are not initalized until VIRTIO_PCI_COMMON_STATUS
> is written. Thus, we should use vhost_started to differentiate the
> two cases: vq reset and device start.
>
> Currently it only supports vhost-kernel.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index d774a3e652..7817206596 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -557,6 +557,26 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>       flush_or_purge_queued_packets(nc);
>   }
>   
> +static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtIONet *n = VIRTIO_NET(vdev);
> +    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
> +    int r;
> +
> +    if (!nc->peer || !vdev->vhost_started) {
> +        return;
> +    }
> +
> +    if (get_vhost_net(nc->peer) &&
> +        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
> +        r = vhost_net_virtqueue_restart(vdev, nc, queue_index);
> +        if (r < 0) {
> +            error_report("unable to restart vhost net virtqueue: %d, "
> +                            "when resetting the queue", queue_index);
> +        }
> +    }
> +}
> +
>   static void virtio_net_reset(VirtIODevice *vdev)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> @@ -3802,6 +3822,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
>       vdc->bad_features = virtio_net_bad_features;
>       vdc->reset = virtio_net_reset;
>       vdc->queue_reset = virtio_net_queue_reset;
> +    vdc->queue_enable = virtio_net_queue_enable;
>       vdc->set_status = virtio_net_set_status;
>       vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
>       vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;


