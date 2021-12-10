Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470734703EA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:32:52 +0100 (CET)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhtD-0004ft-Dd
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:32:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1mvgy6-0005GO-0M; Fri, 10 Dec 2021 09:33:50 -0500
Received: from [2607:f8b0:4864:20::22b] (port=45990
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1mvgy3-0002Zg-Li; Fri, 10 Dec 2021 09:33:49 -0500
Received: by mail-oi1-x22b.google.com with SMTP id 7so13406128oip.12;
 Fri, 10 Dec 2021 06:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CSa0/0DWTbmm6A0A3f7ZWlAtb52saKTaSRbBjsfmaVE=;
 b=Vj8o0Klq+3aCRa0ONQFeWsaIBTOUCYduM2F99El5vcjlfGsXGpWYHHHltXKvorJ9WP
 RbWt8E1Tj/KOtrcaNA/mwbkYW/Ay9JF2HfzDTF942yHy6ztz+NJp82gKDpNDn4OkmfaI
 XR9PQ1ie9G6IZKLN+C68O9ha0qQRyCl5+LvQ2I8wpyK6nalcNUXbjkolKWFAWuaBYTTr
 0OWyp34JejARpLxWLRmcLFcBwPcL8py9W4Up+FqMoJWVeafz8L20n08KNyzc9koC902U
 NKLMxJjbaBWPvGr1yjUonZfK6TG+AQo73C5JNYDNWNca5xgpwh1LvDfVrcppxe5jV73O
 6oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CSa0/0DWTbmm6A0A3f7ZWlAtb52saKTaSRbBjsfmaVE=;
 b=kN4VKWIwg9S/uUo0zeDm/Fma9UHhdsfiHMh3pHKObI8cTkDvirO1EkwrPwXCeIR0jm
 2fT5mfIK77bLzZ1xWLFJf6HYc/KI1Pg3wtbRZi9um9xMF00tj2A1fLgmuHmCy4kwQg5D
 mR3j5aVkvvfoVQrkXEf8oDt/0DOo+LbNdQFKtn46p4qttC7+xALRKKBTTz8OE2XH1i2r
 UVl0c2cVoyp7KGr8cWgDDHCQVzVRUIInVXCj44yVUTB3IqiDSKpDzU5NV/M/xmJKIJvP
 OvZeq9AgeB5+k2e4jtT31E0lnvYtteSB/GrMmsZOtt7g825or7EZKo1t02p0aAz8haNc
 DM1w==
X-Gm-Message-State: AOAM533+yF7APDvWdJdVWmMa5n6FphdBQKo5HIhWCgbuevdocquHwxgI
 63Snxsv4NfiFOv+f755K+c0tZpuHr8yRrMrV5t0=
X-Google-Smtp-Source: ABdhPJzugvoldHE6oTWJqZ14c770zUSM4VwUbWy9av+onTb/u8GF64Aoo4iC3FW++wW4ZRCxaYK9Tp3n2ATPW1KxJDo=
X-Received: by 2002:a05:6808:bc7:: with SMTP id
 o7mr12776988oik.172.1639146825791; 
 Fri, 10 Dec 2021 06:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20211210083034.726610-1-troy_lee@aspeedtech.com>
 <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
In-Reply-To: <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Fri, 10 Dec 2021 22:33:34 +0800
Message-ID: <CAN9Jwz3ytV3ogztQrcL+YKGdgKYdNjypeMFbKfyqMiwvWhnMEw@mail.gmail.com>
Subject: Re: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=leetroy@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Dec 2021 10:20:18 -0500
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
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 10:05 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> On 12/10/21 09:30, Troy Lee wrote:
> > AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memor=
y
> > and io address. If guest machine try to access DPMCU memory, it will
> > cause a fatal error.
>
> The Aspeed SoCs have an "aspeed_soc.io" region for unimplemented devices
> but it's too small. Anyhow, it is better to have per logic unit. We shoul=
d
> change that one day.
>
Good idea!

> For my information, which FW image are you using ?
>

We're using Aspeed's SDK image, I tested with ast2600-default machine.
Prebuilt image can be download from:
https://github.com/AspeedTech-BMC/openbmc/releases/tag/v07.02

Without declaring the DPMCU memory, the image will hangs in u-boot.
We're still working on I3C and SPI issue to be resolved to get into rootfs.

Thanks for your review.
Troy Lee

> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
> > ---
> >   hw/arm/aspeed_ast2600.c     | 8 ++++++++
> >   include/hw/arm/aspeed_soc.h | 2 ++
> >   2 files changed, 10 insertions(+)
> >
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index 0384357a95..e33483fb5d 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -19,9 +19,11 @@
> >   #include "sysemu/sysemu.h"
> >
> >   #define ASPEED_SOC_IOMEM_SIZE       0x00200000
> > +#define ASPEED_SOC_DPMCU_SIZE       0x00040000
> >
> >   static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
> >       [ASPEED_DEV_SRAM]      =3D 0x10000000,
> > +    [ASPEED_DEV_DPMCU]     =3D 0x18000000,
> >       /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
> >       [ASPEED_DEV_IOMEM]     =3D 0x1E600000,
> >       [ASPEED_DEV_PWM]       =3D 0x1E610000,
> > @@ -44,6 +46,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
> >       [ASPEED_DEV_SCU]       =3D 0x1E6E2000,
> >       [ASPEED_DEV_XDMA]      =3D 0x1E6E7000,
> >       [ASPEED_DEV_ADC]       =3D 0x1E6E9000,
> > +    [ASPEED_DEV_DP]        =3D 0x1E6EB000,
> >       [ASPEED_DEV_VIDEO]     =3D 0x1E700000,
> >       [ASPEED_DEV_SDHCI]     =3D 0x1E740000,
> >       [ASPEED_DEV_EMMC]      =3D 0x1E750000,
> > @@ -104,6 +107,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
> >       [ASPEED_DEV_ETH3]      =3D 32,
> >       [ASPEED_DEV_ETH4]      =3D 33,
> >       [ASPEED_DEV_KCS]       =3D 138,   /* 138 -> 142 */
> > +    [ASPEED_DEV_DP]        =3D 62,
> >   };
> >
> >   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> > @@ -298,6 +302,10 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
> >       memory_region_add_subregion(get_system_memory(),
> >                                   sc->memmap[ASPEED_DEV_SRAM], &s->sram=
);
> >
> > +    /* DPMCU */
> > +    create_unimplemented_device("aspeed.dpmcu", sc->memmap[ASPEED_DEV_=
DPMCU],
> > +                                ASPEED_SOC_DPMCU_SIZE);
> > +
> >       /* SCU */
> >       if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
> >           return;
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index 8139358549..18fb7eed46 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -139,6 +139,8 @@ enum {
> >       ASPEED_DEV_EMMC,
> >       ASPEED_DEV_KCS,
> >       ASPEED_DEV_HACE,
> > +    ASPEED_DEV_DPMCU,
> > +    ASPEED_DEV_DP,
> >   };
> >
> >   #endif /* ASPEED_SOC_H */
> >
>

