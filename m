Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF86BEFF5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:41:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdE4x-0000Hy-2D; Fri, 17 Mar 2023 13:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhishek@drut.io>) id 1pdE4m-0000G0-VA
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:41:16 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhishek@drut.io>) id 1pdE4h-0006PR-PO
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:41:12 -0400
Received: by mail-qt1-x82d.google.com with SMTP id fy17so3866590qtb.2
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=drut-io.20210112.gappssmtp.com; s=20210112; t=1679074866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o5lpx7oRxPc+5X8D+oKotGep8zO6LjYAzsmwQ4EzQJ4=;
 b=COsD970Eg1TfDqApEvA0vrHbpnSmWkSBmf9O2AmPgXSg0P4olzODuuFgaaKs8khlVh
 pxfhljseXSHFfmdg0Cp4WcBn/YgH6+ImIEYFXnGUBl5qkLiE8b+OaPtXATjK6TTfG2vp
 BoxkCON4bKJmc/Z5BvxPSoTE7iaMSAsDTmk8ArQjxXV6hKz0SpheL9oKC7SzlZV8TzYb
 ynqdBGutXlo149HuOXIGeERi853HTMZ7wnL63+/GdcCRLUNaw1ihCuKL2gumtodK482i
 ABucXu1m6EQSyzJDtxHMEOsYn0IhXM1UAkEBEwjSx9knlBeyf1Iy8I2gmtmxoOv3+Q3K
 q0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o5lpx7oRxPc+5X8D+oKotGep8zO6LjYAzsmwQ4EzQJ4=;
 b=xa86HfsUnEDumm04hABYyyC+DTbMiDA3/TEzQONLkOKuPn7jYVgmch5SWxnlcrKdRT
 IzsHEWxJglU6Ywfot5KhEW5oj9hTFtLQow4v/nuBOG1wIn6batO8vLxteVz6uJpvL7zX
 adElnyPjS8c1Qm1OxwUtbp9/v8XqegNT5UqcPUTjj7dZ0i6uSk+I4Y43ZQoUAW9Agkfp
 OsX6lZUA2cLiEezR2mI480bPdeELyZLfnkawB//bJ+CiFBcuJQ9LkEdxbT14zh5HHcvq
 wLZMH0IDzsTuK4RrgkHyMK9WrnaZPDii2R6C+X56hRofcinyvfPBrIppW4yIWBV2O9ri
 bvpw==
X-Gm-Message-State: AO0yUKVW27dN2DehYjTUzSU0qfaWg6eWommyjHWJALXFURSwYz2ipisk
 /LojPm9ktN+Vlky2GSGk9N6o6uTck9xGI3TL71kX6g==
X-Google-Smtp-Source: AK7set80AhHbnamjsAT9UL5EiGK6t9fr+V5GoM1fQSsmaIWgiwoLktEsi1jOFU1w76ngDnRrhEvR736jLcWtTnruMk0=
X-Received: by 2002:a05:622a:19a9:b0:3db:c138:ae87 with SMTP id
 u41-20020a05622a19a900b003dbc138ae87mr450471qtc.6.1679074866124; Fri, 17 Mar
 2023 10:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
 <87mt4b73sv.fsf@linaro.org> <b2c11d07-ee58-715d-2994-3add1c60b95d@kaod.org>
In-Reply-To: <b2c11d07-ee58-715d-2994-3add1c60b95d@kaod.org>
From: Abhishek Singh Dagur <abhishek@drut.io>
Date: Fri, 17 Mar 2023 23:10:54 +0530
Message-ID: <CAJ1un7hrGCTuQ3omx0UhLj+uMp-UFz0Sr_g1X+NAGCgE13h5_Q@mail.gmail.com>
Subject: Re: Using QEMU how to redirect serial /dev/ttyS2 output of guest
 machine to host machine.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 openbmc@lists.ozlabs.org, qemu-devel@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f26e1a05f71c14d1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=abhishek@drut.io; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000f26e1a05f71c14d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I'll check it out.

On Fri, Mar 17, 2023 at 10:54=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.or=
g> wrote:

> On 3/17/23 17:06, Alex Benn=C3=A9e wrote:
> >
> > Abhishek Singh Dagur <abhishek@drut.io> writes:
> >
> > (cc aspeed maintainers)
> >
> >> Hi all,
> >>
> >> We are using obmc-phosphor-image on an ast2500 board which is trying t=
o
> communicate with other devices
> >> over serial port /dev/ttyS2.
> >> As we are trying to emulate the machine on qemu we need to redirect th=
e
> request to the host machine so
> >> that it can handle this request and return appropriately.
> >> We tried using QEMU options like -serial ,-chardev but still not the
> >> concrete way we get to do it.
> >
> > Yeah I'm afraid its non-obvious, certainly for built in serial ports.
> > Try something like:
> >
> >    ./qemu-system-aarch64 -M ast2500-evb \
> >      -serial null -serial null -serial chardev:myserial \
> >      -chardev file,id=3Dmyserial,path=3Doutput.txt \
> >      $MORE_OPTIONS
> >
> > You have to add a -serial for each serial port up to the one you care
> > about and then set the chardev for it.
> >
> > If you where adding a device to the system then you can explicitly set
> > the target chardev for it with something like:
> >
> >    -device isa-serial,iobase=3Dnnn,irq=3Dnnn,chardev=3DID
> >
> >> It will be very helpful if you can provide us some guidance on this.
> >
> > Another quirk for the aspeed boards seems to be the default uart can be
> > an arbitrary one depending on the board model:
> >
> > 334:    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
> > 336:        if (uart =3D=3D amc->uart_default) {
> > 1112:    amc->uart_default =3D ASPEED_DEV_UART5;
> > 1407:    amc->uart_default =3D ASPEED_DEV_UART1;
> >
> > as a result ASPEED_DEV_UART5 will always be the first serial port
> > (serial_hd(0)). I don't know how Linux numbers them but worth being
> > aware of.
>
> Yes. UART5 is the general default but it depends on the board definition
> and the fuji was the first to require an exception. See commit 5d63d0c76c
> ("hw/arm/aspeed: Allow machine to set UART default")
>
> Then, it became more complex with commit d2b3eaefb4 ("aspeed: Refactor
> UART init for multi-SoC machines"). That's another topic.
>
> Abhishek,
>
> I am afraid, you will need to add a new board to fit what's in the DT.
>
> Or, here is a little patch adding a machine option to set the default uar=
t.
> It was never merged because it is a bit of hack, give it a try and we
> will discuss. Use :
>
>    -M ast2500-evb,uart-default=3Duart2
>
>
> Thanks,
>
> C.
>
>  From 0d0700ae772fa5236914e96af1be5afcf0d4a994 Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?C=3DC3=3DA9dric=3D20Le=3D20Goater?=3D <clg@kaod.org>
> Date: Fri, 17 Mar 2023 18:21:54 +0100
> Subject: [PATCH] aspeed: Add a "uart-default" machine option
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 806bb10707..e0335cf167 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -45,6 +45,7 @@ struct AspeedMachineState {
>       bool mmio_exec;
>       char *fmc_model;
>       char *spi_model;
> +    uint32_t uart_default;
>       uint32_t hw_strap1;
>   };
>
> @@ -337,10 +338,11 @@ static void
> connect_serial_hds_to_uarts(AspeedMachineState *bmc)
>       AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(bmc);
>       AspeedSoCState *s =3D &bmc->soc;
>       AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
> +    int uart_default =3D bmc->uart_default ? bmc->uart_default :
> amc->uart_default;
>
> -    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
> +    aspeed_soc_uart_set_chr(s, uart_default, serial_hd(0));
>       for (int i =3D 1, uart =3D ASPEED_DEV_UART1; i < sc->uarts_num; i++=
,
> uart++) {
> -        if (uart =3D=3D amc->uart_default) {
> +        if (uart =3D=3D uart_default) {
>               continue;
>           }
>           aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
> @@ -1145,6 +1147,25 @@ static void aspeed_set_spi_model(Object *obj, cons=
t
> char *value, Error **errp)
>       bmc->spi_model =3D g_strdup(value);
>   }
>
> +const QEnumLookup UartDefault_lookup =3D {
> +    .array =3D
> +        (const char *const[]) {
> +            [0] =3D "none",
> +            [1] =3D "uart1",
> +            [2] =3D "uart2",
> +            [3] =3D "uart3",
> +            [4] =3D "uart4",
> +            [5] =3D "uart5",
> +        },
> +    .size =3D 6
> +};
> +
> +static void aspeed_set_uart_default(Object *obj, int val, Error **err)
> +{
> +    AspeedMachineState *bmc =3D ASPEED_MACHINE(obj);
> +    bmc->uart_default =3D val + 1;
> +}
> +
>   static void aspeed_machine_class_props_init(ObjectClass *oc)
>   {
>       object_class_property_add_bool(oc, "execute-in-place",
> @@ -1153,6 +1174,12 @@ static void
> aspeed_machine_class_props_init(ObjectClass *oc)
>       object_class_property_set_description(oc, "execute-in-place",
>                              "boot directly from CE0 flash device");
>
> +    object_class_property_add_enum(oc, "uart-default", "UartDefault",
> +                                   &UartDefault_lookup, NULL,
> +                                   aspeed_set_uart_default);
> +    object_class_property_set_description(oc, "uart-default",
> +                           "Change the default UART of the board");
> +
>       object_class_property_add_str(oc, "fmc-model", aspeed_get_fmc_model=
,
>                                      aspeed_set_fmc_model);
>       object_class_property_set_description(oc, "fmc-model",
> --
> 2.39.2
>
>
>

--000000000000f26e1a05f71c14d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, I&#39;ll check it out.=C2=A0<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 17, 20=
23 at 10:54=E2=80=AFPM C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod=
.org">clg@kaod.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 3/17/23 17:06, Alex Benn=C3=A9e wrote:<br>
&gt; <br>
&gt; Abhishek Singh Dagur &lt;<a href=3D"mailto:abhishek@drut.io" target=3D=
"_blank">abhishek@drut.io</a>&gt; writes:<br>
&gt; <br>
&gt; (cc aspeed maintainers)<br>
&gt; <br>
&gt;&gt; Hi all,<br>
&gt;&gt;<br>
&gt;&gt; We are using obmc-phosphor-image on an ast2500 board which is tryi=
ng to communicate with other devices<br>
&gt;&gt; over serial port /dev/ttyS2.<br>
&gt;&gt; As we are trying to emulate the machine on qemu we need to redirec=
t the request to the host machine so<br>
&gt;&gt; that it can handle this request and return appropriately.<br>
&gt;&gt; We tried using QEMU options like -serial ,-chardev but still not t=
he<br>
&gt;&gt; concrete way we get to do it.<br>
&gt; <br>
&gt; Yeah I&#39;m afraid its non-obvious, certainly for built in serial por=
ts.<br>
&gt; Try something like:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 ./qemu-system-aarch64 -M ast2500-evb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -serial null -serial null -serial chardev:myserial=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -chardev file,id=3Dmyserial,path=3Doutput.txt \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 $MORE_OPTIONS<br>
&gt; <br>
&gt; You have to add a -serial for each serial port up to the one you care<=
br>
&gt; about and then set the chardev for it.<br>
&gt; <br>
&gt; If you where adding a device to the system then you can explicitly set=
<br>
&gt; the target chardev for it with something like:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 -device isa-serial,iobase=3Dnnn,irq=3Dnnn,chardev=3DID<br=
>
&gt; <br>
&gt;&gt; It will be very helpful if you can provide us some guidance on thi=
s.<br>
&gt; <br>
&gt; Another quirk for the aspeed boards seems to be the default uart can b=
e<br>
&gt; an arbitrary one depending on the board model:<br>
&gt; <br>
&gt; 334:=C2=A0 =C2=A0 aspeed_soc_uart_set_chr(s, amc-&gt;uart_default, ser=
ial_hd(0));<br>
&gt; 336:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uart =3D=3D amc-&gt;uart_default) =
{<br>
&gt; 1112:=C2=A0 =C2=A0 amc-&gt;uart_default =3D ASPEED_DEV_UART5;<br>
&gt; 1407:=C2=A0 =C2=A0 amc-&gt;uart_default =3D ASPEED_DEV_UART1;<br>
&gt; <br>
&gt; as a result ASPEED_DEV_UART5 will always be the first serial port<br>
&gt; (serial_hd(0)). I don&#39;t know how Linux numbers them but worth bein=
g<br>
&gt; aware of.<br>
<br>
Yes. UART5 is the general default but it depends on the board definition<br=
>
and the fuji was the first to require an exception. See commit 5d63d0c76c<b=
r>
(&quot;hw/arm/aspeed: Allow machine to set UART default&quot;)<br>
<br>
Then, it became more complex with commit d2b3eaefb4 (&quot;aspeed: Refactor=
<br>
UART init for multi-SoC machines&quot;). That&#39;s another topic.<br>
<br>
Abhishek,<br>
<br>
I am afraid, you will need to add a new board to fit what&#39;s in the DT.<=
br>
<br>
Or, here is a little patch adding a machine option to set the default uart.=
<br>
It was never merged because it is a bit of hack, give it a try and we<br>
will discuss. Use :<br>
<br>
=C2=A0 =C2=A0-M ast2500-evb,uart-default=3Duart2<br>
<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
=C2=A0From 0d0700ae772fa5236914e96af1be5afcf0d4a994 Mon Sep 17 00:00:00 200=
1<br>
From: =3D?UTF-8?q?C=3DC3=3DA9dric=3D20Le=3D20Goater?=3D &lt;<a href=3D"mail=
to:clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&gt;<br>
Date: Fri, 17 Mar 2023 18:21:54 +0100<br>
Subject: [PATCH] aspeed: Add a &quot;uart-default&quot; machine option<br>
MIME-Version: 1.0<br>
Content-Type: text/plain; charset=3DUTF-8<br>
Content-Transfer-Encoding: 8bit<br>
<br>
Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" ta=
rget=3D"_blank">clg@kaod.org</a>&gt;<br>
---<br>
=C2=A0 hw/arm/aspeed.c | 31 +++++++++++++++++++++++++++++--<br>
=C2=A0 1 file changed, 29 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
index 806bb10707..e0335cf167 100644<br>
--- a/hw/arm/aspeed.c<br>
+++ b/hw/arm/aspeed.c<br>
@@ -45,6 +45,7 @@ struct AspeedMachineState {<br>
=C2=A0 =C2=A0 =C2=A0 bool mmio_exec;<br>
=C2=A0 =C2=A0 =C2=A0 char *fmc_model;<br>
=C2=A0 =C2=A0 =C2=A0 char *spi_model;<br>
+=C2=A0 =C2=A0 uint32_t uart_default;<br>
=C2=A0 =C2=A0 =C2=A0 uint32_t hw_strap1;<br>
=C2=A0 };<br>
<br>
@@ -337,10 +338,11 @@ static void connect_serial_hds_to_uarts(AspeedMachine=
State *bmc)<br>
=C2=A0 =C2=A0 =C2=A0 AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(b=
mc);<br>
=C2=A0 =C2=A0 =C2=A0 AspeedSoCState *s =3D &amp;bmc-&gt;soc;<br>
=C2=A0 =C2=A0 =C2=A0 AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);<br>
+=C2=A0 =C2=A0 int uart_default =3D bmc-&gt;uart_default ? bmc-&gt;uart_def=
ault : amc-&gt;uart_default;<br>
<br>
-=C2=A0 =C2=A0 aspeed_soc_uart_set_chr(s, amc-&gt;uart_default, serial_hd(0=
));<br>
+=C2=A0 =C2=A0 aspeed_soc_uart_set_chr(s, uart_default, serial_hd(0));<br>
=C2=A0 =C2=A0 =C2=A0 for (int i =3D 1, uart =3D ASPEED_DEV_UART1; i &lt; sc=
-&gt;uarts_num; i++, uart++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uart =3D=3D amc-&gt;uart_default) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uart =3D=3D uart_default) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed_soc_uart_set_chr(s, uart, serial_=
hd(i));<br>
@@ -1145,6 +1147,25 @@ static void aspeed_set_spi_model(Object *obj, const =
char *value, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 bmc-&gt;spi_model =3D g_strdup(value);<br>
=C2=A0 }<br>
<br>
+const QEnumLookup UartDefault_lookup =3D {<br>
+=C2=A0 =C2=A0 .array =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (const char *const[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [0] =3D &quot;none&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [1] =3D &quot;uart1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [2] =3D &quot;uart2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [3] =3D &quot;uart3&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [4] =3D &quot;uart4&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [5] =3D &quot;uart5&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .size =3D 6<br>
+};<br>
+<br>
+static void aspeed_set_uart_default(Object *obj, int val, Error **err)<br>
+{<br>
+=C2=A0 =C2=A0 AspeedMachineState *bmc =3D ASPEED_MACHINE(obj);<br>
+=C2=A0 =C2=A0 bmc-&gt;uart_default =3D val + 1;<br>
+}<br>
+<br>
=C2=A0 static void aspeed_machine_class_props_init(ObjectClass *oc)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 object_class_property_add_bool(oc, &quot;execute-in-pl=
ace&quot;,<br>
@@ -1153,6 +1174,12 @@ static void aspeed_machine_class_props_init(ObjectCl=
ass *oc)<br>
=C2=A0 =C2=A0 =C2=A0 object_class_property_set_description(oc, &quot;execut=
e-in-place&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;boot directly from CE0 flash device&qu=
ot;);<br>
<br>
+=C2=A0 =C2=A0 object_class_property_add_enum(oc, &quot;uart-default&quot;,=
 &quot;UartDefault&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;UartDefault_lookup=
, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_uart_default=
);<br>
+=C2=A0 =C2=A0 object_class_property_set_description(oc, &quot;uart-default=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;Change the default UART of the board&quot;);<=
br>
+<br>
=C2=A0 =C2=A0 =C2=A0 object_class_property_add_str(oc, &quot;fmc-model&quot=
;, aspeed_get_fmc_model,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_fmc_m=
odel);<br>
=C2=A0 =C2=A0 =C2=A0 object_class_property_set_description(oc, &quot;fmc-mo=
del&quot;,<br>
-- <br>
2.39.2<br>
<br>
<br>
</blockquote></div>

--000000000000f26e1a05f71c14d1--

