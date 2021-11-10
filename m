Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699244CD9C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 00:04:19 +0100 (CET)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkwdb-0007Mj-RP
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 18:04:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkwce-0006hU-Qu
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 18:03:16 -0500
Received: from [2607:f8b0:4864:20::930] (port=34389
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkwcS-0007Y8-VZ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 18:03:16 -0500
Received: by mail-ua1-x930.google.com with SMTP id b3so8244870uam.1
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 15:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cYUlk+XDR+GMjBup9CaQrxP6tddn1nepnC8VPunkny8=;
 b=7Q0OnGAfcam0dynmqcBS1fj/M5vmJeZ1pCiT2Pf/yWhGIJHZiwDgx9WAEOFqQ1eWlk
 tITbmMcZqzsfwulcdLlem1eqdRYbrN0nRG08wuMY/tt4a8EO+tKgIi7xRbuM7Em3BJtT
 w7uCY0XheNB6EjsU3KvJ4eSQ76liPkwqw8qiE0/MPts/FbqNSaFp7mAjGQatHBAES0Si
 Q2wvWTI5btLoaWVxOSJJuxrge+2lne3dflbk5BxP3KWkUqED1+IKcki5p5tuFLFlgDI2
 795ymTmhY2kfOlwgqD3969yFeQTth+9gbApNK5Gxur2Cv9kmvnTGkr5MWBEmZm/3SfG6
 w/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYUlk+XDR+GMjBup9CaQrxP6tddn1nepnC8VPunkny8=;
 b=a3VT+3riAmUSqmmvRirbdoETau1+OFSXOet0OhDIEtdkDYJRiWsY/LLt9JdeBNeyPg
 Y6G33ZXS1cXCt1twgYRRpGDnDwMMaEqht1rHKNceUa+x2yry/iMV3rchEVw/vJpa/QtN
 tVAJxVKD4gcS2qwHaq6KNTGKGSjfIWLEjoRo/mCP7CL4o8MfLyj5v4pXao2k7cJCCVfS
 LQbu0xW/pFJSu+bCa65ZHDogIl6rEP65F5zlt+w3RKqcTJMSqEEx3/mUtF5O5yXYYK2y
 cpngpa+ebfe5vQYrYZK0ILn53FIhmV82I/rbaImi85CIbCeSh6c8qJGvYI7Z0ej5BFXA
 DDQg==
X-Gm-Message-State: AOAM530xr5jZqllx+98WasM0zVPeLcHo+Z0kntZ7HZbtQzIkSKgmCgC1
 s/KZrtNgFts7SZeR1QsZKTXLIyR/ZMEj8lLULmPBxA==
X-Google-Smtp-Source: ABdhPJzzBKIfHw3mLbK80lE//mEE/QAr7/+fwFMteagA312dbKuLHd+4cDeEJSzttgAzQqzev60JF3+PgIebjWLpzoY=
X-Received: by 2002:ab0:3d07:: with SMTP id f7mr4015339uax.11.1636585383655;
 Wed, 10 Nov 2021 15:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-7-imp@bsdimp.com>
 <b0c5d701-5187-58ab-7b34-aead73ebae68@linaro.org>
In-Reply-To: <b0c5d701-5187-58ab-7b34-aead73ebae68@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 10 Nov 2021 16:02:52 -0700
Message-ID: <CANCZdfp1pPtz3zSOdoXPLewEum9g6WJNnABpEqMtwd_531ROmw@mail.gmail.com>
Subject: Re: [RFC v2 6/6] *-user: move safe-syscall.* to common-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000700e4205d0773a50"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000700e4205d0773a50
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 10:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/10/21 5:31 PM, Warner Losh wrote:
> > Move linux-user/safe-syscall.S to common-user/common-safe-syscall.S and
> > replace it with a #include "common-safe-syscall.S" so that bsd-user can
> > also use it. Also move safe-syscall.h so that it can define a few more
> > externs.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   common-user/common-safe-syscall.S          | 30 +++++++++++++++++++++
> >   {linux-user => common-user}/safe-syscall.h |  0
> >   linux-user/safe-syscall.S                  | 31 +---------------------
> >   linux-user/signal.c                        |  1 +
> >   meson.build                                |  1 +
> >   5 files changed, 33 insertions(+), 30 deletions(-)
> >   create mode 100644 common-user/common-safe-syscall.S
> >   rename {linux-user => common-user}/safe-syscall.h (100%)
> >
> > diff --git a/common-user/common-safe-syscall.S
> b/common-user/common-safe-syscall.S
> > new file mode 100644
> > index 0000000000..42ea7c40ba
> > --- /dev/null
> > +++ b/common-user/common-safe-syscall.S
> > @@ -0,0 +1,30 @@
> > +/*
> > + * safe-syscall.S : include the host-specific assembly fragment
> > + * to handle signals occurring at the same time as system calls.
> > + *
> > + * Written by Peter Maydell <peter.maydell@linaro.org>
> > + *
> > + * Copyright (C) 2016 Linaro Limited
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "hostdep.h"
> > +#include "target_errno_defs.h"
> > +
> > +/* We have the correct host directory on our include path
> > + * so that this will pull in the right fragment for the architecture.
> > + */
> > +#ifdef HAVE_SAFE_SYSCALL
> > +#include "safe-syscall.inc.S"
> > +#endif
> > +
> > +/* We must specifically say that we're happy for the stack to not be
> > + * executable, otherwise the toolchain will default to assuming our
> > + * assembly needs an executable stack and the whole QEMU binary will
> > + * needlessly end up with one. This should be the last thing in this
> file.
> > + */
> > +#if defined(__linux__) && defined(__ELF__)
> > +.section        .note.GNU-stack, "", %progbits
> > +#endif
>
> Hmm.  If we're going to split this file into safe-syscall.S and
> common-safe-syscall.S, we
> shouldn't do the ifdef thing here.  (Why it was present at all for
> linux-user is a mystery.)
>

