Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD5437ABC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:16:27 +0200 (CEST)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdxDW-0004FR-Pe
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdx5P-0004JP-O8
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:08:06 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:46651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdx5M-000646-4C
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:08:03 -0400
Received: by mail-ua1-x931.google.com with SMTP id u5so8545872uao.13
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=UmVjXegCsmo4EByY+ex9ZoWsRzSr5cdVQ3+KC21x0i0=;
 b=Djtmnkkuxhz1hP4lGRCz29mXZT6PYLi61RdmDH2uqJA6BqKKITczmFs2CT32NjCzV/
 fMMS3wEqK7hm7eDVFFjhHxZoc0AMjdVfIEyp2IGS0Z6oIggBKUU3gOloen5FdKQ65gAj
 hYRtlfzaPOAQfLgATOi2Ph4tnD80xAv2M40WCdtit904ruI6GME42/5rPJ1olKpdLxPy
 l+qgF17Wlt3A+/gWzLAdOXboeGNTDtt2nr46oJg722eTyElNGPh8aBpXG92ioVjkuxEn
 RMO7BIrvlU7VfoRECCDox3Jnx53e27A8UBjRbl3eF78ytUAiZlMfIhn22c6iq+0JzcId
 eQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=UmVjXegCsmo4EByY+ex9ZoWsRzSr5cdVQ3+KC21x0i0=;
 b=Kti4nDkXeMHPBMZiqsYta1rML3fWntU5IB3hsEXqKH4EY/XVY8+5tM3nWQTUwCM/5l
 0j/g1N2c6bTVz2xgJDY8nHN9DyEPfuyC4uvdbjeqX7Ds5uilREAQlVIx0Arcw2IbdfZn
 1HGsJGLLnPyv85kfAHxZF2wKnTLzpC1vXtWdPLUzejvhKsrOxOvqyTDGQWwg4z3ubOx9
 xTpr8vL7QX+3+/+ZjIHOAULf6qa5VRhp3/F1rhGjikCuuYT+nv371YB1trAj8kSi6aP9
 6P8L5IXLMb4lIuIP2kG3hFfLHnbkGpWrvj2+94k9WvIw/GLrW6EBlvK/Nwt749RaLtxa
 WO5w==
X-Gm-Message-State: AOAM532umyaxUJ0zch/FNbZvmWBvBtc1qZOv0djDgWZVKP5HYsk5yPAb
 AG2ckJd5Kz6OkbUUpsZFyJT08LKeK/cjzB6GmSO8/BH6kxwajw==
X-Google-Smtp-Source: ABdhPJzB/qdBgm1eTIq9uGHJ8tr3uq4Uc7Pm9q0f29qqe4m2ZSkJ10b3bDhpHpbDhHF8trupq8lFLZtNgjMtX2/Pt2I=
X-Received: by 2002:ab0:5542:: with SMTP id u2mr838665uaa.62.1634918878175;
 Fri, 22 Oct 2021 09:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211022111007.43478-1-yaroshchuk2000@gmail.com>
 <4cc0d115-d022-980c-e67e-3eda149e3fdc@vivier.eu>
In-Reply-To: <4cc0d115-d022-980c-e67e-3eda149e3fdc@vivier.eu>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 22 Oct 2021 19:07:47 +0300
Message-ID: <CADO9X9StQyOU+9PH-g78k02L+XeT9rmF+KdoSVszfdaCgq_foA@mail.gmail.com>
Subject: Re: [PATCH v3] isa-applesmc: provide OSK forwarding on Apple hosts
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f863fe05cef336ae"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x931.google.com
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

--000000000000f863fe05cef336ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Laurent!
Thank you for your review!

=D0=BF=D1=82, 22 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 14:36, Laurent Viv=
ier <laurent@vivier.eu>:

