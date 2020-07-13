Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C421AA68
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 00:19:59 +0200 (CEST)
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jteta-0003SP-SB
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 18:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jtesq-0002zV-VE; Thu, 09 Jul 2020 18:19:12 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:39478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jtesp-0004ic-DQ; Thu, 09 Jul 2020 18:19:12 -0400
Received: by mail-io1-xd44.google.com with SMTP id f23so4018994iof.6;
 Thu, 09 Jul 2020 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zlbovMq+CfQFgr0L2fGTZuKo7s7GwKCOyZktdYMSYt8=;
 b=nrW+HPkPi5C2fdpGY61RDKFJcYxhpYIE5P0+K4q2+xqlEq4L9mNGiJ7qqFK9npfrr8
 +dn8XnV+qHN/Fuo80E8Dd0cbMkjSnusT2NBQeWUpbS9pe7jkRIzwhPfAzYG8i0qslK+I
 YJJiaL5nrIjIuH9MLtW8cG6OLknmROSXLsQYfuPULxmV0dWBYC32ZMzUOzZuFWMUz0f7
 fJnRuVA9n9cSuttHgDONzeCOHrgqAFsMQgpNz+0FEg9Vkei+0EA5V3Bozn0LjgkWypx9
 l6EWDlYxBOUecdWRlO6imVRrCL5kP/bX4HLPSqLnc/lTcG3OH7+F0MttryI2YHUiZQJP
 q7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zlbovMq+CfQFgr0L2fGTZuKo7s7GwKCOyZktdYMSYt8=;
 b=p7hi37QnImtd/H0AlvswJ9ZE8T/emGDqo0tH5nVppMavoYsheYC1YXriS/hMhMcnlF
 KWoqH8J7ba1b65682qY/7YmCoEa+5SqNqEhHAy//scgtyKca6aApulwb2BRW9O8asSz4
 GvRr59yagZE87AoKhUbcx/MlY6GgifCYjDKz8hZ0uNd3vOVpwo2Z8FtK30RlVA6xfOOu
 YwvDJ11urzjP0eyJN2l3NLGwiRBJVn1KMGxy2Hcjm4ppJGzqc+tDGaNj1REVnHjXvuFF
 jV6VFm5mOTxq8fhGpoQWAp/frPsu8mjzsMGDqL1hKwd/DIpADO4Conwb0llzIv433CH0
 RTbw==
X-Gm-Message-State: AOAM533L2QfqijXqrDA8U6ehVTU9xzuolqJ2aq/1j0h3YqGCN7A4alGR
 +J0OMCB1qHsI/L13mtFAKZNd+5Op7j08MMJtlkk=
X-Google-Smtp-Source: ABdhPJzfJD1fKCRKIw0uJC7sfjI2Z68R9Ew3hfbgSKfIPw4lAbsl3ErXgiY5U/JjSNQGZYNSynWG0LvW5VOPOBCHYzQ=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr44638476ios.42.1594333149988; 
 Thu, 09 Jul 2020 15:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <1594289144-24723-1-git-send-email-bmeng.cn@gmail.com>
 <1594289144-24723-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1594289144-24723-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jul 2020 15:09:18 -0700
Message-ID: <CAKmqyKPvn7dALUHhK=na1svr==oZ2rvyFOnw8FvRJZP23uHN7Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/riscv: sifive_u: Provide a reliable way for
 bootloader to detect whether it is running in QEMU
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 9, 2020 at 3:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The reset vector codes are subject to change, e.g.: with recent
> fw_dynamic type image support, it breaks oreboot again.

This is a recurring problem, I have another patch for Oreboot to fix
the latest breakage.

>
> Add a subregion in the MROM, with the size of machine RAM stored,
> so that we can provide a reliable way for bootloader to detect
> whether it is running in QEMU.

I don't really like this though. I would prefer that we don't
encourage guest software to behave differently on QEMU. I don't think
other upstream boards do this.

Besides Oreboot setting up the clocks are there any other users of this?

Alistair

>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v2:
> - correctly populate the value in little-endian
>
>  hw/riscv/sifive_u.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 3413369..79519d4 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -88,6 +88,7 @@ static const struct MemmapEntry {
>
>  #define OTP_SERIAL          1
>  #define GEM_REVISION        0x10070109
> +#define MROM_RAMSIZE_OFFSET 0xf8
>
>  static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      uint64_t mem_size, const char *cmdline)
> @@ -496,6 +497,26 @@ static void sifive_u_machine_init(MachineState *machine)
>      riscv_rom_copy_firmware_info(memmap[SIFIVE_U_MROM].base,
>                                   memmap[SIFIVE_U_MROM].size,
>                                   sizeof(reset_vec), kernel_entry);
> +
> +    /*
> +     * Tell guest the machine ram size at MROM_RAMSIZE_OFFSET.
> +     * On real hardware, the 64-bit value from MROM_RAMSIZE_OFFSET is zero.
> +     * QEMU aware bootloader (e.g.: oreboot, U-Boot) can check value stored
> +     * here to determine whether it is running in QEMU.
> +     */
> +
> +    uint32_t ram_size[2] = {
> +        machine->ram_size,
> +        ((uint64_t)(machine->ram_size)) >> 32
> +    };
> +
> +    /* copy in the ram size in little_endian byte order */
> +    for (i = 0; i < ARRAY_SIZE(ram_size); i++) {
> +        ram_size[i] = cpu_to_le32(ram_size[i]);
> +    }
> +    rom_add_blob_fixed_as("mrom.ram_size", ram_size, sizeof(ram_size),
> +                          memmap[SIFIVE_U_MROM].base + MROM_RAMSIZE_OFFSET,
> +                          &address_space_memory);
>  }
>
>  static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
> --
> 2.7.4
>
>

