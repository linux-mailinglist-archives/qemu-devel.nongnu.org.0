Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862DD659866
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:45:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEjp-0007vu-Lp; Fri, 30 Dec 2022 07:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEjj-0007th-Bc
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:43:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEjh-0003km-Kj
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:43:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso13081690wmb.3
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ha2BxsAW0+cbOeuEud6L0fG28UhfdQ9kMV67Kz8bZRA=;
 b=Egv/TS7zlk5uZl3VshfNeZafj9zc5oFtPGqpKt5cIlEhh2akK+TguTSDwTwyqnZ1oj
 lVU0NaNacwSyRrZ9e2Os3vxcUU/fJ5wVsPDrA/RkwFqhhYNjUA6z/Xx6hDxMLFY6Z5PL
 2x0GJsWmYEiQycoq4Mm2yA0pOxXWv+oE5cAmCfJgYcVlWxPmUGA4ER0l3uKnFrBut/NZ
 MDB8aEVcyXIxNglM+aQFdlqb9pN3jiJwwFbTy7sPi3LI7wRdENjO6qlqj1G9hU8ymYI4
 7rwN6W29QY8NPzGVLsm0sySxSC8brzun8I+p45vdwF9x1wBvn8oTNpO0F1OPpDnqgQzg
 0VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ha2BxsAW0+cbOeuEud6L0fG28UhfdQ9kMV67Kz8bZRA=;
 b=J1/xW4jRJdRKUe7P2LFtFKm/ShkTHC9zxpHnDR69KS2pLY/UciX87L3s/az+Rg153B
 v7zljfYyEK2heOdsT5fr3+/qjazaHojINZHo9ioXI7I4hH7417vpCnpR8tz0adHALLPw
 KFTLsGRXnZfwxucFc7zT7wSC1U0CxmaSCIzEFGEtfR2JhIdgTrhQ+sC6xrfjcJEljJZs
 SLBA/eD5TU3mn1da9npX+XrwvWjT1Y/mfstQqI+rWg54MockE6pzfRI9lzuO5Lrn/PYk
 0HeAm6xQ8BCUCnM0xxIcbnRHIv/i+nYOd+SE1WYajvAdspT3/cUjq7r1jqzDpXWLcFJM
 rRjg==
X-Gm-Message-State: AFqh2kpetYcfUxWQcrisHWbG0/9gsaaE7ZfXsfJ9ye3F7/Ct+H9KM6TP
 GhNT1vMoAI3DwDlb/umKYCZXiA==
X-Google-Smtp-Source: AMrXdXtVLcap5/+vUTX8gHjcUXBQuspDZjxupZLMbCTxDd3m2NOXFcmOUe5nJm8b0ZC1UjcxG1Ueuw==
X-Received: by 2002:a05:600c:47d1:b0:3d3:496b:de9d with SMTP id
 l17-20020a05600c47d100b003d3496bde9dmr22645963wmo.34.1672404223754; 
 Fri, 30 Dec 2022 04:43:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b003d974076f13sm24546633wms.3.2022.12.30.04.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:43:43 -0800 (PST)
Message-ID: <57e4f5aa-7b74-7dcd-60e6-6185d5582979@linaro.org>
Date: Fri, 30 Dec 2022 13:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/3] hw/intc/loongarch_pch_pic: add irq number property
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221230095950.2217103-1-zhaotianrui@loongson.cn>
 <20221230095950.2217103-3-zhaotianrui@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221230095950.2217103-3-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 30/12/22 10:59, Tianrui Zhao wrote:
> With loongarch 7A1000 manual, irq number supported can be set
> in PCH_PIC_INT_ID_HI register. This patch adds irq number property
> for loongarch_pch_pic, so that virt machine can set different
> irq number when pch_pic intc is added.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   hw/intc/loongarch_pch_pic.c         | 33 +++++++++++++++++++++++++----
>   hw/loongarch/virt.c                 |  8 ++++---
>   include/hw/intc/loongarch_pch_pic.h |  5 ++---
>   3 files changed, 36 insertions(+), 10 deletions(-)


> @@ -78,7 +80,12 @@ static uint64_t loongarch_pch_pic_low_readw(void *opaque, hwaddr addr,
>           val = PCH_PIC_INT_ID_VAL;
>           break;
>       case PCH_PIC_INT_ID_HI:
> -        val = PCH_PIC_INT_ID_NUM;
> +        /*
> +         * With 7A1000 manual
> +         *   bit  0-15 pch irqchip version
> +         *   bit 16-31 irq number supported with pch irqchip
> +         */
> +        val = PCH_PIC_INT_ID_VER + ((s->irq_num - 1) << 16);

We usually use the '|' operator instead of '+', but you can also
use deposit32() from "qemu/bitops.h":

           val = deposit32(PCH_PIC_INT_ID_VER, 16, 15, s->irq_num - 1);

>           break;
>       case PCH_PIC_INT_MASK_LO:
>           val = (uint32_t)s->int_mask;
> @@ -365,6 +372,19 @@ static void loongarch_pch_pic_reset(DeviceState *d)
>       s->int_polarity = 0x0;
>   }


> diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
> index 2d4aa9ed6f..ba3a47fa88 100644
> --- a/include/hw/intc/loongarch_pch_pic.h
> +++ b/include/hw/intc/loongarch_pch_pic.h
> @@ -9,11 +9,9 @@
>   #define PCH_PIC_NAME(name) TYPE_LOONGARCH_PCH_PIC#name
>   OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHPIC, LOONGARCH_PCH_PIC)
>   
> -#define PCH_PIC_IRQ_START               0
> -#define PCH_PIC_IRQ_END                 63
>   #define PCH_PIC_IRQ_NUM                 64
>   #define PCH_PIC_INT_ID_VAL              0x7000000UL
> -#define PCH_PIC_INT_ID_NUM              0x3f0001UL
> +#define PCH_PIC_INT_ID_VER              0x1UL
>   
>   #define PCH_PIC_INT_ID_LO               0x00
>   #define PCH_PIC_INT_ID_HI               0x04
> @@ -66,4 +64,5 @@ struct LoongArchPCHPIC {
>       MemoryRegion iomem32_low;
>       MemoryRegion iomem32_high;
>       MemoryRegion iomem8;
> +    unsigned int  irq_num;

There is one extra space here, otherwise LGTM.

>   };


