Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF958A545
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 06:24:31 +0200 (CEST)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJosv-0001lj-Tm
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 00:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oJorM-0000Jr-Vw
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 00:22:53 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oJorL-0000WN-Ab
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 00:22:52 -0400
Received: by mail-pg1-x52b.google.com with SMTP id f11so1678969pgj.7
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 21:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ozjF1T9hI+hMulyF+KHf0Rdo25oM+JdFuvBISLfFkDs=;
 b=k2Uv9Bhllvlka7RcDgCfEn8+KBf/A6OWA8JuyNugE8HfRWvUjlRvBmJjYxo9UmhBUh
 F8jG5q4/EbSKVzYqVLm16FLBkvau18Y68J+h+tzQhEIl8EbqLGFlOo+S0ZhQswVgLrnN
 rIYo0xyPdypTOAIvwn4CvzP2skg+o8xeh7Dp7RcWhZ5hm6xUGlr0A0U62AoUx8XJy1tV
 36pSz5mqxynDLwU0AMWuZDk6OWmAFQQvHFMF4i3Sl+KMqT319DeJNRhB/OyYNhGyIdzE
 7fPuB+r/TIQVmhqQOlf4GuJEg33jD/EoWN1mLZu9cUoTVIi5vMTbpcHqzxOFsj164C86
 KWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ozjF1T9hI+hMulyF+KHf0Rdo25oM+JdFuvBISLfFkDs=;
 b=NK8Cxab2l6xQAEpSVMI4WCNBVAmwcLY6aBqU6qQE1kRbq+89h9DaIBV4Ew9TgrpXXl
 ILrN1xHvtbtzfFMXeBHmaWkxUStqO4wMuTjNafKFJ1Of/lv8JB6FSJNCxetPjF91vPNY
 bp5zgR87MSG2hkGmeYqke66WRCUWBEYuEYTbjXi2sbaWXMQGmRzcmhWR/MCu/NKHbxbV
 2PkBgXmYsetNL1uSWqNxoEgcXtrZC6MAbWliEbPRaAlDeYNp+zK3Wd3M8dskMaOsIeaE
 Pcx8msTgypL3STczQ9EUqH6UOH6ZVx4Or0kSWm7JR2d8L72mJwNKZY6sQlPJRDzuPLNY
 A44Q==
X-Gm-Message-State: ACgBeo0T1j+kcUfOqsk9wOmEEnjmNvttIZkhrRdiRrRxXAKXpQgI9mr9
 5WIn985iZ4oBlxGf6Loa/aYGnCSm++oJ06CyOgg=
X-Google-Smtp-Source: AA6agR6ib25Br1HPTA7P949Y06clOHPh/WbpU38FKPvZKTy9ppcUwGxGBDbPx6kys2JrYShEeH9ibcYVN3AHk/xVKe4=
X-Received: by 2002:a63:f14c:0:b0:41a:b83d:a636 with SMTP id
 o12-20020a63f14c000000b0041ab83da636mr4299978pgk.361.1659673369703; Thu, 04
 Aug 2022 21:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220728181926.2123771-1-danielhb413@gmail.com>
In-Reply-To: <20220728181926.2123771-1-danielhb413@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Aug 2022 14:22:23 +1000
Message-ID: <CAKmqyKNe7fmsdm7cQ=DSXY8Gg2V37aPkzQ86epNuZ4NczThJmQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: remove 'fdt' param from
 riscv_setup_rom_reset_vec()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Vijai Kumar K <vijai@behindbytes.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Jul 29, 2022 at 4:19 AM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> The 'fdt' param is not being used in riscv_setup_rom_reset_vec().
> Simplify the API by removing it. While we're at it, remove the redundant
> 'return' statement at the end of function.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Vijai Kumar K <vijai@behindbytes.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/boot.c            | 4 +---
>  hw/riscv/microchip_pfsoc.c | 2 +-
>  hw/riscv/shakti_c.c        | 3 +--
>  hw/riscv/spike.c           | 2 +-
>  hw/riscv/virt.c            | 2 +-
>  include/hw/riscv/boot.h    | 2 +-
>  6 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 06b4fc5ac3..1ae7596873 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -286,7 +286,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>                                 hwaddr start_addr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> -                               uint64_t fdt_load_addr, void *fdt)
> +                               uint64_t fdt_load_addr)
>  {
>      int i;
>      uint32_t start_addr_hi32 = 0x00000000;
> @@ -326,8 +326,6 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>                            rom_base, &address_space_memory);
>      riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
>                                   kernel_entry);
> -
> -    return;
>  }
>
>  void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 10a5d0e501..7313153606 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -583,7 +583,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>          riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
>                                    memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
>                                    memmap[MICROCHIP_PFSOC_ENVM_DATA].size,
> -                                  kernel_entry, fdt_load_addr, machine->fdt);
> +                                  kernel_entry, fdt_load_addr);
>      }
>  }
>
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index 90e2cf609f..e43cc9445c 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -66,8 +66,7 @@ static void shakti_c_machine_state_init(MachineState *mstate)
>      riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
>                                shakti_c_memmap[SHAKTI_C_RAM].base,
>                                shakti_c_memmap[SHAKTI_C_ROM].base,
> -                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0,
> -                              NULL);
> +                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0);
>      if (mstate->firmware) {
>          riscv_load_firmware(mstate->firmware,
>                              shakti_c_memmap[SHAKTI_C_RAM].base,
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index e41b6aa9f0..5ba34543c8 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -308,7 +308,7 @@ static void spike_board_init(MachineState *machine)
>      riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
>                                memmap[SPIKE_MROM].base,
>                                memmap[SPIKE_MROM].size, kernel_entry,
> -                              fdt_load_addr, s->fdt);
> +                              fdt_load_addr);
>
>      /* initialize HTIF using symbols found in load_kernel */
>      htif_mm_init(system_memory, mask_rom,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index bc424dd2f5..2e9ed2628c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1299,7 +1299,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
>                                virt_memmap[VIRT_MROM].base,
>                                virt_memmap[VIRT_MROM].size, kernel_entry,
> -                              fdt_load_addr, machine->fdt);
> +                              fdt_load_addr);
>
>      /*
>       * Only direct boot kernel is currently supported for KVM VM,
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index d2db29721a..a36f7618f5 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -51,7 +51,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>                                 hwaddr saddr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> -                               uint64_t fdt_load_addr, void *fdt);
> +                               uint64_t fdt_load_addr);
>  void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
>                                    hwaddr rom_size,
>                                    uint32_t reset_vec_size,
> --
> 2.36.1
>
>

