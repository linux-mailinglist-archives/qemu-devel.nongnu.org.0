Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBD5F310E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:20:30 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLMz-0001On-GE
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofKxZ-00036r-DH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:54:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofKxX-0002Xe-7S
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:54:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so5786743wmq.1
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=hyiaRcH+k0xc4PNTJ8nDGG+si/hLIoM9ExAWSZUj+/Y=;
 b=oSAta5NJeRLnxTebFFkHoRT/rcOJKzk4UVew+RFYuRMBTjr1UXCqsHJW64+eSOXyop
 CqtD8QJT5C1Zy1BQTWokwtvKYzjgEmrwfBib6LAGXQTxC7bfN2A40V7RN69eDBfypsj9
 l36GLwXI42h5KnPzZQnL4tWpQ8wEQYajQfb5MG/4oDboB/gyNbaz8PakZ8M1JIBeYwuH
 YHMF2Zn+4lYEBDhexNPGCBwIZxTiCjm3WWMnT+PRE26JcwPALWK2hepm5CgDUdKLDZ+v
 sAETOnFy1BJaFh3PHxK7Bhz0f8lpg89J/N8ElZLXrwv9u37QocLtP6WLaKaffmn8Pkei
 cRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=hyiaRcH+k0xc4PNTJ8nDGG+si/hLIoM9ExAWSZUj+/Y=;
 b=us+s/sbjZd8pap5XqGzsksUOsNZ7gBCqklgG7ThLdeR7tceBWnfle5r/fjK1TtqDvT
 +u4xnhpmnEcmWGNObpNB5IWcRvG/kqu55LO8gHQQebhgNYlxKc39o+busKpJVsLueUIP
 QUiMFHp5lM1k/2VDqegNDTLzrNAFWerAGbnbyaZP+R0OIE0kUQR2ettxQDOj5+elKwi/
 BYDbjmNeMQ2VGyC2FULDzjUZhldW2V+yJjSHklHZjT0n4PUrqV3J61VtkxHGaaZ/Xs27
 yEhCox3MZ/XsP0uybv6RdZ3sPK0NXKuadytxapX5YS1NahMUwEznNUCFJ0bIvCwrHa5i
 PWwg==
X-Gm-Message-State: ACrzQf2LtdpTKXewxqCGY1fd/OEIIx2g/phTIJir1N77Enz17dIiA+SR
 Xs9p0G+YPmIdy4DYji+M4gE=
X-Google-Smtp-Source: AMsMyM4lPVpjOORVwp2ErRFd8vYva+O1uvo/ufKh2xNBDxVgA4JMozrxmWA0xTX9YdFJKvIrhHK3SA==
X-Received: by 2002:a1c:440b:0:b0:3b3:330d:88d8 with SMTP id
 r11-20020a1c440b000000b003b3330d88d8mr7103568wma.31.1664801648363; 
 Mon, 03 Oct 2022 05:54:08 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c2cd200b003a63a3b55c3sm17435044wmc.14.2022.10.03.05.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 05:54:07 -0700 (PDT)
Message-ID: <73834ee7-a7bc-64b0-d7c4-1be3a7687e2a@amsat.org>
Date: Mon, 3 Oct 2022 14:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v3 1/2] hw/intc: Fix LoongArch extioi function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, peter.maydell@linaro.org
References: <20220930071045.848674-1-yangxiaojuan@loongson.cn>
 <20220930071045.848674-2-yangxiaojuan@loongson.cn>
In-Reply-To: <20220930071045.848674-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi,

On 30/9/22 09:10, Xiaojuan Yang wrote:
> 1.When cpu read or write extioi COREISR reg, it should access
> the reg belonged to itself, so the index of 's->coreisr' is
> current cpu number. Using MemTxAttrs' requester_type and id
> to get the cpu index.
> 2.Remove the unused extioi system memory region and we only
> support the extioi iocsr memory region now.
> 
> Based-on: <20220927141504.3886314-1-alex.bennee@linaro.org>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_extioi.c      | 51 +++++++++++++++++++--------------
>   hw/intc/trace-events            |  2 +-
>   target/loongarch/iocsr_helper.c | 16 +++++------
>   3 files changed, 38 insertions(+), 31 deletions(-)

> -static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
> +static MemTxResult extioi_readw(void *opaque, hwaddr addr, uint64_t *data,
> +                                unsigned size, MemTxAttrs attrs)
>   {
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
> +        if (attrs.requester_type != MTRT_CPU) {

We now miss the trace event. Should we add another one for errors?

> +            return MEMTX_ACCESS_ERROR;
> +        }
> +        cpu = attrs.requester_id;
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
>   
>   static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
> @@ -127,8 +131,9 @@ static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
>       }
>   }
>   
> -static void extioi_writew(void *opaque, hwaddr addr,
> -                          uint64_t val, unsigned size)
> +static MemTxResult extioi_writew(void *opaque, hwaddr addr,
> +                          uint64_t val, unsigned size,
> +                          MemTxAttrs attrs)
>   {
>       LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>       int i, cpu, index, old_data, irq;
> @@ -183,8 +188,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
>           s->bounce[index] = val;
>           break;
>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        index = (offset - EXTIOI_COREISR_START) >> 2;
> +        /* using attrs to get current cpu index */
> +        if (attrs.requester_type != MTRT_CPU) {
> +            return MEMTX_ACCESS_ERROR;

Ditto trace event.

> +        }
> +        cpu = attrs.requester_id;
>           old_data = s->coreisr[cpu][index];
>           s->coreisr[cpu][index] = old_data & ~val;
>           /* write 1 to clear interrrupt */
> @@ -231,11 +240,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
>       default:
>           break;
>       }
> +    return MEMTX_OK;
>   }
>   
>   static const MemoryRegionOps extioi_ops = {
> -    .read = extioi_readw,
> -    .write = extioi_writew,
> +    .read_with_attrs = extioi_readw,
> +    .write_with_attrs = extioi_writew,
>       .impl.min_access_size = 4,
>       .impl.max_access_size = 4,
>       .valid.min_access_size = 4,
> @@ -284,9 +294,6 @@ static void loongarch_extioi_instance_init(Object *obj)
>               qdev_init_gpio_out(DEVICE(obj), &s->parent_irq[cpu][pin], 1);
>           }
>       }
> -    memory_region_init_io(&s->extioi_system_mem, OBJECT(s), &extioi_ops,
> -                          s, "extioi_system_mem", 0x900);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_system_mem);
>   }

I am confused, isn't this used in loongarch_irq_init()?

510         /* extioi iocsr memory region */
511         memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
512 
sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
513                                 cpu));

Anyhow this is a separate logical change, so must go in a separate
patch/commit.

Regards,

Phil.

