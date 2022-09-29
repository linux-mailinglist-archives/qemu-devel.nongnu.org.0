Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F3D5EEAF4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 03:29:52 +0200 (CEST)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odiN5-0002gS-AL
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 21:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1odiLp-0001B8-Qr
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 21:28:33 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1odiLo-0002Aj-5V
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 21:28:33 -0400
Received: by mail-pf1-x435.google.com with SMTP id a80so126525pfa.4
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 18:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tfN21X8c5D9bkWguatDNcu/DcWR/PtQE4cNsvwI4uT8=;
 b=cqsQbE0t5EH6myrY86e9tJB0TcRqf7yrTM4+YyZVUOSTXd+nyMGQYnetPma5QrbA9l
 8FcMqQTCd/OXtNHhNOvq5wiywzkuP44Xr0MjlddRfTgSJE9QL3K9yVdRveyC2IHl0ZIA
 NPsoJCeTFeXU1zlgU+jW01GoaOxvHBHWrqu93+eJTHhY9FXpxjn4nfeLgGsl7lHv8Bsj
 m0wtQnXfpdvAqC0rvx7uTCm+WpVtgj68+wiQm6uxHREMn0JW+wzSdK91Ugbr4fREXSfJ
 IERLsC5IfPByRkCi8vJCg8ZLcgOxgIGpm4cxKfn9MwRKpdlIbjah1hGN5Rn7QikL4nUs
 qa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tfN21X8c5D9bkWguatDNcu/DcWR/PtQE4cNsvwI4uT8=;
 b=cI4q/n3nSswo2ssjPOV8mzstRGdXj5l59zV6I9q3XDI4QQ7PW5BPAI6PP5KxnGEiLw
 R+Jmqbe9a331s47ikTZ+FHdkGFNLZoG8bWOSJ4WZDpEvu+XhvacxTnvwTD2k4vNgGkNZ
 wv53oI0wJ3UP0pdyYoW7LoZa4PpIOUbVBTO4A8waV3gPPbGbh+MTmrc2GhkvSRTc76iK
 0ySGeaELyyWq8oS57HCWZglvMadn8itwGBmtjqjjNI6Tqfdv5RqDC6DPFrSggat22LGW
 RwRUflXUqYYQqIxNnO7kBPHq9r7Hp+Vd6i4Ogggd8SldV8dHS25lDafxIeLLNaw/ZXIE
 KUug==
X-Gm-Message-State: ACrzQf1S+hj7Djrc6lVZFJ4pizfKOO4jvE90cysUboUHkOBWvq5JlUnz
 WQ0hyue4A1mKH6t4+RHJ1F37+MqcbcbEWLFqmfA=
X-Google-Smtp-Source: AMsMyM6gHwpdeqLhddHKM0iY7B4frYyY2UnSbPUhep2xLkvbLWBxZIbk5nkDDGmJVObe3fcARWonTChNBr2QC/tZ6IA=
X-Received: by 2002:a05:6a00:1496:b0:546:2856:6cf5 with SMTP id
 v22-20020a056a00149600b0054628566cf5mr610260pfu.31.1664414909443; Wed, 28 Sep
 2022 18:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220920081517.25401-1-frasse.iglesias@gmail.com>
In-Reply-To: <20220920081517.25401-1-frasse.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 29 Sep 2022 11:28:02 +1000
Message-ID: <CAKmqyKMX-UdspdDkRsF+e3cMHHW5=_79_AEngeniH=M1LxMseA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/arm/xlnx-zynqmp: Connect ZynqMP's USB
 controllers
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Edgar Iglesias <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, fkonrad@amd.com, 
 sai.pavan.boddu@amd.com, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 20, 2022 at 6:23 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> From: Francisco Iglesias <francisco.iglesias@amd.com>
>
> Connect ZynqMP's USB controllers.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c         | 36 ++++++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-zynqmp.h |  3 +++
>  2 files changed, 39 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 383e177a00..335cfc417d 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -143,6 +143,14 @@ static const int adma_ch_intr[XLNX_ZYNQMP_NUM_ADMA_CH] = {
>      77, 78, 79, 80, 81, 82, 83, 84
>  };
>
> +static const uint64_t usb_addr[XLNX_ZYNQMP_NUM_USB] = {
> +    0xFE200000, 0xFE300000
> +};
> +
> +static const int usb_intr[XLNX_ZYNQMP_NUM_USB] = {
> +    65, 70
> +};
> +
>  typedef struct XlnxZynqMPGICRegion {
>      int region_index;
>      uint32_t address;
> @@ -428,6 +436,10 @@ static void xlnx_zynqmp_init(Object *obj)
>      object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
>      object_initialize_child(obj, "qspi-irq-orgate",
>                              &s->qspi_irq_orgate, TYPE_OR_IRQ);
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
> +        object_initialize_child(obj, "usb[*]", &s->usb[i], TYPE_USB_DWC3);
> +    }
>  }
>
>  static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> @@ -814,6 +826,30 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          object_property_add_alias(OBJECT(s), bus_name,
>                                    OBJECT(&s->qspi), target_bus);
>      }
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
> +        if (!object_property_set_link(OBJECT(&s->usb[i].sysbus_xhci), "dma",
> +                                      OBJECT(system_memory), errp)) {
> +            return;
> +        }
> +
> +        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "intrs", 4);
> +        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "slots", 2);
> +
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->usb[i]), errp)) {
> +            return;
> +        }
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0, usb_addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 0,
> +                           gic_spi[usb_intr[i]]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 1,
> +                           gic_spi[usb_intr[i] + 1]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 2,
> +                           gic_spi[usb_intr[i] + 2]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 3,
> +                           gic_spi[usb_intr[i] + 3]);
> +    }
>  }
>
>  static Property xlnx_zynqmp_props[] = {
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 85fd9f53da..20bdf894aa 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -42,6 +42,7 @@
>  #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
>  #include "hw/misc/xlnx-zynqmp-crf.h"
>  #include "hw/timer/cadence_ttc.h"
> +#include "hw/usb/hcd-dwc3.h"
>
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -56,6 +57,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  #define XLNX_ZYNQMP_NUM_SPIS 2
>  #define XLNX_ZYNQMP_NUM_GDMA_CH 8
>  #define XLNX_ZYNQMP_NUM_ADMA_CH 8
> +#define XLNX_ZYNQMP_NUM_USB 2
>
>  #define XLNX_ZYNQMP_NUM_QSPI_BUS 2
>  #define XLNX_ZYNQMP_NUM_QSPI_BUS_CS 2
> @@ -132,6 +134,7 @@ struct XlnxZynqMPState {
>      XlnxZynqMPAPUCtrl apu_ctrl;
>      XlnxZynqMPCRF crf;
>      CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
> +    USBDWC3 usb[XLNX_ZYNQMP_NUM_USB];
>
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> --
> 2.20.1
>
>

