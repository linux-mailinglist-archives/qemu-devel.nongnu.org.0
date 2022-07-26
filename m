Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0A580A19
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 05:47:14 +0200 (CEST)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGBXN-0003MI-0X
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 23:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBUE-0001np-ED
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBUA-000151-Ul
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658807033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8h9sIgX26Ftv5peArEpPtiXWh9oUxK5TF1Yb0cR7PU=;
 b=Vr6l8ZDGWLK0o5ORJaLFilw/t82Mb7GQ8TAfQg6dHBzbbGynZFeejNJ1Pxate4RMeMQXOt
 EnhKBpw1A2rBkB/DWzJEcP1n5NZn6RAxesIWe+FEqP9at+L6SV6fvGFUcss/2sdOojekEn
 TGEd7tept5lqNm3RNLlt6h5Q4yD5xiI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-qZI-J1hnMgeKimyNfsvuiA-1; Mon, 25 Jul 2022 23:43:50 -0400
X-MC-Unique: qZI-J1hnMgeKimyNfsvuiA-1
Received: by mail-pl1-f200.google.com with SMTP id
 m5-20020a170902f64500b0016d313f3ce7so7733175plg.23
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 20:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I8h9sIgX26Ftv5peArEpPtiXWh9oUxK5TF1Yb0cR7PU=;
 b=wbXo9gV51FDQQjJqnb1Pfpu0Q31I63+Xwb4dDnVo5eumisag+m47c5utaWk3tUbAxS
 rpu5b6RNjJYkhhbXW/yPjYmb7YeMrmLR/FAmvKiRp1Nj/A5s3DKZfG5laTC1iqPmgbBA
 TZPn/a7omWmFJBn0r5iZ6VIzr26bDsud5YMtOZL8di0Ci7ZrKrGUwW3drlCrolTNT3AL
 oV5tCeUxL/qg6Q/QXbmforwg7FIb1bm5eTOMPH0OIBe74TMGy3upz0Ke5Ml2SxQUqVT8
 5JIIirJ4M8nGzUaXXAjlcMrARxtIrbX/K0mT9gjH9N2+ChqaPb+5Ffqj3W+C6uywQRhu
 whKQ==
X-Gm-Message-State: AJIora+e4X7iqmEsZhMJMeGJo+TfVLPJ6JnmWP8KFf9oGOsVhzLu4lar
 JTiEbndlvqermwOFHS8x94uX22tCx5aWONFwoeT5BuGcJUgIIIKlV7fskIS9TyMDHxo+66dwLEg
 0zdt+xBhtYIhPk4E=
X-Received: by 2002:a63:f84b:0:b0:416:360f:230d with SMTP id
 v11-20020a63f84b000000b00416360f230dmr13738795pgj.376.1658807029457; 
 Mon, 25 Jul 2022 20:43:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vRx9db8SRNKMO2YNN++3qyYoBNhbd/i7a3QgzedQqVu9GPuILjYB2SxA1pYpyomLsPkOX93Q==
X-Received: by 2002:a63:f84b:0:b0:416:360f:230d with SMTP id
 v11-20020a63f84b000000b00416360f230dmr13738786pgj.376.1658807029186; 
 Mon, 25 Jul 2022 20:43:49 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a170903229100b0016bef6f6903sm10237456plh.72.2022.07.25.20.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 20:43:48 -0700 (PDT)
Message-ID: <b5fb3193-a0a7-88c2-11b0-700a101c642e@redhat.com>
Date: Tue, 26 Jul 2022 11:43:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 07/16] virtio-net: support queue reset
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <c6718441a57198bc22d9861417e5ae69c0a70fdb.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <c6718441a57198bc22d9861417e5ae69c0a70fdb.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> virtio-net implements queue reset. Queued packets in the corresponding
> queue pair are flushed or purged.
>
> Queue reset is currently only implemented for non-vhosts.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/virtio-net.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 7ad948ee7c..8396e21a67 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -531,6 +531,19 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
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
> +    qemu_flush_or_purge_queued_packets(nc->peer, true);
> +    assert(!virtio_net_get_subqueue(nc)->async_tx.elem);


Let's try to reuse this function in virtio_net_reset().


> +}
> +
>   static void virtio_net_reset(VirtIODevice *vdev)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> @@ -741,6 +754,7 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>       }
>   
>       if (!get_vhost_net(nc->peer)) {
> +        virtio_add_feature(&features, VIRTIO_F_RING_RESET);


This breaks migration compatibility.

We probably need:

1) a new command line parameter
2) make it disabled for pre-7.2 machine

Thanks


>           return features;
>       }
>   
> @@ -3766,6 +3780,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
>       vdc->set_features = virtio_net_set_features;
>       vdc->bad_features = virtio_net_bad_features;
>       vdc->reset = virtio_net_reset;
> +    vdc->queue_reset = virtio_net_queue_reset;
>       vdc->set_status = virtio_net_set_status;
>       vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
>       vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;


