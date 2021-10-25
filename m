Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C5439860
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:21:12 +0200 (CEST)
Received: from localhost ([::1]:56646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0qd-0007Ym-BK
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mf0kd-0001Hr-NT
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:14:59 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:39516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mf0kZ-0003sj-Js
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:14:59 -0400
Received: by mail-ua1-x936.google.com with SMTP id p23so9637721uaa.6
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VlEviGyX1uFTOvXDtp+D99hoqs33OIdLVX9KYBNIk14=;
 b=MGc2AFdk1qU6dwVIbrEtdB5Y2HCsCthGpt16k051aghibAfGzN0qjR1U2QUnw8EbG9
 M5VqwbiBUkDzsof9rsCKNAGqprTgscw2WAsrw1jLWcgBF1iQv20mNwnhRDmSAoM6sWez
 akY24CSxYsfwqa8y2TQpZeloitJe/HCmKTd9CzKrB7XUGohQqW2IqpiREb6hUw+YRkUE
 HWYy0vUUJfb0mmNVHvgIB7P1nNid8LGBNIE2eZ2K72+jZBu0LQC0dRim09X25jFP8bGp
 XBOa/cD6Dr/ovp5J+BebYhbJs8pf6DIh1YwJ+6nX3SrwnvApOKX0j2CXz3SdhoOBazWp
 qXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VlEviGyX1uFTOvXDtp+D99hoqs33OIdLVX9KYBNIk14=;
 b=7JccGGF3aKwjX/IPv6KuVu4HnOhJZjKa+an5Z+GexjxKhe+xNQ/rUTRDFnbNR3asFG
 3HF38lcxmMxRnq2Aq9iEXhzvZ2vFcqbmlf3QNFNSeH2VyMkj3zcB++4EsPFCiNhPpw/x
 jPlIKPzhWEUhjmRQoMdhuUbdXe8EIgCrHKc/UH5vwh9jPuQ+Kx+x8u6NR/2rHy3o0PGp
 F4ZxvYfGEpO8YZMkU2rO1gub/zGNmWt5elPd6smTBoQT7jKf+BnVV2aAnMFVFxtSdHUb
 UAghPXgM7i9DGwy+Y5ctNpNjPSAYJzZTfD9J5aIFR55E3V9KaDqE7qlc8MSQ+GY95OUB
 2o5w==
X-Gm-Message-State: AOAM530PlKId4JRk1xO0N6yrc6xsLEUQlbY39JeJO5nRmLI7NfLYyrKZ
 AU+KxSCeWxVSNm/NIenWgBA27oyLjlCSapMSsoIzmIw6Yyv5GtSP
X-Google-Smtp-Source: ABdhPJyOMpveAKnT1VJCeobIBrkIV+jLTdjWsi657BShWJSKgokLRcYGHe4YHbJ+niJFyk+F1KrBLWqkklN4f9dtko4=
X-Received: by 2002:a05:6102:5088:: with SMTP id
 bl8mr14773132vsb.32.1635171293707; 
 Mon, 25 Oct 2021 07:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211022161448.81579-1-yaroshchuk2000@gmail.com>
 <394b94ad-3de6-2dfb-4aaf-344dcef8ec18@csgraf.de>
In-Reply-To: <394b94ad-3de6-2dfb-4aaf-344dcef8ec18@csgraf.de>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Mon, 25 Oct 2021 17:14:42 +0300
Message-ID: <CADO9X9QUKUh-0H+VQ=Y67Ri2SSoXZXPDSDgPdPQLsxN-sARpXA@mail.gmail.com>
Subject: Re: [PATCH v4] isa-applesmc: provide OSK forwarding on Apple hosts
To: Alexander Graf <agraf@csgraf.de>, Laurent Vivier <laurent@vivier.eu>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, suse@csgraf.de, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?Q?Pedro_To=CC=82rres?= <t0rr3sp3dr0@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 "Gabriel L. Somlo" <gsomlo@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001bc47f05cf2dfcca"
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x936.google.com
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

--0000000000001bc47f05cf2dfcca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 25 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 13:13, Alexander G=
raf <agraf@csgraf.de>:

>
> On 22.10.21 18:14, Vladislav Yaroshchuk wrote:
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
>
>
> There was a similar proposal on the mailing list by Pedro Torres
> recently. Please copy everyone who contributed to that email thread in
> your patch submission in addition to everyone who commented on previous
> versions of your own submission.
>
>
I understood that I'd missed the already submitted patch by Pedro
Torres. I should have queried 'applesmc' instead of 'isa-applesmc' to find
his patch. I've checked the mailing discussion and found some useful things
to fix, thank you.


> Also, this is definitely not "trivial" material. Trivial means spelling
> or super obvious fixes. This one is an actual feature :). I've removed
> qemu-trivial@ from the copy list.
>
> My mistake, won't make the same next time :)

