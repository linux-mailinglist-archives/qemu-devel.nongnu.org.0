Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08BB8878E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 03:52:00 +0200 (CEST)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwGY4-0006nD-0C
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 21:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48417)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwGXb-0006Mo-1H
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 21:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwGXZ-0000uZ-Ia
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 21:51:30 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:45561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwGXZ-0000u3-AP; Fri, 09 Aug 2019 21:51:29 -0400
Received: by mail-lj1-x243.google.com with SMTP id t3so5131487ljj.12;
 Fri, 09 Aug 2019 18:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qqvOiGTJSrTLmqPybsLpvU7Oe2XJr0tNCiiLqQo/Y8Y=;
 b=QlJ8JqQnjuRaErZ4Nd6IRBjjhXQ3KzRxMakUIRwHj4qdGySIjLFw3opIxdZG0eSB+6
 EnH8lwzJfRx0T3ciZP40DHX8q3byCBUFDQ4lKOuUD1gpk3cSLHk7f/PwucJes1aMPmZ3
 FxvekiWwckzoCetZHro6spQesNYNfv7Q9kLvzLqSVqZveKZi2LJ4KzxN3oQmQpHBOwWe
 HVtxiAANkNL03eGnc5Xjusrcs4EOlY+zIcycB25kBLWrl0YV4QUiCVDPuhQnA7HaSBdJ
 k2gwnPuwqr39DjBzMf/lVQjHnvnUF4MVJBnm9JgKtxBSR0Pg/CvtTZ5Wr+6+Je/rJbsG
 dAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqvOiGTJSrTLmqPybsLpvU7Oe2XJr0tNCiiLqQo/Y8Y=;
 b=OdYQlUdkq2dndE5rR2r1SdVBUZ4S+s/oQzcA0JtPXtkYeVcTx+ajcMiAMGVQrGghox
 0tf/yRjjl4iKf86X5jfkt+IEpOlSQFB5qlY7a8iNyN0E77de+79V0KJuobWCTgOy13vb
 tnduwMq4oKLOYR7W1ve2n0Vm4MxzvB0G/USU2UquF8yMMIoKYZEQMHMFoJldAiwFCz2C
 ORgHpqfdwJL6JdyxtzyPX1bIMix1y29wTWEYqI50tYonxlaWgrc9MQzCdsPK/+NOaITz
 xCczZ5WLN685uzpyJRLkq5WSkh2njhX0UydQLrhVQOcpYww19YJrKn/R3V9dDrX1Qdmw
 QEPA==
X-Gm-Message-State: APjAAAXPF8bKecb6rqK/+gUxDR5p0YnhBF2PvcKkkRsvuXBK0MriPi85
 4ORTJDXwLCf6IoUXH2kobTpsl1seImwrHnXgB/I=
X-Google-Smtp-Source: APXvYqyMO2GYxH2yCmAXY0VuxLTal/OzA6DRSzozV5jTO1oAn1rpdJRq6XfcEABlI+dNci+cQUwRTvrhytqbj7qjuJo=
X-Received: by 2002:a2e:9758:: with SMTP id f24mr13067613ljj.58.1565401887977; 
 Fri, 09 Aug 2019 18:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-12-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565163924-18621-12-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Aug 2019 18:51:01 -0700
