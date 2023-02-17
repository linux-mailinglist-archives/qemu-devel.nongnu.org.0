Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94969A8DD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSxgK-0005lY-HU; Fri, 17 Feb 2023 05:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSxgI-0005kv-5T; Fri, 17 Feb 2023 05:09:30 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSxgF-0002sw-SD; Fri, 17 Feb 2023 05:09:29 -0500
Received: by mail-ua1-x92c.google.com with SMTP id n23so10286ual.2;
 Fri, 17 Feb 2023 02:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=01m2VTCy7/bETX9LWCeH+us6j/sW0qHrdyZq4V7D6ow=;
 b=H2t2SnusJCR+8ezH9HS0dCpAjgM9ug8aUjxOTM/KQg2hXmmjNCVCURQrBhnmsu4mnQ
 DD7mnvIAoFN5uMDjchmrozn++fcdi8PI7wRCrJUyshYGIA1pAialTrk176YHpfroGNPZ
 3jVb9dA7uiln8pu8xl/Ne7Cr8bpsoITwxXWEdxeEEQvbd4CaZejKRSLvoiwYrpjrDhTc
 Gb0Im7HAbh3WbtZ9LQkkproCFvE8Wqhn7rDl/ugG0JBAFzR+FMrtqPXFi72F9Ps31BDx
 96LU5E5c+UECB2E+HkZAjtR09PGmfFR6KYs3VKf4n+0s8db/m+8uV2iEmdfFeVvAkoOV
 T+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=01m2VTCy7/bETX9LWCeH+us6j/sW0qHrdyZq4V7D6ow=;
 b=C+xdkbJtu3Pw0TkP4lHOem07qQqH6xbr7kUSgrx6zWWKJciWt13NR3QxBB+rHhXpm/
 bPJgmRawUMI2LuhJUADyAWWhkjwVMlusftbm3lT7fpv4BPZwM9BVtD2Q54aB5KnuQMwt
 lXqmUXEdc+z8+lGTguDBUOwIFzEU+/FDRfJW2JzHt7K/lxWCTQjwMYJPwIp2cXdbezwD
 0lCShFb9YZ7co4JDq5LkAMQFT/ZLRbnIP+5dmwNrLPDsilybfgQ54AattMRMxo0PnNy6
 MKoOwJ6055yVphuY5Z8TS6kL84qZjFsxsgIlZQtEGFou0xAQmg0UUT55jw8sJbRG+CrK
 LJuw==
X-Gm-Message-State: AO0yUKX6XeLdkSt500JWHxuKvPxXG9pA37Me5TIo0ZtDOSzfzeADxVo6
 BBBctUx2gjhciT3hAx6vKPxfulSIpPv2b1/iP1A0i8rWWehtHQ==
X-Google-Smtp-Source: AK7set8neWX6uAkJrUX2/jsXArskDOkR/LJZHRsDK0o2CWIuEp/q/AsvUIPEOKJo4CMUN0LroVFuvA0W9dJNLknxJZ0=
X-Received: by 2002:ab0:104b:0:b0:68b:94c5:7683 with SMTP id
 g11-20020ab0104b000000b0068b94c57683mr650312uab.0.1676628566161; Fri, 17 Feb
 2023 02:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20230216184342.253868-1-pkarthikeyan1509@gmail.com>
 <245aedfe-c5c4-2e99-ac8f-726665f954ce@kaod.org>
In-Reply-To: <245aedfe-c5c4-2e99-ac8f-726665f954ce@kaod.org>
From: karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Date: Fri, 17 Feb 2023 15:39:14 +0530
Message-ID: <CA+ezb7g_RpWqVh1LGrTo_9s8PRtbdWc+=EdfWK1svCL47_-2gg@mail.gmail.com>
Subject: Re: [PATCH v2] Adding new machine Tiogapass in QEMU
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001b3d0805f4e2828b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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

--0000000000001b3d0805f4e2828b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Noted.

Thanks,
C=C3=A9dric


