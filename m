Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE14B82F8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:33:54 +0100 (CET)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFl2-0002Du-Pi
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:33:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nKFMz-0007zh-B9; Wed, 16 Feb 2022 03:09:01 -0500
Received: from [2607:f8b0:4864:20::836] (port=44972
 helo=mail-qt1-x836.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nKFMx-0000vl-KA; Wed, 16 Feb 2022 03:09:01 -0500
Received: by mail-qt1-x836.google.com with SMTP id b5so1349911qtq.11;
 Wed, 16 Feb 2022 00:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lw5YiY9yUGLm18fiLImLVX4lYgGEP51hGR/N6TRCB5U=;
 b=ALM7NRlBJVRT+KGYhtN/vd6NEGy24dq/J4+Seep9ruvpRsYKdzvYKsl0ngySFUJFo1
 bJBFQksXFlTc1Vv79ua3/pzxfJSkr3fvAupu9FSuNA/GKl4ssL3YiaWInt+h4OdM2MUX
 rYIx3nLOi2/W3ZJUoefgLb+m9i1Wl54al6U4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lw5YiY9yUGLm18fiLImLVX4lYgGEP51hGR/N6TRCB5U=;
 b=si0dmbi/lH1wz5+WwYKebsXk9CKvgiP1d4sCJK89o3wJmTcu9E7P+OSD2Wq2Jomtqe
 YqCSwzvPnPnlAtff5v4B7jgUN8dBjRX1RxEnzYXmxGUQSWOT3DVvFxzc/Z+xlYVdi+Dq
 8HJrNouJ7YCeWsX2tGKAxZU0Vr0XWLgqm8PJhHwRZp4uBzBWlhYPSV51xIKQ7ElyPT4h
 TT464qrVhj+pafXQeemDjiwgFVpUvFkgbhrj3XEAAYc6onE+ixWAKvlCtv4sxtvB3BCe
 wPY8/8y3OHyVozCxZriF439bW6egLMDUQP7CmWjzh7eWOkEna09VOWZljmjIxaxXWycD
 WS5Q==
X-Gm-Message-State: AOAM533sC0Q4ImKzG9po/FzD8o1jyoMBfuqau/lA7UDpQSXoug+kQxsG
 2F/i48Mi/EHJxTAYnCmvJBM+UOpklrSNn3bc/4w=
X-Google-Smtp-Source: ABdhPJwBt16LTBXnRrQSQtlUejvGuqfn6MMDctl3CXkI9VBvJ4SFvauaoooEJnkGMsP5L1ncvfFNmB2FHmN3Vp2hT90=
X-Received: by 2002:ac8:5b91:0:b0:2db:acb7:2412 with SMTP id
 a17-20020ac85b91000000b002dbacb72412mr1136181qta.475.1644998938316; Wed, 16
 Feb 2022 00:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20220216080354.65257-1-joel@jms.id.au>
 <142d4fb5-c33f-5902-0aec-a21af01c717c@kaod.org>
In-Reply-To: <142d4fb5-c33f-5902-0aec-a21af01c717c@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Feb 2022 08:08:46 +0000
Message-ID: <CACPK8XcE7DS30nS-VmUXRJ4O8tj6KVC4KFV_Jx4ff-a6xFW2DA@mail.gmail.com>
Subject: Re: [PATCH] arm: Remove swift-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::836
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 at 08:07, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 2/16/22 09:03, Joel Stanley wrote:
> > It was scheduled for removal in 7.0.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Could you please send a v2 with an update of docs/about/deprecated.rst ?

Sure. Do we remove the machine from the list once they're gone?

>
> With that,
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
> > ---
> >   docs/system/arm/aspeed.rst |  1 -
> >   hw/arm/aspeed.c            | 53 -------------------------------------=
-
> >   2 files changed, 54 deletions(-)
> >
> > diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> > index d8b102fa0ad0..60ed94f18759 100644
> > --- a/docs/system/arm/aspeed.rst
> > +++ b/docs/system/arm/aspeed.rst
> > @@ -22,7 +22,6 @@ AST2500 SoC based machines :
> >   - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
> >   - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
> >   - ``sonorapass-bmc``       OCP SonoraPass BMC
> > -- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed i=
n v7.0)
> >   - ``fp5280g2-bmc``         Inspur FP5280G2 BMC
> >   - ``g220a-bmc``            Bytedance G220A BMC
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index d911dc904fb3..9789a489047b 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -544,35 +544,6 @@ static void romulus_bmc_i2c_init(AspeedMachineStat=
e *bmc)
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds133=
8", 0x32);
> >   }
> >
> > -static void swift_bmc_i2c_init(AspeedMachineState *bmc)
> > -{
> > -    AspeedSoCState *soc =3D &bmc->soc;
> > -
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552=
", 0x60);
> > -
> > -    /* The swift board expects a TMP275 but a TMP105 is compatible */
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105"=
, 0x48);
> > -    /* The swift board expects a pca9551 but a pca9552 is compatible *=
/
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552=
", 0x60);
> > -
> > -    /* The swift board expects an Epson RX8900 RTC but a ds1338 is com=
patible */
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338"=
, 0x32);
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552=
", 0x60);
> > -
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423"=
, 0x4c);
> > -    /* The swift board expects a pca9539 but a pca9552 is compatible *=
/
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552=
", 0x74);
> > -
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423=
", 0x4c);
> > -    /* The swift board expects a pca9539 but a pca9552 is compatible *=
/
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "pca955=
2",
> > -                     0x74);
> > -
> > -    /* The swift board expects a TMP275 but a TMP105 is compatible */
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105=
", 0x48);
> > -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105=
", 0x4a);
> > -}
> > -
> >   static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> >   {
> >       AspeedSoCState *soc =3D &bmc->soc;
> > @@ -1102,26 +1073,6 @@ static void aspeed_machine_sonorapass_class_init=
(ObjectClass *oc, void *data)
> >           aspeed_soc_num_cpus(amc->soc_name);
> >   };
> >
> > -static void aspeed_machine_swift_class_init(ObjectClass *oc, void *dat=
a)
> > -{
> > -    MachineClass *mc =3D MACHINE_CLASS(oc);
> > -    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> > -
> > -    mc->desc       =3D "OpenPOWER Swift BMC (ARM1176)";
> > -    amc->soc_name  =3D "ast2500-a1";
> > -    amc->hw_strap1 =3D SWIFT_BMC_HW_STRAP1;
> > -    amc->fmc_model =3D "mx66l1g45g";
> > -    amc->spi_model =3D "mx66l1g45g";
> > -    amc->num_cs    =3D 2;
> > -    amc->i2c_init  =3D swift_bmc_i2c_init;
> > -    mc->default_ram_size       =3D 512 * MiB;
> > -    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> > -        aspeed_soc_num_cpus(amc->soc_name);
> > -
> > -    mc->deprecation_reason =3D "redundant system. Please use a similar=
 "
> > -        "OpenPOWER BMC, Witherspoon or Romulus.";
> > -};
> > -
> >   static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, vo=
id *data)
> >   {
> >       MachineClass *mc =3D MACHINE_CLASS(oc);
> > @@ -1277,10 +1228,6 @@ static const TypeInfo aspeed_machine_types[] =3D=
 {
> >           .name          =3D MACHINE_TYPE_NAME("romulus-bmc"),
> >           .parent        =3D TYPE_ASPEED_MACHINE,
> >           .class_init    =3D aspeed_machine_romulus_class_init,
> > -    }, {
> > -        .name          =3D MACHINE_TYPE_NAME("swift-bmc"),
> > -        .parent        =3D TYPE_ASPEED_MACHINE,
> > -        .class_init    =3D aspeed_machine_swift_class_init,
> >       }, {
> >           .name          =3D MACHINE_TYPE_NAME("sonorapass-bmc"),
> >           .parent        =3D TYPE_ASPEED_MACHINE,
>

