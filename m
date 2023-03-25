Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D086C90EA
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 22:16:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgBEs-0001gz-Hy; Sat, 25 Mar 2023 17:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgBEo-0001gL-HJ; Sat, 25 Mar 2023 17:15:47 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgBEm-0005Lx-GT; Sat, 25 Mar 2023 17:15:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id w9so21260500edc.3;
 Sat, 25 Mar 2023 14:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679778941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKKA3VhDmE+iqDVKNUjcCMoiq9oRCLFDKTDvORSJjxo=;
 b=jqodQ0AZ6/ajfzuXKsrvEhlX5YBNNW9cEeShFancndeITBGmAvjPSbMyhuIPad3hdI
 kKPIcaM5ixA+Q92zgwjE+ZdibSRbXR2XCyF9FEKjaesrIWgXZvY36l19JDfH/+220VzR
 v69aet3VDM25dqlmt+w0Lq9l+XJEp+atAl6lKQItwTG+KtnLYucMTfkYwMXTpePEbYSn
 8zv+1GkgcBMuxj8kTiLzzeTiRrkWQ1o1bywh7ZXwKPgtHKOVe+KIlPCM2APkw4tNvXdD
 o5XA2Zn6P0m9gD0x/u6vPrNmUWKWXWtXLSLVvF3BTIDMaOE+nz/gUa+DYeZVM0+s6xdS
 5X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679778941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKKA3VhDmE+iqDVKNUjcCMoiq9oRCLFDKTDvORSJjxo=;
 b=ip+eo3mypnV8ooSQGBz02ydvYwjRvFfY6A8kJEsoSoYUITqTVcHN/8icT3Ff2FSSdM
 FgPMwyyKkuo2xgOSmQbRxX2ride4pIC7INBgfsoCpeMfAeblpmcdzhkpF6aZvsWzehzs
 yOPkFTrm/z//h9Bd8g+CfQNoG27zV2YnkhRV/LUGIfsp7GS0MaqeAzzEH25VAtwK0c2t
 dOERHtW668QSkHrAeSglsmZgiDFP7RP7XNDRayKMmEXscZratrPCmQ6fr2mnq+hU2NEg
 feGuBShqiPXvZab7Il8NZ6iOqxEHtAm2YdJyMf6Jph52Ggqg9SyDgLHrenxDq6+1frmc
 pyHw==
X-Gm-Message-State: AAQBX9ewkzoOXBE+WajsvrmJuWVDLgr5YRgOUjEQpEODqDJiXW4N9OqV
 /2hZoSbwRQXKVA6QkamT9+Q2HGZHuQinMjcq9ZY=
X-Google-Smtp-Source: AKy350YnOVjYhMAVbnLlfHq+w1JCUNu8P76DlPROfmMtYpwrYu4KNukwi08tuOeZnKdq9Al5TzsSBrVrwFUQDEQuTtc=
X-Received: by 2002:a17:906:8315:b0:93d:6382:d5b with SMTP id
 j21-20020a170906831500b0093d63820d5bmr3037916ejx.9.1679778941339; Sat, 25 Mar
 2023 14:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230321102510.16754-1-qianfanguijin@163.com>
 <20230321102510.16754-4-qianfanguijin@163.com>