On Fri, Feb 17, 2023 at 1:19 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello Karthikeyan,
>
> On 2/16/23 19:43, Karthikeyan Pasupathi wrote:
> > This patch support Tiogapass in QEMU environment.
> > and introduced EEPROM BMC FRU data support "add tiogapass_bmc_fruid dat=
a"
> > along with the machine support.
> >
> > Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
>
> There are a couple of coding style issues that I will fix. This is minor.
> (./scripts/checkpatch.pl is a good tool to run before sending.)
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
> > ---
> >   hw/arm/aspeed.c        | 32 ++++++++++++++++++++++++++++++++
> >   hw/arm/aspeed_eeprom.c | 22 ++++++++++++++++++++++
> >   hw/arm/aspeed_eeprom.h |  3 +++
> >   3 files changed, 57 insertions(+)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 27dda58338..d12164420d 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -530,6 +530,15 @@ static void romulus_bmc_i2c_init(AspeedMachineStat=
e
> *bmc)
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
> "ds1338", 0x32);
> >   }
> >
> > +static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)
> > +{
> > +    AspeedSoCState *soc =3D &bmc->soc;
> > +
> > +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x54, 128 *
> KiB);
> > +    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 6), 0x54, 128 =
*
> KiB, tiogapass_bmc_fruid,
> > +                          tiogapass_bmc_fruid_len);
> > +}
> > +
> >   static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
> >   {
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, bus_id),
> > @@ -1191,6 +1200,25 @@ static void
> aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
> >           aspeed_soc_num_cpus(amc->soc_name);
> >   };
> >
> > +static void aspeed_machine_tiogapass_class_init(ObjectClass *oc, void
> *data)
> > +{
> > +    MachineClass *mc =3D MACHINE_CLASS(oc);
> > +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> > +
> > +    mc->desc       =3D "Facebook Tiogapass BMC (ARM1176)";
> > +    amc->soc_name  =3D "ast2500-a1";
> > +    amc->hw_strap1 =3D AST2500_EVB_HW_STRAP1;
> > +    amc->hw_strap2 =3D 0;
> > +    amc->fmc_model =3D "n25q256a";
> > +    amc->spi_model =3D "mx25l25635e";
> > +    amc->num_cs    =3D 2;
> > +    amc->i2c_init  =3D tiogapass_bmc_i2c_init;
> > +    mc->default_ram_size       =3D 1 * GiB;
> > +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> > +        aspeed_soc_num_cpus(amc->soc_name);
> > +        aspeed_soc_num_cpus(amc->soc_name);
> > +};
> > +
> >   static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, voi=
d
> *data)
> >   {
> >       MachineClass *mc =3D MACHINE_CLASS(oc);
> > @@ -1566,6 +1594,10 @@ static const TypeInfo aspeed_machine_types[] =3D=
 {
> >           .name          =3D MACHINE_TYPE_NAME("tacoma-bmc"),
> >           .parent        =3D TYPE_ASPEED_MACHINE,
> >           .class_init    =3D aspeed_machine_tacoma_class_init,
> > +    }, {
> > +        .name          =3D MACHINE_TYPE_NAME("tiogapass-bmc"),
> > +        .parent        =3D TYPE_ASPEED_MACHINE,
> > +        .class_init    =3D aspeed_machine_tiogapass_class_init,
> >       }, {
> >           .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
> >           .parent        =3D TYPE_ASPEED_MACHINE,
> > diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> > index 04463acc9d..f937a6ceaa 100644
> > --- a/hw/arm/aspeed_eeprom.c
> > +++ b/hw/arm/aspeed_eeprom.c
> > @@ -6,6 +6,27 @@
> >
> >   #include "aspeed_eeprom.h"
> >
> > +/* Tiogapass BMC FRU */
> > +const uint8_t tiogapass_bmc_fruid[] =3D {
> > +    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00,
> 0x36,
> > +    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42,
> 0x4d,
> > +    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d,
> 0x6f,
> > +    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58,
> 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31,
> 0x2e,
> > +    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> 0xd2,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00,
> 0xc6,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x54, 0x69, 0x6f, 0x67,
> 0x61,
> > +    0x20, 0x50, 0x61, 0x73, 0x73, 0x20, 0x53, 0x69, 0x6e, 0x67, 0x6c,
> 0x65,
> > +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x58, 0x58, 0x58, 0x32, 0xcd, 0x58,
> 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> 0xc7,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30,
> 0xc9,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43,
> 0x6f,
> > +    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
> > +};
> > +
> >   const uint8_t fby35_nic_fruid[] =3D {
> >       0x01, 0x00, 0x00, 0x01, 0x0f, 0x20, 0x00, 0xcf, 0x01, 0x0e, 0x19,
> 0xd7,
> >       0x5e, 0xcf, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> 0xdd,
> > @@ -77,6 +98,7 @@ const uint8_t fby35_bmc_fruid[] =3D {
> >       0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
> >   };
> >
> > +const size_t tiogapass_bmc_fruid_len =3D sizeof(tiogapass_bmc_fruid);
> >   const size_t fby35_nic_fruid_len =3D sizeof(fby35_nic_fruid);
> >   const size_t fby35_bb_fruid_len =3D sizeof(fby35_bb_fruid);
> >   const size_t fby35_bmc_fruid_len =3D sizeof(fby35_bmc_fruid);
> > diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> > index a0f848fa6e..69db103c83 100644
> > --- a/hw/arm/aspeed_eeprom.h
> > +++ b/hw/arm/aspeed_eeprom.h
> > @@ -9,6 +9,9 @@
> >
> >   #include "qemu/osdep.h"
> >
> > +extern const uint8_t tiogapass_bmc_fruid[];
> > +extern const size_t tiogapass_bmc_fruid_len;
> > +
> >   extern const uint8_t fby35_nic_fruid[];
> >   extern const uint8_t fby35_bb_fruid[];
> >   extern const uint8_t fby35_bmc_fruid[];
>
>

--0000000000001b3d0805f4e2828b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Noted. <br></div><div><br></div><div>Thanks,</div><di=
v>C=C3=A9dric</div><div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 17, 2023 at 1:19 PM C=C3=A9dr=
ic Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Karthike=
yan,<br>
<br>
On 2/16/23 19:43, Karthikeyan Pasupathi wrote:<br>
&gt; This patch support Tiogapass in QEMU environment.<br>
&gt; and introduced EEPROM BMC FRU data support &quot;add tiogapass_bmc_fru=
id data&quot;<br>
&gt; along with the machine support.<br>
&gt; <br>
&gt; Signed-off-by: Karthikeyan Pasupathi &lt;<a href=3D"mailto:pkarthikeya=
n1509@gmail.com" target=3D"_blank">pkarthikeyan1509@gmail.com</a>&gt;<br>
<br>
There are a couple of coding style issues that I will fix. This is minor.<b=
r>
(./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_b=
lank">checkpatch.pl</a> is a good tool to run before sending.)<br>
<br>
Reviewed-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" targ=
et=3D"_blank">clg@kaod.org</a>&gt;<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 ++++++++++=
++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed_eeprom.c | 22 ++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed_eeprom.h |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A03 files changed, 57 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt; index 27dda58338..d12164420d 100644<br>
&gt; --- a/hw/arm/aspeed.c<br>
&gt; +++ b/hw/arm/aspeed.c<br>
&gt; @@ -530,6 +530,15 @@ static void romulus_bmc_i2c_init(AspeedMachineSta=
te *bmc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&=
amp;soc-&gt;i2c, 11), &quot;ds1338&quot;, 0x32);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AspeedSoCState *soc =3D &amp;bmc-&gt;soc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 at24c_eeprom_init(aspeed_i2c_get_bus(&amp;soc-&gt;i2c, =
4), 0x54, 128 * KiB);<br>
&gt; +=C2=A0 =C2=A0 at24c_eeprom_init_rom(aspeed_i2c_get_bus(&amp;soc-&gt;i=
2c, 6), 0x54, 128 * KiB, tiogapass_bmc_fruid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 tiogapass_bmc_fruid_len);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void create_pca9552(AspeedSoCState *soc, int bus_id=
, int addr)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&=
amp;soc-&gt;i2c, bus_id),<br>
&gt; @@ -1191,6 +1200,25 @@ static void aspeed_machine_romulus_class_init(O=
bjectClass *oc, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_soc_num_cpus(amc-&gt;so=
c_name);<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void aspeed_machine_tiogapass_class_init(ObjectClass *oc, void=
 *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
&gt; +=C2=A0 =C2=A0 AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;desc=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;Faceboo=
k Tiogapass BMC (ARM1176)&quot;;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;soc_name=C2=A0 =3D &quot;ast2500-a1&quot;;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;hw_strap1 =3D AST2500_EVB_HW_STRAP1;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;hw_strap2 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;fmc_model =3D &quot;n25q256a&quot;;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;spi_model =3D &quot;mx25l25635e&quot;;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;num_cs=C2=A0 =C2=A0 =3D 2;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;i2c_init=C2=A0 =3D tiogapass_bmc_i2c_init;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;default_ram_size=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 1=
 * GiB;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;default_cpus =3D mc-&gt;min_cpus =3D mc-&gt;max_=
cpus =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed_soc_num_cpus(amc-&gt;soc_name);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed_soc_num_cpus(amc-&gt;soc_name);<br=
>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void aspeed_machine_sonorapass_class_init(ObjectCla=
ss *oc, void *data)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);<br>
&gt; @@ -1566,6 +1594,10 @@ static const TypeInfo aspeed_machine_types[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D MACHINE_TYPE_NAME(&quot;tacoma-bmc&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D TYPE_ASPEED_MACHINE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D a=
speed_machine_tacoma_class_init,<br>
&gt; +=C2=A0 =C2=A0 }, {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D MACHINE_TYPE_NAME(&quot;tiogapass-bmc&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TY=
PE_ASPEED_MACHINE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D aspeed_machi=
ne_tiogapass_class_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D MACHINE_TYPE_NAME(&quot;g220a-bmc&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D TYPE_ASPEED_MACHINE,<br>
&gt; diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c<br>
&gt; index 04463acc9d..f937a6ceaa 100644<br>
&gt; --- a/hw/arm/aspeed_eeprom.c<br>
&gt; +++ b/hw/arm/aspeed_eeprom.c<br>
&gt; @@ -6,6 +6,27 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;aspeed_eeprom.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Tiogapass BMC FRU */<br>
&gt; +const uint8_t tiogapass_bmc_fruid[] =3D {<br>
&gt; +=C2=A0 =C2=A0 0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0=
x0c, 0x00, 0x36,<br>
&gt; +=C2=A0 =C2=A0 0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0=
xd2, 0x42, 0x4d,<br>
&gt; +=C2=A0 =C2=A0 0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0=
x20, 0x4d, 0x6f,<br>
&gt; +=C2=A0 =C2=A0 0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0=
x58, 0x58, 0x58,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0=
x58, 0x58, 0x58,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0=
xc3, 0x31, 0x2e,<br>
&gt; +=C2=A0 =C2=A0 0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0=
x58, 0x58, 0xd2,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0=
x58, 0x58, 0x58,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0=
x0c, 0x00, 0xc6,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x54, 0x69, 0=
x6f, 0x67, 0x61,<br>
&gt; +=C2=A0 =C2=A0 0x20, 0x50, 0x61, 0x73, 0x73, 0x20, 0x53, 0x69, 0x6e, 0=
x67, 0x6c, 0x65,<br>
&gt; +=C2=A0 =C2=A0 0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0=
x58, 0x58, 0x58,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0xc4, 0x58, 0x58, 0x58, 0x32, 0=
xcd, 0x58, 0x58,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0=
x58, 0x58, 0xc7,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0=
x2e, 0x30, 0xc9,<br>
&gt; +=C2=A0 =C2=A0 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0=
xc8, 0x43, 0x6f,<br>
&gt; +=C2=A0 =C2=A0 0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0const uint8_t fby35_nic_fruid[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A00x01, 0x00, 0x00, 0x01, 0x0f, 0x20, 0x00, 0x=
cf, 0x01, 0x0e, 0x19, 0xd7,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A00x5e, 0xcf, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x=
58, 0x58, 0x58, 0x58, 0xdd,<br>
&gt; @@ -77,6 +98,7 @@ const uint8_t fby35_bmc_fruid[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A00x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x=
45,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +const size_t tiogapass_bmc_fruid_len =3D sizeof(tiogapass_bmc_fruid);=
<br>
&gt;=C2=A0 =C2=A0const size_t fby35_nic_fruid_len =3D sizeof(fby35_nic_frui=
d);<br>
&gt;=C2=A0 =C2=A0const size_t fby35_bb_fruid_len =3D sizeof(fby35_bb_fruid)=
;<br>
&gt;=C2=A0 =C2=A0const size_t fby35_bmc_fruid_len =3D sizeof(fby35_bmc_frui=
d);<br>
&gt; diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h<br>
&gt; index a0f848fa6e..69db103c83 100644<br>
&gt; --- a/hw/arm/aspeed_eeprom.h<br>
&gt; +++ b/hw/arm/aspeed_eeprom.h<br>
&gt; @@ -9,6 +9,9 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +extern const uint8_t tiogapass_bmc_fruid[];<br>
&gt; +extern const size_t tiogapass_bmc_fruid_len;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0extern const uint8_t fby35_nic_fruid[];<br>
&gt;=C2=A0 =C2=A0extern const uint8_t fby35_bb_fruid[];<br>
&gt;=C2=A0 =C2=A0extern const uint8_t fby35_bmc_fruid[];<br>
<br>
</blockquote></div>

--0000000000001b3d0805f4e2828b--

