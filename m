Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021892729B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 00:50:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTa4D-0000Oq-1C
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 18:50:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hTa2q-0008Ka-3e
	for qemu-devel@nongnu.org; Wed, 22 May 2019 18:49:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hTa2n-0003HE-MR
	for qemu-devel@nongnu.org; Wed, 22 May 2019 18:49:12 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:34402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hTa2n-0003FS-9y; Wed, 22 May 2019 18:49:09 -0400
Received: by mail-lf1-x143.google.com with SMTP id v18so2929146lfi.1;
	Wed, 22 May 2019 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RIMc85N6rhaq18c4x7fNSLfa1/l9Qg722/3bwnkkgDI=;
	b=VHcvMrqd9SX8GY8FreTQZLK5FgQd5ZeFMJZJ5lDTn4mrruvj2+mKGHGZX3xW39RtHZ
	5KjTsg7JUa1hJxlqo74JvdcJmkd/67B/wREu96J8V7noRH0M7lgf3rVQGRuz8UihTw35
	uyi8a2229cylhuj+jvFOERPafgGzDqFpUFyAqbVba1sMPgzUpaDXLqe4FZxph79NUdS+
	iv3NtRJ9PpdbNcPntGKi92NYBwRtZlY7XrU4VHbAsCj1H7IlIZtj2lt3hPzCExbUVeYf
	n3vjd5mLZGOaR3I/cv8Ifr//CTMDJzzZIoeNuxCii9SzBhAXPCacxlkCMdFs+QZh40PT
	PjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RIMc85N6rhaq18c4x7fNSLfa1/l9Qg722/3bwnkkgDI=;
	b=ICJVmH/OFM6NoVtUocwBQ7Gau2SN6IByqLjMcvTag3vahyHTNEPBWaaTggK409CXzF
	Vewe68MNZ0RBm5MjLLFU2AgBjjWGJy6kw21Acr4FO+GO/tpvMlvzf/G6+91yWuToK1Sv
	3OdIj+9GXS/BlDoafmitsxcB/A2cgA7hBsqEGaJxxZ/qeF85y5B6XLgsXY7F8qP/w2pN
	JfKMex+zqYBrHesb24/R7YbLkTWYzpvU4GSo32M60IiGUWSuVuSMnQcqhS3XdMT2z79N
	X9uar88jYBYCKSw+3LbQkHBLhq3ggMTVs7AKRtqlYxeXbS6T/FxIBFTjMKaNWyqF+LbF
	4d3w==
X-Gm-Message-State: APjAAAV9cgHIXuD3yUICks5UvBK1+iy0VMj6g6PpowZMht098hC1AfEj
	rdZolHhhUpiwG+DZJNTffuY0L559ZzA08ruJcFI=
X-Google-Smtp-Source: APXvYqz5FYtMxm7Cwm3dcAIihsvJ+xmxIVr1+36fX+0qFAVifIV7yFxBREgSxLMo5vvGUXj9Hyy2LBnUhEeB79Bhp0Y=
X-Received: by 2002:a19:4cd5:: with SMTP id z204mr76150lfa.113.1558565345275; 
	Wed, 22 May 2019 15:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190520214342.13709-1-philmd@redhat.com>
	<20190520214342.13709-5-philmd@redhat.com>
In-Reply-To: <20190520214342.13709-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 May 2019 15:46:47 -0700
Message-ID: <CAKmqyKPdmwF0+T4t6LyUMgoujoRvrXZFLhxsqwGZdW9vDqWVTA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-devel] [PATCH 4/4] hw/arm/exynos4210: QOM'ify the
 Exynos4210 SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 20, 2019 at 2:47 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/exynos4210.c         | 26 +++++++++++++++++++++++---
