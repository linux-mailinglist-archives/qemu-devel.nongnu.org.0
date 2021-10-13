Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57C42C172
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:34:26 +0200 (CEST)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeOn-00015H-Ih
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1maYio-0007Ek-23; Wed, 13 Oct 2021 03:30:44 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1maYim-0004I0-1v; Wed, 13 Oct 2021 03:30:41 -0400
Received: by mail-ua1-x941.google.com with SMTP id e2so2654266uax.7;
 Wed, 13 Oct 2021 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q04YolgQ2guANTX8EzdsZIAc8PLaO9lclWMEquEb4C0=;
 b=jDULCEEMlZ8x4NBnGFvmnU5RTg2l/QSJK9SKmhlbNZmPZHUOxWOM3xssVMl+RuwHzf
 bFvEHxy1tf4z77Uh5UNSUEGc2Yo765rpcIv49f2eVp2DJcNb27DZPt7v1pITFRqjCqh/
 T1UuYg7oEjPUfcKAp+3k2e5gpgjLtTVAhEeMxvWwKbKJaolXshQRxWgezQrlSPNFtVTt
 +PP+IArCbCtvyvSLNK0b10OP5YZudo9cl8U9XXWO5wFKdTc4S2wDB3jrhO0JIQ9I03IX
 q/u2vd2p3y5dyTcdiNKV4erFTuDNnSECAQ47nBlarzmMfTuVyeQx+cuuEdKib/SNmiFQ
 AcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q04YolgQ2guANTX8EzdsZIAc8PLaO9lclWMEquEb4C0=;
 b=RJ/jU2lQIHYCZ3PfevD3Ta5U4yEc98yudiHjrik5fz43gIprVDsT+Fi9jeNq+InO0e
 BqnslCBbFuYobeGpz/Zxq132zx8O37aRecWdd/xIoHG9vcGj9+GfrIktbefmZzDPvRBd
 FArzEKOPwjZ05+xQPhalvIHv48F+GoUOISj7zf36EIpp478Bp5mdJ5aJ3ESgBar67lqH
 +R8Ls0DfMHATVT41AgRHXjzxoMETPRx+ZtRM0OGcFthB/lwRfrXNfCKt8iBE2+R73A+R
 v5/exfGSXCwBwbQgktUeAwPt3qLBe9hTBMsoYId3JIse/kw4i6q8aHTeutp8xS4R705G
 UOpw==
X-Gm-Message-State: AOAM5322lf9yzR1UEcKAgqGQ73A0690ryp0Ti1n3A++I1xargEMFB/pg
 ue1hsROGU1Lby4Rhu0+q8Om8CLKzTN73sSuwIDg=
X-Google-Smtp-Source: ABdhPJxcAbUtccVC3iAr8vR1HXIFjPcCymdVRkLJwHeGuHoj85dLsl9AqsRJ3FE8dFMxj4E1JVmztb1b//LFALmfiE0=
X-Received: by 2002:a67:cb91:: with SMTP id h17mr37860751vsl.30.1634110238496; 
 Wed, 13 Oct 2021 00:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211013072607.783612-1-wangzhiqiang02@inspur.com>
In-Reply-To: <20211013072607.783612-1-wangzhiqiang02@inspur.com>
From: =?UTF-8?B?546L5b+X5by6?= <wangzq.jn@gmail.com>
Date: Wed, 13 Oct 2021 15:30:27 +0800
Message-ID: <CAHwNHZV7BcXE3g=oXcbwVA3gXXOKkp23Cem=OqdvdTF937iQzw@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Add support for the fp5280g2-bmc board
To: lintao.lc@inspur.com, liuxiwei@inspur.com, duanzhijia01@inspur.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::941;
 envelope-from=wangzq.jn@gmail.com; helo=mail-ua1-x941.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 09:30:50 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is based on https://github.com/openbmc/qemu (commit id:
2856503299534aab7602de2aaa88dd9ee7e9d61a)=EF=BC=8Cnot  qemu/qemu.

John Wang <wangzq.jn@gmail.com> =E4=BA=8E2021=E5=B9=B410=E6=9C=8813=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:26=E5=86=99=E9=81=93=EF=BC=9A
>
> The fp5280g2-bmc is supported by OpenBMC, It's
> based on the following device tree
>
> https://github.com/openbmc/linux/blob/dev-5.10/arch/arm/boot/dts/aspeed-b=
mc-inspur-fp5280g2.dts
>
> Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
> ---
>  hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 01c1747972..3587788f63 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -141,6 +141,21 @@ struct AspeedMachineState {
>          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
>          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>
> +/* FP5280G2 hardware value: 0XF100D286 */
> +#define FP5280G2_BMC_HW_STRAP1 (                                      \
> +        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
> +        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
> +        SCU_AST2500_HW_STRAP_UART_DEBUG |                               =
\
> +        SCU_AST2500_HW_STRAP_RESERVED28 |                               =
\
> +        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              =
\
> +        SCU_HW_STRAP_VGA_CLASS_CODE |                                   =
\
> +        SCU_HW_STRAP_LPC_RESET_PIN |                                    =
\
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                =
\
> +        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     =
\
> +        SCU_HW_STRAP_MAC1_RGMII |                                       =
\
> +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
> +        SCU_AST2500_HW_STRAP_RESERVED1)
> +
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>
> @@ -717,6 +732,17 @@ static void g220a_bmc_i2c_init(AspeedMachineState *b=
mc)
>                            eeprom_buf);
>  }
>
> +static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc =3D &bmc->soc;
> +
> +    /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP10=
5,
> +                     0x48);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP10=
5,
> +                     0x49);
> +}
> +
>  static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc =3D &bmc->soc;
> @@ -1082,6 +1108,24 @@ static void aspeed_machine_g220a_class_init(Object=
Class *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>
> +static void aspeed_machine_fp5280g2_class_init(ObjectClass *oc, void *da=
ta)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       =3D "Inspur FP5280G2 BMC (ARM1176)";
> +    amc->soc_name  =3D "ast2500-a1";
> +    amc->hw_strap1 =3D FP5280G2_BMC_HW_STRAP1;
> +    amc->fmc_model =3D "n25q512a";
> +    amc->spi_model =3D "mx25l25635e";
> +    amc->num_cs    =3D 2;
> +    amc->macs_mask  =3D ASPEED_MAC0_ON | ASPEED_MAC1_ON;
> +    amc->i2c_init  =3D fp5280g2_bmc_i2c_init;
> +    mc->default_ram_size =3D 512 * MiB;
> +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>  static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *dat=
a)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -1146,6 +1190,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
>          .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
>          .parent        =3D TYPE_ASPEED_MACHINE,
>          .class_init    =3D aspeed_machine_g220a_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("fp5280g2-bmc"),
> +        .parent        =3D TYPE_ASPEED_MACHINE,
> +        .class_init    =3D aspeed_machine_fp5280g2_class_init,
>      }, {
>          .name          =3D MACHINE_TYPE_NAME("quanta-q71l-bmc"),
>          .parent        =3D TYPE_ASPEED_MACHINE,
> --
> 2.30.2
>

