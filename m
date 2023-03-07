Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7BD6AE291
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:33:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYMx-0007me-Gk; Tue, 07 Mar 2023 09:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZYMu-0007mE-Os
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:32:44 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZYMs-0007cZ-Pa
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:32:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id h11so12327635wrm.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678199561;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RLOggDsG1fKszbHRzs4LIIJfZUkmgEgqNtSYBJzrf64=;
 b=gyfrTIEGTW3q7dWFsbr5o2ZefagN2pQ/SNey4NI/42Q8pVBM/V4Jmk6MLHi7S+UzTb
 GN2mYSnu55PIRkGX31jGx4MSnMELPvb5xk+5ExEmx0TAd+N/JY/H2tTHxjoPpxR76pA2
 j8EACGJDgM6MMpX65OOf2cctLO+ug7tPxsaZiCScpSJ/wr8/o2RsQbZxuccLdLHEk89I
 lDkgouleKMddXHI4zdX1CKefjbziAKoQCqykuPsAU+XmllBreyzB+t/N8LgziOuPY3+e
 rEuU5g12Krg5Bg8Ihar/QrAD6yqA337hUGPOm63rpSBqvCzrqHDAguFxXV9VgB5bGaPb
 eZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199561;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RLOggDsG1fKszbHRzs4LIIJfZUkmgEgqNtSYBJzrf64=;
 b=1/BH0dWDxHkXoIw0pIGg0S8dn7jpy1OOQPR3vxnJofH87c9ejKazgfRN0JBQEixrT4
 7lo05TbBI36Kl5ICWKW97bQ/2J7/qF/a32kCdaVNoQtJfSHSCKhPuULq9KvDzRFFh8Xt
 05QjmQxpf05qak4TOMzD/CrLuh7Vvthb0yPp4jB6WFR3c8m0caDoDZckVLR7te+3cc6J
 mMy0CJPmVD+J/zUzriXn/Ioxhd57zn5EG7I0qxz7AV7IcjsuNFtoE3P1qvKZO+vYoGz8
 8OJo+dzl1cei1KAeIsS/DMWyDTN0WVhsfCkjYED1sIE6yK3BmffQwIH2KX+dMbCfxZVF
 0w2Q==
X-Gm-Message-State: AO0yUKX/XxOr2t6dHbQ4CC+Cmil3CFzVOoxz9dgWJ6zTl+o2QfjcqVBz
 GZVXiUeG/aI7wQ5SHmQ40B1FHg==
X-Google-Smtp-Source: AK7set9Dn8k0OZ7Z1yW+yxb8E5bi6/cNGje26r9dNxXBwJ7M05WIRjzI4fMPvY4SLrQnXHn/F5HpOA==
X-Received: by 2002:a5d:630a:0:b0:2cb:5b58:75e with SMTP id
 i10-20020a5d630a000000b002cb5b58075emr9174527wru.5.1678199560910; 
 Tue, 07 Mar 2023 06:32:40 -0800 (PST)
Received: from [192.168.248.175] (131.red-95-127-34.staticip.rima-tde.net.
 [95.127.34.131]) by smtp.gmail.com with ESMTPSA id
 f2-20020a5d4dc2000000b002be5bdbe40csm12594530wru.27.2023.03.07.06.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:32:40 -0800 (PST)
Message-ID: <a720d85a-8c16-f075-4525-ecf6ebbdd8fc@linaro.org>
Date: Tue, 7 Mar 2023 15:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] hw/mips: Add MIPS virt board
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <20230304223803.55764-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230304223803.55764-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 4/3/23 23:38, Jiaxun Yang wrote:
> MIPS virt board is design to utilize existing VirtIO infrastures
> but also comptitable with MIPS's existing internal simulation tools.
> 
> It includes virtio-pci, virtio-mmio, pcie gpex, flash rom, fw_cfg,
> goldfish-rtc and MIPS CPS system.
> 
> It should be able to cooperate with any MIPS CPU cores.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v1:
>   - Rename to virt board
>   - Convert BIOS flash to ROM
>   - Cleanups
> v2:
>   - Fix fdt flash
>   - Remove UP variant
> ---
>   MAINTAINERS                             |   7 +
>   configs/devices/mips-softmmu/common.mak |   1 +
>   docs/system/target-mips.rst             |  22 +
>   hw/mips/Kconfig                         |  17 +
>   hw/mips/meson.build                     |   1 +
>   hw/mips/virt.c                          | 916 ++++++++++++++++++++++++
>   6 files changed, 964 insertions(+)
>   create mode 100644 hw/mips/virt.c


> +static void gen_firmware(void *p, hwaddr kernel_entry, hwaddr fdt_addr)
> +{
> +    uint64_t regaddr;
> +    const MemMapEntry *memmap = virt_memmap;
> +
> +    /* Move CM GCRs */
> +    regaddr = cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS),

Eh this is odd C...

> +    bl_gen_write_ulong(&p, regaddr, memmap[VIRT_CM].base);
> +
> +    /* Move & enable GIC GCRs */
> +    regaddr = cpu_mips_phys_to_kseg1(NULL, memmap[VIRT_CM].base +
> +                                                GCR_GIC_BASE_OFS),
> +    bl_gen_write_ulong(&p, regaddr,
> +                        memmap[VIRT_GIC].base | GCR_GIC_BASE_GICEN_MSK);
> +
> +    /* Move & enable CPC GCRs */
> +    regaddr = cpu_mips_phys_to_kseg1(NULL, memmap[VIRT_CM].base +
> +                                                GCR_CPC_BASE_OFS),
> +    bl_gen_write_ulong(&p, regaddr,
> +                        memmap[VIRT_CPC].base | GCR_CPC_BASE_CPCEN_MSK);
> +
> +    /*
> +     * Setup argument registers to follow the UHI boot protocol:
> +     *
> +     * a0/$4 = -2
> +     * a1/$5 = virtual address of FDT
> +     * a2/$6 = 0
> +     * a3/$7 = 0
> +     */
> +    bl_gen_jump_kernel(&p,
> +                       true, 0, true, (int32_t)-2,
> +                       true, fdt_addr, true, 0, true, 0,
> +                       kernel_entry);
> +}


