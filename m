Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65D58BE13
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 00:49:38 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKp5V-0007xg-PR
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 18:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKp3O-0005gZ-Qh
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 18:47:26 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKp3M-0001J8-BX
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 18:47:25 -0400
Received: by mail-pg1-x531.google.com with SMTP id r69so586421pgr.2
 for <qemu-devel@nongnu.org>; Sun, 07 Aug 2022 15:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=rZhQL7HGX46x1Wd9kgtulYMynaRlBY2ne1Nj1hUimW0=;
 b=aa16ucaJsDuWqyInI3t9iID5qvxtxgC/2GTuTfWfl1fQvSeJP8Ufv4ulWJLiNtOKyN
 r7Hb85eMt5BelxF9sH9ocoMxbuqBc/b4tJKLy9+FmTFkejiGm0thxl4zIJptjg0FZ8W6
 Mhc4RgTg5fJ5+vfMqyRqu/I9nE6fiWlsKrEgCofq4uROLeYpH0zBCOQrVmcHPz7dQzxZ
 Xg3bNk/vjGlLibVNzzVWfJCqXNqPsiTZv/T0LLSNDQktuNzuzpm1bnYUJ/9hg6Rvphc5
 9jqEPCBrmOKZJ6v+gqLZJXzssthpSU0siOwO0n+U2LUpAhKmwknO26a4ZlxlufCYLXM6
 DY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=rZhQL7HGX46x1Wd9kgtulYMynaRlBY2ne1Nj1hUimW0=;
 b=ZrSbbiFihDOx3PiuZUv+hdY1aOUMs7ntha6995VR+sCXFLkdb1UC/IEmEDBbMete3I
 O/hjiRDV+GpKRV1DRTaNnpUd6Lb2VctOE/0RgrEYDImk6CsGJ+F/ec+q33uPX1DiD77Y
 MbFQE42Nc0h6o1SllnW4gavgkARPOya4DVUw0qUvaN6gs0/gzK4tHgYRZhM985yumAgt
 9xMWyWjUBHdXr5tqdH+LxItKWy41R9MwIbs1qSihkCQl/cbiz9Z+6b190mhybV86d5YG
 +IKtumeXujHYEBp231E3FiNBT40G+CdFt/KujhwerJkCi6gg+hkLuCIDj4axBHYziar/
 Uh7g==
X-Gm-Message-State: ACgBeo1VjmpREwJvaiWFRj/O5bVw07QoSPOeMQgenIVWKMIA0D3YyMFu
 FxC+11mzKcPAJUOxLZJQct48b1Wof7+8Nq6g6as=
X-Google-Smtp-Source: AA6agR7SC4gr2Mr7EBx3DwCVQnLN8U3ZmnkVHvzNMJvrCq6keZWARzGbCWYHewjuPPOavfeDPVM5ZPwNgogv1ZiUHLk=
X-Received: by 2002:a63:f14c:0:b0:41a:b83d:a636 with SMTP id
 o12-20020a63f14c000000b0041ab83da636mr13440974pgk.361.1659912443045; Sun, 07
 Aug 2022 15:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-13-danielhb413@gmail.com>
In-Reply-To: <20220805093948.82561-13-danielhb413@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:46:56 +1000
Message-ID: <CAKmqyKNGxnO4B0qvsMg1xzh=_sHQiAG8i_x8O5zaO+OdG22PoQ@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v2 12/20] hw/riscv: set machine->fdt in
 spike_board_init()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x531.google.com
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

On Fri, Aug 5, 2022 at 8:08 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
> the spike machine.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index e41b6aa9f0..2909f7b2a1 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -40,6 +40,8 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>
> +#include <libfdt.h>
> +
>  static const MemMapEntry spike_memmap[] = {
>      [SPIKE_MROM] =     {     0x1000,     0xf000 },
>      [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
> @@ -304,6 +306,15 @@ static void spike_board_init(MachineState *machine)
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
>                                     machine->ram_size, s->fdt);
> +
> +    /*
> +     * Update the machine->fdt pointer to enable support for
> +     * 'dumpdtb'and 'info fdt' commands. Use fdt_pack() to
> +     * shrink the blob size we're going to store.
> +     */
> +    fdt_pack(s->fdt);
> +    machine->fdt = s->fdt;
> +
>      /* load the reset vector */
>      riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
>                                memmap[SPIKE_MROM].base,
> --
> 2.36.1
>
>

