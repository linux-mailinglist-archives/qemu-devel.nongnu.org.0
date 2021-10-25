Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F84399C4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 17:12:17 +0200 (CEST)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf1e4-0005zc-A4
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 11:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mf1bl-0004OT-2s
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 11:09:53 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:43677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mf1bh-0003FW-TA
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 11:09:52 -0400
Received: by mail-ua1-x933.google.com with SMTP id k28so18531126uaa.10
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=17lmRrSQHxxn+VHFvP/TNxEInB7/+iRz1J997yHDUbI=;
 b=QcUHp8ls/Y7MaC7FjmKocRBRa5zOmQlhSooesLSbhVFXfWPxzA45+9JW0EyJaLf+oQ
 YIRGDei4kVC4D9AcCInjXYV0sXMJEeEJuTVRmOWOOTIP/Xlt0zriuQuQS7k8f1Aut+A/
 4iUzMeESHePyq8GAa3dvegR+f6Qw04qTNVeyK2SFXGXMCtN23PeQJrFCWfY1UIhA+s17
 vI09jELAezssL04uWKLzUmC7jD/kUWfNCC2tt2RGvNAPhqwIvUeVqPhDO25WEQoKhnuf
 ChIPTu3TGtqxraHbvFlHIQ3tf/4smzEFiUqcu8xyTmUxQssDoYmCg9yLXfl0SR+p7ygG
 1TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=17lmRrSQHxxn+VHFvP/TNxEInB7/+iRz1J997yHDUbI=;
 b=gtFaDzIfNWSbPgztiZtwZHLzUqL3rG+6sBryAYBGfcPsN7E95Lxq88lIyHMxTrJjaT
 d++oL4Ke09FBxMNs0mFXaqLs/hQP1T4mMP3A8Rf3AinVVHL1k/nAE2RBpyJboyHGp5ne
 mijtP73jmszixVTxhWbSD4/EW6R8Y3npScUysoa+wo1cnsU9oNeTwrCr6mmjqkiCBUoF
 ruUh7XIqODrGVZWMojVMsdQPyLo28YUvyV0ytKow0It+272AlKMhBblS7aaAs2nrTA/s
 fNVNK1iNo7rzDcStCd0S0ROFBLjHx6g8gizktU26uG/gYwtai9KyFKMzz605XmLVJxrb
 DOgg==
X-Gm-Message-State: AOAM530fjYmh0JBGK160dbHDFi1fauao1ZPGcGgH5byOnEsMbBFHh8Ww
 QC5T0cgMie/O6wViODMNrtsqq96VlKDsJILYPeQ=
X-Google-Smtp-Source: ABdhPJxJsXxfvgCfqEceEzmbO3QOgLpRYS5qpLQnQ5ryn/dpRzVMX+YJRYQuUEKfwws2CelOV5zfoKFofbPSPGwtqNY=
X-Received: by 2002:a05:6102:290b:: with SMTP id
 cz11mr4117129vsb.38.1635174588470; 
 Mon, 25 Oct 2021 08:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211025142138.9393-1-yaroshchuk2000@gmail.com>
 <543422ff-4556-04d7-77bb-88095dd69805@csgraf.de>
In-Reply-To: <543422ff-4556-04d7-77bb-88095dd69805@csgraf.de>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Mon, 25 Oct 2021 18:09:37 +0300
Message-ID: <CADO9X9RXwOvG707VBjKk-ES97v=moBLrk7Dh8bf8b2i8kE7Z+w@mail.gmail.com>
Subject: Re: [PATCH v5] isa-applesmc: provide OSK forwarding on Apple hosts
To: Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <r.bolshakov@yadro.com>,
 suse@csgraf.de, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Pedro_To=CC=82rres?= <t0rr3sp3dr0@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 "Gabriel L. Somlo" <gsomlo@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007de43405cf2ec081"
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x933.google.com
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

--0000000000007de43405cf2ec081
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 25 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 17:56, Alexander G=
raf <agraf@csgraf.de>:

