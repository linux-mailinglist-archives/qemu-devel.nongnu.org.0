Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B91DA364
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 23:18:26 +0200 (CEST)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb9d3-0007WR-Q0
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 17:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jb9au-0006qp-Tv
 for qemu-devel@nongnu.org; Tue, 19 May 2020 17:16:12 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jb9at-00044X-Ct
 for qemu-devel@nongnu.org; Tue, 19 May 2020 17:16:12 -0400
Received: by mail-io1-xd41.google.com with SMTP id f3so830546ioj.1
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2STbaSQTUqLl/dn7ITABEwJ9QnawGEhuLbFdZHdg74I=;
 b=eAG2jyNQMJs3M5Ib2bEVoHfjn//ogfukB08UC/9E6JrRzgrQjo/55kXbBKwP56xdEj
 7hjijn9wRwxip6nTIFPJM2+XicVT9XRBicqoMN2DH1fedN/h1H+vOMGczLJ/k4/laM3t
 yd11fqvEf66Cnf2UCQXibR6aGgvYPpMZSmrKAXhnC39kahOoXVglPVCSIcv6X26NFtV7
 pt8picnEGQw6N0/3wkMk5nYDgoLwdBUCrVXEAAsUWO4VtMFwgbZq71uOXW7MV1LVLOhJ
 2Ir6ayht/OWSX6itM5VM9hgDpjHTC2wcqsTaRJC7CXYGyCRx08iYNYNfkVjYPL4KODZV
 MU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2STbaSQTUqLl/dn7ITABEwJ9QnawGEhuLbFdZHdg74I=;
 b=Kh/gRsH1zb9UFEa/jBPXa5ZNQZxhKftMHnKCGuhAHvYHuEsg+7cl88KZsWpNK76zUL
 2QZEQ1jf/g6Q/frXnGCp1Hk9+jspnja2RTQgbcZAMpWDzfzYtU1iF6gp5s3aUJh2SgZQ
 SgwmxyKD6MnnqKf5yPnSiUfJYk6i9g4NtOLLFE3gzYNoyrmXH2CZxDF9CbDZf72kF2ke
 M0n+QHYfGGj3zi46wlmHvCZe03F8TpkCn3Nk/m6PDJW+PBqY7pM7YekTiMdz/SGyhjxv
 VXvx8enraRCxJeOb7vBxR1DzLThnrdtEHh9DvtCMfoIbX2pliYNKlmKgqqNpXhzMPNYF
 zYxA==
X-Gm-Message-State: AOAM533Qc2O406Vxc0cCxztEKc9Vmqv2VDZ/jw3ZQtEc9KWJsC16WfET
 AikBnDbnIeIv9tIxJhz1ShxC41G+9gSaiOoCXlg=
X-Google-Smtp-Source: ABdhPJw/AJNALeLDD/hFY2knlZV5Q/3CGS86w8CS40hLexzGNRUaIJLh4j5Eymt3Br2ZKnLZpA0OcKb38vkaOu+cEYI=
X-Received: by 2002:a6b:bf83:: with SMTP id p125mr886158iof.118.1589922970149; 
 Tue, 19 May 2020 14:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200519145551.22836-1-armbru@redhat.com>
 <20200519145551.22836-23-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-23-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 May 2020 14:07:17 -0700
