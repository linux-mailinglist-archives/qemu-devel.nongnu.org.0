Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF844588247
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 21:10:14 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIxHS-0007ob-4C
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 15:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oIxFk-0005RJ-OP; Tue, 02 Aug 2022 15:08:28 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oIxFj-0001yj-9W; Tue, 02 Aug 2022 15:08:28 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10ea30a098bso13394844fac.8; 
 Tue, 02 Aug 2022 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kVDWKV0Koi4aQlqW+MZhskLpfIwh+0ANLp8QB/ww7DY=;
 b=NUHwPjvEJH/2uYJqMxnooc0D//XOeXMd7vkU2QTJZbCqWWHPDce7IO5SdAtqm4JpW4
 QmGE3hb2GgpjcyyRsygMUQMqWHpMmunV4qrEnEBMEUv94aZRxNt3mfEseyfMO0upboJr
 mdYjDNbLbkJGrpHuLajRfJ2vRWhwjOmjBOAOddI3PJQ0wnISNOd1lh7POlB/oaup1sxe
 pCwfdh7EKbDImtTGpuBtLHmCoWjucQqrlxfK8Cmdq2mI1ZxYMAbg4Fv6gev0iEjfLqQ8
 2lRRa/Yv5hTYfNbC3+5Vr+9xKA33zVizUFHFyM1ENWKxI9dfK4w/10eXn1hH/pjhcSzK
 HphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kVDWKV0Koi4aQlqW+MZhskLpfIwh+0ANLp8QB/ww7DY=;
 b=mzYY0QHq9sevdDYtihRJcx1B2uXWWyUqpR+Q++bbKqa2aO6tDTXXl09uA1XOR8IfSi
 05QFiASSPpgEf98LKRPgTwP93f8k0Z94g5SAVreAQ0Cpshbb8AP+pBFcnhMV7n3xFZL2
 qGGGIxSWO2W5uquVU80GE3oXtHljkjbYOzuB5R44GR+gmKWR8kip8D9nUIzPZhZHObqv
 c/+fhYdgPv9b7sxSD3apmGwqeJOdQxAtGeesO5flHsP40ot/REXyy1oG+snvWiFg03+X
 8aIr/dBM8ZR0Y3gNOSJt26lxJLyOiP1UPs2CIx7IKPfe4kDPQ00fX/ewDwEe1rP8kAAb
 cyyw==
X-Gm-Message-State: ACgBeo0wEqXLv4p3aZi7JYB4RP4FHNddpuu88yimwMl7w5uz3qHXRlLQ
 oRia39eSX5Vlqi6KWF2cSTQ=
X-Google-Smtp-Source: AA6agR5rmltKK1Sz+YdnXQIQEwWWHTMmRTANIM5f1acU6pze5t9XVgx42SWDsavhjQJj/3UaVoTt4A==
X-Received: by 2002:a05:6870:a909:b0:10c:4c49:9c15 with SMTP id
 eq9-20020a056870a90900b0010c4c499c15mr386463oab.186.1659467304835; 
 Tue, 02 Aug 2022 12:08:24 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 ep2-20020a056870a98200b0010dc461410bsm3966399oab.38.2022.08.02.12.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 12:08:24 -0700 (PDT)
Message-ID: <4256cd60-c629-540a-f7c0-d15aee516854@gmail.com>
Date: Tue, 2 Aug 2022 16:08:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 03/19] ppc/ppc405: Move devices under the ref405ep machine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-4-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/1/22 10:10, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc405_boards.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 4c269b6526a5..24ec948d22a4 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -230,13 +230,11 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>       env->load_info = &boot_info;
>   }
>   
> -static void ref405ep_init(MachineState *machine)
> +static void ppc405_init(MachineState *machine)
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>       const char *kernel_filename = machine->kernel_filename;
>       PowerPCCPU *cpu;
> -    DeviceState *dev;
> -    SysBusDevice *s;
>       MemoryRegion *sram = g_new(MemoryRegion, 1);
>       MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
>       hwaddr ram_bases[2], ram_sizes[2];
> @@ -294,15 +292,6 @@ static void ref405ep_init(MachineState *machine)
>           memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios);
>       }
>   
> -    /* Register FPGA */
> -    ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
> -    /* Register NVRAM */
> -    dev = qdev_new("sysbus-m48t08");
> -    qdev_prop_set_int32(dev, "base-year", 1968);
> -    s = SYS_BUS_DEVICE(dev);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
> -
>       /* Load kernel and initrd using U-Boot images */
>       if (kernel_filename && machine->firmware) {
>           target_ulong kernel_base, initrd_base;
> @@ -335,6 +324,23 @@ static void ref405ep_init(MachineState *machine)
>       }
>   }
>   
> +static void ref405ep_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +    SysBusDevice *s;
> +
> +    ppc405_init(machine);
> +
> +    /* Register FPGA */
> +    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
> +    /* Register NVRAM */
> +    dev = qdev_new("sysbus-m48t08");
> +    qdev_prop_set_int32(dev, "base-year", 1968);
> +    s = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
> +}
> +
>   static void ref405ep_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -354,6 +360,7 @@ static void ppc405_machine_class_init(ObjectClass *oc, void *data)
>       MachineClass *mc = MACHINE_CLASS(oc);
>   
>       mc->desc = "PPC405 generic machine";
> +    mc->init = ppc405_init;
>       mc->default_ram_size = 0x08000000;
>       mc->default_ram_id = "ppc405.ram";
>   }

