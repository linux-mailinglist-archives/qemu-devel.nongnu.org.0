Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEDB8A5E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 07:17:59 +0200 (CEST)
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBBIs-0006tu-Ni
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 01:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBBGJ-0005Il-JP
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 01:15:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBBGI-0004Fw-Jd
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 01:15:19 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:45345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iBBGI-0004Fa-DM; Fri, 20 Sep 2019 01:15:18 -0400
Received: by mail-yb1-xb41.google.com with SMTP id y6so2192861ybq.12;
 Thu, 19 Sep 2019 22:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0z1T6JvcssTLSPZ9td1uJrq4D7t3gj4q4nnzUK6mH+U=;
 b=Xwpvc8UZmeR0OCxCm4itUWxwIyEV/A7wkzxC9pqQgXtyLcSfrmaniVXD2pMZ1/1nqY
 qMs9rzI+0avMmO/NC/A3S1CbW1Av0Uwox3N9GduOP7i0JjfF/8vpS87mki0P/FtAO+uU
 Kk2O66EvBtA02NQLw7Q6KDs8mP48w9WmECl6c3JTivGVmbdbzUSxwr0wnMb8xcPPkkJw
 jQ/pH0fSRjpot8MiOh6YIZm0UjxP+HweTjVTrdrbXZxrSs23hqH76TcUeMW7W2saTb7m
 cvd6C5JTTUv9h7mpxm5ISSpVslCSMeVaNfgAgxkgVE8ZThdm89leuF3w30zSpV0IvUlp
 o44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0z1T6JvcssTLSPZ9td1uJrq4D7t3gj4q4nnzUK6mH+U=;
 b=OjnnCXaevxiAb2dxxO2aPzTL6ou4LCyvSg9spM04dgBe7BkrmNU08BvXvnEthy4fn5
 l6yIBWehffGmxaO7YcpjpAHamzJkqxXY4CP25ZaIztM8gpQSqZu+Vqcr0g4cFW+P1k+w
 grqERh7VhamiulQmmJplRL+bN4RhIghvRx9rRj7iOakv9zGE/XngDs4B3yFCNE7puCDZ
 op3bbgoKtqCT409Kej7L4lp8Oe/rCaV3TaRnYHO3vvEdAq2nssvCUpzBNFEAaV+ooKVU
 TELiobqj40i0cZRJQ4/orbiMjJ9H9aMr8uDyV+5Fpm8d+f8UmiUE0nuY9BVHbrXfGty7
 EHRA==
X-Gm-Message-State: APjAAAU2Pp3aRDEfWXmfpBkXYnKAmU3WOxHj8reDzZTuoIIGR7TFfQ6G
 BXx7cUlqoiZ42MtZxXcswXBtOlSpRNKScYfJFJ4=
X-Google-Smtp-Source: APXvYqyWw3CjEeEEwJgs2f6oe5PVe4AxuXnX5WZru6AD+w9m83FSi2X+4T8D+hMpO0tUhwEFPA234/33lfrbEYbjwYo=
X-Received: by 2002:a25:b911:: with SMTP id x17mr9108500ybj.29.1568956517403; 
 Thu, 19 Sep 2019 22:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <a3649f52a79eff39c707546d88ecd25b753dbf33.1568931866.git.alistair.francis@wdc.com>
In-Reply-To: <a3649f52a79eff39c707546d88ecd25b753dbf33.1568931866.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 20 Sep 2019 13:15:04 +0800
Message-ID: <CAEUhbmVcupHEesoyrfnyCfSUg4Q8pZnyUt=3hpC_g11BL1wxwg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] riscv/virt: Jump to pflash if specified
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 20, 2019 at 6:35 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> If the user supplied pflash to QEMU then change the reset code to jump
> to the pflash base address instead of the DRAM base address.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ca002ecea7..ed25cc6761 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -441,6 +441,7 @@ static void riscv_virt_board_init(MachineState *machine)
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      char *plic_hart_config;
>      size_t plic_hart_config_len;
> +    target_ulong start_addr = memmap[VIRT_DRAM].base;
>      int i;
>      unsigned int smp_cpus = machine->smp.cpus;
>
> @@ -487,6 +488,13 @@ static void riscv_virt_board_init(MachineState *machine)
>          }
>      }
>
> +    if (drive_get(IF_PFLASH, 0, 0)) {
> +        /* Pflash was supplied, let's overwrite the address we jump to after

nits: wrong multi-line comment format

> +         * reset to the base of the flash.
> +         */
> +        start_addr = virt_memmap[VIRT_FLASH].base;
> +    }
> +
>      /* reset vector */
>      uint32_t reset_vec[8] = {
>          0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
> @@ -499,7 +507,7 @@ static void riscv_virt_board_init(MachineState *machine)
>  #endif
>          0x00028067,                  /*     jr     t0 */
>          0x00000000,
> -        memmap[VIRT_DRAM].base,      /* start: .dword memmap[VIRT_DRAM].base */
> +        start_addr,                  /* start: .dword */
>          0x00000000,
>                                       /* dtb: */
>      };
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

