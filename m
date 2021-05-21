Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E1338C687
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:30:41 +0200 (CEST)
Received: from localhost ([::1]:49118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4Ia-0008Uf-39
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lk4EX-0006Ir-1G
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:26:29 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lk4EU-0002M0-46
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:26:28 -0400
Received: by mail-ed1-x533.google.com with SMTP id a25so23082880edr.12
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s49dOmfncrebn2im9WTHoiGZlREGiMcJCbdpwWsUM8M=;
 b=bjr0XDlSvTI1/HRhoEm3Zxq0rgOG7sbDtU4+wyq8jkkzU946JLUyaHS5qbGZeOC3dK
 V6unvaO2onMi4lCczGP49yQWiTti6Fm8THI/ox3YWoku39RQd/GZ4r4cNSwAAV8Aodi4
 L0yK8F9JjHnmc5PlO1vJbRF2OmrVF6crscD1yJ8zvpzbczeZb3RjTRZ4oiyPwLV6rwpr
 tGxUreDYnHtVcyiW4+WUR2QilWyp36+31AMEzrdNfeRRWYvSp1m200fu1oAKH240PyNO
 Qntmr/xnC7GdYIkEJRp6c2RlXXkYSKHkXH8Y1zamtgselBKX8a9ssg9j4Pg4JwPWFbXh
 XzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s49dOmfncrebn2im9WTHoiGZlREGiMcJCbdpwWsUM8M=;
 b=nyWTOFUEfiNVczW3MPiINhc4AImpwwZApyK267uKmE6aY/MtMSdJE+iFpJQpjw1gI1
 +tbSl6OR9ZbaFm30ZzZByJa4MU5dqPCgG2KTp4oQRWtZLrilw5lATyQIm5VmPgS+z7GO
 KrJIvHbtBRVku2HZHhh4IaidTFQXxhLTA9S0gFD0zTZs8RUOJd5nRbD14sk52ocGDhpT
 OuTrT1OhjmyKppyRofCuNrfXp08fFrVenqDw7SCs3Zv9mOqahdk5wxkBkC8bSPz9M/Fc
 t3sYmetEJv9phy3J4bZYHWw9Kz2Rho1+j+NSY+CNtl55lpTkjjnIIq98SvgxUjbcjNip
 0F4g==
X-Gm-Message-State: AOAM532ASyGS9fUzyiYChhCZcIOCw/uE3v8Ufj7IV0rFdP3a4mXgmT39
 Yatm8qHE+adm40uaXgerFbYb6busEmKjlyEFy30=
X-Google-Smtp-Source: ABdhPJzwVS9ekb6YbDo0gS52JR7BTa5aoTdyAfxBJoTw9C4Yri87az+135xc/PEi2c2RF7Ze0+xozFmAU+5vCu2jP9s=
X-Received: by 2002:aa7:cf03:: with SMTP id a3mr10800831edy.314.1621599984356; 
 Fri, 21 May 2021 05:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
 <20210517163040.2308926-9-marcandre.lureau@redhat.com>
 <871ra05m6r.fsf@dusky.pond.sub.org>
In-Reply-To: <871ra05m6r.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 21 May 2021 16:26:12 +0400
Message-ID: <CAJ+F1C+st7399x7RYfW38DjQKWMFWhXq+C+x0QGkZnD23mDofw@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] qapi: make 'if' condition strings simple
 identifiers
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000009127a05c2d62b08"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x533.google.com
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

--00000000000009127a05c2d62b08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 4:03 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Change the 'if' condition strings to be C-agnostic and be simple
> > identifiers.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > ---
>
> [...]
>
> > diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.tx=
t
> > index c1cb6f987d..edaaf7ec40 100644
> > --- a/docs/devel/qapi-code-gen.txt
> > +++ b/docs/devel/qapi-code-gen.txt
> > @@ -791,7 +791,7 @@ will then be guarded by #if STRING for each STRING
> in the COND list.
> >  Example: a conditional struct
> >
> >   { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
> > -   'if': ['defined(CONFIG_FOO)', 'defined(HAVE_BAR)'] }
> > +   'if': ['CONFIG_FOO', 'HAVE_BAR'] }
> >
> >  gets its generated code guarded like this:
> >
> > @@ -810,7 +810,7 @@ member 'bar'
> >
> >  { 'struct': 'IfStruct', 'data':
> >    { 'foo': 'int',
> > -    'bar': { 'type': 'int', 'if': 'defined(IFCOND)'} } }
> > +    'bar': { 'type': 'int', 'if': 'IFCOND'} } }
> >
> >  A union's discriminator may not be conditional.
> >
> > @@ -822,7 +822,7 @@ value 'bar'
> >
> >  { 'enum': 'IfEnum', 'data':
> >    [ 'foo',
> > -    { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
> > +    { 'name' : 'bar', 'if': 'IFCOND' } ] }
> >
> >  Likewise, features can be conditional.  This requires the longhand
> >  form of FEATURE.
> > @@ -832,7 +832,7 @@ Example: a struct with conditional feature
> 'allow-negative-numbers'
> >  { 'struct': 'TestType',
> >    'data': { 'number': 'int' },
> >    'features': [ { 'name': 'allow-negative-numbers',
> > -                  'if': 'defined(IFCOND)' } ] }
> > +                  'if': 'IFCOND' } ] }
> >
> >  Please note that you are responsible to ensure that the C code will
> >  compile with an arbitrary combination of conditions, since the
>
> At this point in your series, the documentation does not yet reflect the
> code changes you've made.  You now add another change together with a
> doc update.  Now the docs match *no* version of the code, past, present,
> or future.  I find this confusing.  Swap the last two patches?
>
> How do you feel about updating documentation before the code?
>