>
> > ---
> >   hw/misc/applesmc.c | 155 ++++++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 154 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> > index 1b9acaf1d3..6bdec0063b 100644
> > --- a/hw/misc/applesmc.c
> > +++ b/hw/misc/applesmc.c
> > @@ -37,6 +37,11 @@
> >   #include "qemu/module.h"
> >   #include "qemu/timer.h"
> >   #include "qom/object.h"
> > +#include "qapi/error.h"
> > +
> > +#if defined(__APPLE__)
> > +#include <IOKit/IOKitLib.h>
> > +#endif
> >
> >   /* #define DEBUG_SMC */
> >
> > @@ -108,6 +113,7 @@ struct AppleSMCState {
> >       uint8_t data_len;
> >       uint8_t data_pos;
> >       uint8_t data[255];
> > +    bool hostosk_flag;
> >       char *osk;
> >       QLIST_HEAD(, AppleSMCData) data_def;
> >   };
> > @@ -312,9 +318,136 @@ static const MemoryRegionOps applesmc_err_io_ops =
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
> > +static bool applesmc_read_host_osk(char **host_osk, Error **errp)
>
>
> Please just provide a buffer to write the OSK into (char *host_osk) to
> the function.
>
>
Thank you, I will fix this.

>
> > +{
> > +    assert(host_osk !=3D NULL);
> > +
> > +    io_service_t            hostsmc_service =3D IO_OBJECT_NULL;
> > +    io_connect_t            hostsmc_connect =3D IO_OBJECT_NULL;
> > +    size_t                  out_size =3D sizeof(struct AppleSMCParam);
> > +    IOReturn                status =3D kIOReturnError;
> > +    struct AppleSMCParam    in =3D {0};
> > +    struct AppleSMCParam    out =3D {0};
>
>
> Can in and out be the same variable?
>
>
Checked, we can use one variable for in and out.


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
> > +        error_setg(errp, "Unable to get host-AppleSMC service");
> > +        goto error_osk_buffer_free;
> > +    }
> > +
> > +    status =3D IOServiceOpen(hostsmc_service,
> > +                           mach_task_self(),
> > +                           1,
> > +                           &hostsmc_connect);
> > +    if (status !=3D kIOReturnSuccess || hostsmc_connect =3D=3D
> IO_OBJECT_NULL) {
> > +        error_setg(errp, "Unable to open host-AppleSMC service");
> > +        goto error_osk_buffer_free;
> > +    }
> > +
> > +    status =3D IOConnectCallMethod(
> > +        hostsmc_connect,
> > +        SMC_CLIENT_OPEN,
> > +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL
> > +    );
> > +    if (status !=3D kIOReturnSuccess) {
> > +        error_setg(errp, "Unable to connect to host-AppleSMC");
> > +        goto error_ioservice_close;
> > +    }
> > +
> > +    in.key =3D ('OSK0');
> > +    in.data_size =3D sizeof(out.bytes);
> > +    in.command =3D SMC_READ_KEY;
>
>
> Since you know all these beforehand, can't you just create two struct
> AppleSMCParam - one for osk0 and one for osk1? Then just shoot them off
> here:
>
> struct AppleSMCParam cmd[2] =3D {
>      {
>          .key =3D ('OSK0'),
>          .data_size =3D sizeof(cmd[0].bytes),
>          .command =3D SMC_READ_KEY,
>      }, {
>          .key =3D ('OSK1'),
>          .data_size =3D sizeof(cmd[0].bytes),
>          .command =3D SMC_READ_KEY,
>      },
> };
>
>
> for (i =3D 0; i < ARRAY_SIZE(in); i++) {
>      IOConnectCallStructMethod(hostsmc_connect, SMC_HANDLE_EVENT,
> cmd[i], sizeof(cmd[i]), cmd[i], &out_size);
>      if (out_size !=3D sizeof(cmd[i])) {
>          goto err;
>      }
> }
>
>
A good idea, I'll rewrite the code using this approach, thank you!


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
> > +        error_setg(errp, "Unable to read OSK0 from host-AppleSMC");
> > +        goto error_ioconnect_close;
> > +    }
> > +    strncpy(*host_osk, (const char *) out.bytes, 32);
>
>
> The OSK is not a string (well, it is, but technically it isn't). Just
> treat it as opaque 32 bytes of memory. Memcpy is what you want here.
>
>
Yes, agree with you, fixing it now.


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
> > +        error_setg(errp, "Unable to read OSK1 from host-AppleSMC");
> > +        goto error_ioconnect_close;
> > +    }
> > +    strncpy((*host_osk) + 32, (const char *) out.bytes, 32);
> > +
> > +    IOConnectCallMethod(
> > +        hostsmc_connect,
> > +        SMC_CLIENT_CLOSE,
> > +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
> > +    IOServiceClose(hostsmc_connect);
> > +    return true;
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
> > +    return false;
> > +}
> > +#else
> > +static bool applesmc_read_host_osk(char **output_key, Error **errp)
> > +{
> > +    error_setg(errp, "isa-applesmc.hostosk ignored: "
> > +                     "unsupported on non-Apple hosts");
> > +    return false;
> > +}
> > +#endif
> > +
> >   static void applesmc_isa_realize(DeviceState *dev, Error **errp)
> >   {
> > -    AppleSMCState *s =3D APPLE_SMC(dev);
> > +    AppleSMCState   *s =3D APPLE_SMC(dev);
>
> Why the whitespace change here?
>
>
It was used to align `*s` and `*err`.  Seems disaccorded with QEMU
code style, I'll remove the space in the next patch.


> > +    Error           *err =3D NULL;
> >
> >       memory_region_init_io(&s->io_data, OBJECT(s),
> &applesmc_data_io_ops, s,
> >                             "applesmc-data", 1);
> > @@ -331,6 +464,25 @@ static void applesmc_isa_realize(DeviceState *dev,
> Error **errp)
> >       isa_register_ioport(&s->parent_obj, &s->io_err,
> >                           s->iobase + APPLESMC_ERR_PORT);
> >
> > +    if (s->hostosk_flag) {
> > +        /*
> > +         * Property 'hostosk' has higher priority than 'osk'
> > +         * and shadows it.
> > +         * Free user-provided 'osk' property value
> > +         */
> > +        if (s->osk) {
> > +            warn_report("isa-applesmc.osk is shadowed "
> > +                        "by isa-applesmc.hostosk");
> > +            g_free(s->osk);
> > +        }
> > +
> > +        if (!applesmc_read_host_osk(&s->osk, &err)) {
> > +            /* On host OSK retrieval error report a warning */
> > +            error_report_err(err);
> > +            s->osk =3D default_osk;
> > +        }
> > +    }
>
>
> This part is yucky. A few things:
>
> 1) QEMU in general does not fail user requested operations silently. If
> the user explicitly asked to read the host OSK and we couldn't, it must
> propagate that error.
> 2) In tandem to the above, I think the only consistent CX is to make
> both options mutually exclusive. The easiest way to achieve that IMHO
> would be to overload the "osk" property. If it is "host", then use the
> host one.

