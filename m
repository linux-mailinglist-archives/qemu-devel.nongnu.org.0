Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B734701F1A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 20:57:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyGt5-0002Gw-2M; Sun, 14 May 2023 14:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pyGsx-0002Fv-8w; Sun, 14 May 2023 14:55:59 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pyGsv-0002Xq-Dd; Sun, 14 May 2023 14:55:59 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-55a010774a5so178718577b3.3; 
 Sun, 14 May 2023 11:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684090556; x=1686682556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=saV+v6EvrbCOiFO3oNVFTh6QFhB9wkDSdFDJ+AFRKRQ=;
 b=cse0Tr/GNMTMf+nXYWLwnSQmPe87N8WJuB+SEHd3SQLYxMZvKQK8cSH2x4DI1PVHxV
 SaJ7/nDafha+IFAfWHvSXRn0VkGmNPapsLIaxCA4feR3LA5naDUX0w/VI+5z/TOr9/Mq
 RYlJCfLBsKRdOQywzwU8iN/WefMpsoVFa6FhSfo36klBPm4Xb4rasWtC1ZcCQ+sm5rN4
 ZQgtbnIb53dJwF2P90CVag4QuIVMYkQcbmjgY41TpYSREG8W2hnMwouqTnZa0NUkT+mb
 4o64TNMQwLY4ujgQBwk1ljor+/psrRaWmRBlNSSpLjIhvx1RvLPhNH/t6FlRYnWwFM8I
 vSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684090556; x=1686682556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=saV+v6EvrbCOiFO3oNVFTh6QFhB9wkDSdFDJ+AFRKRQ=;
 b=DozUo/S/WlcarKfQwvfPErDHaIOJKl6uGgM969pu1yKPz5wU1hzGuz02nB99NqHIIF
 R+8CDsezw4/LPxFgLaGXe65d7B2awJsNIQHe9VDN+THxqBcybtU2URRpMSS50CfNwhGK
 XCtt8xc6IIuV0uNr/OWVd3RE5w4nmUvdPwz71zQgYOI0yHS5Ai1Ddv9NsnW8kgAFVad1
 4mdmaJeUadIt/PerEt8ZaYiA4MAMiKtrr/VUXsBkuFdUgZFKxoiSfgk7kBBgg1NtWUtf
 ldgZzAqWeokfry1rE3uaS/C4tEmY+QF16VoIR3Y6+D26Xz4DxWdV7SCXd09LBQi656pL
 Lc4w==
X-Gm-Message-State: AC+VfDwsgGIWKDq89WUkUy95YJz78FP5qphrep6ixga3tyKcbzYbMQjB
 RKyIwKI7tfuuAKcEXhMPI1QYGiajp1kx1xYyXB4=
X-Google-Smtp-Source: ACHHUZ5V2iipcPoq+I15q03Z2Rv/B8wuDfuOhs87mFBcCdhCbqQIb+GfPzRUemhoxgb63NYkjzhb+jnUxzZkKyroDkg=
X-Received: by 2002:a0d:d90d:0:b0:55a:8fe8:c90b with SMTP id
 b13-20020a0dd90d000000b0055a8fe8c90bmr29152221ywe.35.1684090555918; Sun, 14
 May 2023 11:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230510103004.30015-1-qianfanguijin@163.com>
 <20230510103004.30015-4-qianfanguijin@163.com>
In-Reply-To: <20230510103004.30015-4-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 14 May 2023 20:55:45 +0200
Message-ID: <CAPan3WrHGhcTWh5R3Uw1BFuVmTLf=jbXpTKTWSz0qNx8JrPszw@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] hw: allwinner-r40: Complete uart devices
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005aee6605fbabe32a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000005aee6605fbabe32a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qianfan,


On Wed, May 10, 2023 at 12:30=E2=80=AFPM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> R40 has eight UARTs, support both 16450 and 16550 compatible modes.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/arm/allwinner-r40.c         | 31 ++++++++++++++++++++++++++++---
>  include/hw/arm/allwinner-r40.h |  8 ++++++++
>  2 files changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index 128c0ca470..537a90b23d 100644
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
>

