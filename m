Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA837BCB7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:41:54 +0200 (CEST)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgoBV-0004E2-Da
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgo9k-0002rT-7u
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:40:04 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgo9h-0002FK-Sn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:40:04 -0400
Received: by mail-ej1-x62f.google.com with SMTP id n2so34750350ejy.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72SMLUAo9Ubh4swJmxoxKJbEypxX6uJTozHl5AyR0Xw=;
 b=hQCBMW3aBeoddmerYeEFoZKwIUq7OhTG7og9M/Uvtzom/XFSewwXYzzSIiOLtHhIoD
 I+05+wZ7uidXA20JgD6Id+zu5wudduYpfLXXHdLl+31Mk7aRj5hM3oRZhEbDxV539JRG
 mhm4co3JXS2MWazjv7EOtctn/VC4Hiy/Ds9lqPBYVYD8h8/IOIyQiRr0FQ6Wt/JvTyjb
 huMYwApqcuGoI9uWen/9bqYCc8N7HsLtJdEzHP7g4fEymo9GIUs6m3TdyUVTq6xN4/9G
 P5ua9XY3z+6pdhxL62e1xBQIPuYhZqtyyG8W7menkABH1/AyNpWSIczp/8BaWHMcCK7j
 1S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72SMLUAo9Ubh4swJmxoxKJbEypxX6uJTozHl5AyR0Xw=;
 b=lCvuaPK+bPJmMGjeXocFOpJWXy+CjNyzYS1ATuOWa8RB6CKMQ/IiaVPAfXmKjV9N5o
 d2czJmBuF7alUKYigjhD1+dF1kWnuuDftEokYXruYoRCrBQx1H1rkpeSA2dNTUtmYdNl
 nf1ZRJxVmni/d4Gnq/RUUoJ8kpNChRaigsgWH/M+AWYpEk1cITy/4p8W5LFYYMLzt4t9
 tK6qUzlizi86p5GLoOTKbhG64AIymTsPxGv5h8M5lQL5HuTQJo7cTNiTR8x0ObIFS0we
 FvGRix97H0lmp02sfzlJcwqineg6JxeyqBL7hBBKTxOaUYxb2w8tDmD3fqLNmt1FevBH
 aU/g==
X-Gm-Message-State: AOAM532DdnSIDOfdE+HxU10VqqE/+tn23cWSFdyfletQ9wT5e8M/1ogF
 wLAIANayocsxEQ8AMrids90is6CUA9vxbS7uJD8=
X-Google-Smtp-Source: ABdhPJwojgyLI1KjJU4Eok3Tec8XOvcfyiXLuxySviDvq7MPJWqbIcD1IvyC9bAUKRVZJZElezXhwv0JELKWv9yC/0g=
X-Received: by 2002:a17:906:414d:: with SMTP id
 l13mr37080085ejk.527.1620823200286; 
 Wed, 12 May 2021 05:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <YJq2SXW1kSyDZ7WX@stefanha-x1.localdomain>
In-Reply-To: <YJq2SXW1kSyDZ7WX@stefanha-x1.localdomain>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 May 2021 16:39:48 +0400
Message-ID: <CAJ+F1CJ4FNGJj7pVP90njGeyB0REoeBOf=29_6u-QCmJM+LSzA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] qapi: untie 'if' conditions from C preprocessor
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000018c97805c2214ff6"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000018c97805c2214ff6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus

On Tue, May 11, 2021 at 8:53 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Thu, Apr 29, 2021 at 05:40:23PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > This series makes the 'if' conditions less liberal, by formalizing a
> simple
> > expression tree based on bare boolean logic of configure option
> identifiers.
> >
> > (this allows to express conditions in Rust in my QAPI-Rust PoC series)
> >
> > This is based on John Snow QAPI pt4:
> > https://patchew.org/QEMU/20210421192233.3542904-1-jsnow@redhat.com/
> >
> > Based-on: <20210421192233.3542904-2-jsnow@redhat.com>
> >
>

The patch series applies cleanly on top of master now. I checked no
regression between each commit, including python style checks.

If you are overloaded, can I make a pull request for it?

thanks

