Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BEB4EE787
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 07:06:36 +0200 (CEST)
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na9UZ-0001CR-JT
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 01:06:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1na9Sl-0000Lf-5c; Fri, 01 Apr 2022 01:04:43 -0400
Received: from [2607:f8b0:4864:20::d32] (port=44734
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1na9Sj-0004Wa-HU; Fri, 01 Apr 2022 01:04:42 -0400
Received: by mail-io1-xd32.google.com with SMTP id e22so1944420ioe.11;
 Thu, 31 Mar 2022 22:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/vliwkce+UGxUjMEBR3Q0qBdJMs35wBtoz1X1jG5gv0=;
 b=RWKpboAQI5dSPPYIylXAOJjP76JpHUa9XvTSQ3TgwRLeGU/nRkay3RSWijMmj8kSiH
 jJ44ZZ399/WUWJVzoUzU3VKH6iXRq0BkLuEahXRgsU7YSj8fvumJvASsirJxejaCS0D7
 aX/iSsrU/HzcE2Jw4sjGyV7dNHfwNeeTAClY/kzcP+wkE4ZH/Ny/Yz8MTqB8jbJ3SJU9
 oaywOMK6MCZTqWfHkIAOAd481JhAlPkwwljP8CDG2fTgLmw4nXYEvg1NI4CDgcz6KYXR
 G9fk3UrYip2YHwmyD88UA8N7c8LUPKL2q6rrYKgRYmhq6l3k0OvdWPhx+Fq2Yl5G8A+8
 lqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/vliwkce+UGxUjMEBR3Q0qBdJMs35wBtoz1X1jG5gv0=;
 b=6ivAqZ3AbFhGLu3/fz/ldahwFDrUNV/31yScryUOkdFfptL1QRNpaMgWD1xeoYNKUg
 DIswiOSmBU7kRhkpWK90DsFc8HOYXR9MYyPn2Tnugs/bPbVlXg/XNmp69StPEaITpWaV
 nKsBYh6D8e/u3/9wDhz/AgS9bOb8z+vxjhK7qAryuUx+YsHd4+nE/Z7FGF9IXYRNVzOX
 4W9lfJlvxnVAnqohZVqWU3tWW5eiPZepT1idS0AjAbJ4x/Vjzb6r37ZJa4IhxnUgAsbq
 92pq9csAb7zNTbyhpuiDVzqS9RNLbMs4H+FMxuPqAnMFedi15KfcwhpdNmMWwEysnOZQ
 9Zzg==
X-Gm-Message-State: AOAM530kxkQhu10iqJi1JH+4fv/jGJ0Tcdnq/YRg6YXxHMob0KZ+xE5K
 fT+QJj/2GTqEk3HiCTvwMQvEHupgIlj2ZpZfR24=
X-Google-Smtp-Source: ABdhPJxcCxIo5SHMgNkM7MQXV0NbhjGj/4kFMApFkGQ4BTIJz0Z+2zeTLMKMvP+ImwX7uZevxQlGZsyx+4qUG4bfvh8=
X-Received: by 2002:a05:6602:45b:b0:645:bdc2:fe13 with SMTP id
 e27-20020a056602045b00b00645bdc2fe13mr15751965iov.114.1648789479201; Thu, 31
 Mar 2022 22:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
 <20220331222017.2914409-3-edgar.iglesias@gmail.com>
In-Reply-To: <20220331222017.2914409-3-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Apr 2022 15:04:13 +1000
Message-ID: <CAKmqyKPjMh2-MBhc3G+inh=7hCfn2FxQcoQNz0Gi5B85+qzA1g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hw/arm/xlnx-zynqmp: Connect 4 TTC timers
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 8:26 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> Connect the 4 TTC timers on the ZynqMP.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/xlnx-zynqmp.h |  4 ++++
>  hw/arm/xlnx-zynqmp.c         | 22 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 9d9a9d0bf9..85fd9f53da 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -41,6 +41,7 @@
>  #include "hw/or-irq.h"
>  #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
>  #include "hw/misc/xlnx-zynqmp-crf.h"
> +#include "hw/timer/cadence_ttc.h"
>
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -84,6 +85,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
>                                    XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
>
> +#define XLNX_ZYNQMP_NUM_TTC 4
> +
>  /*
>   * Unimplemented mmio regions needed to boot some images.
>   */
> @@ -128,6 +131,7 @@ struct XlnxZynqMPState {
>      qemu_or_irq qspi_irq_orgate;
>      XlnxZynqMPAPUCtrl apu_ctrl;
>      XlnxZynqMPCRF crf;
> +    CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
>
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 5bfe285a19..375309e68e 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -68,6 +68,9 @@
>  #define APU_ADDR            0xfd5c0000
>  #define APU_IRQ             153
>
> +#define TTC0_ADDR           0xFF110000
> +#define TTC0_IRQ            36
> +
>  #define IPI_ADDR            0xFF300000
>  #define IPI_IRQ             64
>
> @@ -316,6 +319,24 @@ static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
>      sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
>  }
>
> +static void xlnx_zynqmp_create_ttc(XlnxZynqMPState *s, qemu_irq *gic)
> +{
> +    SysBusDevice *sbd;
> +    int i, irq;
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_TTC; i++) {
> +        object_initialize_child(OBJECT(s), "ttc[*]", &s->ttc[i],
> +                                TYPE_CADENCE_TTC);
> +        sbd = SYS_BUS_DEVICE(&s->ttc[i]);
> +
> +        sysbus_realize(sbd, &error_fatal);
> +        sysbus_mmio_map(sbd, 0, TTC0_ADDR + i * 0x10000);
> +        for (irq = 0; irq < 3; irq++) {
> +            sysbus_connect_irq(sbd, irq, gic[TTC0_IRQ + i * 3 + irq]);
> +        }
> +    }
> +}
> +
>  static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>  {
>      static const struct UnimpInfo {
> @@ -721,6 +742,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      xlnx_zynqmp_create_efuse(s, gic_spi);
>      xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
>      xlnx_zynqmp_create_crf(s, gic_spi);
> +    xlnx_zynqmp_create_ttc(s, gic_spi);
>      xlnx_zynqmp_create_unimp_mmio(s);
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
> --
> 2.25.1
>
>