After adding the uarts to the memory map here, you should remove them from
the unimplemented array.

     [AW_R40_DEV_GIC_DIST]   =3D 0x01c81000,
>      [AW_R40_DEV_GIC_CPU]    =3D 0x01c82000,
>      [AW_R40_DEV_GIC_HYP]    =3D 0x01c84000,
> @@ -160,6 +167,10 @@ enum {
>      AW_R40_GIC_SPI_UART1     =3D  2,
>      AW_R40_GIC_SPI_UART2     =3D  3,
>      AW_R40_GIC_SPI_UART3     =3D  4,
>

Since you put the addition of UART1-7 in this patch, probably it makes
sense to have adding the lines 'AW_R40_GIC_SPI_UART1/2/3' also part of this
patch.

With the two above remarks resolved, the patch looks good to me.

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Regards,
Niek

> +    AW_R40_GIC_SPI_UART4     =3D 17,
> +    AW_R40_GIC_SPI_UART5     =3D 18,
> +    AW_R40_GIC_SPI_UART6     =3D 19,
> +    AW_R40_GIC_SPI_UART7     =3D 20,
>      AW_R40_GIC_SPI_TIMER0    =3D 22,
>      AW_R40_GIC_SPI_TIMER1    =3D 23,
>      AW_R40_GIC_SPI_MMC0      =3D 32,
> @@ -387,9 +398,23 @@ static void allwinner_r40_realize(DeviceState *dev,
> Error **errp)
>      }
>
>      /* UART0. For future clocktree API: All UARTS are connected to
> APB2_CLK. */
> -    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART0], 2,
> -                   qdev_get_gpio_in(DEVICE(&s->gic),
> AW_R40_GIC_SPI_UART0),
> -                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +    for (int i =3D 0; i < AW_R40_NUM_UARTS; i++) {
> +        static const int uart_irqs[AW_R40_NUM_UARTS] =3D {
> +            AW_R40_GIC_SPI_UART0,
> +            AW_R40_GIC_SPI_UART1,
> +            AW_R40_GIC_SPI_UART2,
> +            AW_R40_GIC_SPI_UART3,
> +            AW_R40_GIC_SPI_UART4,
> +            AW_R40_GIC_SPI_UART5,
> +            AW_R40_GIC_SPI_UART6,
> +            AW_R40_GIC_SPI_UART7,
> +        };
> +        const hwaddr addr =3D s->memmap[AW_R40_DEV_UART0 + i];
> +
> +        serial_mm_init(get_system_memory(), addr, 2,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), uart_irqs[i]),
> +                       115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
> +    }
>
>      /* Unimplemented devices */
>      for (i =3D 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
> diff --git a/include/hw/arm/allwinner-r40.h
> b/include/hw/arm/allwinner-r40.h
> index 3be9dc962b..959b5dc4e0 100644
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
> @@ -70,6 +77,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AwR40State, AW_R40)
>   * which are currently emulated by the R40 SoC code.
>   */
>  #define AW_R40_NUM_MMCS         4
> +#define AW_R40_NUM_UARTS        8
>
>  struct AwR40State {
>      /*< private >*/
> --
> 2.25.1
>
>

--=20
Niek Linnenbank

--0000000000005aee6605fbabe32a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Qianfan,</div><div><br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at 12:=
30=E2=80=AFPM &lt;<a href=3D"mailto:qianfanguijin@163.com">qianfanguijin@16=
3.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">From: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" target=
=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
<br>
R40 has eight UARTs, support both 16450 and 16550 compatible modes.<br>
<br>
Signed-off-by: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" ta=
rget=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/allwinner-r40.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ++++++++=
++++++++++++++++++++---<br>
=C2=A0include/hw/arm/allwinner-r40.h |=C2=A0 8 ++++++++<br>
=C2=A02 files changed, 36 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c<br>
index 128c0ca470..537a90b23d 100644<br>
--- a/hw/arm/allwinner-r40.c<br>
+++ b/hw/arm/allwinner-r40.c<br>
@@ -45,6 +45,13 @@ const hwaddr allwinner_r40_memmap[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_CCU]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x01c20=
000,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_PIT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x01c20=
c00,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_UART0]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28000,<=
br>
+=C2=A0 =C2=A0 [AW_R40_DEV_UART1]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28400,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_UART2]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28800,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_UART3]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28c00,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_UART4]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c29000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_UART5]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c29400,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_UART6]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c29800,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_UART7]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c29c00,<br></=
blockquote><div><br></div><div>After adding the uarts to the memory map her=
e, you should remove them from the unimplemented array.</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_GIC_DIST]=C2=A0 =C2=A0=3D 0x01c81000,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_GIC_CPU]=C2=A0 =C2=A0 =3D 0x01c82000,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_GIC_HYP]=C2=A0 =C2=A0 =3D 0x01c84000,<br>
@@ -160,6 +167,10 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART1=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 2,<br=
>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART2=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 3,<br=
>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART3=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 4,<br=
></blockquote><div><br></div><div>Since you put the addition of UART1-7 in =
this patch, probably it makes sense to have adding the lines &#39;AW_R40_GI=
C_SPI_UART1/2/3&#39; also part of this patch.</div><div><br></div><div>With=
 the two above remarks resolved, the patch looks good to me.</div><div><br>=
