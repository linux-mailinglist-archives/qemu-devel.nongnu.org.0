Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BA551A7F5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:06:06 +0200 (CEST)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIRx-0002iR-0W
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIJ5-0000Hx-NI
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:56:55 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:33501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIJ4-0003KT-30
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:56:55 -0400
Received: by mail-oi1-x22e.google.com with SMTP id l203so1799091oif.0
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=pVBP8NyDB+8NSkcbyltv/yrUGpbKcB07KYV0JQfDdKc=;
 b=paxuG7gWwjV81hAOMwF/tHpZ5kdIFOMzBybaha+IPcoJJCqhZp9GYhbhJtp1T05wHB
 mhdyk0++09j7htLajau7j4Oaq1z7O8h+kG4vadwuAnZ+XEgX5QlqATpEqoJ3uk3QHlAe
 rZVPpFYoBQoKc8Cv9tZLr7gTFcsV4ubmSqI+zyZu3/q36QnS4FJsMA53o1raQBkdDtF2
 S8U5KIx3TScnreHbAOF9YMWv8x5u1C/zGGM+HrIN9uWcKILMwvBn2pbnnjRqKVo9eD4L
 /owJSDnwltG9Q7eixTUqjfqSoy3VVscn8gBZdSTmDqnAs5fejMQFZtJqbPGTl9WGPYII
 kqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pVBP8NyDB+8NSkcbyltv/yrUGpbKcB07KYV0JQfDdKc=;
 b=nTqBawQ8AgN1jwjRjZhyq1zw9hwZOrzvT6T026YWxUnEPZOT67ifmaWMVqe2eHvyfx
 LqBiV0+UL0Lvc1urAaXCkptTNvU8Epa5NZ84RDr0UjU3NMTJ/a9Us3TsXEMEQ9Cko27U
 59pqqWSo7kF2XFscrYQZdx2koTONCGKP7tv+UWbU+ajJF46rD91MilH3ZFZnNivhvg8z
 0nv78mardhyfj1dDVHgu41/s60NYBHiMp55tOAXsfVorm+pYPOtmrmrMT4fY8V+ccT8U
 fJHNq32UMEDRdU+6lfjyKhxUa5/H3LKUeprxcUBbDlfvzhNNAoAsdOIlYoELLbT5vjeP
 ZXFQ==
X-Gm-Message-State: AOAM533zrmyA5ufu9Pbyx2A8c6wi+oQw6bt/DJXfas2M35i2fE/D0sw8
 qp+/WcVK1KoUOgxnwoc7v/iHEw==
X-Google-Smtp-Source: ABdhPJz6jzivJa8GvFiNgbTk7jgdoTrkV1V9g55aHS+k/qzFbCzSCYLczLN0TQ2jgC+r2X3NHqy6vg==
X-Received: by 2002:a05:6808:e8d:b0:322:4fbe:8c5f with SMTP id
 k13-20020a0568080e8d00b003224fbe8c5fmr188304oil.284.1651683411263; 
 Wed, 04 May 2022 09:56:51 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a056830408a00b006063f1f05dfsm1468458ott.18.2022.05.04.09.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:56:50 -0700 (PDT)
Message-ID: <2a790cf2-6ab8-327f-c41a-84337f0f998d@linaro.org>
Date: Wed, 4 May 2022 11:56:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 10/50] dino: return PCIBus from dino_init() using
 qdev_get_child_bus()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-11-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> This allows access to the PCI bus without having to reference parent_obj directly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>   hw/hppa/dino.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 77b8089664..d89b48493f 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -523,14 +523,12 @@ PCIBus *dino_init(MemoryRegion *addr_space,
>   {
>       DeviceState *dev;
>       DinoState *s;
> -    PCIBus *b;
> +    PCIBus *pci_bus;
>   
>       dev = qdev_new(TYPE_DINO_PCI_HOST_BRIDGE);
>       object_property_set_link(OBJECT(dev), "memory-as", OBJECT(addr_space),
>                                &error_fatal);
>       s = DINO_PCI_HOST_BRIDGE(dev);
> -
> -    b = s->parent_obj.bus;
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>       memory_region_add_subregion(addr_space, DINO_HPA,
> @@ -539,7 +537,8 @@ PCIBus *dino_init(MemoryRegion *addr_space,
>       *p_rtc_irq = qemu_allocate_irq(dino_set_timer_irq, s, 0);
>       *p_ser_irq = qemu_allocate_irq(dino_set_serial_irq, s, 0);
>   
> -    return b;
> +    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
> +    return pci_bus;
>   }
>   
>   static void dino_pcihost_reset(DeviceState *dev)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

