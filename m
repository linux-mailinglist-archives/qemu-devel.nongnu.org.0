Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC338C69A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:34:33 +0200 (CEST)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4MK-0004kh-Uy
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lk4HS-0000t6-7O
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:29:31 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lk4HO-0003xF-Fq
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:29:29 -0400
Received: by mail-ej1-x635.google.com with SMTP id lz27so30183799ejb.11
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HapzqVMRP5PWh6aTG7JXULNQ0mXnItBWh8lkLDbgo50=;
 b=r/5SnnhzwP++be5z9x7uoiD9brZLVFdiJ7XtvNfRkFMkeS5VRM/uT1xf0+/x5V0Mx8
 2S/aTJqlsGCZHCySMLGRKZFDl4fWfLUUXpyEbTIYDzZvGzrv+ZVOsRw9C7J8U16XIJM8
 9FOaCzGxl1RIVzvcdQOpAy57jwpO6T+AIM/GM1+71zC+TC4uoBKYIK7xkeIDPyVGDMNi
 Ac42Nb5MD8c0Bo21Cc2+nE06UmIBwtqz44NpFXEWOSDhGXi2vfXXbevw4NOO3DpUscKj
 Bap1WWsVFkfPw0EDUJpFGwwef78t4xk683el32WD0hCAR0LsDGnlc56wruAr4EspKwBL
 6tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HapzqVMRP5PWh6aTG7JXULNQ0mXnItBWh8lkLDbgo50=;
 b=VqdSHkfcVFSESvT7xZNB+2TXg2TIh1zIbIRrxO26ZUz5dT/loyydTAxaGkq1WYmfab
 +EvmtamKpOIO7SaZD5YDUX7hcCKMM/YIbhYhOGk0OizJEInlOEZRC0FpdjgPU+UJD/4S
 lRD5WsantAI5Ynzphd3ZjnQLikEAJegHMEEfdVr6xzNmHp137OkTKa6GmvXxb4c/y+Fa
 EqoMAEBjQEG+XFbaQ2QBesWhDp7kwFY9C2fewnZmXMmdCiiEMS2CqQKuejFoWdMQjq6P
 ayH4SAT45Hbtaem86Q8PY/UHLvHdUKeJajMMx/U+cYajGqq53VtGi8zTItAZ6ze4EstT
 q82g==
X-Gm-Message-State: AOAM533fcPqS+FmumEXt14s0UvewGODRTxcgjbtIvxxB62F1TlHu2+dw
 aMmi/QWmlJYYBM5ptJftn9SfJmlhs8Hwm/qozmUb+9/WWnc=
X-Google-Smtp-Source: ABdhPJyc7GmajYh02aqU0H95rYNTqLu6qfbfOujms5ip6cjpSh2+ORjzbyn8+BTdoZd1tacgYRFwel0ea/VHX99QnuE=
X-Received: by 2002:a17:906:2655:: with SMTP id
 i21mr10118384ejc.389.1621600164969; 
 Fri, 21 May 2021 05:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
 <20210517163040.2308926-10-marcandre.lureau@redhat.com>
 <878s485mh5.fsf@dusky.pond.sub.org>
