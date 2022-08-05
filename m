Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882658AA26
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:32:02 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvYf-0000NR-7i
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oJvPv-0008Vf-RG; Fri, 05 Aug 2022 07:22:59 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oJvPu-0002mk-2M; Fri, 05 Aug 2022 07:22:59 -0400
Received: by mail-lf1-x134.google.com with SMTP id y11so2984753lfs.6;
 Fri, 05 Aug 2022 04:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=i1POwSm/Pi6KvkfZPaQkPvKU4V/G6OBO0pP4vf1OjcA=;
 b=OT3SaZPEc7cqRLKta5LhznjDw3k/fy11AMfrQZCPTbxjWGVq3Ts9MSL0/fkxP/dXJn
 x9c3rypGES2amxjrcCiUNER+PFxCPxOAvdMOxY+QiuQ56rDYQLVMqkXbdCMCgx0zlxkI
 bcbPDKXmCQuscMC6wFCMNOH8C/uzKZHhu5lFFPGIzIgMH7KOMXAw4s0DomwKlgecQ3Ah
 Q0OroTY8+YWK8RPt/5f4+Yel7b+BQ6WtNWWUy55xMRJiSNX4s5oNtjesUZG6hUtkarBy
 0f54UhWOV0U7GXZZ5EqNFBFniObfRTt1lagYUkUzMX4rKO1grD2TAbmbWc3S+jbnMqel
 eRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=i1POwSm/Pi6KvkfZPaQkPvKU4V/G6OBO0pP4vf1OjcA=;
 b=iTA/70MCCGebtE5+atVkhjgW/VbVNgR6BerPUwV3hY2+3XjPCix66NlYqLVhPPc2sO
 DF4tnCl4jvpO7LrZ9zJlWRbZQzpJ/ne7EK7oIfy/jktofQjJpvtiTRK816hcw4uNYG+g
 2qOQAwKYOky+ay8mbkEs2DrZLDxj4orRk6UubLiuk4G5HXduJLl4kcpjgmfsIY1U35sb
 fqkx9GIwSyCvYtNEWijMi53oL8RfPKCjsMQbifzrpWHVrac4Ptu1VOVz28TQ585SR7xI
 7W0ZD4Y9s6OLaO9pDEE+0FlogGLvguT74ZqlUQMixVQxpukszswLtOVwk+aM3ObPSinY
 Oqew==
X-Gm-Message-State: ACgBeo3iVoJjPnjlwjfjH9mM64xBVKREOrExNlshqSi8gxLm37gfnPwx
 g0MuTv9l5p2AcewEB2+759GJI48kqB0a/pnrMvI=
X-Google-Smtp-Source: AA6agR49Bd670OZC0mwfCP31L6/vxntdUsQzAA7OyfrDUag0heVffROEj4AuG7kC993xqNQduSXy2yyeJAQ/e9y8+5o=
X-Received: by 2002:a19:6b16:0:b0:48a:b377:f161 with SMTP id
 d22-20020a196b16000000b0048ab377f161mr2464594lfa.218.1659698575739; Fri, 05
 Aug 2022 04:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-15-marcandre.lureau@redhat.com>
 <cce5f807-e8ab-8779-7d01-b225520e9a87@redhat.com>
In-Reply-To: <cce5f807-e8ab-8779-7d01-b225520e9a87@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 5 Aug 2022 15:22:44 +0400
Message-ID: <CAJ+F1CLskbv=wo13Y2=1pDWiMz0T2EBnFjNw_Wf+X7QcAVHMHA@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] mtest2make.py: teach suite name that are just
 "PROJECT"
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org, 
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>, 
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000a919505e57cb041"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000a919505e57cb041
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 5, 2022 at 2:39 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 7/12/22 11:35, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > A subproject test may be simply in the "PROJECT" suite (such as
> > "qemu-common" with the following patches)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   scripts/mtest2make.py | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
> > index 0fe81efbbcec..606821ee2732 100644
> > --- a/scripts/mtest2make.py
> > +++ b/scripts/mtest2make.py
> > @@ -51,8 +51,11 @@ def process_tests(test, targets, suites):
> >
> >       test_suites =3D test['suite'] or ['default']
> >       for s in test_suites:
> > -        # The suite name in the introspection info is "PROJECT:SUITE"
> > -        s =3D s.split(':')[1]
> > +        # The suite name in the introspection info is "PROJECT" or
> "PROJECT:SUITE"
> > +        try:
> > +            s =3D s.split(':')[1]
> > +        except IndexError:
> > +            continue
>
> Shouldn't you continue with s begin simply "PROJECT"?  That is, just
>
>      if ':' in s:
>          s =3D s.split(':')[1]
>
> This way you can do "make check-qemu-common".
>
> >           if s =3D=3D 'slow' or s =3D=3D 'thorough':
> >               continue
> >           if s.endswith('-slow'):
>
> and then however these two "ifs" need to be under the case where the
> suite name is "PROJECT:SUITE".
>
>
Thanks for the tips, updated


--=20
Marc-Andr=C3=A9 Lureau

--0000000000000a919505e57cb041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 5, 2022 at 2:39 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
7/12/22 11:35, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; A subproject test may be simply in the &quot;PROJECT&quot; suite (such=
 as<br>
&gt; &quot;qemu-common&quot; with the following patches)<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0scripts/mtest2make.py | 7 +++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py<br>
&gt; index 0fe81efbbcec..606821ee2732 100644<br>
&gt; --- a/scripts/mtest2make.py<br>
&gt; +++ b/scripts/mtest2make.py<br>
&gt; @@ -51,8 +51,11 @@ def process_tests(test, targets, suites):<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test_suites =3D test[&#39;suite&#39;] or [&#=
39;default&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for s in test_suites:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The suite name in the introspection inf=
o is &quot;PROJECT:SUITE&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D s.split(&#39;:&#39;)[1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The suite name in the introspection inf=
o is &quot;PROJECT&quot; or &quot;PROJECT:SUITE&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D s.split(&#39;:&#39;)[=
1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except IndexError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
<br>
Shouldn&#39;t you continue with s begin simply &quot;PROJECT&quot;?=C2=A0 T=
hat is, just<br>
<br>
=C2=A0 =C2=A0 =C2=A0if &#39;:&#39; in s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D s.split(&#39;:&#39;)[1]<br>
<br>
This way you can do &quot;make check-qemu-common&quot;.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if s =3D=3D &#39;slow&#39; or =
s =3D=3D &#39;thorough&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if s.endswith(&#39;-slow&#39;)=
:<br>
<br>
and then however these two &quot;ifs&quot; need to be under the case where =
the <br>
suite name is &quot;PROJECT:SUITE&quot;.<br>
<br></blockquote><div><br></div><div>Thanks for the tips, updated <br></div=
></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000a919505e57cb041--