>
> On 25.10.21 16:21, Vladislav Yaroshchuk wrote:
> > On Apple hosts we can read AppleSMC OSK key directly from host's
> > SMC and forward this value to QEMU Guest.
> >
> > Usage:
> > `-device isa-applesmc,osk=3Dhost`
> >
> > Apple licence allows use and run up to two additional copies
> > or instances of macOS operating within virtual operating system
> > environments on each Apple-branded computer that is already running
> > the Apple Software, for purposes of:
> > - software development
> > - testing during software development
> > - using macOS Server
> > - personal, non-commercial use
> >
> > Guest macOS requires AppleSMC with correct OSK. The most legal
> > way to pass it to the Guest is to forward the key from host SMC
> > without any value exposion.
> >
> > Enable this feature by default on Apple devices
> >
> > Based on
> https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter=
7/tpmdrmmyth/
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
> >   hw/misc/applesmc.c | 121 ++++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 121 insertions(+)
> >
> > diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> > index 1b9acaf1d3..6bd2584ca0 100644
> > --- a/hw/misc/applesmc.c
> > +++ b/hw/misc/applesmc.c
> > @@ -37,6 +37,11 @@
> >   #include "qemu/module.h"
> >   #include "qemu/timer.h"
> >   #include "qom/object.h"
> > +#include "qapi/error.h"
> > +
> > +#if defined(__APPLE__) && defined(__MACH__)
> > +#include <IOKit/IOKitLib.h>
> > +#endif
> >
> >   /* #define DEBUG_SMC */
> >
> > @@ -312,9 +317,106 @@ static const MemoryRegionOps applesmc_err_io_ops =
=3D
> {
> >       },
> >   };
> >
> > +#if defined(__APPLE__) && defined(__MACH__)
> > +/*
> > + * Based on
> > + *
> https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter=
7/tpmdrmmyth/
> > + */
> > +enum {
> > +    SMC_HANDLE_EVENT     =3D 2,
> > +    SMC_READ_KEY         =3D 5
>
>
> Anonymous enums are not great. Would you mind to just make them
> #define's instead?
>
>
> > +};
> > +
> > +struct AppleSMCParam {
> > +    uint32_t    key;
> > +    uint8_t     pad0[22];
> > +    IOByteCount data_size;
> > +    uint8_t     pad1[10];
> > +    uint8_t     command;
> > +    uint32_t    pad2;
> > +    uint8_t     bytes[32];
> > +};
> > +
> > +static bool applesmc_read_host_osk(char *host_osk, Error **errp)
> > +{
> > +    assert(host_osk !=3D NULL);
> > +
> > +    io_service_t    hostsmc_service =3D IO_OBJECT_NULL;
> > +    io_connect_t    hostsmc_connect =3D IO_OBJECT_NULL;
> > +    size_t          smc_param_size =3D sizeof(struct AppleSMCParam);
> > +    IOReturn        status =3D kIOReturnError;
> > +    int             i;
>
>
> No need to align the variable names. If anything, better follow the
> Reverse Christmas Tree model :)
>
Also, let's wait for v6 until Daniel and me agreed on the parameter.
>
>
> Alex
>
>
>
Ok, waiting for your discussion to finish.

--=20
Best Regards,

Vladislav Yaroshchuk

