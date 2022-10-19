Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808076042C0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 13:09:55 +0200 (CEST)
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol6xO-0002IJ-1F
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 07:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6o6-0004ZP-KR
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 07:00:19 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6o3-0007i3-Ke
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 07:00:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id bu30so28498606wrb.8
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RpIeW2HKR5LfuXE3Xh2tREtEa9w5p9iLOY5e6k6MCqc=;
 b=BzRM86P15OwLZ5L9ZxHxOl9uKsY53xl0/8kvulih1Cm0CViSSdupyckFJyCYEPXQ5v
 OmZnnhOnAW9ynYxH6ZScO17mS+4hptANALnHM1mWuajDkVtMzgpn3g/CLahrr9+9j/mL
 DilGED4zDQQ/Rb3AyQZMpIkxy0UiKvkkYY8OGjHjxrDNepN4rhvhhubCIt/t7QLW5uk9
 2IyyNET1HG+ckNBO6i7SE1TN5sysu/g8TXLwb/PUDpDVQHtB8+uw0kxo1Hqtp0qGA5Sr
 d0/ERtkagdX+SK3qsk8XcBcWg8VSTvenoo35jzvoD3mUJ+6hT2avWJKb66xacvStX9O0
 2koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RpIeW2HKR5LfuXE3Xh2tREtEa9w5p9iLOY5e6k6MCqc=;
 b=NSpsZw6+cxSugQP3vhpG567scLYFxc3jpkxOjaPHIDMh45u+SSDVlC0xRjPxmll1HV
 +15rvIJG5DD5iSoeiPaEDpdqN+SZqisOEn3eoPer+rTvBxrNZ3rQD+WAGvBLRgVTmkiF
 veUL7B8ThESqD7E1rmb3GGNda0pFZjXWySFTxNgfDpPCJW5Wtl2hZPWZ3XtayMRBm8e8
 C1fveoLNIKOocHnv6PWmiOEqfxSKf2bsG5bfMiYZaXwWT0LYlO+eeVjOxb4WyV/SKvBl
 gUaw6LjnFeZK3XsUWwiN+W49kG6r+70BRI+sP0LjrVjJLREAmg/TkF0CIGz+Z091yNwC
 oz6g==
X-Gm-Message-State: ACrzQf0FErgx48g9VVrLzn38dVZBJKL8I9cFET/EK1NvW5Ej0u1DkkbC
 6nP/VDXL9BgL93w4XKu6kNvI7g==
X-Google-Smtp-Source: AMsMyM6J4oG8hB8SOB1JuDehFH4plBnXwKUDpQUuCTpF2I96U+ClKqoAmOVMXq+atjiGYiVdzMWY6Q==
X-Received: by 2002:a5d:4ec5:0:b0:22c:dca3:e84d with SMTP id
 s5-20020a5d4ec5000000b0022cdca3e84dmr4575423wrv.14.1666177213828; 
 Wed, 19 Oct 2022 04:00:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a5d5348000000b0022ac119fcc5sm13490816wrv.60.2022.10.19.04.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 04:00:13 -0700 (PDT)
Message-ID: <f7c4f7ca-cbf9-87d6-4d8c-5957c36ae23c@linaro.org>
Date: Wed, 19 Oct 2022 13:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v6 1/1] hw/intc: Fix LoongArch extioi coreisr accessing
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, f4bug@amsat.org
References: <20221019091546.2148418-1-yangxiaojuan@loongson.cn>
 <20221019091546.2148418-2-yangxiaojuan@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019091546.2148418-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/22 11:15, Xiaojuan Yang wrote:
> When cpu read or write extioi COREISR reg, it should access

"When the CPU reads or writes ..."

> the reg belonged to itself, so the cpu index of 's->coreisr'
> is current cpu number. Using MemTxAttrs' requester_id to get
> the cpu index.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_extioi.c      | 42 ++++++++++++++++++---------------
>   hw/intc/trace-events            |  3 +--
>   target/loongarch/iocsr_helper.c | 18 +++++++-------
>   3 files changed, 34 insertions(+), 29 deletions(-)

> -static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
> +static MemTxResult extioi_readw(void *opaque, hwaddr addr, uint64_t *data,
> +                                unsigned size, MemTxAttrs attrs)
>   {

This patch would be easier to review if you split it in 2, first 
converting the MemoryRegionOps read/write handlers to _with_attrs
ones, then another patch fetching the CPU id from attrs.requester_id.

>       LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>       unsigned long offset = addr & 0xffff;
> -    uint32_t index, cpu, ret = 0;
> +    uint32_t index, cpu;
>   
>       switch (offset) {
>       case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>           index = (offset - EXTIOI_NODETYPE_START) >> 2;
> -        ret = s->nodetype[index];
> +        *data = s->nodetype[index];
>           break;
>       case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>           index = (offset - EXTIOI_IPMAP_START) >> 2;
> -        ret = s->ipmap[index];
> +        *data = s->ipmap[index];
>           break;
>       case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>           index = (offset - EXTIOI_ENABLE_START) >> 2;
> -        ret = s->enable[index];
> +        *data = s->enable[index];
>           break;
>       case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
>           index = (offset - EXTIOI_BOUNCE_START) >> 2;
> -        ret = s->bounce[index];
> +        *data = s->bounce[index];
>           break;
>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> -        ret = s->coreisr[cpu][index];
> +        index = (offset - EXTIOI_COREISR_START) >> 2;
> +        /* using attrs to get current cpu index */
> +        cpu = attrs.requester_id;

            assert(attrs.requester_type == MTRT_CPU);

> +        *data = s->coreisr[cpu][index];
>           break;
>       case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>           index = (offset - EXTIOI_COREMAP_START) >> 2;
> -        ret = s->coremap[index];
> +        *data = s->coremap[index];
>           break;
>       default:
>           break;
>       }
>   
> -    trace_loongarch_extioi_readw(addr, ret);
> -    return ret;
> +    trace_loongarch_extioi_readw(addr, *data);
> +    return MEMTX_OK;
>   }

> -static void extioi_writew(void *opaque, hwaddr addr,
> -                          uint64_t val, unsigned size)
> +static MemTxResult extioi_writew(void *opaque, hwaddr addr,
> +                          uint64_t val, unsigned size,
> +                          MemTxAttrs attrs)
>   {
>       LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>       int i, cpu, index, old_data, irq;
> @@ -183,8 +185,9 @@ static void extioi_writew(void *opaque, hwaddr addr,
>           s->bounce[index] = val;
>           break;
>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        index = (offset - EXTIOI_COREISR_START) >> 2;
> +        /* using attrs to get current cpu index */

            assert(attrs.requester_type == MTRT_CPU);

> +        cpu = attrs.requester_id;
>           old_data = s->coreisr[cpu][index];
>           s->coreisr[cpu][index] = old_data & ~val;
>           /* write 1 to clear interrrupt */
> @@ -231,11 +234,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
>       default:
>           break;
>       }
> +    return MEMTX_OK;
>   }


