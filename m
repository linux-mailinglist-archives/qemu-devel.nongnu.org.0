Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629E1C338E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 09:18:10 +0200 (CEST)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVVMe-0004Aq-SX
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 03:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jVVLa-0003L4-1o; Mon, 04 May 2020 03:17:02 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jVVLY-0007Ji-Im; Mon, 04 May 2020 03:17:01 -0400
Received: by mail-yb1-xb41.google.com with SMTP id d197so8700457ybh.6;
 Mon, 04 May 2020 00:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4aZq8HfR7AdD238baEAff+cTqXCGBmkjxmNbF13RhM=;
 b=tRNifiiY11j2qjQ6p1FEcqqbPWNjbRHwldS7ltFASVQ0I8olAFdlcd1yxx+kXF73pe
 hyiBHkEBTRkbvxm6B3hnHHiYJv/T7YQZ8elxX0xPzIiv9277teOsllFFGmeL5OqBLPSA
 Iuv2CxS86XbliAEFkFGiz6JtmbLN5jDrsddHeG5mWHZYXaXAWkYzZslocXNbvB67dHOi
 2+uqm3C68LdPGlkwUviYU/LTgmlCZ1CnjlFH8QOkXwDkyt8H5Mx2ENydzGwkT08daZts
 eRqpxjA3a1UNTJd9RArm8aaJDl7QIipN0y/OkgRiQHpQnfHIJgM5geN18zmr7g8K+Qj9
 9+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4aZq8HfR7AdD238baEAff+cTqXCGBmkjxmNbF13RhM=;
 b=pQBjJIH8mhnvIB9VeTYWkGnBA9wvueQrVS0Q+VOhaNubpR3JDmJHg94/TMOUAfCKsj
 lL0gzRpxhs31cqr56QPhEkLP2AGkVvao1EfENPHdWq7whm/t9NKZYeUjyXXx+GrZbRt0
 /ff9szOqk3C9GOIsEae8snU70JNnXzJR6uVMacHbPg+8cXnBUuxAe0IlzsF+W5no4o2G
 Up/bR9Su6vnD46fD1D/GIeHKt52fXcxXv2Gborc5lySTyPNVEfR7CQD1Nd7zTsTmfgGH
 /LdfgSHZHEi1P6hab/tZe/mMMwkBl2Q8RmUIULs6V/+xGvnpWW6kAmKn+JEjzd1QHfpO
 C+jQ==
X-Gm-Message-State: AGi0PuZ68cJOUt8WhY7+sqgUgaeiLmZqElVFWKWSy6N7i4WrWRAPQmcB
 dHD+hzw5ef32A2+2YKWzA341kXXHrfsIYQk6Hr0=
X-Google-Smtp-Source: APiQypJO5JcWE/vwoZb0ArAD3mZ0qqrTbe0cKr2x+DrkpSvjsdhi0kNV6ni/1S/oS+kxnKo1q/0HMBQ1Zr0qmfi9PcE=
X-Received: by 2002:a5b:383:: with SMTP id k3mr25003740ybp.332.1588576618737; 
 Mon, 04 May 2020 00:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
 <1588348254-7241-2-git-send-email-bmeng.cn@gmail.com>
 <CAAhSdy06i1zb6_aedLn41rWDzrjyTcJ_T954DcwX7k2bM_VcVw@mail.gmail.com>
In-Reply-To: <CAAhSdy06i1zb6_aedLn41rWDzrjyTcJ_T954DcwX7k2bM_VcVw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 4 May 2020 15:16:47 +0800
Message-ID: <CAEUhbmXMcxZqk4RUjcWMG-5MCd-Z3wPn=ktQnHLA3Rvn01iq+g@mail.gmail.com>
Subject: Re: [PATCH 1/5] roms/opensbi: Update to support building bios images
 for generic platform
To: Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 QEMU Developers <qemu-devel@nongnu.org>, Anup Patel <Anup.Patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Anup,

