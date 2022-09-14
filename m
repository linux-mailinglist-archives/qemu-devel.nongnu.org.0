Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919345B805A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:39:10 +0200 (CEST)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYKB3-00025q-LF
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYK95-0007fZ-4S
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYK93-0005A8-FP
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663130224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8pK50LSZ5r2XYrLPm6m9NQt4blToF3wccS4gUF7We4=;
 b=RL90N0W+DBj78ubwv2db+P6qrTGyEMoMvefIgzzOTEUfP2bCmQzGFc9REhZhjFLEgQPJ4D
 vAEdPNfOWyw6LVe+t+pAI1745meJFVgfBjQfV5t5Ag/vJhMz/6mDpHSitc1qjBmtSC+FbC
 wKK4WhuYR9CdD2W/qW2wqQoZtsL+MIs=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-7Go8v8-MOWisz-_6c36oFQ-1; Wed, 14 Sep 2022 00:37:03 -0400
X-MC-Unique: 7Go8v8-MOWisz-_6c36oFQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 d133-20020a1fb48b000000b003a2621cc912so1903584vkf.1
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 21:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=N8pK50LSZ5r2XYrLPm6m9NQt4blToF3wccS4gUF7We4=;
 b=RVTujWTqZ9XLkfzuCwPsee4fIKGjWQMJhlLsPfp8jxu4ahWZorOLy5qRTPfPyUa4h6
 Q3aibN95TVokP3lCLMa1ebraGn4BsgRA/IxilFuRGicYEteUMQuaQxG7Bz1hdwgAoazy
 2glDSEI3+tD5HAcLpdJXGGD62AJGcDPg3grbsDOfRBr7Q/cFwvy4bF4+2+xos2Mlq5Oj
 7UyROCVIawqvuTgo4rj4IPueFP19bHeSlsE2FSHByDbv+7AtCwGjQMz2rYcYeLyYk0oy
 038vXf0Zu3I0alkW4lOcP929cXWxW4VfEmLG83wXrdXXIE3fCMK3T+NUTv4FDAoQxAI3
 xB5Q==
X-Gm-Message-State: ACgBeo0YnLrZnw1KnFxLJfBOiI9/BiZ5mmQhcw26YTXs6HuGE2gKDsof
 i2EAyf70nXpl3onmNkcjoyU1VidTyKGmObS9UPx5v8XQZcYi4lskPcLWWhTb1PHKWauCVYBkIWa
 8BF1DatecBTBlVzSHJMdJDG2P1327mlM=
X-Received: by 2002:ab0:238e:0:b0:390:f466:1c11 with SMTP id
 b14-20020ab0238e000000b00390f4661c11mr11960938uan.15.1663130222522; 
 Tue, 13 Sep 2022 21:37:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR76/ZNxPlfVcBQQMRoeHhs0vYoTJ13IaC67ZKgO0DqbAbF41xmTGua3UGPcWxXTD/E/NMbBv+SQXT3H8kAtD58=
X-Received: by 2002:ab0:238e:0:b0:390:f466:1c11 with SMTP id
 b14-20020ab0238e000000b00390f4661c11mr11960931uan.15.1663130222315; Tue, 13
 Sep 2022 21:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
 <20220914042055.61939-16-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20220914042055.61939-16-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 14 Sep 2022 12:36:51 +0800
Message-ID: <CACGkMEtRM1UyhPT5Ap35VDYMUVU7crfNzY5NoDNR+tRKP55W3w@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] vhost: vhost-kernel: enable vq reset feature
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Kangjie Xu <kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 14, 2022 at 12:21 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>
> Add virtqueue reset feature for vhost-kernel.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/vhost_net.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d2926e2ed6..53b2fac4f6 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -47,6 +47,7 @@ static const int kernel_feature_bits[] = {
>      VIRTIO_NET_F_MTU,
>      VIRTIO_F_IOMMU_PLATFORM,
>      VIRTIO_F_RING_PACKED,
> +    VIRTIO_F_RING_RESET,
>      VIRTIO_NET_F_HASH_REPORT,
>      VHOST_INVALID_FEATURE_BIT
>  };
> --
> 2.32.0.3.g01195cf9f
>


