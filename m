Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339B32BE5B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:45:52 +0100 (CET)
Received: from localhost ([::1]:38682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHaFb-0000tE-BZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHaEd-0000Pz-Tw; Wed, 03 Mar 2021 17:44:51 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:46405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHaEa-0001jh-U2; Wed, 03 Mar 2021 17:44:51 -0500
Received: by mail-io1-xd35.google.com with SMTP id u8so27546257ior.13;
 Wed, 03 Mar 2021 14:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C39x6Pqj5G5Fds2WIyg4uvQ5YG4W8zxx1oVLhkrBu7A=;
 b=ZSLvvliPyf106Zbu1qU800wxj8UunnWCz7zmPOwbzdPm1MZ1qcXzX/MIzJAvLob25G
 RVsZp2yiU4VKDu8a4aLrjunKaggFu96q0PCd8oJ9m1+CdG/pFj7q1BVwGDRUZtDp/ulM
 Ul5KuZYAfMxlfPzdhG2eveKyNOwwB9TbZ21A4Ly/nT6Kja8wAsLoHy4AHFIt7t1jC7l7
 ErPAJZFk0hOUNYxrInnsJBu50i6b2n2cc2b9JLbJ8OkHsVfNFB+HT59vWeFfZH7TgUoG
 4jput2yumi9ypCWhiA3Q5F0RJgluaXFdjFRo+9PfmlMPa1Urt1ZLmN3dAAoKXLMxiDfc
 soww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C39x6Pqj5G5Fds2WIyg4uvQ5YG4W8zxx1oVLhkrBu7A=;
 b=FsE7YnlLDScQj8zUuoTf23PMyihYzYFXHO0O243QnyOftAnONgdIBLDewPKsDvyA1X
 mZ0+rGk2gYrhQvBiRpCBPkR7Lns/6F2CxB80MXjEewWPt7qn9vfriDO2lf1ZpSyzYIHx
 u5psMuusAlEnU+ZiMwtHeDqh3Qb21BcSWD23/H7obWK0ezUePRqMpfDQM8jYgaQW39VH
 eRycrnPiF7eXeRTzuooXJglAwXiVR6a0plFYT44YK1L+udqq+yiUlUzBbH1DMOUs48sJ
 dG/6B/cx6D2UTXyC7h7fJsmzM8i10+HL1+l+GH1DYcKDtSrFuxEt3S4lwW3kSQ6+a9T2
 O7Wg==
X-Gm-Message-State: AOAM533gwFfIKpnrs6XfniMm28oNzwbryUF+hTzOYyJU3lxMkFVo8UYe
 uYLtb86HX3hGLIjtL3nYxiAse1MearF6aMK/RGM=
X-Google-Smtp-Source: ABdhPJxCGjXawGvnOtehoP/50mCOcDlNDTZJ3V+pRfgydtQlOIV5klaGYhF8lOYy0dJ1lsqmowDTCrsfiqJGbo6ZRZY=
X-Received: by 2002:a02:2944:: with SMTP id p65mr1156872jap.91.1614811487255; 
 Wed, 03 Mar 2021 14:44:47 -0800 (PST)
MIME-Version: 1.0
References: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
 <20210302110955.1810487-3-edgar.iglesias@gmail.com>
In-Reply-To: <20210302110955.1810487-3-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Mar 2021 17:43:30 -0500
Message-ID: <CAKmqyKO2zZG_dR1WAc7O_92rfLSzjV9mx1zEPSfdYvmMQ4JjoQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hw/arm: versal: Add support for the XRAMs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, joe.komlodi@xilinx.com,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 francisco.iglesias@xilinx.com, KONRAD Frederic <frederic.konrad@adacore.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 2, 2021 at 6:10 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Connect the support for the Versal Accelerator RAMs (XRAMs).
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/arm/xlnx-versal-virt.rst |  1 +
>  include/hw/arm/xlnx-versal.h         | 13 ++++++++++
>  hw/arm/xlnx-versal.c                 | 36 ++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)
>
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index 2602d0f995..27f73500d9 100644
> --- a/docs/system/arm/xlnx-versal-virt.rst
> +++ b/docs/system/arm/xlnx-versal-virt.rst
> @@ -30,6 +30,7 @@ Implemented devices:
>  - 8 ADMA (Xilinx zDMA) channels
>  - 2 SD Controllers
>  - OCM (256KB of On Chip Memory)
> +- XRAM (4MB of on chip Accelerator RAM)
>  - DDR memory
>
>  QEMU does not yet model any other devices, including the PL and the AI Engine.
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 2b76885afd..22a8fa5d11 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -14,6 +14,7 @@
>
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
> +#include "hw/or-irq.h"
>  #include "hw/sd/sdhci.h"
>  #include "hw/intc/arm_gicv3.h"
>  #include "hw/char/pl011.h"
> @@ -22,6 +23,7 @@
>  #include "hw/rtc/xlnx-zynqmp-rtc.h"
>  #include "qom/object.h"
>  #include "hw/usb/xlnx-usb-subsystem.h"
> +#include "hw/misc/xlnx-versal-xramc.h"
>
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
>  OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
> @@ -31,6 +33,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
>  #define XLNX_VERSAL_NR_GEMS    2
>  #define XLNX_VERSAL_NR_ADMAS   8
>  #define XLNX_VERSAL_NR_SDS     2
> +#define XLNX_VERSAL_NR_XRAM    4
>  #define XLNX_VERSAL_NR_IRQS    192
>
>  struct Versal {
> @@ -62,6 +65,11 @@ struct Versal {
>              XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
>              VersalUsb2 usb;
>          } iou;
> +
> +        struct {
> +            qemu_or_irq irq_orgate;
> +            XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
> +        } xram;
>      } lpd;
>
>      /* The Platform Management Controller subsystem.  */
> @@ -96,6 +104,7 @@ struct Versal {
>  #define VERSAL_GEM1_IRQ_0          58
>  #define VERSAL_GEM1_WAKE_IRQ_0     59
>  #define VERSAL_ADMA_IRQ_0          60
> +#define VERSAL_XRAM_IRQ_0          79
>  #define VERSAL_RTC_APB_ERR_IRQ     121
>  #define VERSAL_SD0_IRQ_0           126
>  #define VERSAL_RTC_ALARM_IRQ       142
> @@ -128,6 +137,10 @@ struct Versal {
>  #define MM_OCM                      0xfffc0000U
>  #define MM_OCM_SIZE                 0x40000
>
> +#define MM_XRAM                     0xfe800000
> +#define MM_XRAMC                    0xff8e0000
> +#define MM_XRAMC_SIZE               0x10000
> +
>  #define MM_USB2_CTRL_REGS           0xFF9D0000
>  #define MM_USB2_CTRL_REGS_SIZE      0x10000
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 628e77ef66..79609692e4 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -10,6 +10,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> @@ -278,6 +279,40 @@ static void versal_create_rtc(Versal *s, qemu_irq *pic)
>      sysbus_connect_irq(sbd, 1, pic[VERSAL_RTC_APB_ERR_IRQ]);
>  }
>
> +static void versal_create_xrams(Versal *s, qemu_irq *pic)
> +{
> +    int nr_xrams = ARRAY_SIZE(s->lpd.xram.ctrl);
> +    DeviceState *orgate;
> +    int i;
> +
> +    /* XRAM IRQs get ORed into a single line.  */
> +    object_initialize_child(OBJECT(s), "xram-irq-orgate",
> +                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> +    orgate = DEVICE(&s->lpd.xram.irq_orgate);
> +    object_property_set_int(OBJECT(orgate),
> +                            "num-lines", nr_xrams, &error_fatal);
> +    qdev_realize(orgate, NULL, &error_fatal);
> +    qdev_connect_gpio_out(orgate, 0, pic[VERSAL_XRAM_IRQ_0]);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.xram.ctrl); i++) {
> +        SysBusDevice *sbd;
> +        MemoryRegion *mr;
> +
> +        object_initialize_child(OBJECT(s), "xram[*]", &s->lpd.xram.ctrl[i],
> +                                TYPE_XLNX_XRAM_CTRL);
> +        sbd = SYS_BUS_DEVICE(&s->lpd.xram.ctrl[i]);
> +        sysbus_realize(sbd, &error_fatal);
> +
> +        mr = sysbus_mmio_get_region(sbd, 0);
> +        memory_region_add_subregion(&s->mr_ps,
> +                                    MM_XRAMC + i * MM_XRAMC_SIZE, mr);
> +        mr = sysbus_mmio_get_region(sbd, 1);
> +        memory_region_add_subregion(&s->mr_ps, MM_XRAM + i * MiB, mr);
> +
> +        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(orgate, i));
> +    }
> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -363,6 +398,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_admas(s, pic);
>      versal_create_sds(s, pic);
>      versal_create_rtc(s, pic);
> +    versal_create_xrams(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>
> --
> 2.25.1
>
>

