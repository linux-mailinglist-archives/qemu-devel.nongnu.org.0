Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD26B7172
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:47:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdoT-0003KT-No; Mon, 13 Mar 2023 04:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbdoQ-0003KG-RX
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:45:46 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbdoO-0004Ss-BH
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:45:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i9so1470403wrp.3
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678697142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wIVlXXLvFujOYI1CdHdCb7y59zSvcbA34QWAmft3GhA=;
 b=gOEcXlfuWYuefEQ4VR7XD3RgjTGy3w5hSpLKhKYDaaA/c6DkpkcH3zlnVm63PlbMGJ
 nYjntt2l/fdQzDDMrHh9IS8z8Vx9ZkvMQMQj5aSRHSWEyhPmSFIQ/G6cO08d5bYliov8
 Pf+nkSLXa3H0ywHno7wM/L8/mmoWiM+dUrEffu/PSJmuEMZD0sZgB4uKYSGXJJ98RQVQ
 JP1UYHLqqj9Ikm1g+G0wo89tajG7eIX5DzZtppZ5jvyi3N2iyxPdMUhBNZMe6hgdjwkn
 iQPZtpCZ4L+hINCpr2zIu7yzUlSnNpFNqHFu/eAvM3k1i17ozlFazlEegq3Z28cMKAeZ
 vPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678697142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wIVlXXLvFujOYI1CdHdCb7y59zSvcbA34QWAmft3GhA=;
 b=CCjWUVGWKypFG7iUNzrdV922Gzap7s79HOt+/dUbZRBnGXL9nxgYQ3CdBDD5W/mqTA
 y3mfyFIXlh2uDCmiWyGd3Kz6+yw53lLHS2iMFAGSSjrSLvcYAalxJf+v3krlEmFYSLgb
 fe/wGIITl7umcUj3edjnIAkexzXzziwX9n41/QU4uq1FuHXvHfji2AVPKOdqiwXio7aT
 GPJ9TWUx3fd4gU2827RLT7HW8kUiNDJBPHQyqMaZWZ5NeQLsfEcN1Og6Y2zkKiGus/hz
 ioiyjOo2XQrYJIm8zT07DJwq3rdrlvte32nzZa+M9JbzH+FaCzsWQH1kz23KMSMW9Dtz
 IF4w==
X-Gm-Message-State: AO0yUKUSSBVdAcBr56fYwzAYWG+t6ofjzT/9w8nfXNEqL3lFHwR4yrKh
 4X8Qm2E3IRNxjiqSOMgh4IsJ/Q==
X-Google-Smtp-Source: AK7set8KgGDek7+EPFZaoJxjX9g970Kqop7YrSXl6CMXvW7NvRJ6fmapO8mu6SJeoqcs9lKJTpJR1w==
X-Received: by 2002:a05:6000:1002:b0:2ce:a0c2:d9f3 with SMTP id
 a2-20020a056000100200b002cea0c2d9f3mr4182311wrx.17.1678697142395; 
 Mon, 13 Mar 2023 01:45:42 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f13-20020adff44d000000b002ceaeb24c0asm3097341wrp.58.2023.03.13.01.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:45:41 -0700 (PDT)
Message-ID: <bb13d933-0de9-9537-8e3e-dc91c24eb177@linaro.org>
Date: Mon, 13 Mar 2023 09:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/6] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-2-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230313082417.827484-2-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Hi Alex,

Sorry for the late review, *sigh*.

On 13/3/23 09:24, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Acked-by: Peter Xu <peterx@redhat.com>
> ---
>   include/hw/qdev-core.h |  7 +++++++
>   softmmu/memory.c       | 17 +++++++++++++++++
>   softmmu/trace-events   |  1 +
>   3 files changed, 25 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bd50ad5ee1..7623703943 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -162,6 +162,10 @@ struct NamedClockList {
>       QLIST_ENTRY(NamedClockList) node;
>   };
>   
> +typedef struct {
> +    bool engaged_in_io;

Do you plan to add more fields?

> +} MemReentrancyGuard;
> +
>   /**
>    * DeviceState:
>    * @realized: Indicates whether the device has been fully constructed.
> @@ -194,6 +198,9 @@ struct DeviceState {
>       int alias_required_for_version;
>       ResettableState reset;
>       GSList *unplug_blockers;
> +
> +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> +    MemReentrancyGuard mem_reentrancy_guard;

At this point I'm not sure anymore this is a device or MR property.

>   };
>   
>   struct DeviceListener {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 4699ba55ec..57bf18a257 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -533,6 +533,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>       uint64_t access_mask;
>       unsigned access_size;
>       unsigned i;
> +    DeviceState *dev = NULL;
>       MemTxResult r = MEMTX_OK;
>   
>       if (!access_size_min) {
> @@ -542,6 +543,19 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>           access_size_max = 4;
>       }
>   
> +    /* Do not allow more than one simultanous access to a device's IO Regions */

Typo "simultaneous".

1/ access_with_adjusted_size() is complex enough and we are having hard
    time getting it right. I'd prefer we don't intermix size adjustment
    and re-entrancy check in the same function. This check could belong
    to the callers.

2/ I'm not keen on calling QOM object_dynamic_cast() in this hot path;
    and mixing QDev API within MR one. At least, can we cache this value
    once in memory_region_do_init() since we have access to @owner?

> +    if (mr->owner &&
> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> +        if (dev) {
> +            if (dev->mem_reentrancy_guard.engaged_in_io) {
> +                trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> +                return MEMTX_ERROR;

MEMTX_ERROR is device-specific, I'm not sure it is right to return it
from this generic path. Maybe you meant MEMTX_ACCESS_ERROR?

> +            }
> +            dev->mem_reentrancy_guard.engaged_in_io = true;
> +        }
> +    }
> +
>       /* FIXME: support unaligned access? */
>       access_size = MAX(MIN(size, access_size_max), access_size_min);
>       access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> @@ -556,6 +570,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>                           access_mask, attrs);
>           }
>       }
> +    if (dev) {
> +        dev->mem_reentrancy_guard.engaged_in_io = false;
> +    }
>       return r;
>   }


