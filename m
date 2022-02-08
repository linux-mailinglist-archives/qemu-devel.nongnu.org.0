Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1644ADBE4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:03:02 +0100 (CET)
Received: from localhost ([::1]:53426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHS1E-0008NX-QU
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:03:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHQu2-00017K-1X
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:51:30 -0500
Received: from [2607:f8b0:4864:20::234] (port=46808
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHQtz-0008Bq-Qf
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:51:29 -0500
Received: by mail-oi1-x234.google.com with SMTP id y23so20513595oia.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3fbvxPiHjUvx56fkH5SKeavOg+C4edeD0jK5RMs64sE=;
 b=lYiayqYhIsw5yTGpO0N3dAjhMbPszM70dXZZxG5VTjwBoY1Mxf5A7BV0hLqRB675Od
 7RTH8Xbp6gep28KcymGa6VdLPztGxGEWLo4j5p9Q4mkpadpuMJtHyEKrAa21E6ItMgv7
 27yGeWedCVUX5JT/uyZtxUtD3BIh9U1XrWyn+16RJNCAchKmiOhBBAHMaZjc0RhwD0ez
 ABsPUrt5xXNHBBgAp78WK6Z8p9Z3YK8OyPaBkSEkZUp8hUGQD4aFrWXPe9bMZFUdR39M
 rV8vcCCQ3KdwgHvBV16a9B5B30r8ipYCQmOYah6XnrpLUDZPSMSmlYDjC7a4H4Z17gyd
 DOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3fbvxPiHjUvx56fkH5SKeavOg+C4edeD0jK5RMs64sE=;
 b=4t3+rDnjbjW3B2jUx2fLGwhfrerwibKmtywqTDWjfi20Lpnxw09VvPd930FEmavhFR
 14ZnCAdjWdu2dPIlsx4J5tAmuizu3WJ1Q0YbLhmUiEe0FA5fWkLyJdgr9Gl58Wu5MoRX
 mh9RTWHk0CLB53RXGTJxeUDljEWUFC2y+R9724s961kc/qXhO7LanoeqDe0P6DCAbN7Z
 axFVgwXgVa8pGQXxkqIdz5dvDyCuM+nzX3icajFypVG+BlySnFjorEyFJOOoCZaPnh3l
 y9X+iuLQ1LL1SICyZTrMaad0n5eVT4vAcNK3VchIbi2BkTghaxblLuua09mkBBCjO9G+
 n5/A==
X-Gm-Message-State: AOAM532i6o5rljHkvosN/38mdtHT4olCBrLoQhnD8KSKrZuq41kkCGJc
 FtUXi4paAl4dTdMJnqNfnOwN46mSIbcVSZbw0lU7uFqacik=
X-Google-Smtp-Source: ABdhPJxQhilvKr/y1mnK2VZZiicdt7bGx45Tubp6TR89qIryHKTlyKSV4KndoGjkz6Ye89tzj2SOj5oDCCPaTEjD5hI=
X-Received: by 2002:a05:6870:3654:: with SMTP id
 v20mr364103oak.330.1644327968680; 
 Tue, 08 Feb 2022 05:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <20220207224024.87745-7-wwcohen@gmail.com>
 <2797799.bNjLCV8H8p@silver>
In-Reply-To: <2797799.bNjLCV8H8p@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 8 Feb 2022 08:45:57 -0500
Message-ID: <CAB26zV0ie0J3FawXxd4zkushE1hWQY7EvA_7bak_a2fMz=JsbA@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] 9p: darwin: Move
 XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000077ae1c05d781f01b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=wwcohen@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000077ae1c05d781f01b
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 7:20 AM Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> On Montag, 7. Februar 2022 23:40:19 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> >
> > Because XATTR_SIZE_MAX is not defined on Darwin,
> > create a cross-platform P9_XATTR_SIZE_MAX instead.
> >
> > [Will Cohen: - Adjust coding style
> >              - Lower XATTR_SIZE_MAX to 64k
> >              - Add explanatory context related to XATTR_SIZE_MAX]
> > [Fabian Franz: - Move XATTR_SIZE_MAX reference from 9p.c to
> >                  P9_XATTR_SIZE_MAX in 9p.h]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
> > ---
> >  hw/9pfs/9p.c |  2 +-
> >  hw/9pfs/9p.h | 11 +++++++++++
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 14e84c3bcf..7405352c37 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -3949,7 +3949,7 @@ static void coroutine_fn v9fs_xattrcreate(void
> > *opaque) rflags |= XATTR_REPLACE;
> >      }
> >
> > -    if (size > XATTR_SIZE_MAX) {
> > +    if (size > P9_XATTR_SIZE_MAX) {
> >          err = -E2BIG;
> >          goto out_nofid;
> >      }
> > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > index 1567b67841..6a1856b4dc 100644
> > --- a/hw/9pfs/9p.h
> > +++ b/hw/9pfs/9p.h
> > @@ -479,4 +479,15 @@ struct V9fsTransport {
> >      void        (*push_and_notify)(V9fsPDU *pdu);
> >  };
> >
> > +/*
> > + * Darwin doesn't seem to define a maximum xattr size in its user
> > + * space header, so manually configure it across platforms as 64k.
> > + *
> > + * Having no limit at all can lead to QEMU crashing during large
> g_malloc()
> > + * calls. Because QEMU does not currently support macOS guests, the
> below
> > + * preliminary solution only works due to its being a reflection of the
> limit of
> > + * Linux guests.
> > + */
> > +#define P9_XATTR_SIZE_MAX 65536
>
> It would be cleaner in a way like this:
>
> #if defined(XATTR_SIZE_MAX)
> /* Linux */
> #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
> #elif defined(CONFIG_DARWIN)
> /* darwin comment goes here */
> #define P9_XATTR_SIZE_MAX 65536
> #else
> #error Missing definition for P9_XATTR_SIZE_MAX for this host system
> #endif
>
> Sorry, I haven't noticed that before. You actually had that wrapped into
> some
> ifdefs in v2 before:
>
> #if defined(CONFIG_DARWIN) && !defined(XATTR_SIZE_MAX)
> ...
> #endif
>
> > +
> >  #endif
>
> Agreed, that is cleaner. Adjusting for the next round.

--00000000000077ae1c05d781f01b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 8, 2022 at 7:20 AM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Montag, 7. Februar 2022 23:40:19 CET Wi=
ll Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; <br>
&gt; Because XATTR_SIZE_MAX is not defined on Darwin,<br>
&gt; create a cross-platform P9_XATTR_SIZE_MAX instead.<br>
&gt; <br>
&gt; [Will Cohen: - Adjust coding style<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Lower XATTR_SIZE_MAX=
 to 64k<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Add explanatory cont=
ext related to XATTR_SIZE_MAX]<br>
&gt; [Fabian Franz: - Move XATTR_SIZE_MAX reference from 9p.c to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 P9_XATTR=
_SIZE_MAX in 9p.h]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Fabian Franz &lt;<a href=3D"mailto:fabianfranz.oss@gmai=
l.com" target=3D"_blank">fabianfranz.oss@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p.c |=C2=A0 2 +-<br>
&gt;=C2=A0 hw/9pfs/9p.h | 11 +++++++++++<br>
&gt;=C2=A0 2 files changed, 12 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
&gt; index 14e84c3bcf..7405352c37 100644<br>
&gt; --- a/hw/9pfs/9p.c<br>
&gt; +++ b/hw/9pfs/9p.c<br>
&gt; @@ -3949,7 +3949,7 @@ static void coroutine_fn v9fs_xattrcreate(void<b=
r>
&gt; *opaque) rflags |=3D XATTR_REPLACE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 if (size &gt; XATTR_SIZE_MAX) {<br>
&gt; +=C2=A0 =C2=A0 if (size &gt; P9_XATTR_SIZE_MAX) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D -E2BIG;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_nofid;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h<br>
&gt; index 1567b67841..6a1856b4dc 100644<br>
&gt; --- a/hw/9pfs/9p.h<br>
&gt; +++ b/hw/9pfs/9p.h<br>
&gt; @@ -479,4 +479,15 @@ struct V9fsTransport {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 void=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*push_and_notify)=
(V9fsPDU *pdu);<br>
&gt;=C2=A0 };<br>
&gt; <br>
&gt; +/*<br>
&gt; + * Darwin doesn&#39;t seem to define a maximum xattr size in its user=
<br>
&gt; + * space header, so manually configure it across platforms as 64k.<br=
>
&gt; + *<br>
&gt; + * Having no limit at all can lead to QEMU crashing during large g_ma=
lloc()<br>
&gt; + * calls. Because QEMU does not currently support macOS guests, the b=
elow<br>
&gt; + * preliminary solution only works due to its being a reflection of t=
he limit of<br>
&gt; + * Linux guests.<br>
&gt; + */<br>
&gt; +#define P9_XATTR_SIZE_MAX 65536<br>
<br>
It would be cleaner in a way like this:<br>
<br>
#if defined(XATTR_SIZE_MAX)<br>
/* Linux */<br>
#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX<br>
#elif defined(CONFIG_DARWIN)<br>
/* darwin comment goes here */<br>
#define P9_XATTR_SIZE_MAX 65536<br>
#else<br>
#error Missing definition for P9_XATTR_SIZE_MAX for this host system<br>
#endif<br>
<br>
Sorry, I haven&#39;t noticed that before. You actually had that wrapped int=
o some<br>
ifdefs in v2 before:<br>
<br>
#if defined(CONFIG_DARWIN) &amp;&amp; !defined(XATTR_SIZE_MAX)<br>
...<br>
#endif<br>
<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
<br></blockquote><div>Agreed, that is cleaner. Adjusting for the next round=
. <br></div></div></div>

--00000000000077ae1c05d781f01b--

