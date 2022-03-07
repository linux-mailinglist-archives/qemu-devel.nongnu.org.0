Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB34CFCF8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:32:50 +0100 (CET)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBbd-0005t7-1N
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:32:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRBBZ-0004Ry-69; Mon, 07 Mar 2022 06:05:53 -0500
Received: from [2607:f8b0:4864:20::12f] (port=45593
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRBBX-0004Ei-J4; Mon, 07 Mar 2022 06:05:52 -0500
Received: by mail-il1-x12f.google.com with SMTP id h2so910525ila.12;
 Mon, 07 Mar 2022 03:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pVy4AzLXXvS7qLKcHtZ5i12l2K5nNvv7Rm0g9B5H27c=;
 b=JO0VUQT7aUKfGbM7SwAGLqACa7ETHP6C/SyH60uX91wQNjo+qYHNA5eg8Q24y1Ub2X
 hP2mRxyIw9uW3gsFDIwfW3lJgS4H04doS+h3sNsHqIQDvJhz7811z8WQFofuilJArx3N
 x1lw2onF7CDQEZE2Sj+ikiqk0DYuE6SJr2u2RxE9cqzhTEekfOjTQRYbx2sCTjT9uTA5
 /Gv4alXE029xXPeiUCvGl5Cy3uHgrYItVVCGwjLMXF40eih0SAByuGZm3mncScPbcGqA
 h4vSkL1Sbu9+QhTGaVrYP+PDh6MpjYyYudp2HDzU3+30OKelXpYQiRvmH1kZ0VD/R6Ol
 9u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pVy4AzLXXvS7qLKcHtZ5i12l2K5nNvv7Rm0g9B5H27c=;
 b=BLTaGsYSqh9WY66SIj6QmtCR5R8UhLL7Xvg3mFfdP1uouMA1NN7+jNM3l/gQiL7KxR
 mcXS2wzxZVB+t1W6qYtfVD6kY2nv+Pc4b/Uef1eY07I7S07K1pZwlysMtdjSQRxfQyDi
 Ocudt+iY2dwF1bhNTKoQrhIx1SlRJTIqJN0xOSxFNUJJUxa/j9Y0R4uifJ0StHIkJsxx
 3+moVQBoDm1frzLiinH10uDqqrfreDwOa3KHrBdpTPwxQqqfomOybvAC9JYNZqeUcQ0f
 zf6mQIAVCmqG6ZieNrUJziE8emXzV1u7JMY4l1AK1U4lNR15DEPygWGUnib6kybAzRYe
 2Kjg==
X-Gm-Message-State: AOAM53122zLPOzYn8/25nU+fwSvZJJn+22dIvUpDRek5bRjS8OwsGMgB
 iub0IcNBFPOXVW/Ojjib+llwRZ9mHPia/B0TUdBIrQijNqU=
X-Google-Smtp-Source: ABdhPJwCR4s80YDTO+vqzLr1UsEUQgZh4NfcWcm4F3dBdHlH0ue//+yskxg6xU/AyR3EYM7HCRW1jEKaDIWDb0db7nw=
X-Received: by 2002:a05:6e02:154c:b0:2c6:4ffa:57ec with SMTP id
 j12-20020a056e02154c00b002c64ffa57ecmr775720ilu.55.1646651149711; Mon, 07 Mar
 2022 03:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-4-clg@kaod.org>
In-Reply-To: <20220307071856.1410731-4-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Mar 2022 21:05:23 +1000
Message-ID: <CAKmqyKNTyqEAo+7YZ9vTzfnpaFksJ1ErOe4E2+EXcW9TESy5kg@mail.gmail.com>
Subject: Re: [PATCH 3/6] aspeed/smc: Remove 'num_cs' field
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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

On Mon, Mar 7, 2022 at 5:19 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> It is not used anymore.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/ssi/aspeed_smc.h | 1 -
>  hw/arm/aspeed.c             | 2 --
>  hw/arm/aspeed_ast2600.c     | 2 --
>  hw/arm/aspeed_soc.c         | 2 --
>  hw/ssi/aspeed_smc.c         | 7 -------
>  5 files changed, 14 deletions(-)
>
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index cad73ddc13f2..4a9354e13c7f 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -57,7 +57,6 @@ struct AspeedSMCState {
>
>      qemu_irq irq;
>
> -    uint32_t num_cs;
>      qemu_irq *cs_lines;
>      bool inject_failure;
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index be24508a9854..8f14738676f6 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -352,8 +352,6 @@ static void aspeed_machine_init(MachineState *machine=
)
>                              &error_abort);
>      object_property_set_int(OBJECT(&bmc->soc), "hw-strap2", amc->hw_stra=
p2,
>                              &error_abort);
> -    object_property_set_int(OBJECT(&bmc->soc), "num-cs", amc->num_cs,
> -                            &error_abort);
>      object_property_set_link(OBJECT(&bmc->soc), "dram",
>                               OBJECT(machine->ram), &error_abort);
>      if (machine->kernel_filename) {
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 21cd3342c578..c1e15e37739c 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -163,7 +163,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
>
>      snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
>      object_initialize_child(obj, "fmc", &s->fmc, typename);
> -    object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs");
>
>      for (i =3D 0; i < sc->spis_num; i++) {
>          snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, s=
ocname);
> @@ -383,7 +382,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
>      for (i =3D 0; i < sc->spis_num; i++) {
>          object_property_set_link(OBJECT(&s->spi[i]), "dram",
>                                   OBJECT(s->dram_mr), &error_abort);
> -        object_property_set_int(OBJECT(&s->spi[i]), "num-cs", 1, &error_=
abort);
>          if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
>              return;
>          }
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 7d53cf2f5133..58714cb2a01d 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -170,7 +170,6 @@ static void aspeed_soc_init(Object *obj)
>
>      snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
>      object_initialize_child(obj, "fmc", &s->fmc, typename);
> -    object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs");
>
>      for (i =3D 0; i < sc->spis_num; i++) {
>          snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, s=
ocname);
> @@ -327,7 +326,6 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
>
>      /* SPI */
>      for (i =3D 0; i < sc->spis_num; i++) {
> -        object_property_set_int(OBJECT(&s->spi[i]), "num-cs", 1, &error_=
abort);
>          if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
>              return;
>          }
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index a5d8bb717fc7..6859f061c8be 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1127,12 +1127,6 @@ static void aspeed_smc_realize(DeviceState *dev, E=
rror **errp)
>      s->r_timings =3D asc->r_timings;
>      s->conf_enable_w0 =3D asc->conf_enable_w0;
>
> -    /* Enforce some real HW limits */
> -    if (s->num_cs > asc->max_peripherals) {
> -        aspeed_smc_error("num_cs cannot exceed: %d", asc->max_peripheral=
s);
> -        s->num_cs =3D asc->max_peripherals;
> -    }
> -
>      /* DMA irq. Keep it first for the initialization in the SoC */
>      sysbus_init_irq(sbd, &s->irq);
>
> @@ -1211,7 +1205,6 @@ static const VMStateDescription vmstate_aspeed_smc =
=3D {
>  };
>
>  static Property aspeed_smc_properties[] =3D {
> -    DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
>      DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, f=
alse),
>      DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
>                       TYPE_MEMORY_REGION, MemoryRegion *),
> --
> 2.34.1
>
>