Yea, the #ifdef dates from the earliest days of the safe syscall stuff. I
think it can be dropped,
though I'm unsure if the the whole thing should be dropped, or just the
ifdef.


> What do you have planned for bsd-user that would be more than
>
> > +#include "common-safe-syscall.S"
>
> this?
>

Yes. I had that in mind. I wasn't sure how to do this with meson directly,
or I'd have
compiled it out of common-user tree.

Warner

--000000000000700e4205d0773a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 10, 2021 at 10:04 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 11/10/21 5:31 PM, Warner Losh wrote:<br>
&gt; Move linux-user/safe-syscall.S to common-user/common-safe-syscall.S an=
d<br>
&gt; replace it with a #include &quot;common-safe-syscall.S&quot; so that b=
sd-user can<br>
&gt; also use it. Also move safe-syscall.h so that it can define a few more=
<br>
&gt; externs.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0common-user/common-safe-syscall.S=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 30 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0{linux-user =3D&gt; common-user}/safe-syscall.h |=C2=A0 0<=
br>
&gt;=C2=A0 =C2=A0linux-user/safe-syscall.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 +---------------------<br>
&gt;=C2=A0 =C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
&gt;=C2=A0 =C2=A05 files changed, 33 insertions(+), 30 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 common-user/common-safe-syscall.S<br>
&gt;=C2=A0 =C2=A0rename {linux-user =3D&gt; common-user}/safe-syscall.h (10=
0%)<br>
&gt; <br>
&gt; diff --git a/common-user/common-safe-syscall.S b/common-user/common-sa=
fe-syscall.S<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..42ea7c40ba<br>
&gt; --- /dev/null<br>
&gt; +++ b/common-user/common-safe-syscall.S<br>
&gt; @@ -0,0 +1,30 @@<br>
&gt; +/*<br>
&gt; + * safe-syscall.S : include the host-specific assembly fragment<br>
&gt; + * to handle signals occurring at the same time as system calls.<br>
&gt; + *<br>
&gt; + * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; + *<br>
&gt; + * Copyright (C) 2016 Linaro Limited<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;hostdep.h&quot;<br>
&gt; +#include &quot;target_errno_defs.h&quot;<br>
&gt; +<br>
&gt; +/* We have the correct host directory on our include path<br>
&gt; + * so that this will pull in the right fragment for the architecture.=
<br>
&gt; + */<br>
&gt; +#ifdef HAVE_SAFE_SYSCALL<br>
&gt; +#include &quot;safe-syscall.inc.S&quot;<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +/* We must specifically say that we&#39;re happy for the stack to not=
 be<br>
&gt; + * executable, otherwise the toolchain will default to assuming our<b=
r>
&gt; + * assembly needs an executable stack and the whole QEMU binary will<=
br>
&gt; + * needlessly end up with one. This should be the last thing in this =
file.<br>
&gt; + */<br>
&gt; +#if defined(__linux__) &amp;&amp; defined(__ELF__)<br>
&gt; +.section=C2=A0 =C2=A0 =C2=A0 =C2=A0 .note.GNU-stack, &quot;&quot;, %p=
rogbits<br>
&gt; +#endif<br>
<br>
Hmm.=C2=A0 If we&#39;re going to split this file into safe-syscall.S and co=
mmon-safe-syscall.S, we <br>
shouldn&#39;t do the ifdef thing here.=C2=A0 (Why it was present at all for=
 linux-user is a mystery.)<br></blockquote><div><br></div><div>Yea, the #if=
def dates from the earliest days of the safe syscall stuff. I think it can =
be dropped,</div><div>though I&#39;m unsure if the the whole thing should b=
e dropped, or just the ifdef.</div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
What do you have planned for bsd-user that would be more than<br>
<br>
&gt; +#include &quot;common-safe-syscall.S&quot;<br>
<br>
this?<br></blockquote><div><br></div><div>Yes. I had that in mind. I wasn&#=
39;t sure how to do this with meson directly, or I&#39;d have</div><div>com=
piled it out of common-user tree.</div><div><br></div><div>Warner</div></di=
v></div>

--000000000000700e4205d0773a50--

