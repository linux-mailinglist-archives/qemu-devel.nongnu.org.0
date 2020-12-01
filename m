Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4952C9507
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 03:10:58 +0100 (CET)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjv85-0003Jr-QJ
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 21:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv6X-00021M-IZ; Mon, 30 Nov 2020 21:09:25 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:32933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv6S-0000o7-D6; Mon, 30 Nov 2020 21:09:21 -0500
Received: by mail-io1-xd29.google.com with SMTP id o8so84956ioh.0;
 Mon, 30 Nov 2020 18:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2oOt5IFK0sgLJSISwHWuQQfgNKZOTBoOczVad+Uu2I0=;
 b=cZM9spUZmBejmwGkf9d3nzENO/YoUK5ibcVsDjVbMcVVbciWJ6e0fETuqhF3GSGcsf
 CAwhRAnxdP5atnI97EMbUIlqArrYglxxzVPbDTfu79FrPH/FCOApXQskwPMF1OBqkE6w
 3sL1ekCUQm4AUmkbx+Tv+9BkVS2X1iOLj5FH6f+XpD9MoxNNsxdkIySAogstY+1MM4EO
 VZmygyOeUfqZsfRBeoOs0mZwSjFjcfqt6m763ZIrnPsS954Z0Nevot9GT445QM0ljlBi
 Y8x2QuNSTBPjRLBGmBoqeZx7ollrKcLQHMV51DEzl39NBF9WhhCZ17kUE39FObzO5REw
 JFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2oOt5IFK0sgLJSISwHWuQQfgNKZOTBoOczVad+Uu2I0=;
 b=A6fJC7P3Ih5PuCxcY2ltmeu4rJn7CouM6BN6mtORSoLUfKThCX07xnPJeq0tt9WWya
 /ldBxL1S3Wbxyn/1wHBuACzStsTm3sRSS4RDJbpwgU8IihRKidDmzYX+edptTgBrlXOg
 xlBEQ/FlLxudJ5jGXMAfWPR58h+0T4ukPKHNzWjcDnJaMT02gEb2bGZpZpFzyaowsjbG
 LaH8rJ27IhFmpb5tKK9fhoo3wxyRRIiueDvp28V2i54KvBedvkEDwyWOYyI6SlHSup6d
 OUaK848FfeFiv0K2FX+KzQpbuLvSXkhT2a8Y2XkBH/X8SZnpV91UmQcErQHXTzQIv+Bn
 szUw==
X-Gm-Message-State: AOAM533rQ6Y+bS9z+AfdkD/V/ScKJ3Qxa3F/l//7V0IDWUbPDrauw9la
 8L00TUHDbJx2puLbnh4IU7MnA7NmDkIjePlH4bY=
X-Google-Smtp-Source: ABdhPJz6kqRJMTTXapQcb5n3F1Yc5HdPjwdmAKe404j2bVOh+JspHDDyn5lvxy6iXR2hGwbNlH/CHLcCgufz/V9I9kc=
X-Received: by 2002:a6b:c994:: with SMTP id z142mr656376iof.42.1606788555085; 
 Mon, 30 Nov 2020 18:09:15 -0800 (PST)
MIME-Version: 1.0
References: <20201124094941.485767-1-f4bug@amsat.org>
 <20201124094941.485767-2-f4bug@amsat.org>
In-Reply-To: <20201124094941.485767-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 17:56:56 -0800
Message-ID: <CAKmqyKMtNHhoeer1Bw8XpV8HXnKkUndqkkEivkKQ15T2a1vJmg@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 1/4] hw/arm/fsl-imx: Add SD bus QOM alias on the
 SoC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 David Aghaian <David.Aghaian@panasonic.aero>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 1:54 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To be able to select a particular SD bus from the command
> line, add a QOM alias on the SoC (using an unique name).
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1895895
> Reported-by: David Aghaian <David.Aghaian@panasonic.aero>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/fsl-imx25.c | 6 ++++++
>  hw/arm/fsl-imx6.c  | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 08a98f828fc..6e66ae742af 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -239,6 +239,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error=
 **errp)
>              { FSL_IMX25_ESDHC1_ADDR, FSL_IMX25_ESDHC1_IRQ },
>              { FSL_IMX25_ESDHC2_ADDR, FSL_IMX25_ESDHC2_IRQ },
>          };
> +        g_autofree char *bus_name =3D NULL;
>
>          object_property_set_uint(OBJECT(&s->esdhc[i]), "sd-spec-version"=
, 2,
>                                   &error_abort);
> @@ -253,6 +254,11 @@ static void fsl_imx25_realize(DeviceState *dev, Erro=
r **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
>                             qdev_get_gpio_in(DEVICE(&s->avic),
>                                              esdhc_table[i].irq));
> +
> +        /* Alias controller SD bus to the SoC itself */
> +        bus_name =3D g_strdup_printf("sd-bus%d", i);
> +        object_property_add_alias(OBJECT(s), bus_name,
> +                                  OBJECT(&s->esdhc[i]), "sd-bus");
>      }
>
>      /* USB */
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index 00dafe3f62d..144bcdcaf6c 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -314,6 +314,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error =
**errp)
>              { FSL_IMX6_uSDHC3_ADDR, FSL_IMX6_uSDHC3_IRQ },
>              { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
>          };
> +        g_autofree char *bus_name =3D NULL;
>
>          /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
>          object_property_set_uint(OBJECT(&s->esdhc[i]), "sd-spec-version"=
, 3,
> @@ -329,6 +330,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error=
 **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
>                             qdev_get_gpio_in(DEVICE(&s->a9mpcore),
>                                              esdhc_table[i].irq));
> +
> +        /* Alias controller SD bus to the SoC itself */
> +        bus_name =3D g_strdup_printf("sd-bus%d", i);
> +        object_property_add_alias(OBJECT(s), bus_name,
> +                                  OBJECT(&s->esdhc[i]), "sd-bus");
>      }
>
>      /* USB */
> --
> 2.26.2
>
>