3) Should we make "osk"=3D"host" the default on macOS as well then? Of
> course, that one should *not* fail hard when it can't read the key,
> because it's an implicit request rather than an explicit one.
>

Sounds reasonable, let's use `osk=3Dhost`, drop `hostosk=3Don` and enable
this feature on Apple-macOS hosts by default.


>
Alex
>
>
> > +
> >       if (!s->osk || (strlen(s->osk) !=3D 64)) {
> >           warn_report("Using AppleSMC with invalid key");
> >           s->osk =3D default_osk;
> > @@ -344,6 +496,7 @@ static Property applesmc_isa_properties[] =3D {
> >       DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
> >                          APPLESMC_DEFAULT_IOBASE),
> >       DEFINE_PROP_STRING("osk", AppleSMCState, osk),
> > +    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk_flag, false),
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> >



--=20
Best Regards,

Vladislav Yaroshchuk

--0000000000001bc47f05cf2dfcca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">=D0=BF=D0=BD, 25 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=
=B2 13:13, Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de" target=3D"=
_blank">agraf@csgraf.de</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br>
On 22.10.21 18:14, Vladislav Yaroshchuk wrote:<br>
&gt; On Apple hosts we can read AppleSMC OSK key directly from host&#39;s<b=
r>
&gt; SMC and forward this value to QEMU Guest.<br>
&gt;<br>
&gt; Usage:<br>
&gt; `-device isa-applesmc,hostosk=3Don`<br>
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
&gt; Based on <a href=3D"https://web.archive.org/web/20200103161737/osxbook=
.com/book/bonus/chapter7/tpmdrmmyth/" rel=3D"noreferrer" target=3D"_blank">=
https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/=
tpmdrmmyth/</a><br>
&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
<br>
<br>
There was a similar proposal on the mailing list by Pedro Torres <br>
recently. Please copy everyone who contributed to that email thread in <br>
your patch submission in addition to everyone who commented on previous <br=
>
versions of your own submission.<br>
<br></blockquote><div><br></div><div>I understood that I&#39;d missed the a=
lready submitted patch by Pedro</div><div>Torres. I should have queried &#3=
9;applesmc&#39; instead of &#39;isa-applesmc&#39; to find=C2=A0</div><div>h=
is patch. I&#39;ve checked the mailing discussion and found some useful thi=
ngs=C2=A0</div><div>to fix, thank=C2=A0you.=C2=A0=C2=A0</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Also, this is definitely not &quot;trivial&quot; material. Trivial means sp=
elling <br>
or super obvious fixes. This one is an actual feature :). I&#39;ve removed =
<br>
qemu-trivial@ from the copy list.<br>
<br></blockquote><div>My mistake,=C2=A0won&#39;t make=C2=A0the=C2=A0same ne=
xt time :)=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/misc/applesmc.c | 155 +++++++++++++++++++++++++++++++++=
+++++++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 154 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c<br>
&gt; index 1b9acaf1d3..6bdec0063b 100644<br>
&gt; --- a/hw/misc/applesmc.c<br>
&gt; +++ b/hw/misc/applesmc.c<br>
&gt; @@ -37,6 +37,11 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/module.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/timer.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qom/object.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +<br>
&gt; +#if defined(__APPLE__)<br>
&gt; +#include &lt;IOKit/IOKitLib.h&gt;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* #define DEBUG_SMC */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -108,6 +113,7 @@ struct AppleSMCState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t data_len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t data_pos;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t data[255];<br>
&gt; +=C2=A0 =C2=A0 bool hostosk_flag;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *osk;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QLIST_HEAD(, AppleSMCData) data_def;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt; @@ -312,9 +318,136 @@ static const MemoryRegionOps applesmc_err_io_ops=
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
&gt; +static bool applesmc_read_host_osk(char **host_osk, Error **errp)<br>
<br>
<br>
Please just provide a buffer to write the OSK into (char *host_osk) to <br>
the function.<br>
<br></blockquote><div><br></div><div>Thank you, I will fix this.=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
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
<br>
<br>
Can in and out be the same variable?<br>
<br></blockquote><div><br></div><div>Checked, we can use one variable for i=
n and out.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to get host=
-AppleSMC service&quot;);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to open hos=
t-AppleSMC service&quot;);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to connect =
to host-AppleSMC&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_ioservice_close;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 in.key =3D (&#39;OSK0&#39;);<br>
&gt; +=C2=A0 =C2=A0 in.data_size =3D sizeof(out.bytes);<br>
&gt; +=C2=A0 =C2=A0 in.command =3D SMC_READ_KEY;<br>
<br>
<br>
Since you know all these beforehand, can&#39;t you just create two struct <=
br>
AppleSMCParam - one for osk0 and one for osk1? Then just shoot them off <br=
>
here:<br>
<br>
struct AppleSMCParam cmd[2] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.key =3D (&#39;OSK0&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data_size =3D sizeof(cmd[0].bytes),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.command =3D SMC_READ_KEY,<br>
=C2=A0 =C2=A0 =C2=A0}, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.key =3D (&#39;OSK1&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data_size =3D sizeof(cmd[0].bytes),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.command =3D SMC_READ_KEY,<br>
=C2=A0 =C2=A0 =C2=A0},<br>
};<br>
<br>
<br>
for (i =3D 0; i &lt; ARRAY_SIZE(in); i++) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0 IOConnectCallStructMethod(hostsmc_connect, SMC_HAN=
DLE_EVENT, <br>
cmd[i], sizeof(cmd[i]), cmd[i], &amp;out_size);<br>
=C2=A0=C2=A0=C2=A0=C2=A0 if (out_size !=3D sizeof(cmd[i])) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
}<br>
<br></blockquote><div>=C2=A0</div><div>A good idea, I&#39;ll rewrite the co=
de using this approach, thank you!</div><div>=C2=A0=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to read OSK=
0 from host-AppleSMC&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_ioconnect_close;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 strncpy(*host_osk, (const char *) out.bytes, 32);<br>
<br>
<br>
The OSK is not a string (well, it is, but technically it isn&#39;t). Just <=
br>
treat it as opaque 32 bytes of memory. Memcpy is what you want here.<br>
<br></blockquote><div>=C2=A0</div><div>Yes, agree=C2=A0with you, fixing it =
now.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to read OSK=
1 from host-AppleSMC&quot;);<br>
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
&gt; +=C2=A0 =C2=A0 return true;<br>
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
&gt; +=C2=A0 =C2=A0 return false;<br>
&gt; +}<br>
&gt; +#else<br>
&gt; +static bool applesmc_read_host_osk(char **output_key, Error **errp)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 error_setg(errp, &quot;isa-applesmc.hostosk ignored: &q=
uot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;unsupported on non-Apple hosts&quot;);<br>
&gt; +=C2=A0 =C2=A0 return false;<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void applesmc_isa_realize(DeviceState *dev, Error *=
*errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 AppleSMCState *s =3D APPLE_SMC(dev);<br>
&gt; +=C2=A0 =C2=A0 AppleSMCState=C2=A0 =C2=A0*s =3D APPLE_SMC(dev);<br>
<br>
Why the whitespace change here?<br>
<br></blockquote><div>=C2=A0</div><div>It was used to align `*s` and `*err`=
.=C2=A0 Seems disaccorded with QEMU</div><div>code style, I&#39;ll remove t=
he space in the next patch.</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*err =3D =
NULL;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;io_data, OB=
JECT(s), &amp;applesmc_data_io_ops, s,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;applesmc-data&quot;, 1);<br>
&gt; @@ -331,6 +464,25 @@ static void applesmc_isa_realize(DeviceState *dev=
, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0isa_register_ioport(&amp;s-&gt;parent_obj, &=
amp;s-&gt;io_err,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;iobase + APPLESMC_ERR_PORT);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;hostosk_flag) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Property &#39;hostosk&#39; has hi=
gher priority than &#39;osk&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and shadows it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Free user-provided &#39;osk&#39; =
property value<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;osk) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;isa-apple=
smc.osk is shadowed &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;by isa-applesmc.hostosk&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;osk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!applesmc_read_host_osk(&amp;s-&gt;os=
k, &amp;err)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* On host OSK retrieval er=
ror report a warning */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;osk =3D default_osk;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
<br>
This part is yucky. A few things:<br>
<br>
1) QEMU in general does not fail user requested operations silently. If <br=
>
the user explicitly asked to read the host OSK and we couldn&#39;t, it must=
 <br>
