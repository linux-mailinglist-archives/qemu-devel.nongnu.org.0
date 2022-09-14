Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6185B7EF2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 04:27:34 +0200 (CEST)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYI7h-0007R4-3g
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 22:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYI5m-0005hf-G2
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYI5k-00042M-Lf
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663122331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJBUZSVlBmwkEuSilE/f9OXJoxB8zS7QSib/biC5lFE=;
 b=KQsxp/1qFKiTFjwjYbhELIoh9eP1jPS7ZHNxbZlQ8ZK4JctgN4U0CM1pvhRhFOjNjswI1F
 2IEom2fPRz7+H76JUEmmSJsuWKFe8C1bpLmui+y21fU/vXzIBJxHvkoZ7cUs8XZUc7hwRQ
 WTyfrepdEfgvRvmb3xz9ZZ3kHRxPGKQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-2zR-0sAXMLigG3iLbpQwaQ-1; Tue, 13 Sep 2022 22:25:30 -0400
X-MC-Unique: 2zR-0sAXMLigG3iLbpQwaQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 y11-20020a17090a390b00b00202a34974dcso4166254pjb.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 19:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mJBUZSVlBmwkEuSilE/f9OXJoxB8zS7QSib/biC5lFE=;
 b=vDKiUkBa7CXsnboOtDa21WxQ9cyXa0VfA8r5Zm01F/9dYg6PXIUOZKSZmqVO2CTO3Q
 rfKrhP2Noj7YCUWWEVSRQnWFzP7laq3JR2ePxXbNgimmtd3M3hGa2ZFTqSlQC4Obs29K
 I8H5oMLqW8U5eCafALwrzjc7LC5RroPMH36mQW/TpsYgGfkq14NWFLc8cUu0Q8lP8vx9
 BvKmCN7QwLG6BbBFkXpRwMItWLCe6bygMAxlUOAJdVWbyj/l8scc+P0mSWOLwsOA++Vw
 pTu50C2iP2S61EVyIVovd69mlfnLGHgDVv5M7/jyznOyhEyOwGxhhG3tPdrzXY6Gpfg8
 PzsA==
X-Gm-Message-State: ACgBeo2bNEAmgKzL12xnnxwsSl62qL6XFqzbmwo6mg8NkqutAwYmY1PF
 oZZXPm9vOOO5Gt9YfZ1+qeKn3ve3gfBTq6TvA60HekxGo5IWlbbi+Rm+0nyXW9gO405Xx/TCBAn
 Wq5KkaYFCGfLa+qc=
X-Received: by 2002:aa7:9e12:0:b0:53e:27d8:b71b with SMTP id
 y18-20020aa79e12000000b0053e27d8b71bmr35515718pfq.46.1663122329372; 
 Tue, 13 Sep 2022 19:25:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4nuaSzRLR4vhWUZayZ2uC3zRmqmUN3MD3Xoad1VBwKNnD6reZLWMbr6yXkM1PBw+s/AmHKeA==
X-Received: by 2002:aa7:9e12:0:b0:53e:27d8:b71b with SMTP id
 y18-20020aa79e12000000b0053e27d8b71bmr35515692pfq.46.1663122329084; 
 Tue, 13 Sep 2022 19:25:29 -0700 (PDT)
Received: from [10.72.13.238] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 k5-20020aa79d05000000b0053725e331a1sm8630240pfp.82.2022.09.13.19.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 19:25:28 -0700 (PDT)
Message-ID: <5abf2d72-4f9e-c192-850e-417a860373d7@redhat.com>
Date: Wed, 14 Sep 2022 10:25:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 13/15] virtio-net: support queue reset
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
 <46d6618a04fb41f1ac1fcec36ee73a52c5d9d4c6.1662916759.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <46d6618a04fb41f1ac1fcec36ee73a52c5d9d4c6.1662916759.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> virtio-net and vhost-kernel implement queue reset.
> Queued packets in the corresponding queue pair are flushed
> or purged.
>
> For virtio-net, userspace datapath will be disabled later in
> __virtio_queue_reset(). It will set addr of vring to 0 and idx to 0.
> Thus, virtio_net_receive() and virtio_net_flush_tx() will not receive
> or send packets.
>
> For vhost-net, the datapath will be disabled in vhost_net_virtqueue_reset().
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 27b59c0ad6..d774a3e652 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -540,6 +540,23 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
>       return info;
>   }
>   
> +static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtIONet *n = VIRTIO_NET(vdev);
> +    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
> +
> +    if (!nc->peer) {
> +        return;
> +    }
> +
> +    if (get_vhost_net(nc->peer) &&
> +        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
> +        vhost_net_virtqueue_reset(vdev, nc, queue_index);
> +    }
> +
> +    flush_or_purge_queued_packets(nc);
> +}
> +
>   static void virtio_net_reset(VirtIODevice *vdev)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> @@ -3784,6 +3801,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
>       vdc->set_features = virtio_net_set_features;
>       vdc->bad_features = virtio_net_bad_features;
>       vdc->reset = virtio_net_reset;
> +    vdc->queue_reset = virtio_net_queue_reset;
>       vdc->set_status = virtio_net_set_status;
>       vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
>       vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;


