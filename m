Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319BF66B5B8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 03:49:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHFYV-00085q-2Z; Sun, 15 Jan 2023 21:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFYS-00084d-NZ; Sun, 15 Jan 2023 21:49:00 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFYQ-0000PE-LO; Sun, 15 Jan 2023 21:49:00 -0500
Received: by mail-vs1-xe32.google.com with SMTP id d66so15338067vsd.9;
 Sun, 15 Jan 2023 18:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDIUpumaRud4TSL3Rzqc8YTQU2bmATKtwd+TLtpjfXo=;
 b=GiGFyfzOhpe9EQg1F3O0/MqHIhJImLov5TRi28L0TC5oUS6XCyN2+5UoXOPla8zKwa
 2zGd5w8S6/f8VWvJFXceE8f8uCZnRe2t7P91GuEnsrvJ0fnKPILQe7SJX8bO3sRPSN60
 tlhIRz7eH8jsTtBZC0q/QeJGdzI9ZAwDCA1U0PIipGr8qj7uGmhxxWqslhEiK89GkeoS
 WDoSQLbQhesHvPmkpqwVCfDxejan0td7FGHucgOgfqjkwSCu5uUIK5+Rm5WRBhKyK1m7
 jKmiNKR7u8lkJXL6YFzJYGEh1EpfWJqqW1RK54reYZNn9F+n4uaSsBc4U0lLyTu8PuJ1
 BtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDIUpumaRud4TSL3Rzqc8YTQU2bmATKtwd+TLtpjfXo=;
 b=AcBzARZa9Grqv73bkwFZAjUb22C/5lEOLuMTTjhHMqrYnA6hZ2/kCPyQNZsltLbn//
 WmpEyH+kv2ym4tx6tr+khe+GIZZma2t6fGQykThns4ZHel1dqw9Q9q0D4SyU0UHMWkx1
 9z+dhvTvRpGQs95ijJDudnBLgtL9MDQAHk93EI3P3TLGcMbQwfSwdXgcpJHWIJaAUfLR
 uBQmZsXaY2mzNKdPKSCGRBqDqHZIzdKbydZRQOH7Gb6u+t62jNJ1+YG05Y0qVHtYnZmE
 E+kVOWRiz1WDmJxZBMW4XjJpeAULYVzz82tpCGj5ztaL/1pbQ2qp4vqwC6UK6rPrZ2bK
 bryw==
X-Gm-Message-State: AFqh2kqWPOZvTeWhCMG/0S0JhUpKtgojg8HtUIOPCB9GRNPTbKriO6Dg
 SXdGO4MAi2aN3kMJxzYj8withL8aiAHTQizTtso=
X-Google-Smtp-Source: AMrXdXsunv1YfOoSeRNqNrl0srCXjlPsfAJxfym/TtrpXTWTzhLfpCPlq+VzjgL5X5MDn3FxBjTmk6ffzBLdg+OjOLI=
X-Received: by 2002:a67:e052:0:b0:3d0:c2e9:cb77 with SMTP id
 n18-20020a67e052000000b003d0c2e9cb77mr3001266vsl.54.1673837336497; Sun, 15
 Jan 2023 18:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20230113200138.52869-1-philmd@linaro.org>
 <20230113200138.52869-5-philmd@linaro.org>
