Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8669984F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:06:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfoI-0000yk-IQ; Thu, 16 Feb 2023 10:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSfoF-0000wG-7s; Thu, 16 Feb 2023 10:04:31 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSfoB-0001W4-Ru; Thu, 16 Feb 2023 10:04:29 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id k6so2211385vsk.1;
 Thu, 16 Feb 2023 07:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vdnqnv11/k8IPNC5YHenEjTBuU30ug4qQLofMMWs+jE=;
 b=IznZ5xYazWUcW3EkQxZ0rFBi2jo1Bllss/FtI+KFg83PeVer0tDUxP00ZOlxMoqPay
 SGWLetr6OnNz1zt0vnLv0KRqqr/aC4BHNlpn87PCjmIkcWTgH/6BEDLfHiR3cD0clMtZ
 pJ/8SkHKmL9DVf54Aky8tckwMDUAuqMo/3QWNtPe2BzKF8qlpTerN73tvh0U5ikEFSDq
 Fc7LMxbpXRWRWES5JUGf+Ct65ewFwjXVW/QTeisgDViRhSI/LAEmnfSeikJQR0WJQ40/
 Pf+JBvEfBDlGdkQrHCcgTRmJZD5INKO6qxgQkhROqJGj+FiG221OTFem6EvYt6WntnK9
 9+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vdnqnv11/k8IPNC5YHenEjTBuU30ug4qQLofMMWs+jE=;
 b=fY7yR5RHxxveJqbhDTISzpnPPJavyW4fnDihGFYjicTIkELFPzDf/6TRfUoM57SMwh
 H0fgXFVZpDFByD5eCBmsP/uZhInjYs9m7tYmfsuxWMKgyYbixU598uqJa3LJyomgXCM+
 OgphHXQUVDCOAGRHM6l2Ml5Hpn9YEsfepexURH0y2mEp38EBi6W2XcGxL/aXJOivkCJb
 w8f/htUwRbFklRBYPSAz5r8sTRPdOxuGXXLk9X9S8yQ9TWQZxdWF4ytGLuk8jvSLuJXF
 KK6x4V0BgIH0Sr54zkPguJ8r/bRhCq+cnB23v5fRWkChvmf2EdcnRt6kxSDr9qUZDo+G
 xTlg==
X-Gm-Message-State: AO0yUKVHqQeg0AXvPiWmPaPwSnZKZX4YXeoXwGoWFwhwtld/gr+cwleJ
 FHF1cy+IQuNuB+6PfeWT122GWGZX7yFvLAyTDfE=
X-Google-Smtp-Source: AK7set+hUQSr+apTC1b9anBG4bLnO/XPvyzMqpJVjlzezJnZFBoKRIYmzo6drYZIY7xocjlN9QpRXIF6Q/6gvZRh1bM=
X-Received: by 2002:a05:6102:2751:b0:3fe:b46c:7889 with SMTP id
 p17-20020a056102275100b003feb46c7889mr1034233vsu.78.1676559866202; Thu, 16
 Feb 2023 07:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
 <2e46db2f-d48b-bc6e-85d8-1fa80ef4082c@linaro.org>
In-Reply-To: <2e46db2f-d48b-bc6e-85d8-1fa80ef4082c@linaro.org>
From: karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Date: Thu, 16 Feb 2023 20:34:13 +0530
Message-ID: <CA+ezb7hfKoaa6wQDQZpipzjOcJx9vWTXLT6cfOu7agG1iMD4SA@mail.gmail.com>
Subject: Re: [PATCH v3] Adding new machine Yosemitev2 in QEMU
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000450da705f4d2836f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-vs1-xe2f.google.com
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

--000000000000450da705f4d2836f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks.

On Thu, Feb 16, 2023 at 7:57 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> On 16/2/23 14:33, Karthikeyan Pasupathi wrote:
> > This patch support Yosemitev2 in QEMU environment.
> > and introduced EEPROM BMC FRU data support "add fbyv2_bmc_fruid data"
> > along with the machine support.
> >
> >
> > Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> > ---
> >   hw/arm/aspeed.c        | 31 +++++++++++++++++++++++++++++++
> >   hw/arm/aspeed_eeprom.c | 23 +++++++++++++++++++++++
> >   hw/arm/aspeed_eeprom.h |  3 +++
> >   3 files changed, 57 insertions(+)
>
> > +static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, void
> *data)
> > +{
> > +    MachineClass *mc =3D MACHINE_CLASS(oc);
> > +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> > +
> > +    mc->desc       =3D "Facebook YosemiteV2 BMC (ARM1176)";
> > +    amc->soc_name  =3D "ast2500-a1";
> > +    amc->hw_strap1 =3D AST2500_EVB_HW_STRAP1;
> > +    amc->hw_strap2 =3D 0;
> > +    amc->fmc_model =3D "n25q256a";
> > +    amc->spi_model =3D "mx25l25635e";
> > +    amc->num_cs    =3D 2;
> > +    amc->i2c_init  =3D yosemitev2_bmc_i2c_init;
> > +    mc->default_ram_size       =3D 512 * MiB;
>
> Odd indentation
>
> > +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> > +        aspeed_soc_num_cpus(amc->soc_name);
>
> Here too. What about:
>
>         mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus
>                          =3D aspeed_soc_num_cpus(amc->soc_name);
>
> I suppose C=C3=A9dric can fix when applying, no need for v4.
>
>

--000000000000450da705f4d2836f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, thanks. <br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 16, 2023 at 7:57 PM Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 16/2/23 14:33, Karthikeyan Pasupathi wrote:<br>
&gt; This patch support Yosemitev2 in QEMU environment.<br>
&gt; and introduced EEPROM BMC FRU data support &quot;add fbyv2_bmc_fruid d=
ata&quot;<br>
&gt; along with the machine support.<br>
&gt; <br>
&gt; <br>
&gt; Signed-off-by: Karthikeyan Pasupathi &lt;<a href=3D"mailto:pkarthikeya=
n1509@gmail.com" target=3D"_blank">pkarthikeyan1509@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ++++++++++=
+++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed_eeprom.c | 23 +++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed_eeprom.h |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A03 files changed, 57 insertions(+)<br>
<br>
&gt; +static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, voi=
d *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
&gt; +=C2=A0 =C2=A0 AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;desc=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;Faceboo=
k YosemiteV2 BMC (ARM1176)&quot;;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;soc_name=C2=A0 =3D &quot;ast2500-a1&quot;;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;hw_strap1 =3D AST2500_EVB_HW_STRAP1;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;hw_strap2 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;fmc_model =3D &quot;n25q256a&quot;;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;spi_model =3D &quot;mx25l25635e&quot;;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;num_cs=C2=A0 =C2=A0 =3D 2;<br>
&gt; +=C2=A0 =C2=A0 amc-&gt;i2c_init=C2=A0 =3D yosemitev2_bmc_i2c_init;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;default_ram_size=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 5=
12 * MiB;<br>
<br>
Odd indentation<br>
<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;default_cpus =3D mc-&gt;min_cpus =3D mc-&gt;max_=
cpus =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed_soc_num_cpus(amc-&gt;soc_name);<br=
>
<br>
Here too. What about:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mc-&gt;default_cpus =3D mc-&gt;min_cpus =3D mc-=
&gt;max_cpus<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D aspeed_soc_num_cpus(amc-&gt;soc_name);<br>
<br>
I suppose C=C3=A9dric can fix when applying, no need for v4.<br>
<br>
</blockquote></div>

--000000000000450da705f4d2836f--

