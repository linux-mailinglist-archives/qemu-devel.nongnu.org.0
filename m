Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2336276D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:05:55 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSqo-0001Fp-Rs
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lXSQA-0005C2-25
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:38:22 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lXSQ7-0007uJ-TF
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:38:21 -0400
Received: by mail-qk1-x734.google.com with SMTP id d23so17611248qko.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hz9a4hjciu21TFOJCSK8kwYsTaHAfAEQqBxTY2sg6/I=;
 b=UZcPmgJhAkT1R/KHF/UgdvXzeOuL4PkGIgpC7O7D8NfiOzE96dk8t1KEjHZQwHiheM
 wy2k2CLfYPDcDpuKAfbS6a7r2vL+LI0DdswbTUUDYkG08j8/0UBH85Suvh5eZN2cw1m9
 lWzh3+qt2keEUgHCVPoUdaDj6Vl2l0PO5uVWJDIKb4IJBNIAVqYJ2rGFPC0vjNoGycyi
 M/3lXL4OnxqUPHrN/4CHhFDHzav9vtVjlMfmZboKvAd/UQg70uY4ARHMqdqP56A+p4w/
 RWYe74spLbluPYkSBlfwL3T4aHd4IP63evt/8q9J5ASZ8NNrtJCZk1JJipcHFQ16gn2p
 Y6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hz9a4hjciu21TFOJCSK8kwYsTaHAfAEQqBxTY2sg6/I=;
 b=dm8+0Ri5DC1PFkzpskn9AtzEp1sxFlHvB1bXsp552HWabsMHXJBCoTC0f1Gr/gohVv
 EnQdJZ9g9u0SYU5zB+5eVhCiE0spI3d4Gyqejp06CcSoYe11YEkv6vBXZhuu/1WrrXZ3
 5i/hk5BN8Cgd5P4VRhmbfhHxz9RVp7ypigCPU1cVl6BHYB9sKwUYJP/PARqOZEwmCNu1
 Oo8k3LbeID3qoWvEN5pIp7byRy8GeKPO235l897J53Mk59Kgk8tD/yvXh1MSvrn9DcQk
 LgIuZ7hg6quZEeGvcTGmhw4e8nghiQBMLEY7vvBkzCP+imk5P9NxSZ2v5zUPic4gdlO2
 tD6Q==
X-Gm-Message-State: AOAM5306t8a3XA9rfiu5JWTRubwRThHfJmOFJP35vsPP5+KOZkez51AP
 +V2FaLna/Op27IPfnb4yLiNAHLE7AsrHJY2pJ9uhXA==
X-Google-Smtp-Source: ABdhPJx27SeaFLJtBxmuaaWDH0qs0XiC5x2DqHV/NpxXd55Ov8FPfHXx/ycYyT+zIbnYZUUFEtvb92VCAX1bX/6/EbY=
X-Received: by 2002:a37:2ec4:: with SMTP id u187mr354995qkh.472.1618594697648; 
 Fri, 16 Apr 2021 10:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210416162426.3217033-1-venture@google.com>
 <4e5592b1-ea5b-0ef6-c837-1c7ac1476696@kaod.org>
In-Reply-To: <4e5592b1-ea5b-0ef6-c837-1c7ac1476696@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Fri, 16 Apr 2021 10:38:06 -0700
Message-ID: <CAO=notw0zZZt7U1-tyg9h8oC_TngRCNddEgmNbz=NnLojdYUYg@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Add support for the quanta-q7l1-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=venture@google.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 9:40 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Patrick,
>
> On 4/16/21 6:24 PM, Patrick Venture wrote:
> > The Quanta-Q71l BMC board is a board supported by OpenBMC.
> >
> > Tested: Booted quanta-q71l firmware.
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>
> This looks good.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Some comments below,
>
>
> > ---
> >  hw/arm/aspeed.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index a17b75f494..4611996d21 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -138,6 +138,19 @@ struct AspeedMachineState {
> >  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition)=
 */
> >  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> >
> > +/* Quanta-Q71l hardware value */
> > +#define QUANTA_Q71L_BMC_HW_STRAP1 (                                   =
  \
> > +        SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_128MB) |             =
  \
> > +        SCU_AST2400_HW_STRAP_DRAM_CONFIG(2/* DDR3 with CL=3D6, CWL=3D5=
 */) | \
> > +        SCU_AST2400_HW_STRAP_ACPI_DIS |                               =
  \
