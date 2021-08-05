Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D43E17AE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:13:19 +0200 (CEST)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBf3e-0001si-G1
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBf2V-0000Pq-WC
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBf2Q-0003Fy-Po
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628176320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ohI63vUGJsMn3cP0gX+HEvo34uQ3bWbNZy22EYvB+UM=;
 b=Z5owsyzKSYHQzjIDZtz6o80NPDAZ5TFNGKbFBwhwWJsWkxk5SHDcUgNV0RM527tRCPmk8Z
 xmdtkOXPB8aFACywO9EfPXmoT5S0wxjhjCFdVArVyltgNjjSImRH2zGpBXroYIttbPA74n
 7jYywtLke9O7mYczcbawo+fnmCutJ+s=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-BVOUmhtiNpqYeLZBUIuBMg-1; Thu, 05 Aug 2021 11:11:59 -0400
X-MC-Unique: BVOUmhtiNpqYeLZBUIuBMg-1
Received: by mail-oo1-f69.google.com with SMTP id
 k18-20020a4a94920000b029026767722880so2024319ooi.7
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 08:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohI63vUGJsMn3cP0gX+HEvo34uQ3bWbNZy22EYvB+UM=;
 b=rTkbE6qh54kidNGDHZrmTzYFnPXXvKNTFzrP9NVkyuQWYHZMJoS86tL24m3YTftTEB
 wdg/k7G90xtWZD9rvmi3bE3olLD1NMXp5cWK9vQBPlu8y+2VHcLbC/SQyAuC7gAph1ws
 Ozjc0FVjpJXA9kpSaJMDyycU5VArGLBxtEZCp9rfvN7ytc0xWIQ0xb6EhZiO/aGeIoHO
 es1VW5gp9kBWFwF8lxSBO7B+6aoPkiZDVggu8wUBCBIHHEkvX8uqAeO7uJZeKk0SAH2X
 R7hmPsVM9277piMYlrVdRZJAtw2WQT7eWTYo/v/Wyy14VA12WVR2yv5V4mwk1gK5ywLs
 iIQQ==
X-Gm-Message-State: AOAM531BPSMHn4HcFJzAplorkXAWdWRiGjYu0dygdWlq2nPms+oAViel
 cTmYak/+5EGJBCF982Hl/Hi70Y76i9hWdvh+nK4NPgRbRe7joirb/yOmJzAw6ZoF3h1Ul+pZJXi
 IPPFTnxDujpwHDBsw1pYqBiLV6npgp6U=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr4217565otr.45.1628176318480; 
 Thu, 05 Aug 2021 08:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3jZlioTI2JlhvFJOxSNcEdZEN1EYf97otuc0atUJ2gOF8sndh176UxdRua5sDdFMeFSqNQPos3BWP5A4H89A=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr4217544otr.45.1628176318178; 
 Thu, 05 Aug 2021 08:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-8-marcandre.lureau@redhat.com>
 <87lf5ismpj.fsf@dusky.pond.sub.org>
