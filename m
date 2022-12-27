Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36662656D6C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:31:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADnD-0004Ky-Ua; Tue, 27 Dec 2022 12:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADmh-0004I9-Re
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:30:40 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADmf-000854-0u
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:30:38 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso16102254fac.10
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8S9aJZa+lYpTXbJPrPnNVjOjdt8tD/yxLir9G/eK2MQ=;
 b=aLifQaHQ0q9s+nm+EyDT/OSs/HY8YvNHseD+HooQhw0iQKWIHbT9KLe59OzOYUhZkZ
 Bfhs+8TPo0VrW5S1CkD4yac7px+OjJOw5S5ZrFiRIEz9IQ623LKZLyKHUdg2/7mZ+kX3
 NJla8oi8uct5fwMEe7/588CNP6a3uBA9kg/pIekuOBpyXQTBfJtLH3QbkMiwnHv7n586
 QC7NkfOyXxnixQVox++Rygvmkr2XaDbeO1PmS4osHC7M5geU2wm1jbQSDDACuXiC/yM0
 ybGJiJZClj2MdqJIUNHjzwOeH/qnUx+iywhurlxLdLtaQC8Wv3ka8Kt5KJFe4gd8fLb/
 ZFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8S9aJZa+lYpTXbJPrPnNVjOjdt8tD/yxLir9G/eK2MQ=;
 b=P+vl8C7DbT5AG6BkPF2WWK78J6D7eIDhQCvx6hmSJDlt63QalOlUSADjTxPW3LwGOi
 eiCus8DMGojJNwJkuc2Bk/EbZOCJZMOGqgsGFhig1zY5arm3Kka2pKfjHlmmAmG9GGrE
 xwGj+BmsdQMSSW7mUMhArn0GSLatsaIH3rU6EtGkD40VG9b6a7EqxaTUIm/o/QdFRNDx
 hC2mYCjJ9kifKClqv6doRHo86na9vSHswM0UdDejSX5oFPAkOWu/GxD172OCH/pQW+Yr
 IzIkC4EnvZb5zaEVBT982VJQBJb+7nCaPXMw+M3LCgo8tg+5rCM7JXe3hfRQpcgDG9VN
 aZgw==
X-Gm-Message-State: AFqh2krB+uiYxzNt7/cEhv0FafMDFI5QOUTEwz7yiWPdKiMuwva1uXbl
 KAsnCBiMwffXpKLP1P2Z4KUUR8z7nC+ex/7B
X-Google-Smtp-Source: AMrXdXu5IY5ug7I6NCfNjPBGlu0ivWlO2ZgVmqq/8tYBf4XzFcRpC5x0w8Ey4PjLAE3KfAPo9yeaRg==
X-Received: by 2002:a05:6870:5d8b:b0:14f:b76a:fd8f with SMTP id
 fu11-20020a0568705d8b00b0014fb76afd8fmr7058327oab.53.1672162235907; 
 Tue, 27 Dec 2022 09:30:35 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05687015ce00b0014fd7e7c3fesm3273779oad.27.2022.12.27.09.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:30:35 -0800 (PST)
Message-ID: <89f92523-0075-bde7-70ac-152cbac18095@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:30:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 03/12] hw/char: riscv_htif: Drop useless assignment of
 memory region
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-4-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-4-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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



On 12/27/22 03:48, Bin Meng wrote:
> struct HTIFState has 3 members for address space and memory region,
> and are initialized during htif_mm_init(). But they are actually
> useless. Drop them.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   include/hw/char/riscv_htif.h | 7 ++-----
>   hw/char/riscv_htif.c         | 7 ++-----
>   hw/riscv/spike.c             | 5 ++---
>   3 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 3eccc1914f..6d172ebd6d 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -34,9 +34,6 @@ typedef struct HTIFState {
>       hwaddr tohost_offset;
>       hwaddr fromhost_offset;
>       MemoryRegion mmio;
> -    MemoryRegion *address_space;
> -    MemoryRegion *main_mem;
> -    void *main_mem_ram_ptr;
>   
>       CPURISCVState *env;
>       CharBackend chr;
> @@ -54,7 +51,7 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>   bool htif_uses_elf_symbols(void);
>   
>   /* legacy pre qom */
> -HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> -    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
> +HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
> +                        Chardev *chr, uint64_t nonelf_base);
>   
>   #endif
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 088556bb04..e7e319ca1d 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -265,8 +265,8 @@ bool htif_uses_elf_symbols(void)
>       return (address_symbol_set == 3) ? true : false;
>   }
>   
> -HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> -    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
> +HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
> +                        Chardev *chr, uint64_t nonelf_base)
>   {
>       uint64_t base, size, tohost_offset, fromhost_offset;
>   
> @@ -281,9 +281,6 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
>       fromhost_offset = fromhost_addr - base;
>   
>       HTIFState *s = g_new0(HTIFState, 1);
> -    s->address_space = address_space;
> -    s->main_mem = main_mem;
> -    s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
>       s->env = env;
>       s->tohost_offset = tohost_offset;
>       s->fromhost_offset = fromhost_offset;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 1e1d752c00..82cf41ac27 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -317,9 +317,8 @@ static void spike_board_init(MachineState *machine)
>                                 fdt_load_addr);
>   
>       /* initialize HTIF using symbols found in load_kernel */
> -    htif_mm_init(system_memory, mask_rom,
> -                 &s->soc[0].harts[0].env, serial_hd(0),
> -                 memmap[SPIKE_HTIF].base);
> +    htif_mm_init(system_memory, &s->soc[0].harts[0].env,
> +                 serial_hd(0), memmap[SPIKE_HTIF].base);
>   }
>   
>   static void spike_machine_instance_init(Object *obj)