propagate that error.<br>
2) In tandem to the above, I think the only consistent CX is to make <br>
both options mutually exclusive. The easiest way to achieve that IMHO <br>
would be to overload the &quot;osk&quot; property. If it is &quot;host&quot=
;, then use the <br>
host one.</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
3) Should we make &quot;osk&quot;=3D&quot;host&quot; the default on macOS a=
s well then? Of <br>
course, that one should *not* fail hard when it can&#39;t read the key, <br=
>
because it&#39;s an implicit request rather than an explicit one.<br></bloc=
kquote><div><br></div><div>Sounds reasonable, let&#39;s use=C2=A0`osk=3Dhos=
t`, drop=C2=A0`hostosk=3Don` and enable=C2=A0</div><div>this feature on App=
le-macOS hosts by default.</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Alex<br>
<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;osk || (strlen(s-&gt;osk) !=3D 64=
)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warn_report(&quot;Using AppleS=
MC with invalid key&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;osk =3D default_osk;<br>
&gt; @@ -344,6 +496,7 @@ static Property applesmc_isa_properties[] =3D {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, Ap=
pleSMCState, iobase,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 APPLESMC_DEFAULT_IOBASE),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;osk&quot;, AppleSMC=
State, osk),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;hostosk&quot;, AppleSMCState, ho=
stosk_flag, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0=C2=A0</blockquote><div>=C2=A0</div></div><div><br></div>-=
- <br><div dir=3D"ltr" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=
Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div></di=
v>

--0000000000001bc47f05cf2dfcca--