In-Reply-To: <87lf5ismpj.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Aug 2021 11:11:46 -0400
Message-ID: <CAFn=p-YjfyumgxF3uxfo6ar9C5u3W8p673kGUAL2zi=NU20==Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] qapi: replace if condition list with dict
 {'all': [...]}
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000013bcd605c8d15766"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000013bcd605c8d15766
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021 at 9:05 AM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Replace the simple list sugar form with a recursive structure that will
> > accept other operators in the following commits (all, any or not).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  scripts/qapi/common.py                        | 23 +++++--
> >  scripts/qapi/expr.py                          | 52 ++++++++++------
> >  scripts/qapi/schema.py                        |  2 +-
> >  tests/qapi-schema/bad-if-empty-list.json      |  2 +-
> >  tests/qapi-schema/bad-if-list.json            |  2 +-
> >  tests/qapi-schema/bad-if.err                  |  3 +-
> >  tests/qapi-schema/doc-good.json               |  3 +-
> >  tests/qapi-schema/doc-good.out                | 13 ++--
> >  tests/qapi-schema/doc-good.txt                |  6 ++
> >  tests/qapi-schema/enum-if-invalid.err         |  3 +-
> >  tests/qapi-schema/features-if-invalid.err     |  2 +-
> >  tests/qapi-schema/qapi-schema-test.json       | 25 ++++----
> >  tests/qapi-schema/qapi-schema-test.out        | 62 +++++++++----------
> >  .../qapi-schema/struct-member-if-invalid.err  |  2 +-
> >  .../qapi-schema/union-branch-if-invalid.json  |  2 +-
> >  15 files changed, 119 insertions(+), 83 deletions(-)
> >
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index 5181a0f167..51463510c9 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -13,7 +13,8 @@
> >
> >  import re
> >  from typing import (
> > -    List,
> > +    Any,
> > +    Dict,
> >      Match,
> >      Optional,
> >      Union,
> > @@ -199,16 +200,28 @@ def guardend(name: str) -> str:
> >                   name=3Dc_fname(name).upper())
> >
> >
> > -def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> > +def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
>
> Uh, why do you swap cgen_ifcond() and docgen_ifcond()?  Accident?
>
> >      if not ifcond:
> >          return ''
> > -    return '(' + ') && ('.join(ifcond) + ')'
> > +    if isinstance(ifcond, str):
> > +        return ifcond
> >
> > +    oper, operands =3D next(iter(ifcond.items()))
> > +    oper =3D {'all': ' and '}[oper]
> > +    operands =3D [docgen_ifcond(o) for o in operands]
> > +    return '(' + oper.join(operands) + ')'
>
> What a nice review speedbump you buried here...
>
> The whole block boils down to the much less exciting
>
>        operands =3D [docgen_ifcond(o) for o in ifcond['all']]
>        return '(' + ' and '.join(operands) + ')'
>
> Peeking ahead, I understand that you did it this way here so you can
> extend it trivially there.  Matter of taste; what counts is the final
> result and minimizing reviewer WTFs/minute along the way.
>
> Since the WTFs/minute is a done deed now, what remains is the final
> result, which I expect to review shortly.  But please try a bit harder
> to be boring next time ;)
>
> >
> > -def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> > +
> > +def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
> >      if not ifcond:
> >          return ''
> > -    return ' and '.join(ifcond)
> > +    if isinstance(ifcond, str):
> > +        return ifcond
>
> This is what gets rid of the redundant parenthesises in the common case
> "single condition string".
>
> > +
> > +    oper, operands =3D next(iter(ifcond.items()))
> > +    oper =3D {'all': '&&'}[oper]
> > +    operands =3D [cgen_ifcond(o) for o in operands]
> > +    return '(' + (') ' + oper + ' (').join(operands) + ')'
>
> This line is hard to read.  Easier, I think:
>
>        oper =3D {'all': ' && '}[oper]
>        operands =3D ['(' + cgen_ifcond(o) + ')' for o in operands]
>        return oper.join(operands)
>
> Neither your version nor mine gets rid of the redundant parenthesises in
> the (uncommon) case "complex condition expression".
> tests/test-qapi-introspect.c still has
>
>     #if (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2))
>                 QLIT_QSTR("feature1"),
>     #endif /* (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2)) */
>
> Mildly annoying.  I'm willing to leave this for later.
>
> Code smell: cgen_ifcond() and docgen_ifcond() are almost identical.  Can
> also be left for later.
>
> >
> >
> >  def gen_if(cond: str) -> str:
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index 496f7e0333..3ee66c5f62 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -259,14 +259,12 @@ def check_flags(expr: _JSONObject, info:
> QAPISourceInfo) -> None:
> >
> >  def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) ->
> None:
> >      """
> > -    Normalize and validate the ``if`` member of an object.
> > +    Validate the ``if`` member of an object.
> >
> > -    The ``if`` member may be either a ``str`` or a ``List[str]``.
> > -    A ``str`` value will be normalized to ``List[str]``.
> > +    The ``if`` member may be either a ``str`` or a dict.
> >
> >      :forms:
> > -      :sugared: ``Union[str, List[str]]``
> > -      :canonical: ``List[str]``
> > +      :canonical: ``Union[str, dict]``
>
> Does this :forms: thing make sense without any :sugared:?  John, you
> added (invented?) it in commit a48653638fa, but no explanation made it
> into the tree.
>
>
This is just a "field list" ... it's just markup that renders like a
bulleted definition list kind of thing. The :field list: syntax is useful
only so far as we use it consistently; does it make sense without at least
2 entries? it CAN, if by analogy with the other docstrings. It's just a
visual consistency thing, it doesn't have any special meaning.

i.e. unlike the other field lists (param, return, raise) it has no special
recognition by the Sphinx python domain.

I won't push very hard for having it be kept either way, though Union[str,
dict] is kind of a cop-out and doesn't actually convey the concrete form,
which was the intent of adding these in the first place.

--js

--00000000000013bcd605c8d15766
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 9:05 AM Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a hr=
ef=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lurea=
u@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Replace the simple list sugar form with a recursive structure that wil=
l<br>
&gt; accept other operators in the following commits (all, any or not).<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++--<br>
&gt;=C2=A0 scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 52 ++++++++++------<br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-empty-list.json=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-list.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 13 ++--<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++<br>
&gt;=C2=A0 tests/qapi-schema/enum-if-invalid.err=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 tests/qapi-schema/features-if-invalid.err=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.json=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 25 ++++----<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.out=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 62 +++++++++----------<br>
&gt;=C2=A0 .../qapi-schema/struct-member-if-invalid.err=C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 .../qapi-schema/union-branch-if-invalid.json=C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 15 files changed, 119 insertions(+), 83 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index 5181a0f167..51463510c9 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -13,7 +13,8 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 from typing import (<br>
&gt; -=C2=A0 =C2=A0 List,<br>
&gt; +=C2=A0 =C2=A0 Any,<br>
&gt; +=C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Match,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Union,<br>
&gt; @@ -199,16 +200,28 @@ def guardend(name: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me=3Dc_fname(name).upper())<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def cgen_ifcond(ifcond: Union[str, List[str]]) -&gt; str:<br>
&gt; +def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -&gt; str:<br>
<br>
Uh, why do you swap cgen_ifcond() and docgen_ifcond()?=C2=A0 Accident?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 return &#39;(&#39; + &#39;) &amp;&amp; (&#39;.join(ifco=
nd) + &#39;)&#39;<br>
&gt; +=C2=A0 =C2=A0 if isinstance(ifcond, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 oper, operands =3D next(iter(ifcond.items()))<br>
&gt; +=C2=A0 =C2=A0 oper =3D {&#39;all&#39;: &#39; and &#39;}[oper]<br>
&gt; +=C2=A0 =C2=A0 operands =3D [docgen_ifcond(o) for o in operands]<br>
&gt; +=C2=A0 =C2=A0 return &#39;(&#39; + oper.join(operands) + &#39;)&#39;<=
br>
<br>
What a nice review speedbump you buried here...<br>
<br>
The whole block boils down to the much less exciting<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0operands =3D [docgen_ifcond(o) for o in ifcond[&=
#39;all&#39;]]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;(&#39; + &#39; and &#39;.join(operan=
ds) + &#39;)&#39;<br>
<br>
Peeking ahead, I understand that you did it this way here so you can<br>
extend it trivially there.=C2=A0 Matter of taste; what counts is the final<=
br>
result and minimizing reviewer WTFs/minute along the way.<br>
<br>
Since the WTFs/minute is a done deed now, what remains is the final<br>
result, which I expect to review shortly.=C2=A0 But please try a bit harder=
<br>
to be boring next time ;)<br>
<br>
&gt;=C2=A0 <br>
&gt; -def docgen_ifcond(ifcond: Union[str, List[str]]) -&gt; str:<br>
&gt; +<br>
&gt; +def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 return &#39; and &#39;.join(ifcond)<br>
&gt; +=C2=A0 =C2=A0 if isinstance(ifcond, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
<br>
This is what gets rid of the redundant parenthesises in the common case<br>
&quot;single condition string&quot;.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 oper, operands =3D next(iter(ifcond.items()))<br>
&gt; +=C2=A0 =C2=A0 oper =3D {&#39;all&#39;: &#39;&amp;&amp;&#39;}[oper]<br=
>
&gt; +=C2=A0 =C2=A0 operands =3D [cgen_ifcond(o) for o in operands]<br>
&gt; +=C2=A0 =C2=A0 return &#39;(&#39; + (&#39;) &#39; + oper + &#39; (&#39=
;).join(operands) + &#39;)&#39;<br>
<br>
This line is hard to read.=C2=A0 Easier, I think:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0oper =3D {&#39;all&#39;: &#39; &amp;&amp; &#39;}=
[oper]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0operands =3D [&#39;(&#39; + cgen_ifcond(o) + &#3=
9;)&#39; for o in operands]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return oper.join(operands)<br>
<br>
Neither your version nor mine gets rid of the redundant parenthesises in<br=
>
the (uncommon) case &quot;complex condition expression&quot;.<br>
tests/test-qapi-introspect.c still has<br>
<br>
=C2=A0 =C2=A0 #if (defined(TEST_IF_COND_1)) &amp;&amp; (defined(TEST_IF_CON=
D_2))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIT_QSTR(&quot;fea=
ture1&quot;),<br>
=C2=A0 =C2=A0 #endif /* (defined(TEST_IF_COND_1)) &amp;&amp; (defined(TEST_=
IF_COND_2)) */<br>
<br>
Mildly annoying.=C2=A0 I&#39;m willing to leave this for later.<br>
<br>
Code smell: cgen_ifcond() and docgen_ifcond() are almost identical.=C2=A0 C=
an<br>
also be left for later.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def gen_if(cond: str) -&gt; str:<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index 496f7e0333..3ee66c5f62 100644<br>
&gt; --- a/scripts/qapi/expr.py<br>
&gt; +++ b/scripts/qapi/expr.py<br>
&gt; @@ -259,14 +259,12 @@ def check_flags(expr: _JSONObject, info: QAPISou=
rceInfo) -&gt; None:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: st=
r) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 Normalize and validate the ``if`` member of an object.<=
br>
&gt; +=C2=A0 =C2=A0 Validate the ``if`` member of an object.<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 The ``if`` member may be either a ``str`` or a ``List[s=
tr]``.<br>
&gt; -=C2=A0 =C2=A0 A ``str`` value will be normalized to ``List[str]``.<br=
>
&gt; +=C2=A0 =C2=A0 The ``if`` member may be either a ``str`` or a dict.<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 :forms:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 :sugared: ``Union[str, List[str]]``<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 :canonical: ``List[str]``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :canonical: ``Union[str, dict]``<br>
<br>
Does this :forms: thing make sense without any :sugared:?=C2=A0 John, you<b=
r>
added (invented?) it in commit a48653638fa, but no explanation made it<br>
into the tree.<br>
<br></blockquote><div><br></div><div>This is just a &quot;field list&quot; =
... it&#39;s just markup that renders like a bulleted definition list kind =
of thing. The :field list: syntax is useful only so far as we use it consis=
tently; does it make sense without at least 2 entries? it CAN, if by analog=
y with the other docstrings. It&#39;s just a visual consistency thing, it d=
oesn&#39;t have any special meaning.</div><div><br></div><div>i.e. unlike t=
he other field lists (param, return, raise) it has no special recognition b=
y the Sphinx python domain.</div><div><br></div><div>I won&#39;t push very =
hard for having it be kept either way, though Union[str, dict] is kind of a=
 cop-out and doesn&#39;t actually convey the concrete form, which was the i=
ntent of adding these in the first place.</div><div><br></div><div>--js<br>=
</div></div></div>

--00000000000013bcd605c8d15766--