In-Reply-To: <20230321102510.16754-4-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sat, 25 Mar 2023 22:15:32 +0100
Message-ID: <CABtshVRmq+DK+ZUELkviJY_+8X2B0LYNazdE+4_rXMp7Xn8AzQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] hw: allwinner-r40: Complete uart devices
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Tue, Mar 21, 2023 at 11:25=E2=80=AFAM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> R40 has eight UARTs, support both 16450 and 16550 compatible modes.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/arm/allwinner-r40.c         | 32 ++++++++++++++++++++++++++++++++
>  include/hw/arm/allwinner-r40.h |  7 +++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index 3517682aed..fde01783b1 100644
> --- a/hw/arm/allwinner-r40.c
> +++ b/hw/arm/allwinner-r40.c
> @@ -45,6 +45,13 @@ const hwaddr allwinner_r40_memmap[] =3D {
>      [AW_R40_DEV_CCU]        =3D 0x01c20000,
>      [AW_R40_DEV_PIT]        =3D 0x01c20c00,
>      [AW_R40_DEV_UART0]      =3D 0x01c28000,
> +    [AW_R40_DEV_UART1]      =3D 0x01c28400,
> +    [AW_R40_DEV_UART2]      =3D 0x01c28800,
> +    [AW_R40_DEV_UART3]      =3D 0x01c28c00,
> +    [AW_R40_DEV_UART4]      =3D 0x01c29000,
> +    [AW_R40_DEV_UART5]      =3D 0x01c29400,
> +    [AW_R40_DEV_UART6]      =3D 0x01c29800,
> +    [AW_R40_DEV_UART7]      =3D 0x01c29c00,
>      [AW_R40_DEV_GIC_DIST]   =3D 0x01c81000,
>      [AW_R40_DEV_GIC_CPU]    =3D 0x01c82000,
>      [AW_R40_DEV_GIC_HYP]    =3D 0x01c84000,
> @@ -160,6 +167,10 @@ enum {
>      AW_R40_GIC_SPI_UART1     =3D  2,
>      AW_R40_GIC_SPI_UART2     =3D  3,
>      AW_R40_GIC_SPI_UART3     =3D  4,
> +    AW_R40_GIC_SPI_UART4     =3D 17,
> +    AW_R40_GIC_SPI_UART5     =3D 18,
> +    AW_R40_GIC_SPI_UART6     =3D 19,
> +    AW_R40_GIC_SPI_UART7     =3D 20,
>      AW_R40_GIC_SPI_TIMER0    =3D 22,
>      AW_R40_GIC_SPI_TIMER1    =3D 23,
>      AW_R40_GIC_SPI_MMC0      =3D 32,
> @@ -396,6 +407,27 @@ static void allwinner_r40_realize(DeviceState *dev, =
Error **errp)
>      serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART0], 2,
>                     qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
0),
>                     115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART1], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
1),
> +                   115200, serial_hd(1), DEVICE_NATIVE_ENDIAN);
> +    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART2], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
2),
> +                   115200, serial_hd(2), DEVICE_NATIVE_ENDIAN);
> +    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART3], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
3),
> +                   115200, serial_hd(3), DEVICE_NATIVE_ENDIAN);
> +    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART4], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
4),
> +                   115200, serial_hd(4), DEVICE_NATIVE_ENDIAN);
> +    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART5], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
5),
> +                   115200, serial_hd(5), DEVICE_NATIVE_ENDIAN);
> +    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART6], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
6),
> +                   115200, serial_hd(6), DEVICE_NATIVE_ENDIAN);
> +    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART7], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
7),
> +                   115200, serial_hd(7), DEVICE_NATIVE_ENDIAN);
>
>      /* Unimplemented devices */
>      for (i =3D 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
> diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r4=
0.h
> index b355af2c4f..dfb5eb609c 100644
> --- a/include/hw/arm/allwinner-r40.h
> +++ b/include/hw/arm/allwinner-r40.h
> @@ -41,6 +41,13 @@ enum {
>      AW_R40_DEV_CCU,
>      AW_R40_DEV_PIT,
>      AW_R40_DEV_UART0,
> +    AW_R40_DEV_UART1,
> +    AW_R40_DEV_UART2,
> +    AW_R40_DEV_UART3,
> +    AW_R40_DEV_UART4,
> +    AW_R40_DEV_UART5,
> +    AW_R40_DEV_UART6,
> +    AW_R40_DEV_UART7,
>      AW_R40_DEV_GIC_DIST,
>      AW_R40_DEV_GIC_CPU,
>      AW_R40_DEV_GIC_HYP,
> --
> 2.25.1
>

Reviewed-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>


Best regards,
Strahinja