> Le 22/10/2021 =C3=A0 13:10, Vladislav Yaroshchuk a =C3=A9crit :
> > On Apple hosts we can read AppleSMC OSK key directly from host's
> > SMC and forward this value to QEMU Guest.
> >
> > Usage:
> > `-device isa-applesmc,hostosk=3Don`
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
> > Based on
> https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter=
7/tpmdrmmyth/
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
> >   hw/misc/applesmc.c | 147 ++++++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 146 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> > index 1b9acaf1d3..bcc021f7b7 100644
> > --- a/hw/misc/applesmc.c
> > +++ b/hw/misc/applesmc.c
> > @@ -38,6 +38,10 @@
> >   #include "qemu/timer.h"
> >   #include "qom/object.h"
> >
> > +#if defined(__APPLE__)
> > +#include <IOKit/IOKitLib.h>
> > +#endif
> > +
> >   /* #define DEBUG_SMC */
> >
> >   #define APPLESMC_DEFAULT_IOBASE        0x300
> > @@ -108,6 +112,7 @@ struct AppleSMCState {
> >       uint8_t data_len;
> >       uint8_t data_pos;
> >       uint8_t data[255];
> > +    char *hostosk_flag;
>
> Use a boolean (see below)
>
> >       char *osk;
> >       QLIST_HEAD(, AppleSMCData) data_def;
> >   };
> > @@ -312,9 +317,136 @@ static const MemoryRegionOps applesmc_err_io_ops =
=3D
> {
> >       },
> >   };
> >
> > +#if defined(__APPLE__)
> > +/*
> > + * Based on
> > + *
> https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter=
7/tpmdrmmyth/
> > + */
> > +enum {
> > +    SMC_CLIENT_OPEN      =3D 0,
> > +    SMC_CLIENT_CLOSE     =3D 1,
> > +    SMC_HANDLE_EVENT     =3D 2,
> > +    SMC_READ_KEY         =3D 5
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
> > +static int applesmc_read_host_osk(char **host_osk)
>
> I think you should return the error message using an "Error **errp".


Yep, sounds much better, will fix this in the next patch version.

> +{
> > +    assert(host_osk !=3D NULL);
> > +
> > +    io_service_t            hostsmc_service =3D IO_OBJECT_NULL;
> > +    io_connect_t            hostsmc_connect =3D IO_OBJECT_NULL;
> > +    size_t                  out_size =3D sizeof(struct AppleSMCParam);
> > +    IOReturn                status =3D kIOReturnError;
> > +    struct AppleSMCParam    in =3D {0};
> > +    struct AppleSMCParam    out =3D {0};
> > +
> > +    /* OSK key size + '\0' */
> > +    *host_osk =3D g_malloc0(65);
> > +    (*host_osk)[64] =3D '\0';
> > +
> > +    hostsmc_service =3D IOServiceGetMatchingService(kIOMasterPortDefau=
lt,
> > +
> IOServiceMatching("AppleSMC"));
> > +    if (hostsmc_service =3D=3D IO_OBJECT_NULL) {
> > +        warn_report("host AppleSMC device is unreachable");
> > +        goto error_osk_buffer_free;
> > +    }
> > +
> > +    status =3D IOServiceOpen(hostsmc_service,
> > +                           mach_task_self(),
> > +                           1,
> > +                           &hostsmc_connect);
> > +    if (status !=3D kIOReturnSuccess || hostsmc_connect =3D=3D
> IO_OBJECT_NULL) {
> > +        warn_report("host AppleSMC device is unreachable");
> > +        goto error_osk_buffer_free;
> > +    }
> > +
> > +    status =3D IOConnectCallMethod(
> > +        hostsmc_connect,
> > +        SMC_CLIENT_OPEN,
> > +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL
> > +    );
> > +    if (status !=3D kIOReturnSuccess) {
> > +        warn_report("host AppleSMC device is unreachable");
> > +        goto error_ioservice_close;
> > +    }
> > +
> > +    in.key =3D ('OSK0');
> > +    in.data_size =3D sizeof(out.bytes);
> > +    in.command =3D SMC_READ_KEY;
> > +    status =3D IOConnectCallStructMethod(
> > +        hostsmc_connect,
> > +        SMC_HANDLE_EVENT,
> > +        &in,
> > +        sizeof(struct AppleSMCParam),
> > +        &out,
> > +        &out_size
> > +    );
> > +
> > +    if (status !=3D kIOReturnSuccess) {
> > +        warn_report("unable to read OSK0 from host AppleSMC device");
> > +        goto error_ioconnect_close;
> > +    }
> > +    strncpy(*host_osk, (const char *) out.bytes, 32);
> > +
> > +    in.key =3D ('OSK1');
> > +    in.data_size =3D sizeof(out.bytes);
> > +    in.command =3D SMC_READ_KEY;
> > +    status =3D IOConnectCallStructMethod(
> > +        hostsmc_connect,
> > +        SMC_HANDLE_EVENT,
> > +        &in,
> > +        sizeof(struct AppleSMCParam),
> > +        &out,
> > +        &out_size
> > +    );
> > +    if (status !=3D kIOReturnSuccess) {
> > +        warn_report("unable to read OSK1 from host AppleSMC device");
> > +        goto error_ioconnect_close;
> > +    }
> > +    strncpy((*host_osk) + 32, (const char *) out.bytes, 32);
> > +
> > +    IOConnectCallMethod(
> > +        hostsmc_connect,
> > +        SMC_CLIENT_CLOSE,
> > +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
> > +    IOServiceClose(hostsmc_connect);
> > +    return 0;
> > +
> > +error_ioconnect_close:
> > +    IOConnectCallMethod(
> > +        hostsmc_connect,
> > +        SMC_CLIENT_CLOSE,
> > +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
> > +error_ioservice_close:
> > +    IOServiceClose(hostsmc_connect);
> > +
> > +error_osk_buffer_free:
> > +    g_free(*host_osk);
> > +    return -1;
> > +}
> > +#else
> > +static int applesmc_read_host_osk(char **output_key)
> > +{
> > +    warn_report("isa-applesmc.hostosk ignored: "
> > +                "unsupported on non-Apple hosts");
>
> I think a failure would be better than a warning.
> Moreover will it work if the user doenst provide the OSK?
>
>
Not sure that failure is more suitable than warning. See below [0].

> +    return -1;
> > +}
> > +#endif
> > +
> >   static void applesmc_isa_realize(DeviceState *dev, Error **errp)
> >   {
> > -    AppleSMCState *s =3D APPLE_SMC(dev);
> > +    AppleSMCState   *s =3D APPLE_SMC(dev);
> > +    char            *host_osk;
> >
> >       memory_region_init_io(&s->io_data, OBJECT(s),
> &applesmc_data_io_ops, s,
> >                             "applesmc-data", 1);
> > @@ -331,6 +463,18 @@ static void applesmc_isa_realize(DeviceState *dev,
> Error **errp)
> >       isa_register_ioport(&s->parent_obj, &s->io_err,
> >                           s->iobase + APPLESMC_ERR_PORT);
> >
> > +    /* Key retrieved from host SMC overwrites provided OSK string */
> > +    if (s->hostosk_flag
> > +        && !strcmp("on", s->hostosk_flag)
>
> Use a bool property for hostosk (see below), that will allow "on", "yes",
> "true", ... and here
> you'll only have to test for the boolean value.
>
> +        && !applesmc_read_host_osk(&host_osk)) {
> > +        if (s->osk) {
> > +            warn_report("provided isa-applesmc.osk "
> > +                        "is overwritten with host OSK");
> > +            g_free(s->osk);
> > +        }
> > +        s->osk =3D host_osk;
> > +    }
> > +
> >       if (!s->osk || (strlen(s->osk) !=3D 64)) {
> >           warn_report("Using AppleSMC with invalid key");

>           s->osk =3D default_osk;
>

[0] The behavior of `osk` property handle: when the wrong OSK is provided
(or not provided at all) isa-applesmc uses `default_osk` and continues to
work fine.
Only a warning is printed.
Seems it's better to meet this "rule": when we can't read OSK from host-SMC
just
warn the user and continue with `default_osk`.



> > @@ -344,6 +488,7 @@ static Property applesmc_isa_properties[] =3D {
> >       DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
> >                          APPLESMC_DEFAULT_IOBASE),
> >       DEFINE_PROP_STRING("osk", AppleSMCState, osk),
> > +    DEFINE_PROP_STRING("hostosk", AppleSMCState, hostosk_flag),
>
> An DEFINE_PROP_BOOL() would be more appropriate for this.
>
>
Will fix the property in the next patch version, thank you!

>       DEFINE_PROP_END_OF_LIST(),
> >   };
> >
> >
>
> Thanks,
> Laurent
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--000000000000f863fe05cef336ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi, Laurent!<br>Thank you for your review=
!</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">=D0=BF=D1=82, 22 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 14:36, Laure=
nt Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt=
;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 22/10/2021=
 =C3=A0 13:10, Vladislav Yaroshchuk a =C3=A9crit=C2=A0:<br>
&gt; On Apple hosts we can read AppleSMC OSK key directly from host&#39;s<b=
r>
&gt; SMC and forward this value to QEMU Guest.<br>
&gt; <br>
&gt; Usage:<br>
&gt; `-device isa-applesmc,hostosk=3Don`<br>
&gt; <br>
&gt; Apple licence allows use and run up to two additional copies<br>
&gt; or instances of macOS operating within virtual operating system<br>
&gt; environments on each Apple-branded computer that is already running<br=
>
&gt; the Apple Software, for purposes of:<br>
&gt; - software development<br>
&gt; - testing during software development<br>
&gt; - using macOS Server<br>
&gt; - personal, non-commercial use<br>
&gt; <br>
&gt; Guest macOS requires AppleSMC with correct OSK. The most legal<br>
&gt; way to pass it to the Guest is to forward the key from host SMC<br>
&gt; without any value exposion.<br>
&gt; <br>
&gt; Based on <a href=3D"https://web.archive.org/web/20200103161737/osxbook=
.com/book/bonus/chapter7/tpmdrmmyth/" rel=3D"noreferrer" target=3D"_blank">=
https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/=
tpmdrmmyth/</a><br>
&gt; <br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/misc/applesmc.c | 147 +++++++++++++++++++++++++++++++++=
+++++++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 146 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c<br>
&gt; index 1b9acaf1d3..bcc021f7b7 100644<br>
&gt; --- a/hw/misc/applesmc.c<br>
&gt; +++ b/hw/misc/applesmc.c<br>
&gt; @@ -38,6 +38,10 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/timer.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qom/object.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#if defined(__APPLE__)<br>
&gt; +#include &lt;IOKit/IOKitLib.h&gt;<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* #define DEBUG_SMC */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define APPLESMC_DEFAULT_IOBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x300<br>
&gt; @@ -108,6 +112,7 @@ struct AppleSMCState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t data_len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t data_pos;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t data[255];<br>
&gt; +=C2=A0 =C2=A0 char *hostosk_flag;<br>
<br>
Use a boolean (see below)<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *osk;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QLIST_HEAD(, AppleSMCData) data_def;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt; @@ -312,9 +317,136 @@ static const MemoryRegionOps applesmc_err_io_ops=
 =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#if defined(__APPLE__)<br>
&gt; +/*<br>
&gt; + * Based on<br>
&gt; + * <a href=3D"https://web.archive.org/web/20200103161737/osxbook.com/=
book/bonus/chapter7/tpmdrmmyth/" rel=3D"noreferrer" target=3D"_blank">https=
://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdr=
mmyth/</a><br>
&gt; + */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 SMC_CLIENT_OPEN=C2=A0 =C2=A0 =C2=A0 =3D 0,<br>
&gt; +=C2=A0 =C2=A0 SMC_CLIENT_CLOSE=C2=A0 =C2=A0 =C2=A0=3D 1,<br>
&gt; +=C2=A0 =C2=A0 SMC_HANDLE_EVENT=C2=A0 =C2=A0 =C2=A0=3D 2,<br>
&gt; +=C2=A0 =C2=A0 SMC_READ_KEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 5<br>
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
&gt; +static int applesmc_read_host_osk(char **host_osk)<br>
<br>
I think you should return the error message using an &quot;Error **errp&quo=
t;.=C2=A0</blockquote><div><br></div><div>Yep, sounds much better, will fix=
 this in the next patch version.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 assert(host_osk !=3D NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 io_service_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
ostsmc_service =3D IO_OBJECT_NULL;<br>
&gt; +=C2=A0 =C2=A0 io_connect_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
ostsmc_connect =3D IO_OBJECT_NULL;<br>
&gt; +=C2=A0 =C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 out_size =3D sizeof(struct AppleSMCParam);<br>
&gt; +=C2=A0 =C2=A0 IOReturn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D kIOReturnError;<br>
&gt; +=C2=A0 =C2=A0 struct AppleSMCParam=C2=A0 =C2=A0 in =3D {0};<br>
&gt; +=C2=A0 =C2=A0 struct AppleSMCParam=C2=A0 =C2=A0 out =3D {0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* OSK key size + &#39;\0&#39; */<br>
&gt; +=C2=A0 =C2=A0 *host_osk =3D g_malloc0(65);<br>
&gt; +=C2=A0 =C2=A0 (*host_osk)[64] =3D &#39;\0&#39;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 hostsmc_service =3D IOServiceGetMatchingService(kIOMast=
erPortDefault,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 IOServiceMatching(&quot;AppleSMC&quot;));<br>
&gt; +=C2=A0 =C2=A0 if (hostsmc_service =3D=3D IO_OBJECT_NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;host AppleSMC device is=
 unreachable&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_osk_buffer_free;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 status =3D IOServiceOpen(hostsmc_service,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0mach_task_self(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A01,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;hostsmc_connect);<br>
&gt; +=C2=A0 =C2=A0 if (status !=3D kIOReturnSuccess || hostsmc_connect =3D=
=3D IO_OBJECT_NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;host AppleSMC device is=
 unreachable&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_osk_buffer_free;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 status =3D IOConnectCallMethod(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostsmc_connect,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SMC_CLIENT_OPEN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0, NULL, 0, NULL, NULL, NULL, NULL<=
br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 if (status !=3D kIOReturnSuccess) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;host AppleSMC device is=
 unreachable&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_ioservice_close;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 in.key =3D (&#39;OSK0&#39;);<br>
&gt; +=C2=A0 =C2=A0 in.data_size =3D sizeof(out.bytes);<br>
&gt; +=C2=A0 =C2=A0 in.command =3D SMC_READ_KEY;<br>
&gt; +=C2=A0 =C2=A0 status =3D IOConnectCallStructMethod(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostsmc_connect,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SMC_HANDLE_EVENT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct AppleSMCParam),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;out,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;out_size<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (status !=3D kIOReturnSuccess) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;unable to read OSK0 fro=
m host AppleSMC device&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_ioconnect_close;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 strncpy(*host_osk, (const char *) out.bytes, 32);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 in.key =3D (&#39;OSK1&#39;);<br>
&gt; +=C2=A0 =C2=A0 in.data_size =3D sizeof(out.bytes);<br>
&gt; +=C2=A0 =C2=A0 in.command =3D SMC_READ_KEY;<br>
&gt; +=C2=A0 =C2=A0 status =3D IOConnectCallStructMethod(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostsmc_connect,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SMC_HANDLE_EVENT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct AppleSMCParam),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;out,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;out_size<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 if (status !=3D kIOReturnSuccess) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;unable to read OSK1 fro=
m host AppleSMC device&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_ioconnect_close;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 strncpy((*host_osk) + 32, (const char *) out.bytes, 32)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 IOConnectCallMethod(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostsmc_connect,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SMC_CLIENT_CLOSE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0, NULL, 0, NULL, NULL, NULL, NULL)=
;<br>
&gt; +=C2=A0 =C2=A0 IOServiceClose(hostsmc_connect);<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +<br>
&gt; +error_ioconnect_close:<br>
&gt; +=C2=A0 =C2=A0 IOConnectCallMethod(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostsmc_connect,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SMC_CLIENT_CLOSE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0, NULL, 0, NULL, NULL, NULL, NULL)=
;<br>
&gt; +error_ioservice_close:<br>
&gt; +=C2=A0 =C2=A0 IOServiceClose(hostsmc_connect);<br>
&gt; +<br>
&gt; +error_osk_buffer_free:<br>
&gt; +=C2=A0 =C2=A0 g_free(*host_osk);<br>
&gt; +=C2=A0 =C2=A0 return -1;<br>
&gt; +}<br>
&gt; +#else<br>
&gt; +static int applesmc_read_host_osk(char **output_key)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 warn_report(&quot;isa-applesmc.hostosk ignored: &quot;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unsuppo=
rted on non-Apple hosts&quot;);<br>
<br>
I think a failure would be better than a warning.<br>
Moreover will it work if the user doenst provide the OSK?<br>
<br></blockquote><div><br></div><div>Not sure that failure is more suitable=
 than warning. See below [0].=C2=A0</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 return -1;<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void applesmc_isa_realize(DeviceState *dev, Error *=
*errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 AppleSMCState *s =3D APPLE_SMC(dev);<br>
&gt; +=C2=A0 =C2=A0 AppleSMCState=C2=A0 =C2=A0*s =3D APPLE_SMC(dev);<br>
&gt; +=C2=A0 =C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *host_osk=
;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;io_data, OB=
JECT(s), &amp;applesmc_data_io_ops, s,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;applesmc-data&quot;, 1);<br>
&gt; @@ -331,6 +463,18 @@ static void applesmc_isa_realize(DeviceState *dev=
, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0isa_register_ioport(&amp;s-&gt;parent_obj, &=
amp;s-&gt;io_err,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;iobase + APPLESMC_ERR_PORT);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* Key retrieved from host SMC overwrites provided OSK =
string */<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;hostosk_flag<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !strcmp(&quot;on&quot;, s-&gt;=
hostosk_flag)<br>
<br>
Use a bool property for hostosk (see below), that will allow &quot;on&quot;=
, &quot;yes&quot;, &quot;true&quot;, ... and here <br>
you&#39;ll only have to test for the boolean value.=C2=A0<br></blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !applesmc_read_host_osk(&amp;h=
ost_osk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;osk) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;provided =
isa-applesmc.osk &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;is overwritten with host OSK&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;osk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;osk =3D host_osk;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;osk || (strlen(s-&gt;osk) !=3D 64=
)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warn_report(&quot;Using AppleS=
MC with invalid key&quot;);</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;osk =3D default_osk;<br>=
</blockquote><div>=C2=A0</div><div>[0] The behavior of `osk` property handl=
e: when the wrong=C2=A0OSK is provided=C2=A0</div><div>(or not provided at =
all) isa-applesmc uses `default_osk` and continues to work fine.=C2=A0</div=
><div>Only a warning is printed.</div><div>Seems it&#39;s better to meet th=
is &quot;rule&quot;: when we can&#39;t read OSK from host-SMC just=C2=A0=C2=
=A0</div><div>warn the=C2=A0user and continue with `default_osk`.=C2=A0</di=
v><div>=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; @@ -344,6 +488,7 @@ static Property applesmc_isa_properties[] =3D {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, Ap=
pleSMCState, iobase,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 APPLESMC_DEFAULT_IOBASE),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;osk&quot;, AppleSMC=
State, osk),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;hostosk&quot;, AppleSMCState, =
hostosk_flag),<br>
<br>
An DEFINE_PROP_BOOL() would be more appropriate for this.<br>
<br></blockquote><div>=C2=A0</div><div>Will fix the property in the next pa=
tch version, thank you!=C2=A0</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
<br>
Thanks,<br>
Laurent<br>
<br>
</blockquote></div></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></di=
v></div></div>

--000000000000f863fe05cef336ae--

