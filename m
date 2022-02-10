Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B0B4B0D3E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:12:22 +0100 (CET)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI8JC-0000Dk-2i
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI8DF-00058K-6T
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:06:14 -0500
Received: from [2607:f8b0:4864:20::62c] (port=47041
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI8DD-0004H1-A2
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:06:12 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u12so1616514plf.13
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zdkc45bxpY3VYTw1OmfWzTxNF5HEjRomir2DQYo1Lx4=;
 b=TxZHunGdAwJNWyNA9YIddCnamdxrr74iBmnj8w9GsHHcnPsVcY6fl7pCNaYrGIcLlY
 FxLxwR8xRcnFR5E3J75L4GYzyS317fnNGGRn5EQB7ctNTgN8/Xe3HuFywQQIYzlNlOeB
 MdARpje7FIaOZzC13XyIkqoPZ8lUZqHNQChq/5RM7W2XVqdHfqeYFBFTGB0PZ/NwNCTo
 JThaIeg1b5/JxNT0wp6n+iY3mmIeAfb6tAtg0n0/DXC8+wYyVuXP0rdhtj9nI+xwdS4t
 aPsJBlLB0sx19/2ctKbh/ydtxi4eSHc36e/TYfrVFMBFPycirM2v0G0p2jlFFPOH9r45
 JOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zdkc45bxpY3VYTw1OmfWzTxNF5HEjRomir2DQYo1Lx4=;
 b=qJz8qKGX7JjPpcwg6OOBt1/alvv2lDWT3A4ZzQlH+vrUX2Rp66OEPmemSNlMLkQmci
 +JeLOzOwV39Hs+OQfCZFqrDmUKWWpQyXpHXBwed+LlTkQ1gwXWvHtCHWaAlpPAVFPe4i
 PtZRMMW6ac6YNuInn/5vtqrGWAhvAHW2Ac5DzQpiLnQeuve2gNTG6Fm2FNkk7omjz9ky
 stMoWsyT3KfLVE0aRx0DNMAp8Lm2wAZd0lH93h9ymBoYFGOV7H04yRkI/FvcMm7eSawn
 77he2yr5ysHNtA23a/ulAft3sfEXEilgQcldMS/g22WkimgfUm4bfx9bROEm5iGDgEGa
 3lHw==
X-Gm-Message-State: AOAM53210qQCJO7HY4i0J/OF66BUV9OBdo5BdBh0Hw+BMEyGHyy44KRA
 BhDIeGcmDHASfIxISS2xbMM=
X-Google-Smtp-Source: ABdhPJzpc628dNRXYhsutTikrzymW4qL4QNMd83tr8qXMbzisrmp3hhdBtCJG3xYD947l2zSFUreiw==
X-Received: by 2002:a17:903:2309:: with SMTP id d9mr329993plh.74.1644494769751; 
 Thu, 10 Feb 2022 04:06:09 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s139sm8773867pfc.152.2022.02.10.04.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 04:06:09 -0800 (PST)
Message-ID: <e8d5554f-d78d-7711-355b-8795559e6075@amsat.org>
Date: Thu, 10 Feb 2022 13:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] vhost: fix repeated memory unmap in error paths
Content-Language: en-US
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru
References: <164449358353.2210343.10106072767435805975.stgit@dynamic-vpn.dhcp.yndx.net>
In-Reply-To: <164449358353.2210343.10106072767435805975.stgit@dynamic-vpn.dhcp.yndx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 10/2/22 12:46, Konstantin Khlebnikov wrote:
> Fuzzing found that on some error paths vhost_memory_unmap() is called twice or
> for NULL address. Let's reset pointers after unmap and ingnore unmap for NULL.
> 
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> ---
>   hw/virtio/vhost.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 7b03efccec..4e5d5f2ea4 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -335,7 +335,7 @@ static void vhost_memory_unmap(struct vhost_dev *dev, void *buffer,
>                                  hwaddr len, int is_write,
>                                  hwaddr access_len)
>   {
> -    if (!vhost_dev_has_iommu(dev)) {
> +    if (buffer && !vhost_dev_has_iommu(dev)) {

Shouldn't we simply add an "assert(buffer);" check here instead?

>           cpu_physical_memory_unmap(buffer, len, is_write, access_len);
>       }
>   }
> @@ -1191,6 +1191,7 @@ fail_alloc_avail:
>       vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
>                          0, 0);
>   fail_alloc_desc:
> +    vq->used = vq->avail = vq->desc = NULL;
>       return r;
>   }
>   
> @@ -1238,6 +1239,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
>                          0, virtio_queue_get_avail_size(vdev, idx));
>       vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
>                          0, virtio_queue_get_desc_size(vdev, idx));
> +    vq->used = vq->avail = vq->desc = NULL;
>   }

This part is OK.

