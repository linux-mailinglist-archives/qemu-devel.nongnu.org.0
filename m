Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC398B99A3
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Sep 2019 00:24:22 +0200 (CEST)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBRK9-0005wl-TZ
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 18:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iBRD1-0007QQ-0B
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 18:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iBRCx-0007WS-7N
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 18:16:57 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34662)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iBRCu-0007W4-R3; Fri, 20 Sep 2019 18:16:53 -0400
Received: by mail-lj1-x242.google.com with SMTP id j19so7009746lja.1;
 Fri, 20 Sep 2019 15:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4sh6Z+qjqwOJVncCA0V/d++uMQ2Ey+b5XabXdVXv4Ko=;
 b=Y4Y4r1eiFXznBiEGWmDI/0usJa0+vYATFZD2VbFEvowvmd9wyMA1CgADgobJ1629Ah
 LaR6CjODOEBL6eL5Y/X+yttWyDcU7ITtThE8colfsM/Yaw8plhlqHjML712dwHfL+6TJ
 H49DRinwAOBTaeiwQ7svVWXfuapUX6kJnL4q9GFqUR80HnTlgPe2GooAHMx4PPbXVD6J
 wKh/m4aqDrU1hFLIw/KawWmx7CqpN0Rcl0UEelrMYASekEwHJEwu7YQNFq+56vQVZ9A8
 4gS3I2JeH/HlCF/1gT+FPlOlRBZux1wph4EF12NQBCMTXEYgccHThzkBct+oR2IbIvw8
 1y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4sh6Z+qjqwOJVncCA0V/d++uMQ2Ey+b5XabXdVXv4Ko=;
 b=HqhgF4SEUb2GEwfhEqfsdlVCADqOfv5tUOa4ftvHMdBeJu+q6tU6U6dNvrH/WcqrYc
 YfSQiANtN2O5eXnoSHZVBrrn1NraMwYZTcRnvmXRMNe5Xcwq4EEAVb6LJ2SYlw8270mI
 tQGs+Dtef5PCF2QBX1XInucE44myLZSPab0V7fAXRDf+GDIIWn0bybQSOOnJ1BG+rgzW
 JgNnssCkOwKu2/w7HJT2o6UlUO/O1vQzNuplx6v3tnTY2x/6F1MTnPvcO2C4I0uM8iNf
 /7ZQXvGdAu/8jz6uyCJDPQw6BNWramejC+0gTLNOrj/9gyUtdFy5NZNpYCYDiOwzr8AG
 K3vA==
X-Gm-Message-State: APjAAAWJTK+TdhVXxnxnbQ6PjqwBf5cBq5gtr880bSIoam1eVwRJX9cY
 6iLD1JbJkuPMJnQxlbdpPK1BQmhso+kFIDzpgj8=
X-Google-Smtp-Source: APXvYqyx//Vjjgth3hCWeGVjjKPWeD2NleOKQB48wxkW1/45S02YwQeSq52GxOI0OnHgabiELyoH8FRjppJTEqbRw0U=
X-Received: by 2002:a2e:3902:: with SMTP id g2mr10544171lja.196.1569017810244; 
 Fri, 20 Sep 2019 15:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <0a5c141a26fada6d93d06e996a2f24e1b269ec50.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmVvDKQqQYE-riq=cvSrCe_NMoW_KDsLjh8CVHRUhJvk9A@mail.gmail.com>
