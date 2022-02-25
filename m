Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A03F4C4D8E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:21:54 +0100 (CET)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNfE1-0008JJ-O5
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:21:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNehl-0002WA-Bk
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:48:33 -0500
Received: from [2607:f8b0:4864:20::b34] (port=45994
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNehi-00079p-H5
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:48:32 -0500
Received: by mail-yb1-xb34.google.com with SMTP id g6so7286818ybe.12
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bGbzWYMV0oGeM1177pkWtZddZ68Pp3RzbrUo2NZW9Gw=;
 b=ilTxfsJASMv6RtZp03bOWhC/aX5it1aW+afIlHtUvWTkFdNSJWuB94ybK8nq+QFpCN
 cr+skq4XJnXCHwUy5yZRA6DyUq7RPgLljvawNxfYcUhNmsYQfQFsIvPHZgMFlxBfDTXl
 3GW1aeCR3wnz9/zm3UkIbGNQh/+Pr4hS/GkKry17T7zBzuv6WFQdLxVCvTG6ejHRENVY
 BcAQWoPYU6g/N8GIoB2Mmj3hsmEXByhyiWNGU+5jQewztyvRogp0dprJRHmmYN7Q+o3x
 LZ39wX2Wf42vKaaqyVk9b5ytk8NDr8omgU4pFOzqLcLhBnRYaVV5UFOQcalneqhULiZs
 d2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bGbzWYMV0oGeM1177pkWtZddZ68Pp3RzbrUo2NZW9Gw=;
 b=z0+6KRvRlwdkVMCKpWQeUK820LUn5PDPdH3E3Qc4IJcaBoqEOjfCkbSWq9F/pT9FLf
 8FfyD9ij1XyH+MpfCQJauAjkywhNkWEf3WKZSoWSL5696eYkl98Igo5aaI9xtizdfkZO
 huO6A2GTrx3it3liBwpaSXh8H5wXhp9WUKenO9WFEc7Rml7/CRo9sohLRQfOXDSS5e06
 FcqiZz2lXVxc0or6juMWQ62GQb/qXn2t1O2OGzcSn0klgQX+4ZKvZjwNEKgpdkLFbG5M
 KmhvjiowvH6d8V/RIk3y0MxKQ/kvvYr5Tw8xl4GwZ97yxIuYgOQp2gVc9DLzvxpo75k/
 Q0YA==
X-Gm-Message-State: AOAM533mLyi9DClWi+rjesMMIyeUybxv6yirZ5d2sKsTBWfhYGCNCm15
 1AnotU9aJOqtaX5NtznImFegALFLli+ZZboeKhRjFw==
X-Google-Smtp-Source: ABdhPJwRKE/9LvHeaSkBtP/BTkjSMzJm1WEKdc45kk9ZT5sLkfs6ShLfM80pg1gns6i3ADeTJ5dQJ/2/4GkbRtRabM8=
X-Received: by 2002:a25:497:0:b0:624:8ba2:fc8e with SMTP id
 145-20020a250497000000b006248ba2fc8emr8364046ybe.39.1645811309075; Fri, 25
 Feb 2022 09:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-4-amir.gonnen@neuroblade.ai>
In-Reply-To: <20220224134901.500007-4-amir.gonnen@neuroblade.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 17:48:17 +0000
Message-ID: <CAFEAcA-6ctDBrewZEtAMKh1yjhaDdLuB7QqSVm9gwaSVTRw=yA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/intc: Vectored Interrupt Controller (VIC)
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 13:49, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote=
:
>
> Implement nios2 Vectored Interrupt Controller (VIC).
> VIC is connected to EIC. It needs to update rha, ril, rrs and rnmi
> fields on Nios2CPU before raising an IRQ.
> For that purpose, VIC has a "cpu" property which should refer to the
> nios2 cpu and set by the board that connects VIC.

This device code looks pretty good to me. I have some comments
below, but they're fairly minor items.

> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> ---
>  hw/intc/Kconfig     |   4 +
>  hw/intc/meson.build |   1 +
>  hw/intc/nios2_vic.c | 327 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 332 insertions(+)
>  create mode 100644 hw/intc/nios2_vic.c
>
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 528e77b4a6..8000241428 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -81,3 +81,7 @@ config GOLDFISH_PIC
>
>  config M68K_IRQC
>      bool
> +
> +config NIOS2_VIC
> +    default y
> +    depends on NIOS2 && TCG

You don't need these default and depends lines -- you want

config NIOS2_VIC
    bool

and then in patch 4 when you add the machine model support
you edit the "config NIOS2_10M50" section to add a line
    select NIOS2_VIC

> +/*
> + * Vectored Interrupt Controller for nios2 processor
> + *
> + * Copyright (c) 2022 Neuroblade
> + *
> + * Interface:
> + * QOM property "cpu": link to the Nios2 CPU (must be set)
> + * Unnamed GPIO inputs 0..NIOS2_VIC_MAX_IRQ-1: input IRQ lines
> + * IRQ should be connected to nios2 IRQ0.
> + *
> + * Reference: "Embedded Peripherals IP User Guide
> + *             for Intel=C2=AE Quartus=C2=AE Prime Design Suite: 21.4"
> + * Chapter 38 "Vectored Interrupt Controller Core"

Since Intel helpfully provide this document online we can give a URL
here, which will be useful for later readers:
  https://www.intel.com/content/www/us/en/docs/programmable/683130/

> +#define LOG_VIC(...) qemu_log_mask(CPU_LOG_INT, ##__VA_ARGS__)

You only use this macro once, so I think it hides more than it
helps. I would just drop it. In any case CPU_LOG_INT is really
intended for logging by the cpu proper, not for devices. Modern
QEMU device code would use tracepoints.

> +static void vic_update_irq(Nios2Vic *vic)
> +{
> +    Nios2CPU *cpu =3D NIOS2_CPU(vic->cpu);
> +    uint32_t pending =3D vic_int_pending(vic);
> +    int irq =3D -1;
> +    int max_ril =3D 0;

This initial value of max_ril correctly implements the behaviour
that setting RIL to 0 disables the interrupt, but it does so
without it being obvious that it's deliberate. A comment might help:

/* Note that if RIL is 0 for an interrupt it is effectively disabled */

> +
> +    vic->vec_tbl_addr =3D 0;
> +    vic->vic_status =3D 0;
> +
> +    if (pending =3D=3D 0) {
> +        qemu_irq_lower(vic->output_int);
> +        return;
> +    }
> +
> +    for (int i =3D 0; i < NIOS2_VIC_MAX_IRQ; i++) {
> +        if (pending & BIT(i)) {
> +            int ril =3D vic_int_config_ril(vic, i);
> +            if (ril > max_ril) {
> +                irq =3D i;
> +                max_ril =3D ril;
> +            }
> +        }
> +    }
> +
> +    if (irq < 0) {
> +        qemu_irq_lower(vic->output_int);
> +        return;
> +    }
> +
> +    vic->vec_tbl_addr =3D irq * vic_config_vec_size(vic) + vic->vec_tbl_=
base;
> +    vic->vic_status =3D deposit32(vic->vic_status, 0, 6, irq) | BIT(31);

You might as well just write
   vic->vic_status =3D irq | BIT(31);
here I think.

> +
> +    cpu->rha =3D vic->vec_tbl_addr;
> +    cpu->ril =3D max_ril;
> +    cpu->rrs =3D vic_int_config_rrs(vic, irq);
> +    cpu->rnmi =3D vic_int_config_rnmi(vic, irq);
> +
> +    qemu_irq_raise(vic->output_int);

I think a comment here would be helpful since this is reaching
into the CPU object. Something like:

/*
 * In hardware, the interface between the VIC and the CPU is via the
 * External Interrupt Controller interface, where the interrupt controller
 * presents the CPU with a packet of data containing:
 *  - Requested Handler Address (RHA): 32 bits
 *  - Requested Register Set (RRS) : 6 bits
 *  - Requested Interrupt Level (RIL) : 6 bits
 *  - Requested NMI flag (RNMI) : 1 bit
 * In our emulation, we implement this by writing the data directly to
 * fields in the CPU object and then raising the IRQ line to tell
 * the CPU that we've done so.
 */

(There are more encapsulated ways one could write this communication
between the VIC device object and the CPU, but I think what you have
here is fine, as long as we have the comment to document that this is
a well-defined interaction and not just the device messing with
some other object's internal state in an arbitrary way.)

> +}
> +

> +static void nios2_vic_csr_write(void *opaque, hwaddr offset, uint64_t va=
lue,
> +                                unsigned size)
> +{
> +    Nios2Vic *vic =3D opaque;
> +    int index =3D offset / 4;
> +
> +    switch (index) {
> +    case INT_CONFIG0 ... INT_CONFIG31:
> +        vic->int_config[index - INT_CONFIG0] =3D value;
> +        break;
> +    case INT_ENABLE:
> +        vic->int_enable =3D value;
> +        break;
> +    case INT_ENABLE_SET:
> +        vic->int_enable |=3D value;
> +        break;
> +    case INT_ENABLE_CLR:
> +        vic->int_enable &=3D ~value;
> +        break;
> +    case SW_INTERRUPT:
> +        vic->sw_int =3D value;
> +        break;
> +    case SW_INTERRUPT_SET:
> +        vic->sw_int |=3D value;
> +        break;
> +    case SW_INTERRUPT_CLR:
> +        vic->sw_int &=3D ~value;
> +        break;
> +    case VIC_CONFIG:
> +        vic->vic_config =3D value;
> +        break;
> +    case VEC_TBL_BASE:
> +        vic->vec_tbl_base =3D value;
> +        break;
> +    default:
> +        ;

Write 'break;' rather than just a ';'.
Or use qemu_log_mask(LOG_GUEST_ERROR, ...) to report that
the guest did something wrong (wrote to a read-only or invalid
register offset, in this case), if you like.

> +    }
> +
> +    vic_update_irq(vic);
> +}

> +static const VMStateDescription nios2_vic_vmstate =3D {
> +    .name =3D "nios2-vic",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]){ VMSTATE_UINT32_ARRAY(int_config, Nios2=
Vic, 32),
> +                                VMSTATE_UINT32(vic_config, Nios2Vic),
> +                                VMSTATE_UINT32(int_raw_status, Nios2Vic)=
,
> +                                VMSTATE_UINT32(int_enable, Nios2Vic),
> +                                VMSTATE_UINT32(sw_int, Nios2Vic),
> +                                VMSTATE_UINT32(vic_status, Nios2Vic),
> +                                VMSTATE_UINT32(vec_tbl_base, Nios2Vic),
> +                                VMSTATE_UINT32(vec_tbl_addr, Nios2Vic),
> +                                VMSTATE_END_OF_LIST() },

This is weirdly laid out; can you format it more like the way
other files do it, please?

    .fields =3D (VMStateField[]){
        VMSTATE_UINT32_ARRAY(int_config, Nios2Vic, 32),
        VMSTATE_UINT32(vic_config, Nios2Vic),
        [ etc ]
        VMSTATE_END_OF_LIST()
    },

> +};

thanks
-- PMM

