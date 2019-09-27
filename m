Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637BCC009E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 10:04:55 +0200 (CEST)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDlFF-00041P-1t
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 04:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl7s-0006X0-F4
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 03:57:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl7r-00017q-AL
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 03:57:16 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:42727)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iDl7r-00016x-65; Fri, 27 Sep 2019 03:57:15 -0400
Received: by mail-yb1-xb42.google.com with SMTP id v6so1601436ybe.9;
 Fri, 27 Sep 2019 00:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GAxQh9j+Ykk2bGicyyBcNjusETSmwhuQo+QjUK8BzHc=;
 b=s7LiTrdezk4dLpSKNQT2hqP6qobRiju5jCvWnqq367o/Y8Byhkkx5LvlDRxbpiQEKB
 GgirBHHVimH0aclV4+VhU1Z2C1JSDDTi2MsCe6w2mkkUWHF8jU3FQ0L1SzfAbQUULqGD
 /SipotCf3sh4jdPGltMHtFwHXYWYgJhJ815pH9MuVDD6/UxiF+REgJ8M6nTCG0MgytmR
 HOCtg6HPWdmTjTPwNfmSkcS3hOaNIekYIkRjuy7lypMqFDjzSc00blX2jYrUljMzPquF
 c6hvToeUcwH33g0Zaltoog6P2VMdu0xRxfbZJmv0/3mt0MY5zmlHx+1Xhd57gJ90kn28
 j3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GAxQh9j+Ykk2bGicyyBcNjusETSmwhuQo+QjUK8BzHc=;
 b=tIQDCiYA1xdqzi/78aPK7tAcNkCsGj65gZjQLAclSMOOCn66kyikV/ORQiiTONcIC8
 jdFNki40wpt1mk8j6ChLCfavj5TDtzNVLsSe9XNSpeHEmO1lBSW8Gh+jW7zwdBcoSkqE
 1rUXDSqIPrQkWdAsbE/yjLeCMo6AeV4iliZpjzqx67nrWyFTWNFK/ZVhLF8ET5Iw+8Gk
 L0VNYKf4jglx7tB5gf0cIP64+KFTgMVobWCOSpMWiQXYFti3TAlY9gtdGloUItdzR21c
 R8jzwNDKPocTU2CHpbPJ4kXRUReAINRYf/jXGi2EdtV4uZk4GWOWgzMY7AecPvUwZMy2
 5juQ==
X-Gm-Message-State: APjAAAUBSM2NyRA+m9oaAL0ncmkqRZZ53Gjbvsj/wzJJxkJLw/AveaHV
 toYquXh/frJu+/Ly6eo4KJn/rH1JlH+nHxZHK4K+mA==
X-Google-Smtp-Source: APXvYqwzSGjx2xJRUskILso39/luBWTpN8bAMQbxc2erXd4QKtvdAfwGjHWZqgRsEPkTnCHDI0sCeWncj98Z12vQdhU=
X-Received: by 2002:a25:7481:: with SMTP id p123mr4627916ybc.392.1569571034808; 
 Fri, 27 Sep 2019 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569545046.git.alistair.francis@wdc.com>
 <a24af06cea57073f4a75381755ab05e825679445.1569545046.git.alistair.francis@wdc.com>
In-Reply-To: <a24af06cea57073f4a75381755ab05e825679445.1569545046.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 27 Sep 2019 15:57:02 +0800
Message-ID: <CAEUhbmVvsujN-EG3hdpaAbf-OF-NvvQnX4k5KWS_MscPHhKg-A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] riscv/sifive_u: Add the start-in-flash property
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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

On Fri, Sep 27, 2019 at 8:55 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add a property that when set to true QEMU will jump from the ROM code to
> the start of flash memory instead of DRAM which is the default
> behaviour.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_u.c         | 27 +++++++++++++++++++++++++++
>  include/hw/riscv/sifive_u.h |  2 ++
>  2 files changed, 29 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index f5741e9a38..33b55d0d5b 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -373,6 +373,10 @@ static void riscv_sifive_u_init(MachineState *machine)
>                                         /* dtb: */
>      };
>
> +    if (s->start_in_flash) {
> +        reset_vec[6] = memmap[SIFIVE_U_FLASH0].base; /* start: .dword FLASH0_BASE */
> +    }

Please change to use the way that patch "[v2,7/7] riscv/virt: Jump to
pflash if specified" does for consistency, ie:

    if (s->start_in_flash) {
        start_addr = memmap[SIFIVE_U_FLASH0].base; /* start: .dword
FLASH0_BASE */
    }

> +
>      /* copy in the reset vector in little_endian byte order */
>      for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
>          reset_vec[i] = cpu_to_le32(reset_vec[i]);
> @@ -432,8 +436,31 @@ static void riscv_sifive_u_soc_init(Object *obj)
>                            TYPE_CADENCE_GEM);
>  }
>
> +static bool virt_get_start_in_flash(Object *obj, Error **errp)

sifive_u_get_start_in_flash()

> +{
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    return s->start_in_flash;
> +}
> +
> +static void virt_set_start_in_flash(Object *obj, bool value, Error **errp)

sifive_u_set_start_in_flash()

> +{
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    s->start_in_flash = value;
> +}
> +
>  static void riscv_sifive_u_machine_instance_init(Object *obj)
>  {
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    s->start_in_flash = false;
> +    object_property_add_bool(obj, "start-in-flash", virt_get_start_in_flash,
> +                             virt_set_start_in_flash, NULL);
> +    object_property_set_description(obj, "start-in-flash",
> +                                    "Set on to tell QEMU's ROM to jump to " \
> +                                    "flash. Otherwise QEMU will jump to DRAM",
> +                                    NULL);
>  }
>
>  static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index a921079fbe..2656b43c58 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -57,6 +57,8 @@ typedef struct SiFiveUState {
>
>      void *fdt;
>      int fdt_size;
> +
> +    bool start_in_flash;
>  } SiFiveUState;
>

Regards,
Bin