> > +        SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(AST2400_CLK_24M_IN) |     =
  \
> > +        SCU_HW_STRAP_VGA_CLASS_CODE |                                 =
  \
> > +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_PASS_THROUGH) |        =
  \
> > +        SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(AST2400_CPU_AHB_RATIO_2=
_1) | \
> > +        SCU_HW_STRAP_SPI_WIDTH |                                      =
  \
> > +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_8M_DRAM) |                      =
  \
> > +        SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
> > +
> >  /* AST2600 evb hardware value */
> >  #define AST2600_EVB_HW_STRAP1 0x000000C0
> >  #define AST2600_EVB_HW_STRAP2 0x00000003
> > @@ -433,6 +446,34 @@ static void palmetto_bmc_i2c_init(AspeedMachineSta=
te *bmc)
> >      object_property_set_int(OBJECT(dev), "temperature3", 110000, &erro=
r_abort);
> >  }
> >
> > +static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
> > +{
> > +    AspeedSoCState *soc =3D &bmc->soc;
> > +
> > +    /*
> > +     * The quanta-q71l platform expects tmp75s which are compatible wi=
th
> > +     * tmp105s.
> > +     */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105"=
, 0x4c);
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105"=
, 0x4e);
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105"=
, 0x4f);
> > +
> > +    /* TODO: i2c-1: Add baseboard FRU eeprom@54 24c64 */
>
> Why not add the eeprom devices ?

I wanted to provide this ahead of filling it all out, I also have the
pca954x staged, and some other devices to add.  If you want, I can add
those and make this into a patch series instead of a one-off.

>
> > +    /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
> > +    /* TODO: Add Memory Riser i2c mux and eeproms. */
> > +
> > +    /* TODO: i2c-2: pca9546@74 */
> > +    /* TODO: i2c-2: pca9548@77 */
> > +    /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
> > +    /* TODO: i2c-7: Add pca9546@70 */
> > +    /*        - i2c@0: pmbus@59 */
> > +    /*        - i2c@1: pmbus@58 */
> > +    /*        - i2c@2: pmbus@58 */
> > +    /*        - i2c@3: pmbus@59 */
> > +    /* TODO: i2c-7: Add PDB FRU eeprom@52 */
> > +    /* TODO: i2c-8: Add BMC FRU eeprom@50 */
> > +}
> > +
> >  static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
> >  {
> >      AspeedSoCState *soc =3D &bmc->soc;
> > @@ -728,6 +769,23 @@ static void aspeed_machine_palmetto_class_init(Obj=
ectClass *oc, void *data)
> >          aspeed_soc_num_cpus(amc->soc_name);
> >  };
> >
> > +static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, voi=
d *data)
> > +{
> > +    MachineClass *mc =3D MACHINE_CLASS(oc);
> > +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> > +
> > +    mc->desc       =3D "Quanta-Q71l BMC (ARM926EJ-S)";
> > +    amc->soc_name  =3D "ast2400-a1";
> > +    amc->hw_strap1 =3D QUANTA_Q71L_BMC_HW_STRAP1;
> > +    amc->fmc_model =3D "n25q256a";
> > +    amc->spi_model =3D "mx25l25635e";
> > +    amc->num_cs    =3D 1;
> > +    amc->i2c_init  =3D quanta_q71l_bmc_i2c_init;
> > +    mc->default_ram_size       =3D 128 * MiB;
>
> I thought the board had more RAM ?

It does not :(  Trying to maintain OpenBMC with such little memory
overhead has been less than fun, but it's do-able.

>
> Thanks,
>
> C.
>
> > +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> > +        aspeed_soc_num_cpus(amc->soc_name);
> > +}
> > +
> >  static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *o=
c,
> >                                                          void *data)
> >  {
> > @@ -927,6 +985,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
> >          .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
> >          .parent        =3D TYPE_ASPEED_MACHINE,
> >          .class_init    =3D aspeed_machine_g220a_class_init,
> > +    }, {
> > +        .name          =3D MACHINE_TYPE_NAME("quanta-q71l-bmc"),
> > +        .parent        =3D TYPE_ASPEED_MACHINE,
> > +        .class_init    =3D aspeed_machine_quanta_q71l_class_init,
> >      }, {
> >          .name          =3D TYPE_ASPEED_MACHINE,
> >          .parent        =3D TYPE_MACHINE,
> >
>

