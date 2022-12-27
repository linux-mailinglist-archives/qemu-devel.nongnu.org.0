Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B153656D1A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 17:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADBH-0007Aq-TR; Tue, 27 Dec 2022 11:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pADBE-00077W-IC
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 11:51:56 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pADB9-00012j-IN
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 11:51:56 -0500
Received: by mail-ed1-x534.google.com with SMTP id b88so12444511edf.6
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 08:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xvFrpX+Js2OAy+uLa6QGZ8OxaXl2pMB247UjCuv/XjE=;
 b=C10syAeDxxwGkA4rT/kndUPBy6gkpj5hESqDmAjmHL8h1v9o4kqiwVe7ju3m5gFbj5
 8HB5KKg6P1tewIGrOQAEajtbpfi9F4iNb6o7IuUwymPNrMVAMrtJ2kAHtPpJg5ezGh5D
 UDl2yT0Vp3y/IBn2oCTquLTq5PF4j+4tzEZYoe9IqlI2E16VjTiWFo3yUG9pj5D6Pbg9
 zj9iGZgmc9e4YlLgq5Aw/4PdFTGKvCBrMUjwZ3nQePfbfaJl9ikOeb0A3L+gW7pgEcau
 SAqt6bQNQ5P2U+6mOYuQDine3K2+Cl4EHTz1VRjbx4GJNBlC1VIWalXrKVlBUeGPcsvn
 jaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xvFrpX+Js2OAy+uLa6QGZ8OxaXl2pMB247UjCuv/XjE=;
 b=LXWPBdEwE6BVVsER/TRDgoshv+wQpd9zRTVU/jiVMQZZH0OqxFwEjPfzYhTpCrA32i
 veU0tGgiAqg65nSQ350E0dwNfNQEQbUHdxqec9G1xM0ETlFahpjsXAKH/B33HwfWno3z
 oD/50xqwpPgn+wOwjpStxeTts4iRJsnUzvdQukxS/CCf23+f13082SNLf8l4+uKTYNN4
 gAsGtg+l8lDJJG3ba8odY+zhQAxT+2j7iDCQcdOHOd1EO7trWR+D3PUg68s5p3k/52nI
 yvoAsSN9S96NGzhElPXnj8bTD7nNxC7sRo31D0iuymijySNy2WUcoD1AHvex4ynH4Ymb
 cN2w==
X-Gm-Message-State: AFqh2koDEz0/7R8S5sNJWy0JgXCz6PzDz8+ULoQ33kKkMPX9rznl5VbN
 FY7zeAHVA736N5j2Gbq1gSZFpw==
X-Google-Smtp-Source: AMrXdXubNBDchvoLh+sRIl84sgjWao2+USo9leHnUHeUrc3lYCNN6D0IvgLoS9VRv54JEgkJf6nhYQ==
X-Received: by 2002:a05:6402:448a:b0:481:9219:f603 with SMTP id
 er10-20020a056402448a00b004819219f603mr13035494edb.28.1672159909965; 
 Tue, 27 Dec 2022 08:51:49 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h25-20020aa7de19000000b00463b9d47e1fsm6043211edv.71.2022.12.27.08.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 08:51:49 -0800 (PST)
Message-ID: <3cdfb4fc-70a9-db51-ac49-4ba984a3045a@linaro.org>
Date: Tue, 27 Dec 2022 17:51:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/3] vdpa: commit all host notifier MRs in a single MR
 transaction
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 mst@redhat.com, jasowang@redhat.com, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Cc: cohuck@redhat.com, sgarzare@redhat.com, pbonzini@redhat.com,
 arei.gonglei@huawei.com, yechuan@huawei.com, huangzhichao@huawei.com,
 qemu-devel@nongnu.org
References: <20221227072015.3134-1-longpeng2@huawei.com>
 <20221227072015.3134-4-longpeng2@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221227072015.3134-4-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/12/22 08:20, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> This allows the vhost-vdpa device to batch the setup of all its MRs of
> host notifiers.
> 
> This significantly reduces the device starting time, e.g. the time spend
> on setup the host notifier MRs reduce from 423ms to 32ms for a VM with
> 64 vCPUs and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device).
> 
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>   hw/virtio/vhost-vdpa.c | 25 +++++++++++++++++++------
>   1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index fd0c33b0e1..870265188a 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -512,9 +512,18 @@ static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
>   {
>       int i;
>   
> +    /*
> +     * Pack all the changes to the memory regions in a single
> +     * transaction to avoid a few updating of the address space
> +     * topology.
> +     */
> +    memory_region_transaction_begin();
> +
>       for (i = dev->vq_index; i < dev->vq_index + n; i++) {
>           vhost_vdpa_host_notifier_uninit(dev, i);
>       }
> +
> +    memory_region_transaction_commit();
>   }

Instead of optimizing one frontend, I wonder if we shouldn't expose
a 'bool memory_region_transaction_in_progress()' helper in memory.c,
and in virtio_queue_set_host_notifier_mr() backend, assert we are
within a transaction. That way we'd optimize all virtio frontends.

