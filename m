Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4BB1BB184
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 00:29:32 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTCFn-0000dX-K0
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 18:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTCE0-0006fo-CI
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 18:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTCDy-0007aE-A0
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 18:27:40 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:40348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTCDx-0007Xh-Rb; Mon, 27 Apr 2020 18:27:37 -0400
Received: by mail-io1-xd44.google.com with SMTP id c2so5929811iow.7;
 Mon, 27 Apr 2020 15:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WQM2n6BQJXvmiGOMpmg/Y0umjMvBSvK9gNucictt/rI=;
 b=AmsT0c37ypMfhNCItH/4nExXPnQhSp59GdEd2+8P8m5JvCvL8bT7cG44YUrDS1IUvr
 9mTypBdFZKzQ+9bJ+dO9TSGPh5awOP/+MWaKUm+E0NbJfZpqPztJvugN1/pnD5t9jyHN
 T/jD9kp5l4rpiXh1N7QOrzyBG9X29S9swLcTa3HzPGz494ucouf628AdXCDw1ciAXcBH
 HkRpEQQ2ZfljaM7uqUCPliQ4jpU1g2aVbGyCqWCMaZTRJyZpp9aSQe+tLLxX8mQCAKij
 lfSeNYhNlv8b+/y1+TLJyOMG2ajFv7IZtSfz94MYp0r9quSuhCPCEESWbRHtucmPFemA
 74pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WQM2n6BQJXvmiGOMpmg/Y0umjMvBSvK9gNucictt/rI=;
 b=MLjoqpbVZvbXWgO9VpeYYEomsF2EtV0ICseAQYlZOKOmpALrWiEl/YpcUbMGJZqoMM
 ZyeG7qvB3MLhXNBLutQ0y8ZIRv/FMssiG0nQ/dG5cTlPw2klbJgGuMPHVtUDy3HkmETC
 npSmAh6d/mngUaGiBzFBy/cuqKseyG3K0KSdbsjEJwS2mes0qc+1EUbdwbY1c4Y91Ffj
 yS8RxXsIkWDV1cjg0RO1mCwn0d5l3fCF7GUaVJmPrY5q6qRMHXifU1NK1k3aR0aprTC6
 qxPoWCEZQe2YwBbgM40ZX2uvQqZchLOTnEhWF/2bGpb8SZiSkfSElZcH4HSpaU6fnQEX
 boow==
X-Gm-Message-State: AGi0PuZjGrqvEjxbOO+nSx6Tk9n1obKhbmQiySLj6cI9AJR9fexPvfEC
 e+3PIhhsOPoVVZf4fv4phL0jXJTwNVFuWq61iVk=
X-Google-Smtp-Source: APiQypI1s8Sq1s163Sa1GrqA1gpO6cegL/0fHqh/+44f9j4Rd/PWYs2R0WDv+Z5i2l399gC5A+G065lQ+oDKCiMOkmM=
X-Received: by 2002:a02:6243:: with SMTP id d64mr21929041jac.135.1588026455835; 
 Mon, 27 Apr 2020 15:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-7-edgar.iglesias@gmail.com>
In-Reply-To: <20200427181649.26851-7-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Apr 2020 15:18:57 -0700
Message-ID: <CAKmqyKN4JBcQ7=fJ9tckm+MQiiG3S5LrB+ff-3GDM6k80wXPCA@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] hw/arm: versal: Embedd the ADMAs into the SoC
 type
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 27, 2020 at 11:22 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Embedd the ADMAs into the SoC type.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal.c         | 14 +++++++-------
>  include/hw/arm/xlnx-versal.h |  3 ++-
>  2 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index e424aa789e..ebd2dc51be 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -203,18 +203,18 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
>          DeviceState *dev;
>          MemoryRegion *mr;
>
> -        dev = qdev_create(NULL, "xlnx.zdma");
> -        s->lpd.iou.adma[i] = SYS_BUS_DEVICE(dev);
> -        object_property_set_int(OBJECT(s->lpd.iou.adma[i]), 128, "bus-width",
> -                                &error_abort);
> -        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
> +        sysbus_init_child_obj(OBJECT(s), name,
> +                              &s->lpd.iou.adma[i], sizeof(s->lpd.iou.adma[i]),
> +                              TYPE_XLNX_ZDMA);
> +        dev = DEVICE(&s->lpd.iou.adma[i]);
> +        object_property_set_int(OBJECT(dev), 128, "bus-width", &error_abort);
>          qdev_init_nofail(dev);
>
> -        mr = sysbus_mmio_get_region(s->lpd.iou.adma[i], 0);
> +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->mr_ps,
>                                      MM_ADMA_CH0 + i * MM_ADMA_CH0_SIZE, mr);
>
> -        sysbus_connect_irq(s->lpd.iou.adma[i], 0, pic[VERSAL_ADMA_IRQ_0 + i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[VERSAL_ADMA_IRQ_0 + i]);
>          g_free(name);
>      }
>  }
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 01da736a5b..94b7826fd4 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -16,6 +16,7 @@
>  #include "hw/arm/boot.h"
>  #include "hw/intc/arm_gicv3.h"
>  #include "hw/char/pl011.h"
> +#include "hw/dma/xlnx-zdma.h"
>  #include "hw/net/cadence_gem.h"
>
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
> @@ -53,7 +54,7 @@ typedef struct Versal {
>          struct {
>              PL011State uart[XLNX_VERSAL_NR_UARTS];
>              CadenceGEMState gem[XLNX_VERSAL_NR_GEMS];
> -            SysBusDevice *adma[XLNX_VERSAL_NR_ADMAS];
> +            XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
>          } iou;
>      } lpd;
>
> --
> 2.20.1
>
>