In-Reply-To: <20230113200138.52869-5-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 12:48:30 +1000
Message-ID: <CAKmqyKN9Hggf9Gv8UPnXH5ra+xVOfOA=POOPdvYnNHhoZHW9iw@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw: Replace qemu_or_irq typedef by OrIRQState
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Jan 14, 2023 at 6:04 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> OBJECT_DECLARE_SIMPLE_TYPE() macro provides the OrIRQState
> declaration for free. Besides, the QOM code style is to use
> the structure name as typedef, and QEMU style is to use Camel
> Case, so rename qemu_or_irq as OrIRQState.
>
> Mechanical change using:
>
>   $ sed -i -e 's/qemu_or_irq/OrIRQState/g' $(git grep -l qemu_or_irq)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/exynos4210.c                  |  4 ++--
>  hw/arm/mps2-tz.c                     |  2 +-
>  hw/core/or-irq.c                     | 18 +++++++++---------
>  hw/pci-host/raven.c                  |  2 +-
>  include/hw/arm/armsse.h              |  6 +++---
>  include/hw/arm/bcm2835_peripherals.h |  2 +-
>  include/hw/arm/exynos4210.h          |  4 ++--
>  include/hw/arm/stm32f205_soc.h       |  2 +-
>  include/hw/arm/stm32f405_soc.h       |  2 +-
>  include/hw/arm/xlnx-versal.h         |  6 +++---
>  include/hw/arm/xlnx-zynqmp.h         |  2 +-
>  include/hw/or-irq.h                  |  2 --
>  12 files changed, 25 insertions(+), 27 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 8dafa2215b..6f2dda13f6 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -507,7 +507,7 @@ static uint64_t exynos4210_calc_affinity(int cpu)
>      return (0x9 << ARM_AFF1_SHIFT) | cpu;
>  }
>
> -static DeviceState *pl330_create(uint32_t base, qemu_or_irq *orgate,
> +static DeviceState *pl330_create(uint32_t base, OrIRQState *orgate,
>                                   qemu_irq irq, int nreq, int nevents, in=
t width)
>  {
>      SysBusDevice *busdev;
> @@ -806,7 +806,7 @@ static void exynos4210_init(Object *obj)
>
>      for (i =3D 0; i < ARRAY_SIZE(s->pl330_irq_orgate); i++) {
>          char *name =3D g_strdup_printf("pl330-irq-orgate%d", i);
> -        qemu_or_irq *orgate =3D &s->pl330_irq_orgate[i];
> +        OrIRQState *orgate =3D &s->pl330_irq_orgate[i];
>
>          object_initialize_child(obj, name, orgate, TYPE_OR_IRQ);
>          g_free(name);
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 284c09c91d..07aecd9497 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -152,7 +152,7 @@ struct MPS2TZMachineState {
>      TZMSC msc[4];
>      CMSDKAPBUART uart[6];
>      SplitIRQ sec_resp_splitter;
> -    qemu_or_irq uart_irq_orgate;
> +    OrIRQState uart_irq_orgate;
>      DeviceState *lan9118;
>      SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ_MAX];
>      Clock *sysclk;
> diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
> index d8f3754e96..1df4bc05a7 100644
> --- a/hw/core/or-irq.c
> +++ b/hw/core/or-irq.c
> @@ -31,7 +31,7 @@
>
>  static void or_irq_handler(void *opaque, int n, int level)
>  {
> -    qemu_or_irq *s =3D OR_IRQ(opaque);
> +    OrIRQState *s =3D OR_IRQ(opaque);
>      int or_level =3D 0;
>      int i;
>
> @@ -46,7 +46,7 @@ static void or_irq_handler(void *opaque, int n, int lev=
el)
>
>  static void or_irq_reset(DeviceState *dev)
>  {
> -    qemu_or_irq *s =3D OR_IRQ(dev);
> +    OrIRQState *s =3D OR_IRQ(dev);
>      int i;
>
>      for (i =3D 0; i < MAX_OR_LINES; i++) {
> @@ -56,7 +56,7 @@ static void or_irq_reset(DeviceState *dev)
>
>  static void or_irq_realize(DeviceState *dev, Error **errp)
>  {
> -    qemu_or_irq *s =3D OR_IRQ(dev);
> +    OrIRQState *s =3D OR_IRQ(dev);
>
>      assert(s->num_lines <=3D MAX_OR_LINES);
>
> @@ -65,7 +65,7 @@ static void or_irq_realize(DeviceState *dev, Error **er=
rp)
>
>  static void or_irq_init(Object *obj)
>  {
> -    qemu_or_irq *s =3D OR_IRQ(obj);
> +    OrIRQState *s =3D OR_IRQ(obj);
>
>      qdev_init_gpio_out(DEVICE(obj), &s->out_irq, 1);
>  }
> @@ -84,7 +84,7 @@ static void or_irq_init(Object *obj)
>
>  static bool vmstate_extras_needed(void *opaque)
>  {
> -    qemu_or_irq *s =3D OR_IRQ(opaque);
> +    OrIRQState *s =3D OR_IRQ(opaque);
>
>      return s->num_lines >=3D OLD_MAX_OR_LINES;
>  }
> @@ -95,7 +95,7 @@ static const VMStateDescription vmstate_or_irq_extras =
=3D {
>      .minimum_version_id =3D 1,
>      .needed =3D vmstate_extras_needed,
>      .fields =3D (VMStateField[]) {
> -        VMSTATE_VARRAY_UINT16_UNSAFE(levels, qemu_or_irq, num_lines, 0,
> +        VMSTATE_VARRAY_UINT16_UNSAFE(levels, OrIRQState, num_lines, 0,
>                                       vmstate_info_bool, bool),
>          VMSTATE_END_OF_LIST(),
>      },
> @@ -106,7 +106,7 @@ static const VMStateDescription vmstate_or_irq =3D {
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
>      .fields =3D (VMStateField[]) {
> -        VMSTATE_BOOL_SUB_ARRAY(levels, qemu_or_irq, 0, OLD_MAX_OR_LINES)=
,
> +        VMSTATE_BOOL_SUB_ARRAY(levels, OrIRQState, 0, OLD_MAX_OR_LINES),
>          VMSTATE_END_OF_LIST(),
>      },
>      .subsections =3D (const VMStateDescription*[]) {
> @@ -116,7 +116,7 @@ static const VMStateDescription vmstate_or_irq =3D {
>  };
>
>  static Property or_irq_properties[] =3D {
> -    DEFINE_PROP_UINT16("num-lines", qemu_or_irq, num_lines, 1),
> +    DEFINE_PROP_UINT16("num-lines", OrIRQState, num_lines, 1),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -136,7 +136,7 @@ static void or_irq_class_init(ObjectClass *klass, voi=
d *data)
>  static const TypeInfo or_irq_type_info =3D {
>     .name =3D TYPE_OR_IRQ,
>     .parent =3D TYPE_DEVICE,
> -   .instance_size =3D sizeof(qemu_or_irq),
> +   .instance_size =3D sizeof(OrIRQState),
>     .instance_init =3D or_irq_init,
>     .class_init =3D or_irq_class_init,
>  };
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index 2c96ddf8fe..5e0a5b9303 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -60,7 +60,7 @@ DECLARE_INSTANCE_CHECKER(PREPPCIState, RAVEN_PCI_HOST_B=
RIDGE,
>  struct PRePPCIState {
>      PCIHostState parent_obj;
>
> -    qemu_or_irq *or_irq;
> +    OrIRQState *or_irq;
>      qemu_irq pci_irqs[PCI_NUM_PINS];
>      PCIBus pci_bus;
>      AddressSpace pci_io_as;
> diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
> index 9648e7a419..cd0931d0a0 100644
> --- a/include/hw/arm/armsse.h
> +++ b/include/hw/arm/armsse.h
> @@ -155,12 +155,12 @@ struct ARMSSE {
>      TZPPC apb_ppc[NUM_INTERNAL_PPCS];
>      TZMPC mpc[IOTS_NUM_MPC];
>      CMSDKAPBTimer timer[3];
> -    qemu_or_irq ppc_irq_orgate;
> +    OrIRQState ppc_irq_orgate;
>      SplitIRQ sec_resp_splitter;
>      SplitIRQ ppc_irq_splitter[NUM_PPCS];
>      SplitIRQ mpc_irq_splitter[IOTS_NUM_EXP_MPC + IOTS_NUM_MPC];
> -    qemu_or_irq mpc_irq_orgate;
> -    qemu_or_irq nmi_orgate;
> +    OrIRQState mpc_irq_orgate;
> +    OrIRQState nmi_orgate;
>
>      SplitIRQ cpu_irq_splitter[NUM_SSE_IRQS];
>
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
> index c9d25d493e..d724a2fc28 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -56,7 +56,7 @@ struct BCM2835PeripheralState {
>      BCM2835AuxState aux;
>      BCM2835FBState fb;
>      BCM2835DMAState dma;
> -    qemu_or_irq orgated_dma_irq;
> +    OrIRQState orgated_dma_irq;
>      BCM2835ICState ic;
>      BCM2835PropertyState property;
>      BCM2835RngState rng;
> diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
> index 97353f1c02..68db19f0cb 100644
> --- a/include/hw/arm/exynos4210.h
> +++ b/include/hw/arm/exynos4210.h
> @@ -96,8 +96,8 @@ struct Exynos4210State {
>      MemoryRegion boot_secondary;
>      MemoryRegion bootreg_mem;
>      I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
> -    qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
> -    qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
> +    OrIRQState pl330_irq_orgate[EXYNOS4210_NUM_DMA];
> +    OrIRQState cpu_irq_orgate[EXYNOS4210_NCPUS];
>      A9MPPrivState a9mpcore;
>      Exynos4210GicState ext_gic;
>      Exynos4210CombinerState int_combiner;
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_so=
c.h
> index 849d3ed889..5a4f776264 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -63,7 +63,7 @@ struct STM32F205State {
>      STM32F2XXADCState adc[STM_NUM_ADCS];
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
>
> -    qemu_or_irq *adc_irqs;
> +    OrIRQState *adc_irqs;
>
>      MemoryRegion sram;
>      MemoryRegion flash;
> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_so=
c.h
> index 249ab5434e..c968ce3ab2 100644
> --- a/include/hw/arm/stm32f405_soc.h
> +++ b/include/hw/arm/stm32f405_soc.h
> @@ -63,7 +63,7 @@ struct STM32F405State {
>      STM32F4xxExtiState exti;
>      STM32F2XXUsartState usart[STM_NUM_USARTS];
>      STM32F2XXTimerState timer[STM_NUM_TIMERS];
> -    qemu_or_irq adc_irqs;
> +    OrIRQState adc_irqs;
>      STM32F2XXADCState adc[STM_NUM_ADCS];
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
>
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index cbe8a19c10..b6786e9832 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -85,7 +85,7 @@ struct Versal {
>          } rpu;
>
>          struct {
> -            qemu_or_irq irq_orgate;
> +            OrIRQState irq_orgate;
>              XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
>          } xram;
>
> @@ -103,7 +103,7 @@ struct Versal {
>                  XlnxCSUDMA dma_src;
>                  XlnxCSUDMA dma_dst;
>                  MemoryRegion linear_mr;
> -                qemu_or_irq irq_orgate;
> +                OrIRQState irq_orgate;
>              } ospi;
>          } iou;
>
> @@ -113,7 +113,7 @@ struct Versal {
>          XlnxVersalEFuseCtrl efuse_ctrl;
>          XlnxVersalEFuseCache efuse_cache;
>
> -        qemu_or_irq apb_irq_orgate;
> +        OrIRQState apb_irq_orgate;
>      } pmc;
>
>      struct {
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 20bdf894aa..687c75e3b0 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -130,7 +130,7 @@ struct XlnxZynqMPState {
>      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
>      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
>      XlnxCSUDMA qspi_dma;
> -    qemu_or_irq qspi_irq_orgate;
> +    OrIRQState qspi_irq_orgate;
>      XlnxZynqMPAPUCtrl apu_ctrl;
>      XlnxZynqMPCRF crf;
>      CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
> diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
> index 131abc2e0c..c0a42f3711 100644
> --- a/include/hw/or-irq.h
> +++ b/include/hw/or-irq.h
> @@ -35,8 +35,6 @@
>   */
>  #define MAX_OR_LINES      48
>
> -typedef struct OrIRQState qemu_or_irq;
> -
>  OBJECT_DECLARE_SIMPLE_TYPE(OrIRQState, OR_IRQ)
>
>  struct OrIRQState {
> --
> 2.38.1
>
>