I thought it would be simpler to update the doc in one go as the last patch
of this series. But if you prefer intermediary doc update, I can do that.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000009127a05c2d62b08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 21, 2021 at 4:03 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a h=
ref=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lure=
au@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Change the &#39;if&#39; condition strings to be C-agnostic and be simp=
le<br>
&gt; identifiers.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
<br>
[...]<br>
<br>
&gt; diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.t=
xt<br>
&gt; index c1cb6f987d..edaaf7ec40 100644<br>
&gt; --- a/docs/devel/qapi-code-gen.txt<br>
&gt; +++ b/docs/devel/qapi-code-gen.txt<br>
&gt; @@ -791,7 +791,7 @@ will then be guarded by #if STRING for each STRING=
 in the COND list.<br>
&gt;=C2=A0 Example: a conditional struct<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0{ &#39;struct&#39;: &#39;IfStruct&#39;, &#39;data&#39;: { =
&#39;foo&#39;: &#39;int&#39; },<br>
&gt; -=C2=A0 =C2=A0&#39;if&#39;: [&#39;defined(CONFIG_FOO)&#39;, &#39;defin=
ed(HAVE_BAR)&#39;] }<br>
&gt; +=C2=A0 =C2=A0&#39;if&#39;: [&#39;CONFIG_FOO&#39;, &#39;HAVE_BAR&#39;]=
 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 gets its generated code guarded like this:<br>
&gt;=C2=A0 <br>
&gt; @@ -810,7 +810,7 @@ member &#39;bar&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;IfStruct&#39;, &#39;data&#39;:<br>
&gt;=C2=A0 =C2=A0 { &#39;foo&#39;: &#39;int&#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;: &#39;int&#39;, &#39;if=
&#39;: &#39;defined(IFCOND)&#39;} } }<br>
&gt; +=C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;: &#39;int&#39;, &#39;if=
&#39;: &#39;IFCOND&#39;} } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 A union&#39;s discriminator may not be conditional.<br>
&gt;=C2=A0 <br>
&gt; @@ -822,7 +822,7 @@ value &#39;bar&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 { &#39;enum&#39;: &#39;IfEnum&#39;, &#39;data&#39;:<br>
&gt;=C2=A0 =C2=A0 [ &#39;foo&#39;,<br>
&gt; -=C2=A0 =C2=A0 { &#39;name&#39; : &#39;bar&#39;, &#39;if&#39;: &#39;de=
fined(IFCOND)&#39; } ] }<br>
&gt; +=C2=A0 =C2=A0 { &#39;name&#39; : &#39;bar&#39;, &#39;if&#39;: &#39;IF=
COND&#39; } ] }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Likewise, features can be conditional.=C2=A0 This requires the l=
onghand<br>
&gt;=C2=A0 form of FEATURE.<br>
&gt; @@ -832,7 +832,7 @@ Example: a struct with conditional feature &#39;al=
low-negative-numbers&#39;<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;TestType&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: { &#39;number&#39;: &#39;int&#39; },<br>
&gt;=C2=A0 =C2=A0 &#39;features&#39;: [ { &#39;name&#39;: &#39;allow-negati=
ve-numbers&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;i=
f&#39;: &#39;defined(IFCOND)&#39; } ] }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;i=
f&#39;: &#39;IFCOND&#39; } ] }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Please note that you are responsible to ensure that the C code w=
ill<br>
&gt;=C2=A0 compile with an arbitrary combination of conditions, since the<b=
r>
<br>
At this point in your series, the documentation does not yet reflect the<br=
>
code changes you&#39;ve made.=C2=A0 You now add another change together wit=
h a<br>
doc update.=C2=A0 Now the docs match *no* version of the code, past, presen=
t,<br>
or future.=C2=A0 I find this confusing.=C2=A0 Swap the last two patches?<br=
>
<br>
How do you feel about updating documentation before the code?<br></blockquo=
te><div><br></div><div>I thought it would be simpler to update the doc in o=
ne go as the last patch of this series. But if you prefer intermediary doc =
update, I can do that.</div></div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">-- <br></div><div dir=3D"ltr" class=3D"gmail_signatu=
re">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000009127a05c2d62b08--

