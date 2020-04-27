Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C251BB18B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 00:34:57 +0200 (CEST)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTCL2-0005mM-UB
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 18:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTCJb-0005AC-RR
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 18:33:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTCJb-0006Rx-69
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 18:33:27 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTCJa-0006Rn-Q3; Mon, 27 Apr 2020 18:33:26 -0400
Received: by mail-il1-x144.google.com with SMTP id c16so18374163ilr.3;
 Mon, 27 Apr 2020 15:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XbUNlzk+RZs5AafzGZINrEDlwvQhkcadp3iNhB1e0/o=;
 b=MRcw6BpZbSRWzA3rejtVD2TOyuiQvAsB+xiBbx3m6fcxSBK95ov6fptq2dW5dKpC+p
 zBlW0/U05rcjiQ11/3wyukaebhXuqVM0i83SiYlB+J1qLH+2U64yVeG+CyPhHQ63L3fX
 W/ckUro2DjdMuMJ8wyP+0nglTtQi/DaMGk3GRPS68e8KCIR8P7JFxLGtHmD55eZWQj3k
 5T1VZtugk/9bgiTk94grbdzov5Z4WqYwaTWllnFHGdRqH5W3BK8ZRWlEGvHlznVSgZ+1
 A2s9/A6xkeBLaeLFFrKDVFRJNZDFAazx9JouaoEDAufn/38STlZNcQoNh6vQAKlD1sIm
 SlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbUNlzk+RZs5AafzGZINrEDlwvQhkcadp3iNhB1e0/o=;
 b=GoWKzcVoHkmPu/OL8cWshDwcdtwT+/W9ojQLk8ri4FDaCJHHCbTMuM2LXpAeyWvT8f
 3Fch1RsfYQQscpGRW3qu+OElB90NZ9rODKNE67gqOZ3jTAr/aIMHWxumXyZHAgNLDJ3D
 3BfMW76I3A43ZyugSVdbc8hpPT5+uip2aP1l4iNr2e5iwa1BnH6qllKdri7AdbOtLqg4
 SMIuraH8bmcyjpT8T16j4MEDBXViz+4AWzwjiSPpZz65ZdxWvBmfoiFoqbxpiNFyHr2h
 wc26ULRoJFcGxpGjkdj4RGSJmOJyJ+oT9GDzSdpFVftsgI0UL3go+cpoQaE+FEMRhkhS
 WF8A==
X-Gm-Message-State: AGi0PuYgto5T6+gkWvLTW0DLIO0yN9kgML5pwiiaVDtQ4s0+GNwz3EsH
 jRVCV9iYmJpgxjZnIRqw2En/J1KIG/VJ4xsCrYY=
X-Google-Smtp-Source: APiQypK8areWnueXm3D+wOUsSB4APQrTYVqCGfFVo3CnJArJN7Jz2k55FaqIEuBEjizD5ydC5B2IOq7t2bZtgD/aW7I=
X-Received: by 2002:a92:d0c6:: with SMTP id y6mr24804933ila.227.1588026804574; 
 Mon, 27 Apr 2020 15:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-9-edgar.iglesias@gmail.com>
In-Reply-To: <20200427181649.26851-9-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Apr 2020 15:24:45 -0700
Message-ID: <CAKmqyKNv5O5Qs14O1L9Ov4LH1oEPtryYLPj8-UX3ZjR+NX8eHw@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] hw/arm: versal: Add support for SD
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::144
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

On Mon, Apr 27, 2020 at 11:23 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for SD.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal.c         | 31 +++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h | 12 ++++++++++++
>  2 files changed, 43 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index c8a296e2e0..e263bdf77a 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -210,6 +210,36 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
>      }
>  }
>
> +#define SDHCI_CAPABILITIES  0x280737ec6481 /* Same as on ZynqMP.  */
> +static void versal_create_sds(Versal *s, qemu_irq *pic)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->pmc.iou.sd); i++) {
> +        DeviceState *dev;
> +        MemoryRegion *mr;
> +
> +        sysbus_init_child_obj(OBJECT(s), "sd[*]",
> +                              &s->pmc.iou.sd[i], sizeof(s->pmc.iou.sd[i]),
> +                              TYPE_SYSBUS_SDHCI);
> +        dev = DEVICE(&s->pmc.iou.sd[i]);
> +
> +        object_property_set_uint(OBJECT(dev),
> +                                 3, "sd-spec-version", &error_fatal);
> +        object_property_set_uint(OBJECT(dev), SDHCI_CAPABILITIES, "capareg",
> +                                 &error_fatal);
> +        object_property_set_uint(OBJECT(dev), UHS_I, "uhs", &error_fatal);
> +        qdev_init_nofail(dev);
> +
> +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +        memory_region_add_subregion(&s->mr_ps,
> +                                    MM_PMC_SD0 + i * MM_PMC_SD0_SIZE, mr);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
> +                           pic[VERSAL_SD0_IRQ_0 + i * 2]);
> +    }
> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -292,6 +322,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_uarts(s, pic);
>      versal_create_gems(s, pic);
>      versal_create_admas(s, pic);
> +    versal_create_sds(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 426b66449d..e11693e29d 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -14,6 +14,7 @@
>
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
> +#include "hw/sd/sdhci.h"
>  #include "hw/intc/arm_gicv3.h"
>  #include "hw/char/pl011.h"
>  #include "hw/dma/xlnx-zdma.h"
> @@ -26,6 +27,7 @@
>  #define XLNX_VERSAL_NR_UARTS   2
>  #define XLNX_VERSAL_NR_GEMS    2
>  #define XLNX_VERSAL_NR_ADMAS   8
> +#define XLNX_VERSAL_NR_SDS     2
>  #define XLNX_VERSAL_NR_IRQS    192
>
>  typedef struct Versal {
> @@ -58,6 +60,13 @@ typedef struct Versal {
>          } iou;
>      } lpd;
>
> +    /* The Platform Management Controller subsystem.  */
> +    struct {
> +        struct {
> +            SDHCIState sd[XLNX_VERSAL_NR_SDS];
> +        } iou;
> +    } pmc;
> +
>      struct {
>          MemoryRegion *mr_ddr;
>          uint32_t psci_conduit;
> @@ -80,6 +89,7 @@ typedef struct Versal {
>  #define VERSAL_GEM1_IRQ_0          58
>  #define VERSAL_GEM1_WAKE_IRQ_0     59
>  #define VERSAL_ADMA_IRQ_0          60
> +#define VERSAL_SD0_IRQ_0           126
>
>  /* Architecturally reserved IRQs suitable for virtualization.  */
>  #define VERSAL_RSVD_IRQ_FIRST 111
> @@ -129,6 +139,8 @@ typedef struct Versal {
>  #define MM_FPD_CRF                  0xfd1a0000U
>  #define MM_FPD_CRF_SIZE             0x140000
>
> +#define MM_PMC_SD0                  0xf1040000U
> +#define MM_PMC_SD0_SIZE             0x10000
>  #define MM_PMC_CRP                  0xf1260000U
>  #define MM_PMC_CRP_SIZE             0x10000
>  #endif
> --
> 2.20.1
>
>

