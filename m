Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066ED6BAA24
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 08:56:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcLye-0007DA-50; Wed, 15 Mar 2023 03:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcLyZ-0007Ao-HW
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:55:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcLyV-0005SF-Va
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:55:10 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 az3-20020a05600c600300b003ed2920d585so497362wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678866905;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xZ/CB7ldh9+bdraz4Dec7RPY+CD7Jp9gUr0reyIzv3k=;
 b=l0f1bMbZietz8IW5p+BmHNU6Gb+oiqQyTVlm5KWO3DDoNBOSFGBwdmUr1sme7+Tuxj
 1MDnynwdDNBxZqc5IV31bLKe0TJEdD/uk11YweVq4htSWkCglM9/QzAxjLjTa4a4JNrF
 /QRnYaulEp6R6C4DJXUZWgBRPF8uBaGuR61iqhsurEQjhjTWF0/qESxW0Zx1qv7l4Dpg
 tsat6Ndasvcq33nR0WJUDPRmBioJbie2ybbdVXwlshTheAsAmbMBQMrmdmWGxpYcv1lD
 E3gcoRO29RI5xz8vXMhjBXiv1EuUHlpWd1oVDoie2VPEgkrXaW2ifs6Q2L3h8sFBPCaj
 jXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678866905;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xZ/CB7ldh9+bdraz4Dec7RPY+CD7Jp9gUr0reyIzv3k=;
 b=xzAx6Eb/A45Q6VBkDdj3ECqcBZ1J6z0ZZjhLy4cHEfmtZc9h4FURCkeA0lPFm2Ofej
 5LtNz1eJW91jd9U7HoQJDPMySJYw9/EVIORqAKSH30gVRh3yFnqYpV+qjmZ7Fjl7sNvB
 k8aKcFG6FQJJ3DkmN4Pe5vXeGnMy7qKafoqBVU7kG2H3f5sQjZTre+E26MHtHaS79L75
 eAijbVxTZ4UjWAVWBFrt1IbXrTfI7x/rk8gej7yfKTiylt7IAeScQmEV1DAojFiHX8Me
 JrEwErWRGVJm7pq9FGnP6HafU9LeaU0yccr4wOYFx74+HMSRLmtiCWwA1G266JmlmW6A
 jdPA==
X-Gm-Message-State: AO0yUKXbuEx1AsNMuC/EiKn7oHN4dWFtpMvmNCgGkfFFPVNMRosFGQkP
 9HZsQJ5Voof+AA3qdz57EtiWlw==
X-Google-Smtp-Source: AK7set+c0N/IP3BU0L93ChYp5TnLbd6lstIXUJuvZCU22rsWitt83Idi6LpB4Ury8zpE0xFi0Cqq5A==
X-Received: by 2002:a05:600c:3595:b0:3ed:2a91:3bc9 with SMTP id
 p21-20020a05600c359500b003ed2a913bc9mr5705257wmq.15.1678866905154; 
 Wed, 15 Mar 2023 00:55:05 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y25-20020a1c4b19000000b003ed2a3eab71sm962495wma.31.2023.03.15.00.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 00:55:04 -0700 (PDT)
Message-ID: <81373d19-2fc6-3914-07d9-ed5c0ea72d63@linaro.org>
Date: Wed, 15 Mar 2023 08:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] exec/memory: Fix kernel-doc warning
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20230315072552.47117-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230315072552.47117-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 15/3/23 08:25, Bernhard Beschow wrote:
> During build the kernel-doc script complains about the following issue:
> 
>    src/docs/../include/exec/memory.h:1741: warning: Function parameter or member 'n' not described in 'memory_region_unmap_iommu_notifier_range'
>    src/docs/../include/exec/memory.h:1741: warning: Excess function parameter 'notifier' description in 'memory_region_unmap_iommu_notifier_range'
> 
> Settle on "notifier" for consistency with other memory functions.
> 
> Fixes: 7caebbf9ea53
>         ("memory: introduce memory_region_unmap_iommu_notifier_range()")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/exec/memory.h | 2 +-
>   softmmu/memory.c      | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 6fa0b071f0..15ade918ba 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>    *
>    * @notifier: the notifier to be notified
>    */
> -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);

This is ...:
https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.bennee@linaro.org/

>   /**
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 4699ba55ec..5305aca7ca 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1996,17 +1996,17 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>       }
>   }
>   
> -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n)
> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier)
>   {
>       IOMMUTLBEvent event;
>   
>       event.type = IOMMU_NOTIFIER_UNMAP;
>       event.entry.target_as = &address_space_memory;
> -    event.entry.iova = n->start;
> +    event.entry.iova = notifier->start;
>       event.entry.perm = IOMMU_NONE;
> -    event.entry.addr_mask = n->end - n->start;
> +    event.entry.addr_mask = notifier->end - notifier->start;
>   
> -    memory_region_notify_iommu_one(n, &event);
> +    memory_region_notify_iommu_one(notifier, &event);
>   }

... but your patch matches the implementation with the declaration, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Since you are looking at this, maybe you could also have a look at:
https://lore.kernel.org/qemu-devel/20230314114431.1096972-1-peter.maydell@linaro.org/

