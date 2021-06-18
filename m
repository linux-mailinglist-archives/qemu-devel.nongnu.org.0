Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2483A3AC911
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:43:38 +0200 (CEST)
Received: from localhost ([::1]:51164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luByL-0007Lw-7V
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1luBne-0007UE-61
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:32:34 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1luBnb-0004cA-SS
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:32:33 -0400
Received: by mail-ej1-x633.google.com with SMTP id dm5so2726806ejc.9
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ux7gfJNXwlHBtJiaDcxWZ6OBC3qP9gp5ZKVgpW3Gd8U=;
 b=s1hFnaTYHD6QlXQBEcnZRjGG2AZJdRXYFMtuEtMWhiXKj9AGTMCIH0JWD9wzmUrYx3
 1ZGe3Cb2kKIqpOHPhE3YWJjOW0+A2783CY7ytkDt0XKZpWa7DI3x9J1RaIBd3y5ks4RW
 cvtsatPVIaCHakloSUhKpeQgmBZXdqnLaRaFwdVJ7m1NwQ1BYdEyKM38AliCzF9FAMO4
 6MeqKiwy4bm2cGZE/KXWjoljK3XkmZPQgCiaXJf1tLIk4KRq7+etZ5UaAYYjFnNAFaLR
 oXxe686I17FXNF8aXZQ2ZbVtZpyAzqSGASLqRNj1aSnURfRP5ZrLf40da3MESwNCWlkQ
 8kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ux7gfJNXwlHBtJiaDcxWZ6OBC3qP9gp5ZKVgpW3Gd8U=;
 b=I87dHY95e6LYE7A6KxA3wktvIhB9BpfEIAr6+S//iscNbOpGYbnFXl2YHUqMJ8U8NF
 4vb3kzFDwKgUWXc/d6A84LpPNdPzoVDhNUGLdk3h5JwAcKu5zSGJtvdnHfZGxVA4q6zg
 wv2tWs6MNelxVAYxdQQEySIgGFuUrmCcIWx74GzwPB8nT4OkIuQ3JNyeY7MYY0zGzrSu
 IcgmiMDbqAt+do+2sMoGheU9Y8kJUSvS6fc34W/ie8dpztZsx34ifpDlyixnIwDkvw7l
 edZBmH0htP2QZiz33AzPZnyXAr8xICuUDk5SGrxk+kLLEVsgG+PlxFdMwLoTJ+ttbFkM
 Xh+Q==
X-Gm-Message-State: AOAM530kw3zUGCZBF1eUH+CXIwwP9Om9xR4w4ubtS8V3tmRJWJksOrIP
 izH56sYvRcH5eu3du072KsYX+WSU9Y2i4bUIC3E=
X-Google-Smtp-Source: ABdhPJw9ytu5Z4nQKKeoqVUv015+KpCs+LTPhvML9WNXgljdCWH8/dE1sejpWdt7/mbTp+Fc0JfFHdN2eeJCrKC7UBY=
X-Received: by 2002:a17:906:509:: with SMTP id
 j9mr2646336eja.109.1624012350265; 
 Fri, 18 Jun 2021 03:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-2-marcandre.lureau@redhat.com>
 <874kdzqrf8.fsf@dusky.pond.sub.org>
In-Reply-To: <874kdzqrf8.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 18 Jun 2021 14:32:18 +0400
Message-ID: <CAJ+F1CJpb9MayWeKVArmMZ4+RPgwB8jKvgZBNRUJqNfmTq-aow@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] docs: update the documentation about schema
 configuration
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003f9f3b05c507d7bf"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003f9f3b05c507d7bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jun 15, 2021 at 3:53 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Update the documentation describing the changes in this series.
>
> Suggest to add "upfront" for clarity.
>

done


> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/devel/qapi-code-gen.txt | 30 ++++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> >
> > diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.tx=
t
> > index c1cb6f987d..0162b73119 100644
> > --- a/docs/devel/qapi-code-gen.txt
> > +++ b/docs/devel/qapi-code-gen.txt
> > @@ -781,25 +781,31 @@ downstream command __com.redhat_drive-mirror.
> >
> >  Syntax:
> >      COND =3D STRING
> > -         | [ STRING, ... ]
> > +         | { 'all: [ COND, ... ] }
> > +         | { 'any: [ COND, ... ] }
> > +         | { 'not': COND }
> >
> >  All definitions take an optional 'if' member.  Its value must be a
> > -string or a list of strings.  A string is shorthand for a list
> > -containing just that string.  The code generated for the definition
> > -will then be guarded by #if STRING for each STRING in the COND list.
> > +string, or an object with a single member 'all', 'any' or 'not'.
> > +
> > +The C code generated for the definition will then be guarded by an #if
> > +preprocessing directive generated from that condition:
> > +
> > +   * STRING will generate #if defined(STRING)
> > +   * { 'all': [COND, ...] } will generate #if (COND && ...)
> > +   * { 'any': [COND, ...] } will generate #if (COND || ...)
> > +   * { 'not': COND } will generate #if !COND
>
> I know this is exactly what I suggested.  It gets the point across, but
> it's not quite accurate: the #if of course only at the root of the tree,
> not at every level.  Better, I think:
>
>    The C code generated for the definition will then be guarded by an #if
>    preprocessing directive with an operand generated from that condition:
>
>       * STRING will generate defined(STRING)
>       * { 'all': [COND, ...] } will generate (COND && ...)
>       * { 'any': [COND, ...] } will generate (COND || ...)
>       * { 'not': COND } will generate !COND
>
>
ok


> >
> >  Example: a conditional struct
> >
> >   { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
> > -   'if': ['defined(CONFIG_FOO)', 'defined(HAVE_BAR)'] }
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
> > @@ -810,7 +816,7 @@ member 'bar'
> >
> >  { 'struct': 'IfStruct', 'data':
> >    { 'foo': 'int',
> > -    'bar': { 'type': 'int', 'if': 'defined(IFCOND)'} } }
> > +    'bar': { 'type': 'int', 'if': 'IFCOND'} } }
> >
> >  A union's discriminator may not be conditional.
> >
> > @@ -822,7 +828,7 @@ value 'bar'
> >
> >  { 'enum': 'IfEnum', 'data':
> >    [ 'foo',
> > -    { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
> > +    { 'name' : 'bar', 'if': 'IFCOND' } ] }
> >
> >  Likewise, features can be conditional.  This requires the longhand
> >  form of FEATURE.
> > @@ -832,7 +838,7 @@ Example: a struct with conditional feature
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
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003f9f3b05c507d7bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 15, 2021 at 3:53 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">a=
rmbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Update the documentation describing the changes in this series.<br>
<br>
Suggest to add &quot;upfront&quot; for clarity.<br></blockquote><div><br></=
div><div>done</div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/devel/qapi-code-gen.txt | 30 ++++++++++++++++++------------=
<br>
&gt;=C2=A0 1 file changed, 18 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.t=
xt<br>
&gt; index c1cb6f987d..0162b73119 100644<br>
&gt; --- a/docs/devel/qapi-code-gen.txt<br>
&gt; +++ b/docs/devel/qapi-code-gen.txt<br>
&gt; @@ -781,25 +781,31 @@ downstream command __com.redhat_drive-mirror.<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 Syntax:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 COND =3D STRING<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| [ STRING, ... ]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| { &#39;all: [ COND, ... ] }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| { &#39;any: [ COND, ... ] }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| { &#39;not&#39;: COND }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 All definitions take an optional &#39;if&#39; member.=C2=A0 Its =
value must be a<br>
&gt; -string or a list of strings.=C2=A0 A string is shorthand for a list<b=
r>
&gt; -containing just that string.=C2=A0 The code generated for the definit=
ion<br>
&gt; -will then be guarded by #if STRING for each STRING in the COND list.<=
br>
&gt; +string, or an object with a single member &#39;all&#39;, &#39;any&#39=
; or &#39;not&#39;.<br>
&gt; +<br>
&gt; +The C code generated for the definition will then be guarded by an #i=
f<br>
&gt; +preprocessing directive generated from that condition:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0* STRING will generate #if defined(STRING)<br>
&gt; +=C2=A0 =C2=A0* { &#39;all&#39;: [COND, ...] } will generate #if (COND=
 &amp;&amp; ...)<br>
&gt; +=C2=A0 =C2=A0* { &#39;any&#39;: [COND, ...] } will generate #if (COND=
 || ...)<br>
&gt; +=C2=A0 =C2=A0* { &#39;not&#39;: COND } will generate #if !COND<br>
<br>
I know this is exactly what I suggested.=C2=A0 It gets the point across, bu=
t<br>
it&#39;s not quite accurate: the #if of course only at the root of the tree=
,<br>
not at every level.=C2=A0 Better, I think:<br>
<br>
=C2=A0 =C2=A0The C code generated for the definition will then be guarded b=
y an #if<br>
=C2=A0 =C2=A0preprocessing directive with an operand generated from that co=
ndition:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 * STRING will generate defined(STRING)<br>
=C2=A0 =C2=A0 =C2=A0 * { &#39;all&#39;: [COND, ...] } will generate (COND &=
amp;&amp; ...)<br>
=C2=A0 =C2=A0 =C2=A0 * { &#39;any&#39;: [COND, ...] } will generate (COND |=
| ...)<br>
=C2=A0 =C2=A0 =C2=A0 * { &#39;not&#39;: COND } will generate !COND<br>
<br></blockquote><div><br></div><div>ok<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 <br>
&gt;=C2=A0 Example: a conditional struct<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0{ &#39;struct&#39;: &#39;IfStruct&#39;, &#39;data&#39;: { =
&#39;foo&#39;: &#39;int&#39; },<br>
&gt; -=C2=A0 =C2=A0&#39;if&#39;: [&#39;defined(CONFIG_FOO)&#39;, &#39;defin=
ed(HAVE_BAR)&#39;] }<br>
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
&gt; @@ -810,7 +816,7 @@ member &#39;bar&#39;<br>
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
&gt; @@ -822,7 +828,7 @@ value &#39;bar&#39;<br>
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
&gt; @@ -832,7 +838,7 @@ Example: a struct with conditional feature &#39;al=
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
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000003f9f3b05c507d7bf--