--0000000000007de43405cf2ec081
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D0=BD, 25 =D0=BE=D0=BA=D1=82. =
2021 =D0=B3. =D0=B2 17:56, Alexander Graf &lt;<a href=3D"mailto:agraf@csgra=
f.de">agraf@csgraf.de</a>&gt;:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
On 25.10.21 16:21, Vladislav Yaroshchuk wrote:<br>
&gt; On Apple hosts we can read AppleSMC OSK key directly from host&#39;s<b=
r>
&gt; SMC and forward this value to QEMU Guest.<br>
&gt;<br>
&gt; Usage:<br>
&gt; `-device isa-applesmc,osk=3Dhost`<br>
&gt;<br>
&gt; Apple licence allows use and run up to two additional copies<br>
&gt; or instances of macOS operating within virtual operating system<br>
&gt; environments on each Apple-branded computer that is already running<br=
>
&gt; the Apple Software, for purposes of:<br>
&gt; - software development<br>
&gt; - testing during software development<br>
&gt; - using macOS Server<br>
&gt; - personal, non-commercial use<br>
&gt;<br>
&gt; Guest macOS requires AppleSMC with correct OSK. The most legal<br>
&gt; way to pass it to the Guest is to forward the key from host SMC<br>
&gt; without any value exposion.<br>
&gt;<br>
&gt; Enable this feature by default on Apple devices<br>
&gt;<br>
&gt; Based on <a href=3D"https://web.archive.org/web/20200103161737/osxbook=
.com/book/bonus/chapter7/tpmdrmmyth/" rel=3D"noreferrer" target=3D"_blank">=
https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/=
tpmdrmmyth/</a><br>
&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/misc/applesmc.c | 121 +++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 121 insertions(+)<br>
&gt;<br>
&gt; diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c<br>
&gt; index 1b9acaf1d3..6bd2584ca0 100644<br>
&gt; --- a/hw/misc/applesmc.c<br>
&gt; +++ b/hw/misc/applesmc.c<br>
&gt; @@ -37,6 +37,11 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/module.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/timer.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qom/object.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +<br>
&gt; +#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
&gt; +#include &lt;IOKit/IOKitLib.h&gt;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* #define DEBUG_SMC */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -312,9 +317,106 @@ static const MemoryRegionOps applesmc_err_io_ops=
 =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
&gt; +/*<br>
&gt; + * Based on<br>
&gt; + * <a href=3D"https://web.archive.org/web/20200103161737/osxbook.com/=
book/bonus/chapter7/tpmdrmmyth/" rel=3D"noreferrer" target=3D"_blank">https=
://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdr=
mmyth/</a><br>
&gt; + */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 SMC_HANDLE_EVENT=C2=A0 =C2=A0 =C2=A0=3D 2,<br>
&gt; +=C2=A0 =C2=A0 SMC_READ_KEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 5<br>
<br>
<br>
Anonymous enums are not great. Would you mind to just make them <br>
#define&#39;s instead?<br>
<br>
<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct AppleSMCParam {<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 key;<br>
&gt; +=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0pad0[22];<br>
&gt; +=C2=A0 =C2=A0 IOByteCount data_size;<br>
&gt; +=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0pad1[10];<br>
&gt; +=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0command;<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 pad2;<br>
&gt; +=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0bytes[32];<br>
&gt; +};<br>
&gt; +<br>
&gt; +static bool applesmc_read_host_osk(char *host_osk, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 assert(host_osk !=3D NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 io_service_t=C2=A0 =C2=A0 hostsmc_service =3D IO_OBJECT=
_NULL;<br>
&gt; +=C2=A0 =C2=A0 io_connect_t=C2=A0 =C2=A0 hostsmc_connect =3D IO_OBJECT=
_NULL;<br>
&gt; +=C2=A0 =C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smc_param_size=
 =3D sizeof(struct AppleSMCParam);<br>
&gt; +=C2=A0 =C2=A0 IOReturn=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D kIORetur=
nError;<br>
&gt; +=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i;<b=
r>
<br>
<br>
No need to align the variable names. If anything, better follow the <br>
Reverse Christmas Tree model :)<br></blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Also, let&#39;s wait for v6 until Daniel and me agreed on the parameter.<br=
>
<br>
<br>
Alex<br>
<br>
<br></blockquote><div>=C2=A0</div><div>Ok, waiting for your discussion to f=
inish.</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<d=
iv><br><div>Vladislav Yaroshchuk</div></div></div></div></div>

--0000000000007de43405cf2ec081--