>  hw/arm/exynos4_boards.c     |  9 ++++++---
>  include/hw/arm/exynos4210.h |  9 +++++++--
>  3 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 19009b76e7c..0b09129eff8 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -178,9 +178,10 @@ static void pl330_create(uint32_t base, qemu_irq irq=
, int nreq)
>      sysbus_connect_irq(busdev, 0, irq);
>  }
>
> -Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
> +static void exynos4210_realize(DeviceState *socdev, Error **errp)
>  {
> -    Exynos4210State *s =3D g_new0(Exynos4210State, 1);
> +    Exynos4210State *s =3D EXYNOS4210_SOC(socdev);
> +    MemoryRegion *system_mem =3D get_system_memory();
>      qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
>      SysBusDevice *busdev;
>      DeviceState *dev;
> @@ -435,6 +436,25 @@ Exynos4210State *exynos4210_init(MemoryRegion *syste=
m_mem)
>                   qemu_irq_invert(s->irq_table[exynos4210_get_irq(36, 1)]=
), 32);
>      pl330_create(EXYNOS4210_PL330_BASE2_ADDR,
>                   qemu_irq_invert(s->irq_table[exynos4210_get_irq(34, 1)]=
), 1);
> +}
> +
> +static void exynos4210_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>
> -    return s;
> +    dc->realize =3D exynos4210_realize;
>  }
> +
> +static const TypeInfo exynos4210_info =3D {
> +    .name =3D TYPE_EXYNOS4210_SOC,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(Exynos4210State),
> +    .class_init =3D exynos4210_class_init,
> +};
> +
> +static void exynos4210_register_types(void)
> +{
> +    type_register_static(&exynos4210_info);
> +}
> +
> +type_init(exynos4210_register_types)
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index f824eef0d36..700e90d6671 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -45,7 +45,7 @@ typedef enum Exynos4BoardType {
>  } Exynos4BoardType;
>
>  typedef struct Exynos4BoardState {
> -    Exynos4210State *soc;
> +    Exynos4210State soc;
>      MemoryRegion dram0_mem;
>      MemoryRegion dram1_mem;
>  } Exynos4BoardState;
> @@ -130,7 +130,10 @@ exynos4_boards_init_common(MachineState *machine,
>      exynos4_boards_init_ram(s, get_system_memory(),
>                              exynos4_board_ram_size[board_type]);
>
> -    s->soc =3D exynos4210_init(get_system_memory());
> +    object_initialize(&s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
> +    qdev_set_parent_bus(DEVICE(&s->soc), sysbus_get_default());
> +    object_property_set_bool(OBJECT(&s->soc), true, "realized",
> +                             &error_fatal);
>
>      return s;
>  }
> @@ -148,7 +151,7 @@ static void smdkc210_init(MachineState *machine)
>                                                        EXYNOS4_BOARD_SMDK=
C210);
>
>      lan9215_init(SMDK_LAN9118_BASE_ADDR,
> -            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]=
));
> +            qemu_irq_invert(s->soc.irq_table[exynos4210_get_irq(37, 1)])=
);
>      arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
>  }
>
> diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
> index 098a69ec73d..27c684e851d 100644
> --- a/include/hw/arm/exynos4210.h
> +++ b/include/hw/arm/exynos4210.h
> @@ -85,6 +85,9 @@ typedef struct Exynos4210Irq {
>  } Exynos4210Irq;
>
>  typedef struct Exynos4210State {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
>      ARMCPU *cpu[EXYNOS4210_NCPUS];
>      Exynos4210Irq irqs;
>      qemu_irq *irq_table;
> @@ -98,11 +101,13 @@ typedef struct Exynos4210State {
>      I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
>  } Exynos4210State;
>
> +#define TYPE_EXYNOS4210_SOC "exynos4210"
> +#define EXYNOS4210_SOC(obj) \
> +    OBJECT_CHECK(Exynos4210State, obj, TYPE_EXYNOS4210_SOC)
> +
>  void exynos4210_write_secondary(ARMCPU *cpu,
>          const struct arm_boot_info *info);
>
> -Exynos4210State *exynos4210_init(MemoryRegion *system_mem);
> -
>  /* Initialize exynos4210 IRQ subsystem stub */
>  qemu_irq *exynos4210_init_irq(Exynos4210Irq *env);
>
> --
> 2.20.1
>
>

