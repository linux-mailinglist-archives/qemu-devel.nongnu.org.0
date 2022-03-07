Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684BE4CFD7F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:57:23 +0100 (CET)
Received: from localhost ([::1]:34420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBzO-0006TQ-Fe
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:57:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRBDs-0001jf-JU; Mon, 07 Mar 2022 06:08:16 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=35764
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRBDq-0004Ty-Le; Mon, 07 Mar 2022 06:08:16 -0500
Received: by mail-io1-xd2a.google.com with SMTP id s20so3184629iol.2;
 Mon, 07 Mar 2022 03:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CH4ROQP0Jn8gRzHTrF2cj/pge9GwMwt4SFzaDfpgkts=;
 b=aGnj6asijY7wH3hV2zF2jicaBsFr/dj+RlTrCYWwuukntvhZgSornqiuslQVixhSli
 vNVcsDTfrIw2ht/Rg0m4OxWOBva5a1nkxwz7Hh6BPjAN3vxzMTcPxe4mP8HYLWLUcEbU
 9Gl4Wxs3I3F/IZxAgtyCIlkXvPvjE9xiYyo4V3kg3zXCrJRKLx5Hvh7lgzAf9HJ2FNhM
 rfpv7ON8I4Kds4d59D2IuRX8YvQ7VoqNQNBdjqoHSKAqxaPZCu2xFVt8cxUun3fZ/mof
 rZJL4CGPYasKkU3rJZ2lYUhzreTMAwvAtw1QtgO9t/3etpbfdcGbUuCoYqGm6qZwYcFZ
 59Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CH4ROQP0Jn8gRzHTrF2cj/pge9GwMwt4SFzaDfpgkts=;
 b=6BxmymflUeicJDMPz4TJvz1jBwMiXXiBI71hG03FwIo9Y/C5TLcTgT5Aj/cAjQbWQ8
 ZHnITZKLb969GF9+mmdb9ZSJH0qha7oXmXU93FbHJ7RsFToCINylp4UWqy6RxWqcJrSX
 golB0/XhhLDJZsPKDIISGrmjO3Z2gd3iV/AXJVUKZoFbQyAdxGZ68Lh4BLFsZyICO3zw
 3IyhLMQ98/tdmNmK9TkkEDJCq+zmeKqC5vS2pgmBHDMvXzq6ADloOwWildDztzEFOyRx
 zHrQRVPt7+X+/KQHSkpeBddV5Vxo3VRXowhV0bzDPizHuMApYz3FTzPCqRYhgi/gYbkE
 nd5A==
X-Gm-Message-State: AOAM531oMKB5DJu4kHkeisvgFIJ+1VXmZoMyf6l+isfUYWWBh2b7ljC5
 fbmf21hMYzwW4Ag7ic00H4F2g4eyE8IiVeDQTgY=
X-Google-Smtp-Source: ABdhPJwzZlKqnXp+ncG2PnWxGOAva0UUqdNfZPx+hVcNjhzjmHz8y0S0YDipvN3iPqaRZVu1gdhsc2A38zqhXwhiB8M=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr9957195iov.93.1646651293107; Mon, 07
 Mar 2022 03:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-5-clg@kaod.org>
In-Reply-To: <20220307071856.1410731-5-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Mar 2022 21:07:47 +1000
Message-ID: <CAKmqyKPew7zz92LPSP_H3NWfNreVZUa6kaBGgTT6amovyUgGGg@mail.gmail.com>
Subject: Re: [PATCH 4/6] aspeed/smc: Rename 'max_peripherals' to 'max_cs'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 7, 2022 at 5:37 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The naming makes more sense in a SPI controller model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/ssi/aspeed_smc.h |  2 +-
>  hw/ssi/aspeed_smc.c         | 42 ++++++++++++++++++-------------------
>  2 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 4a9354e13c7f..6501a04b8f3e 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -95,7 +95,7 @@ struct AspeedSMCClass {
>      uint8_t r_timings;
>      uint8_t nregs_timings;
>      uint8_t conf_enable_w0;
> -    uint8_t max_peripherals;
> +    uint8_t max_cs;
>      const uint32_t *resets;
>      const AspeedSegments *segments;
>      uint32_t segment_addr_mask;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 6859f061c8be..f194182beacf 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -224,7 +224,7 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCS=
tate *s,
>      AspeedSegments seg;
>      int i;
>
> -    for (i =3D 0; i < asc->max_peripherals; i++) {
> +    for (i =3D 0; i < asc->max_cs; i++) {
>          if (i =3D=3D cs) {
>              continue;
>          }
> @@ -290,7 +290,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
>       */
>      if ((asc->segments =3D=3D aspeed_2500_spi1_segments ||
>           asc->segments =3D=3D aspeed_2500_spi2_segments) &&
> -        cs =3D=3D asc->max_peripherals &&
> +        cs =3D=3D asc->max_cs &&
>          seg.addr + seg.size !=3D asc->segments[cs].addr +
>          asc->segments[cs].size) {
>          aspeed_smc_error("Tried to change CS%d end address to 0x%"
> @@ -693,13 +693,13 @@ static void aspeed_smc_reset(DeviceState *d)
>      }
>
>      /* Unselect all peripherals */
> -    for (i =3D 0; i < asc->max_peripherals; ++i) {
> +    for (i =3D 0; i < asc->max_cs; ++i) {
>          s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
>          qemu_set_irq(s->cs_lines[i], true);
>      }
>
>      /* setup the default segment register values and regions for all */
> -    for (i =3D 0; i < asc->max_peripherals; ++i) {
> +    for (i =3D 0; i < asc->max_cs; ++i) {
>          aspeed_smc_flash_set_segment_region(s, i,
>                      asc->segment_to_reg(s, &asc->segments[i]));
>      }
> @@ -729,8 +729,8 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
>          (aspeed_smc_has_dma(asc) && addr =3D=3D R_DMA_LEN) ||
>          (aspeed_smc_has_dma(asc) && addr =3D=3D R_DMA_CHECKSUM) ||
>          (addr >=3D R_SEG_ADDR0 &&
> -         addr < R_SEG_ADDR0 + asc->max_peripherals) ||
> -        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peripheral=
s)) {
> +         addr < R_SEG_ADDR0 + asc->max_cs) ||
> +        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_cs)) {
>
>          trace_aspeed_smc_read(addr << 2, size, s->regs[addr]);
>
> @@ -1042,11 +1042,11 @@ static void aspeed_smc_write(void *opaque, hwaddr=
 addr, uint64_t data,
>           addr < s->r_timings + asc->nregs_timings) ||
>          addr =3D=3D s->r_ce_ctrl) {
>          s->regs[addr] =3D value;
> -    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peri=
pherals) {
> +    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_cs) =
{
>          int cs =3D addr - s->r_ctrl0;
>          aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
>      } else if (addr >=3D R_SEG_ADDR0 &&
> -               addr < R_SEG_ADDR0 + asc->max_peripherals) {
> +               addr < R_SEG_ADDR0 + asc->max_cs) {
>          int cs =3D addr - R_SEG_ADDR0;
>
>          if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
> @@ -1090,7 +1090,7 @@ static void aspeed_smc_instance_init(Object *obj)
>      AspeedSMCClass *asc =3D ASPEED_SMC_GET_CLASS(s);
>      int i;
>
> -    for (i =3D 0; i < asc->max_peripherals; i++) {
> +    for (i =3D 0; i < asc->max_cs; i++) {
>          object_initialize_child(obj, "flash[*]", &s->flashes[i],
>                                  TYPE_ASPEED_SMC_FLASH);
>      }
> @@ -1133,9 +1133,9 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
>      s->spi =3D ssi_create_bus(dev, "spi");
>
>      /* Setup cs_lines for peripherals */
> -    s->cs_lines =3D g_new0(qemu_irq, asc->max_peripherals);
> +    s->cs_lines =3D g_new0(qemu_irq, asc->max_cs);
>
> -    for (i =3D 0; i < asc->max_peripherals; ++i) {
> +    for (i =3D 0; i < asc->max_cs; ++i) {
>          sysbus_init_irq(sbd, &s->cs_lines[i]);
>      }
>
> @@ -1168,7 +1168,7 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
>       * module behind to handle the memory accesses. This depends on
>       * the board configuration.
>       */
> -    for (i =3D 0; i < asc->max_peripherals; ++i) {
> +    for (i =3D 0; i < asc->max_cs; ++i) {
>          AspeedSMCFlash *fl =3D &s->flashes[i];
>
>          if (!object_property_set_link(OBJECT(fl), "controller", OBJECT(s=
),
> @@ -1314,7 +1314,7 @@ static void aspeed_2400_smc_class_init(ObjectClass =
*klass, void *data)
>      asc->r_timings         =3D R_TIMINGS;
>      asc->nregs_timings     =3D 1;
>      asc->conf_enable_w0    =3D CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 1;
> +    asc->max_cs            =3D 1;
>      asc->segments          =3D aspeed_2400_smc_segments;
>      asc->flash_window_base =3D 0x10000000;
>      asc->flash_window_size =3D 0x6000000;
> @@ -1359,7 +1359,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass =
*klass, void *data)
>      asc->r_timings         =3D R_TIMINGS;
>      asc->nregs_timings     =3D 1;
>      asc->conf_enable_w0    =3D CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 5;
> +    asc->max_cs            =3D 5;
>      asc->segments          =3D aspeed_2400_fmc_segments;
>      asc->segment_addr_mask =3D 0xffff0000;
>      asc->resets            =3D aspeed_2400_fmc_resets;
> @@ -1401,7 +1401,7 @@ static void aspeed_2400_spi1_class_init(ObjectClass=
 *klass, void *data)
>      asc->r_timings         =3D R_SPI_TIMINGS;
>      asc->nregs_timings     =3D 1;
>      asc->conf_enable_w0    =3D SPI_CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 1;
> +    asc->max_cs            =3D 1;
>      asc->segments          =3D aspeed_2400_spi1_segments;
>      asc->flash_window_base =3D 0x30000000;
>      asc->flash_window_size =3D 0x10000000;
> @@ -1442,7 +1442,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass =
*klass, void *data)
>      asc->r_timings         =3D R_TIMINGS;
>      asc->nregs_timings     =3D 1;
>      asc->conf_enable_w0    =3D CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 3;
> +    asc->max_cs            =3D 3;
>      asc->segments          =3D aspeed_2500_fmc_segments;
>      asc->segment_addr_mask =3D 0xffff0000;
>      asc->resets            =3D aspeed_2500_fmc_resets;
> @@ -1480,7 +1480,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass=
 *klass, void *data)
>      asc->r_timings         =3D R_TIMINGS;
>      asc->nregs_timings     =3D 1;
>      asc->conf_enable_w0    =3D CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 2;
> +    asc->max_cs            =3D 2;
>      asc->segments          =3D aspeed_2500_spi1_segments;
>      asc->segment_addr_mask =3D 0xffff0000;
>      asc->flash_window_base =3D 0x30000000;
> @@ -1515,7 +1515,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass=
 *klass, void *data)
>      asc->r_timings         =3D R_TIMINGS;
>      asc->nregs_timings     =3D 1;
>      asc->conf_enable_w0    =3D CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 2;
> +    asc->max_cs            =3D 2;
>      asc->segments          =3D aspeed_2500_spi2_segments;
>      asc->segment_addr_mask =3D 0xffff0000;
>      asc->flash_window_base =3D 0x38000000;
> @@ -1597,7 +1597,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass =
*klass, void *data)
>      asc->r_timings         =3D R_TIMINGS;
>      asc->nregs_timings     =3D 1;
>      asc->conf_enable_w0    =3D CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 3;
> +    asc->max_cs            =3D 3;
>      asc->segments          =3D aspeed_2600_fmc_segments;
>      asc->segment_addr_mask =3D 0x0ff00ff0;
>      asc->resets            =3D aspeed_2600_fmc_resets;
> @@ -1636,7 +1636,7 @@ static void aspeed_2600_spi1_class_init(ObjectClass=
 *klass, void *data)
>      asc->r_timings         =3D R_TIMINGS;
>      asc->nregs_timings     =3D 2;
>      asc->conf_enable_w0    =3D CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 2;
> +    asc->max_cs            =3D 2;
>      asc->segments          =3D aspeed_2600_spi1_segments;
>      asc->segment_addr_mask =3D 0x0ff00ff0;
>      asc->flash_window_base =3D 0x30000000;
> @@ -1675,7 +1675,7 @@ static void aspeed_2600_spi2_class_init(ObjectClass=
 *klass, void *data)
>      asc->r_timings         =3D R_TIMINGS;
>      asc->nregs_timings     =3D 3;
>      asc->conf_enable_w0    =3D CONF_ENABLE_W0;
> -    asc->max_peripherals   =3D 3;
> +    asc->max_cs            =3D 3;
>      asc->segments          =3D aspeed_2600_spi2_segments;
>      asc->segment_addr_mask =3D 0x0ff00ff0;
>      asc->flash_window_base =3D 0x50000000;
> --
> 2.34.1
>
>