> thanks
> >
> > v3:
> >  - rebasing on queued pt4 (after waiting for it to land)
> >  - improve documentation generation, to be more human-friendly
> >  - drop typing annotations from schema.py (not yet queued)
> >  - commit message tweaks
> >
> > v2:
> >  - fix the normalization step to handle recursive expr
> >  - replace IfCond by QAPISchemaIf (JohnS)
> >  - commit message and documentation tweaks
> >  - mypy/flake8/isort
> >
> > Marc-Andr=C3=A9 Lureau (9):
> >   qapi: replace List[str] by QAPISchemaIfCond
> >   qapi: move gen_if/gen_endif to QAPISchemaIfCond
> >   qapi: start building an 'if' predicate tree
> >   qapi: introduce IfPredicateList and IfAny
> >   qapi: add IfNot
> >   qapi: normalize 'if' condition to IfPredicate tree
> >   qapi: convert 'if' C-expressions to the new syntax tree
> >   qapi: make 'if' condition strings simple identifiers
> >   docs: update the documentation about schema configuration
> >
> >  docs/devel/qapi-code-gen.txt                  |  33 +++---
> >  docs/sphinx/qapidoc.py                        |   6 +-
> >  qapi/block-core.json                          |  16 +--
> >  qapi/block-export.json                        |   6 +-
> >  qapi/char.json                                |   8 +-
> >  qapi/machine-target.json                      |  28 +++--
> >  qapi/migration.json                           |  10 +-
> >  qapi/misc-target.json                         |  37 +++---
> >  qapi/qom.json                                 |  10 +-
> >  qapi/sockets.json                             |   4 +-
> >  qapi/ui.json                                  |  48 ++++----
> >  qga/qapi-schema.json                          |   8 +-
> >  tests/unit/test-qmp-cmds.c                    |   1 +
> >  scripts/qapi/commands.py                      |   4 +-
> >  scripts/qapi/common.py                        | 106 +++++++++++++++---
> >  scripts/qapi/events.py                        |   5 +-
> >  scripts/qapi/expr.py                          |  62 +++++++---
> >  scripts/qapi/gen.py                           |  16 ++-
> >  scripts/qapi/introspect.py                    |  33 +++---
> >  scripts/qapi/schema.py                        |  99 ++++++++++++----
> >  scripts/qapi/types.py                         |  43 ++++---
> >  scripts/qapi/visit.py                         |  25 ++---
> >  .../alternate-branch-if-invalid.err           |   2 +-
> >  tests/qapi-schema/bad-if-empty.err            |   2 +-
> >  tests/qapi-schema/bad-if-list.err             |   2 +-
> >  tests/qapi-schema/bad-if.err                  |   3 +-
> >  tests/qapi-schema/bad-if.json                 |   2 +-
> >  tests/qapi-schema/doc-good.json               |   6 +-
> >  tests/qapi-schema/doc-good.out                |  12 +-
> >  tests/qapi-schema/doc-good.txt                |   6 +-
> >  tests/qapi-schema/enum-if-invalid.err         |   3 +-
> >  tests/qapi-schema/features-if-invalid.err     |   2 +-
> >  tests/qapi-schema/features-missing-name.json  |   2 +-
> >  tests/qapi-schema/qapi-schema-test.json       |  58 +++++-----
> >  tests/qapi-schema/qapi-schema-test.out        |  67 ++++++-----
> >  .../qapi-schema/struct-member-if-invalid.err  |   2 +-
> >  tests/qapi-schema/union-branch-if-invalid.err |   2 +-
> >  37 files changed, 482 insertions(+), 297 deletions(-)
> >
> > --
> > 2.29.0
> >
> >
> >
>
> Please double-check that the build and tests pass after each commit (for
> bisectability).
>
> I'm not familiar with the details of the QAPI code generator but in
> overall this looks like a nice step:
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>


--=20
Marc-Andr=C3=A9 Lureau