Message-ID: <CAKmqyKOH-M5UK3EDpzpK3yQPSzvu+tafDiMk0FNx8KmLQktk+Q@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 11/28] riscv: sifive: Rename
 sifive_prci.{c, h} to sifive_e_prci.{c, h}
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 7, 2019 at 12:49 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Current SiFive PRCI model only works with sifive_e machine, as it
> only emulates registers or PRCI block in the FE310 SoC.
>
> Rename the file name to make it clear that it is for sifive_e.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
> Changes in v2: None
>
>  hw/riscv/Makefile.objs                              |  2 +-
>  hw/riscv/sifive_e.c                                 |  4 ++--
>  hw/riscv/{sifive_prci.c => sifive_e_prci.c}         | 14 +++++++-------
>  include/hw/riscv/{sifive_prci.h => sifive_e_prci.h} | 14 +++++++-------
>  4 files changed, 17 insertions(+), 17 deletions(-)
>  rename hw/riscv/{sifive_prci.c => sifive_e_prci.c} (90%)
>  rename include/hw/riscv/{sifive_prci.h => sifive_e_prci.h} (82%)
>
> diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> index eb9d4f9..c859697 100644
> --- a/hw/riscv/Makefile.objs
> +++ b/hw/riscv/Makefile.objs
> @@ -2,9 +2,9 @@ obj-y += boot.o
>  obj-$(CONFIG_SPIKE) += riscv_htif.o
>  obj-$(CONFIG_HART) += riscv_hart.o
>  obj-$(CONFIG_SIFIVE_E) += sifive_e.o
> +obj-$(CONFIG_SIFIVE_E) += sifive_e_prci.o
>  obj-$(CONFIG_SIFIVE) += sifive_clint.o
>  obj-$(CONFIG_SIFIVE) += sifive_gpio.o
> -obj-$(CONFIG_SIFIVE) += sifive_prci.o
>  obj-$(CONFIG_SIFIVE) += sifive_plic.o
>  obj-$(CONFIG_SIFIVE) += sifive_test.o
>  obj-$(CONFIG_SIFIVE_U) += sifive_u.o
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 2a499d8..2d67670 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -41,9 +41,9 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_plic.h"
>  #include "hw/riscv/sifive_clint.h"
> -#include "hw/riscv/sifive_prci.h"
>  #include "hw/riscv/sifive_uart.h"
>  #include "hw/riscv/sifive_e.h"
> +#include "hw/riscv/sifive_e_prci.h"
>  #include "hw/riscv/boot.h"
>  #include "chardev/char.h"
>  #include "sysemu/arch_init.h"
> @@ -174,7 +174,7 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
>      sifive_mmio_emulate(sys_mem, "riscv.sifive.e.aon",
>          memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
> -    sifive_prci_create(memmap[SIFIVE_E_PRCI].base);
> +    sifive_e_prci_create(memmap[SIFIVE_E_PRCI].base);
>
>      /* GPIO */
>
> diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_e_prci.c
> similarity index 90%
> rename from hw/riscv/sifive_prci.c
> rename to hw/riscv/sifive_e_prci.c
> index f406682..acb914d 100644
> --- a/hw/riscv/sifive_prci.c
> +++ b/hw/riscv/sifive_e_prci.c
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt)
> + * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt)
>   *
>   * Copyright (c) 2017 SiFive, Inc.
>   *
> @@ -22,7 +22,7 @@
>  #include "hw/sysbus.h"
>  #include "qemu/module.h"
>  #include "target/riscv/cpu.h"
> -#include "hw/riscv/sifive_prci.h"
> +#include "hw/riscv/sifive_e_prci.h"
>
>  static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> @@ -82,10 +82,10 @@ static const MemoryRegionOps sifive_prci_ops = {
>
>  static void sifive_prci_init(Object *obj)
>  {
> -    SiFivePRCIState *s = SIFIVE_PRCI(obj);
> +    SiFivePRCIState *s = SIFIVE_E_PRCI(obj);

Should we not rename the struct as well?

Alistair

>
>      memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
> -                          TYPE_SIFIVE_PRCI, 0x8000);
> +                          TYPE_SIFIVE_E_PRCI, 0x8000);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>
>      s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
> @@ -97,7 +97,7 @@ static void sifive_prci_init(Object *obj)
>  }
>
>  static const TypeInfo sifive_prci_info = {
> -    .name          = TYPE_SIFIVE_PRCI,
> +    .name          = TYPE_SIFIVE_E_PRCI,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(SiFivePRCIState),
>      .instance_init = sifive_prci_init,
> @@ -114,9 +114,9 @@ type_init(sifive_prci_register_types)
>  /*
>   * Create PRCI device.
>   */
> -DeviceState *sifive_prci_create(hwaddr addr)
> +DeviceState *sifive_e_prci_create(hwaddr addr)
>  {
> -    DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_PRCI);
> +    DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_E_PRCI);
>      qdev_init_nofail(dev);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>      return dev;
> diff --git a/include/hw/riscv/sifive_prci.h b/include/hw/riscv/sifive_e_prci.h
> similarity index 82%
> rename from include/hw/riscv/sifive_prci.h
> rename to include/hw/riscv/sifive_e_prci.h
> index bd51c4a..7932fe7 100644
> --- a/include/hw/riscv/sifive_prci.h
> +++ b/include/hw/riscv/sifive_e_prci.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt) interface
> + * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt) interface
>   *
>   * Copyright (c) 2017 SiFive, Inc.
>   *
> @@ -16,8 +16,8 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#ifndef HW_SIFIVE_PRCI_H
> -#define HW_SIFIVE_PRCI_H
> +#ifndef HW_SIFIVE_E_PRCI_H
> +#define HW_SIFIVE_E_PRCI_H
>
>  enum {
>      SIFIVE_PRCI_HFROSCCFG   = 0x0,
> @@ -47,10 +47,10 @@ enum {
>      SIFIVE_PRCI_PLLOUTDIV_DIV1  = (1 << 8)
>  };
>
> -#define TYPE_SIFIVE_PRCI "riscv.sifive.prci"
> +#define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
>
> -#define SIFIVE_PRCI(obj) \
> -    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_PRCI)
> +#define SIFIVE_E_PRCI(obj) \
> +    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_E_PRCI)
>
>  typedef struct SiFivePRCIState {
>      /*< private >*/
> @@ -64,6 +64,6 @@ typedef struct SiFivePRCIState {
>      uint32_t plloutdiv;
>  } SiFivePRCIState;
>
> -DeviceState *sifive_prci_create(hwaddr addr);
> +DeviceState *sifive_e_prci_create(hwaddr addr);
>
>  #endif
> --
> 2.7.4
>
>

