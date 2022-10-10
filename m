Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280735F9746
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 05:57:01 +0200 (CEST)
Received: from localhost ([::1]:59692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohjuV-000376-Pc
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 23:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohjt4-0001cv-Kn
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 23:55:30 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohjt3-0002E3-0f
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 23:55:30 -0400
Received: by mail-pg1-x536.google.com with SMTP id q9so9327646pgq.8
 for <qemu-devel@nongnu.org>; Sun, 09 Oct 2022 20:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R+ct7dzgZh3HHcaBGOahJXeo8uvzSvby2EkmUs4iIaQ=;
 b=cCZ65diF7kd2wvutLB6kn4j3h4OSqNWZDBPFDXHd60/M7Klcu7YIlQlNt4w7K38acc
 w/y/zUbQ1SgYwH+HBPCGhcqYipkfRCV07RmbK+KXJ5khzCBf+6Kl4hnjiBz+Ts2VCQ4h
 VnRwd6IdJEZumsQURyXwB2R7mW/fB1hTd5+Zz9Q8q5GIsNT1/OykRDi2rkoY3wKpCtd5
 TbVhwqTpRUczkWwHFo1eptpr8KXuOq3H1KAGLJzKX4uxTr/U3AlLpn6yn2UulX1kLcYM
 DHBOBWscB+WmtZ3j3Jg8B9WErjCdHwnqGg3MJKctSacEbXmwcTaIJ8gc07Jtk+3UhbIg
 wQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R+ct7dzgZh3HHcaBGOahJXeo8uvzSvby2EkmUs4iIaQ=;
 b=1P0Idb0LPgQRl8E8zYcA+NsO4XY24B8QxgPv1dbg4GNghzf016RwHhfmNf+5kUIxdn
 1kBmB6sPntdZa8nGZezLP6mmpbUUrEdTe84lRQ2cMoaBew8VtBeE09lUkEudGwNZpVup
 +5PrzWIIWV5WyhjExI0uY65MnyZb5fkDAF/K60F8hWBZaAprvY5qfZB2SN2b6MWj+tfm
 YpGDjf1MyW5q7L2Nv7sfXZqB3y8s94iPkDZRSK9KifK72FyOmomG2COVQ5qRZPHIUGJT
 WaNeJh/WHP2z1kJY9B5Zofx5qw8qguxhqfo+Wo0UpTsZupbZEGX6mt7sPsSHkIjIVBYJ
 BpGg==
X-Gm-Message-State: ACrzQf15vJNlaDbjtWq7JgPgsYyuS+qAxVVO5HePYjRzid66grZ/pVU1
 i+Eb2qmFlSO5gu9mFofSZsmdVxP9BNOoDskYMsk=
X-Google-Smtp-Source: AMsMyM68/zZA2Yb696fMAC0/VWmQ4nSWBkXfvnh8J/EphHZPgLkl3kj4TG9rqS8JVK8OsQXVpu/w3PAA6mDemihUcEk=
X-Received: by 2002:a63:1a65:0:b0:460:d5db:8688 with SMTP id
 a37-20020a631a65000000b00460d5db8688mr7095786pgm.221.1665374127361; Sun, 09
 Oct 2022 20:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACv+nXAT-tfuabs04y5+DE-R=Hn81nmM3bKsgOkVkWTOYpTHFA@mail.gmail.com>
In-Reply-To: <CACv+nXAT-tfuabs04y5+DE-R=Hn81nmM3bKsgOkVkWTOYpTHFA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 13:55:00 +1000
Message-ID: <CAKmqyKNAi1NS=6BSANK2HeeN=GH3kkDtQaH8AwkSetdxMmuy3Q@mail.gmail.com>
Subject: Re: Question about RISC-V brom register a1 set value
To: Eric Chan <e14002270@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
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

On Sat, Oct 1, 2022 at 11:33 AM Eric Chan <e14002270@gmail.com> wrote:
>
> Hi, qemu
>
> As I know, brom will pass 3 parameters to the next stage bootloader, ex: openSBI.
> a0 will pass hartid, a2 will pass fw_dynamic_info start address.
> although a1 doesn't use directly in openSBI.
> a1 read value is determined in compile time rather than read from the original a1 that passes from brom.
> In qemu/hw/riscv/boot.c
> both 32bit and 64bit machines read 4byte that offset 32byte from the brom start address.
>
> for 64 bits machine: a1 read low 32bit data member magic of fw_dynamic_info,

Hello Eric,

a2 will contain the address of the fw_dynamic_info

> the value will same as FW_DYNAMIC_INFO_MAGIC_VALUE because risc-v is little endian.
>
> for 32bits machine: each data member of fw_dynamic_info is 4 bytes, so a1 will read the version rather than magic.

On 32-bit RISC-V a2 will also contain the address of fw_dynamic_info

>
> Do the 32bit and 64bit pass different parameters are expected?

I'm not clear what the difference between the 32-bit and 64-bit
variants are. We use different load instructions, but otherwise they
should be the same functionality.

> If it is not expected, I guess the original version is 64bit machine, and then supports 32bit but misses this detail, I hope I can have an opportunity to fix this problem.
> If it is expected, why they must be done?

It might be easier to send a patch with any fixes you think should be
made. That way it's easy to understand what you think needs to be
fixed.

Alistair

>
> Thanks,
> Eric Chan
>
> qemu/include/hw/riscv/boot_opensbi.h
> #define FW_DYNAMIC_INFO_MAGIC_VALUE     0x4942534f
> qemu/hw/riscv/boot.c
> void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                hwaddr start_addr,
>                                hwaddr rom_base, hwaddr rom_size,
>                                uint64_t kernel_entry,
>                                uint64_t fdt_load_addr)
> {
>     int i;
>     uint32_t start_addr_hi32 = 0x00000000;
>     uint32_t fdt_load_addr_hi32 = 0x00000000;
>
>     if (!riscv_is_32bit(harts)) {
>         start_addr_hi32 = start_addr >> 32;
>         fdt_load_addr_hi32 = fdt_load_addr >> 32;
>     }
>     /* reset vector */
>     uint32_t reset_vec[10] = {
>         0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
>         0x02828613,                  /*     addi   a2, t0, %pcrel_lo(1b) */
>         0xf1402573,                  /*     csrr   a0, mhartid  */
>         0,
>         0,
>         0x00028067,                  /*     jr     t0 */
>         start_addr,                  /* start: .dword */
>         start_addr_hi32,
>         fdt_load_addr,               /* fdt_laddr: .dword */
>         fdt_load_addr_hi32,
>                                      /* fw_dyn: */
>     };
>     if (riscv_is_32bit(harts)) {
>         reset_vec[3] = 0x0202a583;   /*     lw     a1, 32(t0) */
>         reset_vec[4] = 0x0182a283;   /*     lw     t0, 24(t0) */
>     } else {
>         reset_vec[3] = 0x0202b583;   /*     ld     a1, 32(t0) */
>         reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
>     }
>
>     /* copy in the reset vector in little_endian byte order */
>     for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
>         reset_vec[i] = cpu_to_le32(reset_vec[i]);
>     }
>     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
>                           rom_base, &address_space_memory);
>     riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
>                                  kernel_entry);
> }
>
> opensbi/firmware/fw_dynamic.S
> fw_boot_hart:
>         /* Sanity checks */
>         li      a1, FW_DYNAMIC_INFO_MAGIC_VALUE
>         REG_L   a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
>         bne     a0, a1, _bad_dynamic_info
>         li      a1, FW_DYNAMIC_INFO_VERSION_MAX
>         REG_L   a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
>         bgt     a0, a1, _bad_dynamic_info
>
>         /* Read boot HART id */
>         li      a1, FW_DYNAMIC_INFO_VERSION_2
>         blt     a0, a1, 2f
>         REG_L   a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
>         ret
> 2:      li      a0, -1
>         ret