--00000000000018c97805c2214ff6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Markus<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 11, 2021 at 8:53=
 PM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefanha@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, Apr 29, 2021 at 05:40:23PM +0400, <a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:=
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; This series makes the &#39;if&#39; conditions less liberal, by formali=
zing a simple<br>
&gt; expression tree based on bare boolean logic of configure option identi=
fiers.<br>
&gt; <br>
&gt; (this allows to express conditions in Rust in my QAPI-Rust PoC series)=
<br>
&gt; <br>
&gt; This is based on John Snow QAPI pt4:<br>
&gt; <a href=3D"https://patchew.org/QEMU/20210421192233.3542904-1-jsnow@red=
hat.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/202=
10421192233.3542904-1-jsnow@redhat.com/</a><br>
&gt; <br>
&gt; Based-on: &lt;<a href=3D"mailto:20210421192233.3542904-2-jsnow@redhat.=
com" target=3D"_blank">20210421192233.3542904-2-jsnow@redhat.com</a>&gt;<br=
>
&gt; <br></blockquote><div><br></div><div>The patch series applies cleanly =
on top of master now. I checked no regression between each commit, includin=
g python style checks.</div><div><br></div><div>If you are overloaded, can =
I make a pull request for it?<br></div><div><br> </div><div>thanks</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; thanks<br>
&gt; <br>
&gt; v3:<br>
&gt;=C2=A0 - rebasing on queued pt4 (after waiting for it to land)<br>
&gt;=C2=A0 - improve documentation generation, to be more human-friendly<br=
>
&gt;=C2=A0 - drop typing annotations from schema.py (not yet queued)<br>
&gt;=C2=A0 - commit message tweaks<br>
&gt; <br>
&gt; v2:<br>
&gt;=C2=A0 - fix the normalization step to handle recursive expr<br>
&gt;=C2=A0 - replace IfCond by QAPISchemaIf (JohnS)<br>
&gt;=C2=A0 - commit message and documentation tweaks<br>
&gt;=C2=A0 - mypy/flake8/isort<br>
&gt; <br>
&gt; Marc-Andr=C3=A9 Lureau (9):<br>
&gt;=C2=A0 =C2=A0qapi: replace List[str] by QAPISchemaIfCond<br>
&gt;=C2=A0 =C2=A0qapi: move gen_if/gen_endif to QAPISchemaIfCond<br>
&gt;=C2=A0 =C2=A0qapi: start building an &#39;if&#39; predicate tree<br>
&gt;=C2=A0 =C2=A0qapi: introduce IfPredicateList and IfAny<br>
&gt;=C2=A0 =C2=A0qapi: add IfNot<br>
&gt;=C2=A0 =C2=A0qapi: normalize &#39;if&#39; condition to IfPredicate tree=
<br>
&gt;=C2=A0 =C2=A0qapi: convert &#39;if&#39; C-expressions to the new syntax=
 tree<br>
&gt;=C2=A0 =C2=A0qapi: make &#39;if&#39; condition strings simple identifie=
rs<br>
&gt;=C2=A0 =C2=A0docs: update the documentation about schema configuration<=
br>
&gt; <br>
&gt;=C2=A0 docs/devel/qapi-code-gen.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 +++---<br>
&gt;=C2=A0 docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 qapi/block-core.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +--<br>
&gt;=C2=A0 qapi/block-export.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A08 +-<br>
&gt;=C2=A0 qapi/machine-target.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +++--<br>
&gt;=C2=A0 qapi/migration.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 qapi/misc-target.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 37 +++---<br>
&gt;=C2=A0 qapi/qom.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 10 +-<br>
&gt;=C2=A0 qapi/sockets.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 =
+-<br>
&gt;=C2=A0 qapi/ui.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
48 ++++----<br>
&gt;=C2=A0 qga/qapi-schema.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 tests/unit/test-qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 scripts/qapi/commands.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 106 +++++++++++++++---<br>
&gt;=C2=A0 scripts/qapi/events.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 62 +++++++---<br>
&gt;=C2=A0 scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ++-<br>
&gt;=C2=A0 scripts/qapi/introspect.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 +++---<br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 99 ++++++++++++----<br>
&gt;=C2=A0 scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 43 ++++---<br>
&gt;=C2=A0 scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 ++---<br>
&gt;=C2=A0 .../alternate-branch-if-invalid.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-empty.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-list.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 tests/qapi-schema/enum-if-invalid.err=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 tests/qapi-schema/features-if-invalid.err=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 tests/qapi-schema/features-missing-name.json=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.json=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 58 +++++-----<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.out=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 67 ++++++-----<br>
&gt;=C2=A0 .../qapi-schema/struct-member-if-invalid.err=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 tests/qapi-schema/union-branch-if-invalid.err |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 37 files changed, 482 insertions(+), 297 deletions(-)<br>
&gt; <br>
&gt; -- <br>
&gt; 2.29.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
Please double-check that the build and tests pass after each commit (for<br=
>
bisectability).<br>
<br>
I&#39;m not familiar with the details of the QAPI code generator but in<br>
overall this looks like a nice step:<br>
<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000018c97805c2214ff6--

