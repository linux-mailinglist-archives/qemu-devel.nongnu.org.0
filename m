Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DFE2EA56B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 07:29:22 +0100 (CET)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwfqK-0003iW-RQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 01:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwfoS-0002rB-95
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 01:27:24 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwfoK-0007zY-FF
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 01:27:23 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id j17so28294940ybt.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 22:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gRcyARo1kQ3qbsEoBnTltI7wgbWfr7ojuiSGRY/Ckbs=;
 b=HjxEo12b9iDG007bt6ZLd2/BKGBEQB3IxoMQBxbP9fu38uy2run0p+YxLfUXrgcMyU
 VC8GBl5bdBrlqFhPXF4AmTgCsM+7fFO3SOowwhCwFPBn14VQfneQKKgXXCA82hpTB18d
 4Ir+Zlr3PbJOC676mtuD+J1C4EFMjMAu3J3gPowfzGNFZSYXT8FvbRn3A4ypF70NbOmn
 DmHEdcT+7mdCWys5F9JykbDpfhyUbidtK/NB/saOlOPY74E2M2TMCbKfprHfxSF77MUW
 0ehFNehO4JBmhI+ZMSXEu1fMG45G9vyHiYP9dmylB8dnunonkMDVG9UXKkWUV28tHy7u
 np/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gRcyARo1kQ3qbsEoBnTltI7wgbWfr7ojuiSGRY/Ckbs=;
 b=jO730Yr9SrfCRjap8CDi5CVIXo4IbUc5jwAdCe7DDTaCCdWrkkyhSF1DHXU77FCM3S
 ifyH/8/DK0VwUuHqrJ9khsLL1otZ/owHi2nipRubE5hW0Rg58mFHUNNz123wSE7jsK+d
 NLVao6qYtn4rKT44pNR/RXQo+Q1+yTYjST/cv7OHOITEPY+v3S/2zMBEowvLaDjzQ6aZ
 Z3WBneb1YKXEHsorTDFZEQUtBRF1XnI6KvkaEoSn3moqpRMv6q299M4sWQ9MZClKcOI5
 UhLBdTI8cqegrJi7G0B+ruQVxjoM3b00pWTb7rrL0nFrqrgLdV1e/sDHM5B8FWuXsjd1
 4K9Q==
X-Gm-Message-State: AOAM532rVSUibsklY4LsXMvArXvB34524IaasupTQmyJw/0BlJDkTVdO
 BVorfaIkY/3pITB7Fz/tkOJeIBYRdd9Yl6kXioA=
X-Google-Smtp-Source: ABdhPJzuUTtMSbCSt2DOKSbT8Qdqa0HydW1J7jFEbhJZ0PqAAXp4ydmibjqw/uRzNbeabjbmKkca/QO+4cgchHDXfKY=
X-Received: by 2002:a25:5a43:: with SMTP id o64mr56575370ybb.387.1609828033509; 
 Mon, 04 Jan 2021 22:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20201219002430.18481-1-vitaly.wool@konsulko.com>
In-Reply-To: <20201219002430.18481-1-vitaly.wool@konsulko.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 14:27:02 +0800
Message-ID: <CAEUhbmVvC7AFmCHJhZMS7KGaAXWFR1dMaghrWM3MyLapR7ycDg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: microchip_pfsoc: specify XIP image
To: Vitaly Wool <vitaly.wool@konsulko.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alistair Francis

On Sat, Dec 19, 2020 at 8:24 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Add command line parameter to microchip_pfsoc machine to be able
> to specify XIP kernel image file. To pass over XIP image file, it
> will be enough to run
>
> $ qemu-system-riscv64 -M microchip-icicle-kit,xipImage=<image> ...
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  hw/riscv/microchip_pfsoc.c         | 42 +++++++++++++++++++++++++++---
>  include/hw/riscv/microchip_pfsoc.h |  1 +
>  2 files changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index e952b49e8c..04d81d52fe 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -181,6 +181,7 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
>  static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> +    MicrochipIcicleKitState *mks = MICROCHIP_ICICLE_KIT_MACHINE(ms);
>      MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
>      const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
>      MemoryRegion *system_memory = get_system_memory();
> @@ -415,10 +416,19 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>                      memmap[MICROCHIP_PFSOC_IOSCB].base);
>
>      /* QSPI Flash */
> -    memory_region_init_rom(qspi_xip_mem, OBJECT(dev),

I believe we only need to change this to memory_region_init_ram(),
then use the device loader the load the XIP image into this space. The
remove the need to introduce the XIP image property as you did.

> -                           "microchip.pfsoc.qspi_xip",
> -                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> -                           &error_fatal);
> +    if (mks->xip_image) {
> +        memory_region_init_ram_from_file(qspi_xip_mem, OBJECT(dev),
> +                                         "microchip.pfsoc.qspi_xip",
> +                                         memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> +                                         0x10000 /* align */, 0 /* ram_flags */,
> +                                         mks->xip_image, &error_fatal);
> +        qspi_xip_mem->readonly = true;
> +    } else {
> +        memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
> +                               "microchip.pfsoc.qspi_xip",
> +                               memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> +                               &error_fatal);
> +    }
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
>                                  qspi_xip_mem);
> @@ -517,6 +527,24 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>      }
>  }
>

Regards,
Bin