Message-ID: <CAKmqyKOY_jhm--p2GErGQo18+fF=Nzo3t+pFuFa-MNyO7ZzFhA@mail.gmail.com>
Subject: Re: [PATCH 22/55] ssi: Convert uses of ssi_create_slave_no_init()
 with Coccinelle
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 19, 2020 at 8:19 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Replace
>
>     dev = ssi_create_slave_no_init(bus, type_name);
>     ...
>     qdev_init_nofail(dev);
>
> by
>
>     dev = qdev_new(type_name);
>     ...
>     qdev_realize_and_unref(dev, bus, &error_fatal);
>
> Recent commit "qdev: New qdev_new(), qdev_realize(), etc." explains
> why.
>
>     @@
>     type SSIBus;
>     identifier bus;
>     expression dev, qbus, expr;
>     expression list args;
>     @@
>     -    bus = (SSIBus *)qbus;
>     +    bus = qbus; // TODO fix up decl
>          ...
>     -    dev = ssi_create_slave_no_init(bus, args);
>     +    dev = qdev_new(args);
>          ... when != dev = expr
>     -    qdev_init_nofail(dev);
>     +    qdev_realize_and_unref(dev, bus, &error_fatal);
>
>     @@
>     expression dev, bus, expr;
>     expression list args;
>     @@
>     -    dev = ssi_create_slave_no_init(bus, args);
>     +    dev = qdev_new(args);
>          ... when != dev = expr
>     -    qdev_init_nofail(dev);
>     +    qdev_realize_and_unref(dev, BUS(bus), &error_fatal);
>
> Bus declarations fixed up manually.
>
> Cc: Alistair Francis <alistair@alistair23.me>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/aspeed.c                     |  4 ++--
>  hw/arm/msf2-som.c                   |  8 ++++----
>  hw/arm/sabrelite.c                  |  4 ++--
>  hw/arm/xilinx_zynq.c                |  4 ++--
>  hw/arm/xlnx-zcu102.c                | 16 ++++++++--------
>  hw/microblaze/petalogix_ml605_mmu.c |  4 ++--
>  6 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c425c01e06..adbfbbd6b4 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -225,12 +225,12 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>          DriveInfo *dinfo = drive_get_next(IF_MTD);
>          qemu_irq cs_line;
>
> -        fl->flash = ssi_create_slave_no_init(s->spi, flashtype);
> +        fl->flash = qdev_new(flashtype);
>          if (dinfo) {
>              qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(dinfo),
>                                  errp);
>          }
> -        qdev_init_nofail(fl->flash);
> +        qdev_realize_and_unref(fl->flash, BUS(s->spi), &error_fatal);
>
>          cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
>          sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index e398703742..ca9cbe1acb 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -47,7 +47,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      DriveInfo *dinfo = drive_get_next(IF_MTD);
>      qemu_irq cs_line;
> -    SSIBus *spi_bus;
> +    BusState *spi_bus;
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *ddr = g_new(MemoryRegion, 1);
>
> @@ -82,14 +82,14 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
>      soc = MSF2_SOC(dev);
>
>      /* Attach SPI flash to SPI0 controller */
> -    spi_bus = (SSIBus *)qdev_get_child_bus(dev, "spi0");
> -    spi_flash = ssi_create_slave_no_init(spi_bus, "s25sl12801");
> +    spi_bus = qdev_get_child_bus(dev, "spi0");
> +    spi_flash = qdev_new("s25sl12801");
>      qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
>      if (dinfo) {
>          qdev_prop_set_drive(spi_flash, "drive", blk_by_legacy_dinfo(dinfo),
>                                      &error_fatal);
>      }
> -    qdev_init_nofail(spi_flash);
> +    qdev_realize_and_unref(spi_flash, spi_bus, &error_fatal);
>      cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
>
> diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
> index 6f0e233d77..dfd6643822 100644
> --- a/hw/arm/sabrelite.c
> +++ b/hw/arm/sabrelite.c
> @@ -80,13 +80,13 @@ static void sabrelite_init(MachineState *machine)
>                  qemu_irq cs_line;
>                  DriveInfo *dinfo = drive_get_next(IF_MTD);
>
> -                flash_dev = ssi_create_slave_no_init(spi_bus, "sst25vf016b");
> +                flash_dev = qdev_new("sst25vf016b");
>                  if (dinfo) {
>                      qdev_prop_set_drive(flash_dev, "drive",
>                                          blk_by_legacy_dinfo(dinfo),
>                                          &error_fatal);
>                  }
> -                qdev_init_nofail(flash_dev);
> +                qdev_realize_and_unref(flash_dev, BUS(spi_bus), &error_fatal);
>
>                  cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
>                  sysbus_connect_irq(SYS_BUS_DEVICE(spi_dev), 1, cs_line);
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 5fbd2b2e31..0e0f0976c4 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -157,12 +157,12 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
>
>          for (j = 0; j < num_ss; ++j) {
>              DriveInfo *dinfo = drive_get_next(IF_MTD);
> -            flash_dev = ssi_create_slave_no_init(spi, "n25q128");
> +            flash_dev = qdev_new("n25q128");
>              if (dinfo) {
>                  qdev_prop_set_drive(flash_dev, "drive",
>                                      blk_by_legacy_dinfo(dinfo), &error_fatal);
>              }
> -            qdev_init_nofail(flash_dev);
> +            qdev_realize_and_unref(flash_dev, BUS(spi), &error_fatal);
>
>              cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
>              sysbus_connect_irq(busdev, i * num_ss + j + 1, cs_line);
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 4229b2d936..77c84b82ab 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -149,21 +149,21 @@ static void xlnx_zcu102_init(MachineState *machine)
>      }
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
> -        SSIBus *spi_bus;
> +        BusState *spi_bus;
>          DeviceState *flash_dev;
>          qemu_irq cs_line;
>          DriveInfo *dinfo = drive_get_next(IF_MTD);
>          gchar *bus_name = g_strdup_printf("spi%d", i);
>
> -        spi_bus = (SSIBus *)qdev_get_child_bus(DEVICE(&s->soc), bus_name);
> +        spi_bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
>          g_free(bus_name);
>
> -        flash_dev = ssi_create_slave_no_init(spi_bus, "sst25wf080");
> +        flash_dev = qdev_new("sst25wf080");
>          if (dinfo) {
>              qdev_prop_set_drive(flash_dev, "drive", blk_by_legacy_dinfo(dinfo),
>                                  &error_fatal);
>          }
> -        qdev_init_nofail(flash_dev);
> +        qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
>
>          cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
>
> @@ -171,22 +171,22 @@ static void xlnx_zcu102_init(MachineState *machine)
>      }
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_FLASH; i++) {
> -        SSIBus *spi_bus;
> +        BusState *spi_bus;
>          DeviceState *flash_dev;
>          qemu_irq cs_line;
>          DriveInfo *dinfo = drive_get_next(IF_MTD);
>          int bus = i / XLNX_ZYNQMP_NUM_QSPI_BUS_CS;
>          gchar *bus_name = g_strdup_printf("qspi%d", bus);
>
> -        spi_bus = (SSIBus *)qdev_get_child_bus(DEVICE(&s->soc), bus_name);
> +        spi_bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
>          g_free(bus_name);
>
> -        flash_dev = ssi_create_slave_no_init(spi_bus, "n25q512a11");
> +        flash_dev = qdev_new("n25q512a11");
>          if (dinfo) {
>              qdev_prop_set_drive(flash_dev, "drive", blk_by_legacy_dinfo(dinfo),
>                                  &error_fatal);
>          }
> -        qdev_init_nofail(flash_dev);
> +        qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
>
>          cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
>
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
> index 2e7a3fa119..d4bfa233c9 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -186,12 +186,12 @@ petalogix_ml605_init(MachineState *machine)
>              DriveInfo *dinfo = drive_get_next(IF_MTD);
>              qemu_irq cs_line;
>
> -            dev = ssi_create_slave_no_init(spi, "n25q128");
> +            dev = qdev_new("n25q128");
>              if (dinfo) {
>                  qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
>                                      &error_fatal);
>              }
> -            qdev_init_nofail(dev);
> +            qdev_realize_and_unref(dev, BUS(spi), &error_fatal);
>
>              cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>              sysbus_connect_irq(busdev, i+1, cs_line);
> --
> 2.21.1
>
>