In-Reply-To: <CAEUhbmVvDKQqQYE-riq=cvSrCe_NMoW_KDsLjh8CVHRUhJvk9A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Sep 2019 15:12:12 -0700
Message-ID: <CAKmqyKOofA3U+8kjMkzQ0sNd1=uwJHq3c9eaLZdoNCb7=e-PAw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] riscv/virt: Add the PFlash CFI01 device
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 19, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Sep 20, 2019 at 6:36 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Add the CFI01 PFlash to the RISC-V virt board. This is the same PFlash
> > from the ARM Virt board and the implementation is based on the ARM Virt
> > board. This allows users to specify flash files from the command line.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/Kconfig        |  1 +
> >  hw/riscv/virt.c         | 81 +++++++++++++++++++++++++++++++++++++++++
> >  include/hw/riscv/virt.h |  3 ++
> >  3 files changed, 85 insertions(+)
> >
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index fb19b2df3a..b12660b9f8 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -36,4 +36,5 @@ config RISCV_VIRT
> >      select SERIAL
> >      select VIRTIO_MMIO
> >      select PCI_EXPRESS_GENERIC_BRIDGE
> > +    select PFLASH_CFI01
> >      select SIFIVE
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index d36f5625ec..ca002ecea7 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -26,6 +26,7 @@
> >  #include "hw/boards.h"
> >  #include "hw/loader.h"
> >  #include "hw/sysbus.h"
> > +#include "hw/qdev-properties.h"
> >  #include "hw/char/serial.h"
> >  #include "target/riscv/cpu.h"
> >  #include "hw/riscv/riscv_hart.h"
> > @@ -61,12 +62,72 @@ static const struct MemmapEntry {
> >      [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
> >      [VIRT_UART0] =       { 0x10000000,         0x100 },
> >      [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
> > +    [VIRT_FLASH] =       { 0x20000000,     0x2000000 },
> >      [VIRT_DRAM] =        { 0x80000000,           0x0 },
> >      [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
> >      [VIRT_PCIE_PIO] =    { 0x03000000,    0x00010000 },
> >      [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
> >  };
> >
> > +#define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
> > +
> > +static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> > +                                       const char *name,
> > +                                       const char *alias_prop_name)
> > +{
> > +    /*
> > +     * Create a single flash device.  We use the same parameters as
> > +     * the flash devices on the ARM virt board.
> > +     */
> > +    DeviceState *dev = qdev_create(NULL, TYPE_PFLASH_CFI01);
> > +
> > +    qdev_prop_set_uint64(dev, "sector-length", VIRT_FLASH_SECTOR_SIZE);
> > +    qdev_prop_set_uint8(dev, "width", 4);
> > +    qdev_prop_set_uint8(dev, "device-width", 2);
> > +    qdev_prop_set_bit(dev, "big-endian", false);
> > +    qdev_prop_set_uint16(dev, "id0", 0x89);
> > +    qdev_prop_set_uint16(dev, "id1", 0x18);
> > +    qdev_prop_set_uint16(dev, "id2", 0x00);
> > +    qdev_prop_set_uint16(dev, "id3", 0x00);
> > +    qdev_prop_set_string(dev, "name", name);
>
> alias_prop_name is unused? ARM virt has 2 more calls in the same function here.

Yep, you are right. I have removed this.

>
> > +
> > +    return PFLASH_CFI01(dev);
> > +}
> > +
> > +static void virt_flash_create(RISCVVirtState *s)
> > +{
> > +    s->flash[0] = virt_flash_create1(s, "virt.flash0", "pflash0");
> > +    s->flash[1] = virt_flash_create1(s, "virt.flash1", "pflash1");
>
> I don't think we should mirror what is used on ARM virt board to
> create 2 flash for sifive_u. For ARM virt, there are 2 flashes because
> they need distinguish secure and non-secure. For sifive_u, only one is
> enough.

I went back and forward about 1 or 2. Two seems more usable as maybe
someone wants to include two pflash files? The Xilinx machine also has
two so I'm kind of used to 2, but I'm not really fussed.

Unless anyone else wants two I will change it to 1.

Alistair

>
> > +}
> > +
> > +static void virt_flash_map1(PFlashCFI01 *flash,
> > +                            hwaddr base, hwaddr size,
> > +                            MemoryRegion *sysmem)
> > +{
> > +    DeviceState *dev = DEVICE(flash);
> > +
> > +    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
> > +    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> > +    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
> > +    qdev_init_nofail(dev);
> > +
> > +    memory_region_add_subregion(sysmem, base,
> > +                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
> > +                                                       0));
> > +}
> > +
> > +static void virt_flash_map(RISCVVirtState *s,
> > +                           MemoryRegion *sysmem)
> > +{
> > +    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
> > +    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
> > +
> > +    virt_flash_map1(s->flash[0], flashbase, flashsize,
> > +                    sysmem);
> > +    virt_flash_map1(s->flash[1], flashbase + flashsize, flashsize,
> > +                    sysmem);
> > +}
> > +
> >  static void create_pcie_irq_map(void *fdt, char *nodename,
> >                                  uint32_t plic_phandle)
> >  {
> > @@ -121,6 +182,8 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> >      char *nodename;
> >      uint32_t plic_phandle, phandle = 1;
> >      int i;
> > +    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
> > +    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
> >
> >      fdt = s->fdt = create_device_tree(&s->fdt_size);
> >      if (!fdt) {
> > @@ -316,6 +379,15 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> >          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> >      }
> >      g_free(nodename);
> > +
> > +    nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
> > +    qemu_fdt_add_subnode(s->fdt, nodename);
> > +    qemu_fdt_setprop_string(s->fdt, nodename, "compatible", "cfi-flash");
> > +    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
> > +                                 2, flashbase, 2, flashsize,
> > +                                 2, flashbase + flashsize, 2, flashsize);
> > +    qemu_fdt_setprop_cell(s->fdt, nodename, "bank-width", 4);
> > +    g_free(nodename);
> >  }
> >
> >
> > @@ -496,6 +568,15 @@ static void riscv_virt_board_init(MachineState *machine)
> >          0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
> >          serial_hd(0), DEVICE_LITTLE_ENDIAN);
> >
> > +    virt_flash_create(s);
> > +
> > +    /* Map legacy -drive if=pflash to machine properties */
> > +    for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
> > +        pflash_cfi01_legacy_drive(s->flash[i],
> > +                                  drive_get(IF_PFLASH, 0, i));
> > +    }
> > +    virt_flash_map(s, system_memory);
> > +
> >      g_free(plic_hart_config);
> >  }
> >
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index 6e5fbe5d3b..2ca8bd3512 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -21,6 +21,7 @@
> >
> >  #include "hw/riscv/riscv_hart.h"
> >  #include "hw/sysbus.h"
> > +#include "hw/block/flash.h"
> >
> >  typedef struct {
> >      /*< private >*/
> > @@ -29,6 +30,7 @@ typedef struct {
> >      /*< public >*/
> >      RISCVHartArrayState soc;
> >      DeviceState *plic;
> > +    PFlashCFI01 *flash[2];
> >      void *fdt;
> >      int fdt_size;
> >  } RISCVVirtState;
> > @@ -41,6 +43,7 @@ enum {
> >      VIRT_PLIC,
> >      VIRT_UART0,
> >      VIRT_VIRTIO,
> > +    VIRT_FLASH,
> >      VIRT_DRAM,
> >      VIRT_PCIE_MMIO,
> >      VIRT_PCIE_PIO,
> > --
>
> Regards,
> Bin