In-Reply-To: <878s485mh5.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 21 May 2021 16:29:11 +0400
Message-ID: <CAJ+F1CJL-w5Wh4w7=15U4ypp7ZgviXkQUHHzVytDARS9qsCRFA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] docs: update the documentation about schema
 configuration
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cd015505c2d6353a"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cd015505c2d6353a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 21, 2021 at 3:58 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/devel/qapi-code-gen.txt | 27 ++++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.tx=
t
> > index edaaf7ec40..4a3fd02723 100644
> > --- a/docs/devel/qapi-code-gen.txt
> > +++ b/docs/devel/qapi-code-gen.txt
> > @@ -780,26 +780,31 @@ downstream command __com.redhat_drive-mirror.
> >  =3D=3D=3D Configuring the schema =3D=3D=3D
> >
> >  Syntax:
> > -    COND =3D STRING
> > -         | [ STRING, ... ]
> > +    COND =3D CFG-ID
> > +         | [ COND, ... ]
> > +         | { 'all: [ COND, ... ] }
> > +         | { 'any: [ COND, ... ] }
> > +         | { 'not': COND }
> >
> > -All definitions take an optional 'if' member.  Its value must be a
> > -string or a list of strings.  A string is shorthand for a list
> > -containing just that string.  The code generated for the definition
> > -will then be guarded by #if STRING for each STRING in the COND list.
> > +    CFG-ID =3D STRING
> > +
> > +All definitions take an optional 'if' member. Its value must be a
> string, a list
> > +of strings or an object with a single member 'all', 'any' or 'not'. A
> string is
> > +shorthand for a list containing just that string. A list is a shorthan=
d
> for a
> > +'all'-member object. The C code generated for the definition will then
> be guarded
>
> Please try to make your changes blend into the existing text: limit line
> length to 70 characters, and put two spaces between sentences.
>

ok


> I doubt the CFG-ID non-terminal is useful.  Elsewhere, we do without,
> e.g. ENUM-VALUE, ALTERNATIVE, FEATURE.
>
> Sure the [ COND, ... ] sugar is worth the bother?
>

Maybe not


> Perhaps
>
>        COND =3D STRING
>             | { 'all: [ COND, ... ] }
>             | { 'any: [ COND, ... ] }
>             | { 'not': COND }
>
>    All definitions take an optional 'if' member.  The form STRING is
>    shorthand for { 'any': [ STRING ] }.  The C code generated ...
>

ok


> > +by an #if precessor expression generated from that condition: 'all':
> [COND, ...]
> > +will generate '(COND && ...)', 'any': [COND, ...] '(COND || ...)',
> 'not': COND '!COND'.
>
> The technical term is "#if preprocessing directive".  Let's use it.
>

ok


> I find the last part unnecessarily hard to read.  What about:
>
>    ... generated from that condition:
>
>    * { 'all': [COND, ...] } will generate #if (COND && ...)
>    * { 'any': [COND, ...] } will generate #if (COND || ...)
>    * { 'not': COND } will generate #if !COND
>
>
Yes!

>
> >  Example: a conditional struct
> >
> >   { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
> > -   'if': ['CONFIG_FOO', 'HAVE_BAR'] }
> > +   'if': { 'all': [ 'CONFIG_FOO', 'HAVE_BAR' ] } }
> >
> >  gets its generated code guarded like this:
> >
> > - #if defined(CONFIG_FOO)
> > - #if defined(HAVE_BAR)
> > + #if defined(CONFIG_FOO) && defined(HAVE_BAR)
> >   ... generated code ...
> > - #endif /* defined(HAVE_BAR) */
> > - #endif /* defined(CONFIG_FOO) */
> > + #endif /* defined(HAVE_BAR) && defined(CONFIG_FOO) */
> >
> >  Individual members of complex types, commands arguments, and
> >  event-specific data can also be made conditional.  This requires the
>
>
>
thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cd015505c2d6353a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 21, 2021 at 3:58 P=
M Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcand=
re.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/devel/qapi-code-gen.txt | 27 ++++++++++++++++-----------<br=
>
&gt;=C2=A0 1 file changed, 16 insertions(+), 11 deletions(-)<br>
&gt;<br>
&gt; diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.t=
xt<br>
&gt; index edaaf7ec40..4a3fd02723 100644<br>
&gt; --- a/docs/devel/qapi-code-gen.txt<br>
&gt; +++ b/docs/devel/qapi-code-gen.txt<br>
&gt; @@ -780,26 +780,31 @@ downstream command __com.redhat_drive-mirror.<br=
>
&gt;=C2=A0 =3D=3D=3D Configuring the schema =3D=3D=3D<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Syntax:<br>
&gt; -=C2=A0 =C2=A0 COND =3D STRING<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| [ STRING, ... ]<br>
&gt; +=C2=A0 =C2=A0 COND =3D CFG-ID<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| [ COND, ... ]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| { &#39;all: [ COND, ... ] }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| { &#39;any: [ COND, ... ] }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| { &#39;not&#39;: COND }<br>
&gt;=C2=A0 <br>
&gt; -All definitions take an optional &#39;if&#39; member.=C2=A0 Its value=
 must be a<br>
&gt; -string or a list of strings.=C2=A0 A string is shorthand for a list<b=
r>
&gt; -containing just that string.=C2=A0 The code generated for the definit=
ion<br>
&gt; -will then be guarded by #if STRING for each STRING in the COND list.<=
br>
&gt; +=C2=A0 =C2=A0 CFG-ID =3D STRING<br>
&gt; +<br>
&gt; +All definitions take an optional &#39;if&#39; member. Its value must =
be a string, a list<br>
&gt; +of strings or an object with a single member &#39;all&#39;, &#39;any&=
#39; or &#39;not&#39;. A string is<br>
&gt; +shorthand for a list containing just that string. A list is a shortha=
nd for a<br>
&gt; +&#39;all&#39;-member object. The C code generated for the definition =
will then be guarded<br>
<br>
Please try to make your changes blend into the existing text: limit line<br=
>
length to 70 characters, and put two spaces between sentences.<br></blockqu=
ote><div><br></div><div>ok</div><div> <br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
I doubt the CFG-ID non-terminal is useful.=C2=A0 Elsewhere, we do without,<=
br>
e.g. ENUM-VALUE, ALTERNATIVE, FEATURE.<br>
<br>
Sure the [ COND, ... ] sugar is worth the bother?<br></blockquote><div><br>=
</div><div>Maybe not</div><div> <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Perhaps<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0COND =3D STRING<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | { &#39;all: [ COND, ... ] }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | { &#39;any: [ COND, ... ] }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | { &#39;not&#39;: COND }<br>
<br>
=C2=A0 =C2=A0All definitions take an optional &#39;if&#39; member.=C2=A0 Th=
e form STRING is<br>
=C2=A0 =C2=A0shorthand for { &#39;any&#39;: [ STRING ] }.=C2=A0 The C code =
generated ...<br></blockquote><div><br></div><div>ok</div><div> <br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +by an #if precessor expression generated from that condition: &#39;al=
l&#39;: [COND, ...]<br>
&gt; +will generate &#39;(COND &amp;&amp; ...)&#39;, &#39;any&#39;: [COND, =
...] &#39;(COND || ...)&#39;, &#39;not&#39;: COND &#39;!COND&#39;.<br>
<br>
The technical term is &quot;#if preprocessing directive&quot;.=C2=A0 Let&#3=
9;s use it.<br></blockquote><div><br></div><div>ok</div><div> <br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I find the last part unnecessarily hard to read.=C2=A0 What about:<br>
<br>
=C2=A0 =C2=A0... generated from that condition:<br>
<br>
=C2=A0 =C2=A0* { &#39;all&#39;: [COND, ...] } will generate #if (COND &amp;=
&amp; ...)<br>
=C2=A0 =C2=A0* { &#39;any&#39;: [COND, ...] } will generate #if (COND || ..=
.)<br>
=C2=A0 =C2=A0* { &#39;not&#39;: COND } will generate #if !COND<br>
<br></blockquote><div><br></div><div>Yes!</div><div> <br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 <br>
&gt;=C2=A0 Example: a conditional struct<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0{ &#39;struct&#39;: &#39;IfStruct&#39;, &#39;data&#39;: { =
&#39;foo&#39;: &#39;int&#39; },<br>
&gt; -=C2=A0 =C2=A0&#39;if&#39;: [&#39;CONFIG_FOO&#39;, &#39;HAVE_BAR&#39;]=
 }<br>
&gt; +=C2=A0 =C2=A0&#39;if&#39;: { &#39;all&#39;: [ &#39;CONFIG_FOO&#39;, &=
#39;HAVE_BAR&#39; ] } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 gets its generated code guarded like this:<br>
&gt;=C2=A0 <br>
&gt; - #if defined(CONFIG_FOO)<br>
&gt; - #if defined(HAVE_BAR)<br>
&gt; + #if defined(CONFIG_FOO) &amp;&amp; defined(HAVE_BAR)<br>
&gt;=C2=A0 =C2=A0... generated code ...<br>
&gt; - #endif /* defined(HAVE_BAR) */<br>
&gt; - #endif /* defined(CONFIG_FOO) */<br>
&gt; + #endif /* defined(HAVE_BAR) &amp;&amp; defined(CONFIG_FOO) */<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Individual members of complex types, commands arguments, and<br>
&gt;=C2=A0 event-specific data can also be made conditional.=C2=A0 This req=
uires the<br>
<br>
<br>
</blockquote></div><br clear=3D"all"></div><div>thanks</div><div><br></div>=
<div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lure=
au<br></div></div></div>

--000000000000cd015505c2d6353a--