</div><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenban=
k@gmail.com">nieklinnenbank@gmail.com</a>&gt;<br></div><div><br></div><div>=
Regards,</div><div>Niek<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_UART4=C2=A0 =C2=A0 =C2=A0=3D 17,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_UART5=C2=A0 =C2=A0 =C2=A0=3D 18,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_UART6=C2=A0 =C2=A0 =C2=A0=3D 19,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_UART7=C2=A0 =C2=A0 =C2=A0=3D 20,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_TIMER0=C2=A0 =C2=A0 =3D 22,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_TIMER1=C2=A0 =C2=A0 =3D 23,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_MMC0=C2=A0 =C2=A0 =C2=A0 =3D 32,<br>
@@ -387,9 +398,23 @@ static void allwinner_r40_realize(DeviceState *dev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* UART0. For future clocktree API: All UARTS are conne=
cted to APB2_CLK. */<br>
-=C2=A0 =C2=A0 serial_mm_init(get_system_memory(), s-&gt;memmap[AW_R40_DEV_=
UART0], 2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_=
get_gpio_in(DEVICE(&amp;s-&gt;gic), AW_R40_GIC_SPI_UART0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011520=
0, serial_hd(0), DEVICE_NATIVE_ENDIAN);<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; AW_R40_NUM_UARTS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 static const int uart_irqs[AW_R40_NUM_UARTS] =
=3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_GIC_SPI_UART0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_GIC_SPI_UART1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_GIC_SPI_UART2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_GIC_SPI_UART3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_GIC_SPI_UART4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_GIC_SPI_UART5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_GIC_SPI_UART6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_GIC_SPI_UART7,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const hwaddr addr =3D s-&gt;memmap[AW_R40_DEV_=
UART0 + i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 serial_mm_init(get_system_memory(), addr, 2,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic), uart_irqs[i]),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Unimplemented devices */<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(r40_unimplemented); i++=
) {<br>
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.=
h<br>
index 3be9dc962b..959b5dc4e0 100644<br>
--- a/include/hw/arm/allwinner-r40.h<br>
+++ b/include/hw/arm/allwinner-r40.h<br>
@@ -41,6 +41,13 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_CCU,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_PIT,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_UART0,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_UART1,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_UART2,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_UART3,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_UART4,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_UART5,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_UART6,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_UART7,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_GIC_DIST,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_GIC_CPU,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_GIC_HYP,<br>
@@ -70,6 +77,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AwR40State, AW_R40)<br>
=C2=A0 * which are currently emulated by the R40 SoC code.<br>
=C2=A0 */<br>
=C2=A0#define AW_R40_NUM_MMCS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
+#define AW_R40_NUM_UARTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
<br>
=C2=A0struct AwR40State {<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; private &gt;*/<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--0000000000005aee6605fbabe32a--

