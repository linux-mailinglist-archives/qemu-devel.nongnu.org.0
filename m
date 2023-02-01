Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C2685FD3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 07:37:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN6K9-0005CC-Fi; Wed, 01 Feb 2023 01:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN6K3-0005BV-Qu; Wed, 01 Feb 2023 01:10:19 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN6JW-0001CC-J9; Wed, 01 Feb 2023 01:10:19 -0500
Received: by mail-ej1-x634.google.com with SMTP id ml19so24688184ejb.0;
 Tue, 31 Jan 2023 22:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqEowceQC4WiCxcwaqBJjKALz7d+JJbEp/SVWrGI4ic=;
 b=hIwTM+2FtAmkvs+nabc3+5GsFLfuoSySgOO4zeh+XQMhv4PtDT4y35cL7acAPVTylH
 P6THisjSZ7m7kM0P4eTxW1WODLsLpjjCtYBo1RMjcVgxRK9CzMG/n3L4wS2pdOC7SUXH
 cLw7zG2rKAuuIxiHIP9Oc4RdqOL/7kK4JbgYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqEowceQC4WiCxcwaqBJjKALz7d+JJbEp/SVWrGI4ic=;
 b=BKETOJ5EFIxJUWc1Y0qdmwVLjJJlGblee5xHLnxVNy5wsUGGZpHHZmx5Y4s0Dqev12
 6+orAwIlkvKmz27z54VwA2iOYlP7KlzwymIdsUV4i9RrsGrm8YuHTY7OPQXmmjdcABBc
 tbQv6g2n6nHrYw1zv46O3PLuaM3rSboz3U3gE1eUNzOa0EiHHdKqFmlpe6IllMa30l2F
 x3exfjiO5Xz19U03ZXkiuUyjyRoq9ne+yNG+JrEVztEsZU0DARlVTJMsS3s4PVL6G/br
 nIb7+GeVtwVwnItaplMn0ftY43qOpErJrEQdw9kh1xCrtrHs67XEvOF9a9npbPH+3F2V
 yo1A==
X-Gm-Message-State: AO0yUKUoELTQBACKUkZm4yhqXM+odrXdNALelp8ORXexRX/uyFbVLbij
 4nxw1LMoYlGpcBZkQpAziYSWUbtJMxVncNHpTPW70p4ivBE=
X-Google-Smtp-Source: AK7set+SQsdiBuhBqIynowXd8ymHpCht+lGX/bSE0CVQjghUbjWzjnEG++iwK3rgY0LpTjN5TcOcsqCjXpUDZejvffY=
X-Received: by 2002:a17:906:1653:b0:88a:7cf5:5d33 with SMTP id
 n19-20020a170906165300b0088a7cf55d33mr342719ejd.100.1675229982823; Tue, 31
 Jan 2023 21:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-3-clg@kaod.org>
In-Reply-To: <20230119123449.531826-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:39:30 +0000
Message-ID: <CACPK8XeSN90WZjpAiBqcQyOgJh+q=HTgFsw98Ywm7voGHY7ypw@mail.gmail.com>
Subject: Re: [PATCH 02/25] aspeed: Add Supermicro X11 SPI machine type
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 19 Jan 2023 at 12:36, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Guenter Roeck <linux@roeck-us.net>
>
> supermicrox11-bmc is configured with ast2400-a1 SoC. This does not match
> the Supermicro documentation for X11 BMCs, and it does not match the
> devicetree file in the Linux kernel.

I found this sentence confusing; AFAICT X11 doesn't name a specific
motherboard. It appears to be a marketing term for a bunch of
different things.

> As it turns out, some Supermicro X11 motherboards use AST2400 SoCs,
> while others use AST2500.
>
> Introduce new machine type supermicrox11-spi-bmc with AST2500 SoC

How about supermicro-x11spi-bmc? It would match the product name:

https://www.supermicro.com/en/products/motherboard/X11SPi-TF

as well as the device tree filename.

> to match the devicetree description in the Linux kernel. Hardware
> configuration details for this machine type are guesswork and taken
> from defaults as well as from the Linux kernel devicetree file.
>
> The new machine type was tested with aspeed-bmc-supermicro-x11spi.dts
> from the Linux kernel and with Linux versions 6.0.3 and 6.1-rc2.
> Linux booted successfully from initrd and from both SPI interfaces.
> Ethernet interfaces were confirmed to be operational.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Link: https://lore.kernel.org/r/20221025165109.1226001-1-linux@roeck-us.n=
et
> Message-Id: <20221025165109.1226001-1-linux@roeck-us.net>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 55f114ef72..4919a1fe9e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -71,6 +71,16 @@ struct AspeedMachineState {
>          SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
>          SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>
> +/* TODO: Find the actual hardware value */
> +#define SUPERMICROX11_SPI_BMC_HW_STRAP1 (                               =
\
> +        AST2500_HW_STRAP1_DEFAULTS |                                    =
\
> +        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
> +        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
> +        SCU_AST2500_HW_STRAP_UART_DEBUG |                               =
\
> +        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              =
\
> +        SCU_HW_STRAP_SPI_WIDTH |                                        =
\
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_M_S_EN))
> +
>  /* AST2500 evb hardware value: 0xF100C2E6 */
>  #define AST2500_EVB_HW_STRAP1 ((                                        =
\
>          AST2500_HW_STRAP1_DEFAULTS |                                    =
\
> @@ -1141,6 +1151,25 @@ static void aspeed_machine_supermicrox11_bmc_class=
_init(ObjectClass *oc,
>      mc->default_ram_size =3D 256 * MiB;
>  }
>
> +static void aspeed_machine_supermicrox11_spi_bmc_class_init(ObjectClass =
*oc,
> +                                                            void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       =3D "Supermicro X11 SPI BMC (ARM1176)";
> +    amc->soc_name  =3D "ast2500-a1";
> +    amc->hw_strap1 =3D SUPERMICROX11_SPI_BMC_HW_STRAP1;
> +    amc->fmc_model =3D "mx25l25635e";
> +    amc->spi_model =3D "mx25l25635e";
> +    amc->num_cs    =3D 1;
> +    amc->macs_mask =3D ASPEED_MAC0_ON | ASPEED_MAC1_ON;
> +    amc->i2c_init  =3D palmetto_bmc_i2c_init;
> +    mc->default_ram_size =3D 512 * MiB;
> +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> +        aspeed_soc_num_cpus(amc->soc_name);
> +}
> +
>  static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void =
*data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -1522,6 +1551,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
>          .name          =3D MACHINE_TYPE_NAME("supermicrox11-bmc"),
>          .parent        =3D TYPE_ASPEED_MACHINE,
>          .class_init    =3D aspeed_machine_supermicrox11_bmc_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("supermicrox11-spi-bmc"),
> +        .parent        =3D TYPE_ASPEED_MACHINE,
> +        .class_init    =3D aspeed_machine_supermicrox11_spi_bmc_class_in=
it,
>      }, {
>          .name          =3D MACHINE_TYPE_NAME("ast2500-evb"),
>          .parent        =3D TYPE_ASPEED_MACHINE,
> --
> 2.39.0
>
>