On Sun, May 3, 2020 at 12:38 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, May 1, 2020 at 9:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The RISC-V generic platform is a flattened device tree (FDT) based
> > platform where all platform specific functionality is provided based
> > on FDT passed by previous booting stage. The support was added in
> > upstream opensbi recently.
> >
> > Bring the QEMU roms/opensbi submodule to the upstream opensbi commit:
> > commit 4f18c6e55049 ("platform: generic: Add Sifive FU540 TLB flush range limit override")
> > with the following changes since v0.7 release:
> >
> >   1bb00ab lib: No need to provide default PMP region using platform callbacks
> >   a9eac67 include: sbi_platform: Combine reboot and shutdown into one callback
> >   6585fab lib: utils: Add SiFive test device
> >   4781545 platform: Add Nuclei UX600 platform
> >   3a326af scripts: adapt binary archive script for Nuclei UX600
> >   5bdf022 firmware: fw_base: Remove CSR_MTVEC update check
> >   e6c1345 lib: utils/serial: Skip baudrate config if input frequency is zero
> >   01a8c8e lib: utils: Improve fdt_parse_uart8250() API
> >   0a0093b lib: utils: Add fdt_parse_uart8250_node() function
> >   243b0d0 lib: utils: Remove redundant clint_ipi_sync() declaration
> >   e3ad7c1 lib: utils: Rename fdt_parse_clint() to fdt_parse_compat_addr()
> >   a39cd6f lib: utils: Add FDT match table based node lookup
> >   dd33b9e lib: utils: Make fdt_get_node_addr_size() public function
> >   66185b3 lib: utils: Add fdt_parse_sifive_uart_node() function
> >   19e966b lib: utils: Add fdt_parse_hart_id() function
> >   44dd7be lib: utils: Add fdt_parse_max_hart_id() API
> >   f0eb503 lib: utils: Add fdt_parse_plic_node() function
> >   1ac794c include: Add array_size() macro
> >   8ff2b94 lib: utils: Add simple FDT timer framework
> >   76f0f81 lib: utils: Add simple FDT ipi framework
> >   75322a6 lib: utils: Add simple FDT irqchip framework
> >   76a8940 lib: utils: Add simple FDT serial framework
> >   7cc6fa4 lib: utils: Add simple FDT reset framework
> >   4d06353 firmware: fw_base: Introduce optional fw_platform_init()
> >   f1aa9e5 platform: Add generic FDT based platform support
> >   1f21b99 lib: sbi: Print platform hart count at boot time
> >   2ba7087 scripts: Add generic platform to create-binary-archive.sh
> >   4f18c6e platform: generic: Add Sifive FU540 TLB flush range limit override
> >
> > Update our Makefile to build the generic platform instead of building
> > virt and sifive_u separately.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  roms/Makefile | 30 ++++++++----------------------
> >  roms/opensbi  |  2 +-
> >  2 files changed, 9 insertions(+), 23 deletions(-)
> >
> > diff --git a/roms/Makefile b/roms/Makefile
> > index f9acf39..cb00628 100644
> > --- a/roms/Makefile
> > +++ b/roms/Makefile
> > @@ -64,10 +64,8 @@ default help:
> >         @echo "  u-boot.e500        -- update u-boot.e500"
> >         @echo "  u-boot.sam460      -- update u-boot.sam460"
> >         @echo "  efi                -- update UEFI (edk2) platform firmware"
> > -       @echo "  opensbi32-virt     -- update OpenSBI for 32-bit virt machine"
> > -       @echo "  opensbi64-virt     -- update OpenSBI for 64-bit virt machine"
> > -       @echo "  opensbi32-sifive_u -- update OpenSBI for 32-bit sifive_u machine"
> > -       @echo "  opensbi64-sifive_u -- update OpenSBI for 64-bit sifive_u machine"
> > +       @echo "  opensbi32-generic  -- update OpenSBI for 32-bit generic machine"
> > +       @echo "  opensbi64-generic  -- update OpenSBI for 64-bit generic machine"
> >         @echo "  bios-microvm       -- update bios-microvm.bin (qboot)"
> >         @echo "  clean              -- delete the files generated by the previous" \
> >                                       "build targets"
> > @@ -170,29 +168,17 @@ skiboot:
> >  efi: edk2-basetools
> >         $(MAKE) -f Makefile.edk2
> >
> > -opensbi32-virt:
> > +opensbi32-generic:
> >         $(MAKE) -C opensbi \
> >                 CROSS_COMPILE=$(riscv32_cross_prefix) \
> > -               PLATFORM="qemu/virt"
> > -       cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-virt-fw_jump.bin
> > +               PLATFORM="generic"
> > +       cp opensbi/build/platform/generic/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-generic-fw_jump.bin
>
> I think you should copy fw_jump.elf as well because QEMU Spike
> platform needs it.
>

I believe we intended only to ship default bios images for virt and
sifive_u. Spike bios image was not shipped in previous QEMU version
too.

> >
> > -opensbi64-virt:
> > +opensbi64-generic:
> >         $(MAKE) -C opensbi \
> >                 CROSS_COMPILE=$(riscv64_cross_prefix) \
> > -               PLATFORM="qemu/virt"
> > -       cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-virt-fw_jump.bin
> > -
> > -opensbi32-sifive_u:
> > -       $(MAKE) -C opensbi \
> > -               CROSS_COMPILE=$(riscv32_cross_prefix) \
> > -               PLATFORM="sifive/fu540"
> > -       cp opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
> > -
> > -opensbi64-sifive_u:
> > -       $(MAKE) -C opensbi \
> > -               CROSS_COMPILE=$(riscv64_cross_prefix) \
> > -               PLATFORM="sifive/fu540"
> > -       cp opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
> > +               PLATFORM="generic"
> > +       cp opensbi/build/platform/generic/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-generic-fw_jump.bin
>
> Same as above.
>
> >
> >  bios-microvm:
> >         $(MAKE) -C qboot
> > diff --git a/roms/opensbi b/roms/opensbi
> > index 9f1b72c..4f18c6e 160000
> > --- a/roms/opensbi
> > +++ b/roms/opensbi
> > @@ -1 +1 @@
> > -Subproject commit 9f1b72ce66d659e91013b358939e832fb27223f5
> > +Subproject commit 4f18c6e55049d858c62e87d2605dd41c06956e4e
> > --
> > 2.7.4
> >
> >
>
> Otherwise looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Bin

