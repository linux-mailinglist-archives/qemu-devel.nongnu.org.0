Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730203E164A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:03:13 +0200 (CEST)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdxo-0005lm-FT
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBdvE-0002HM-6e
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:00:32 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBdvB-00022g-5L
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:00:31 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ec13so8603176edb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7vIHguA9WF8yQxHNHGcAhMyx9RFIuJB4OIveX3gg+s=;
 b=nVLNEmAt8QBzETViCZtET+llM7cST0RH/spESp1acC8hBDtbS8nspODZOHF8al+YU1
 rbf0NTw7VHWYdDXzixN0cU4B6/OqKU8XnWVBlRJutJ8ajtZlIMt5qPJvMitQpO19z3SN
 WdLFWTVbIXy3czNTrEjJoJk3gpYdQM/E9mN7Nn5wIQ95UZI/nKcPQRZymGhSPZ8pCRIx
 Jb98aVigkMJWKq/Q0Of7GV7jK8JU6Tdx9sc6m5q2eUMA8DRShqcwjjSKRyr02M4nyG2W
 ZztyvojeRpIZV+cL9cdQwkoZTu/6jlIZ53QWl9RO3xCa9kverlJQIroTHVMEQJN0i+Mv
 p+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7vIHguA9WF8yQxHNHGcAhMyx9RFIuJB4OIveX3gg+s=;
 b=Y/MOjTVSq12s6WWw+QL1zNW0YkCzh1TXycFyefQuAtMj/UpZlRjKIIj9pbh0xOzHk1
 hmYB2Qj0lYIwD/d6Sub7ol0cCPFgzSTA8suF9fk4tJXjYL8mEdsgQ/2Hpdi214D7/VLL
 +YgniM7LO4I8agFTX2NPb5EBmnBIHuJbRl7C5NRGuTs0YTIpXzaPwByfLhwMcFmtqcWs
 2hNADTcrNLw3ppz3Z1swumpRFXL7k35eTWQLFqoJuHpgWdUXn9FcqiO6jllyMz6YaVDp
 tDHPJVd6B0jR7ZpS2H/rGduJ5gsfETDLWpyt4la0Bibj+xpzoIaABSBknq6/iepCXgvL
 agjw==
X-Gm-Message-State: AOAM5301SFjqjh//M8yMgNomac2BAuvyH39VizIsqsbDSr2iPchLVTWc
 rXY9QBGtOvzgmaUHlYoQaP6CBW73x0s8e9Bl1L8=
X-Google-Smtp-Source: ABdhPJxC21xXYioFpl2NwqYx4HkuvtfoH8gjuofit6lp0Jle2XHozKhhqrF5PoKPQXdrj+rIrfi0td94FoB3SQHXriU=
X-Received: by 2002:aa7:d691:: with SMTP id d17mr6740163edr.245.1628172027430; 
 Thu, 05 Aug 2021 07:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-7-marcandre.lureau@redhat.com>
 <87y29g6mak.fsf@dusky.pond.sub.org>
In-Reply-To: <87y29g6mak.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 Aug 2021 18:00:14 +0400
Message-ID: <CAJ+F1CJi2_2D_fm_XBC+zTcjXHV8X-8KNFkQ53KD_7LboYVh6Q@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] qapi: replace if condition list with dict
 {'all': [...]}
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005408d305c8d057fc"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005408d305c8d057fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 5, 2021 at 5:42 PM Markus Armbruster <armbru@redhat.com> wrote:

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
> >  tests/qapi-schema/bad-if-all.err              |  2 +
> >  tests/qapi-schema/bad-if-all.json             |  3 +
> >  tests/qapi-schema/bad-if-all.out              |  0
> >  tests/qapi-schema/bad-if-empty-list.json      |  2 +-
> >  tests/qapi-schema/bad-if-key.err              |  3 +
> >  tests/qapi-schema/bad-if-key.json             |  3 +
> >  tests/qapi-schema/bad-if-key.out              |  0
> >  tests/qapi-schema/bad-if-keys.err             |  2 +
> >  tests/qapi-schema/bad-if-keys.json            |  3 +
> >  tests/qapi-schema/bad-if-keys.out             |  0
> >  tests/qapi-schema/bad-if-list.json            |  2 +-
> >  tests/qapi-schema/bad-if.err                  |  2 +-
> >  tests/qapi-schema/bad-if.json                 |  2 +-
> >  tests/qapi-schema/doc-good.json               |  3 +-
> >  tests/qapi-schema/doc-good.out                | 13 ++--
> >  tests/qapi-schema/doc-good.txt                |  6 ++
> >  tests/qapi-schema/enum-if-invalid.err         |  3 +-
> >  tests/qapi-schema/features-if-invalid.err     |  2 +-
> >  tests/qapi-schema/meson.build                 |  3 +
> >  tests/qapi-schema/qapi-schema-test.json       | 25 ++++----
> >  tests/qapi-schema/qapi-schema-test.out        | 62 +++++++++----------
> >  .../qapi-schema/struct-member-if-invalid.err  |  2 +-
> >  .../qapi-schema/union-branch-if-invalid.json  |  2 +-
> >  26 files changed, 138 insertions(+), 84 deletions(-)
> >  create mode 100644 tests/qapi-schema/bad-if-all.err
> >  create mode 100644 tests/qapi-schema/bad-if-all.json
> >  create mode 100644 tests/qapi-schema/bad-if-all.out
> >  create mode 100644 tests/qapi-schema/bad-if-key.err
> >  create mode 100644 tests/qapi-schema/bad-if-key.json
> >  create mode 100644 tests/qapi-schema/bad-if-key.out
> >  create mode 100644 tests/qapi-schema/bad-if-keys.err
> >  create mode 100644 tests/qapi-schema/bad-if-keys.json
> >  create mode 100644 tests/qapi-schema/bad-if-keys.out
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
> Looks like you forgot to un-swap cgen_ifcond() and docgen_ifcond().  Can
> do in my tree.
>

Oops, I did it though, I wonder where it went..!


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
> >
> > -def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> > +
> > +def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
> >      if not ifcond:
> >          return ''
> > -    return ' and '.join(ifcond)
> > +    if isinstance(ifcond, str):
> > +        return ifcond
> > +
> > +    oper, operands =3D next(iter(ifcond.items()))
> > +    oper =3D {'all': '&&'}[oper]
> > +    operands =3D [cgen_ifcond(o) for o in operands]
> > +    return '(' + (') ' + oper + ' (').join(operands) + ')'
>
> I suggested a more legible version in review of v6.  Not worth a respin
> by itself.
>
> Note to self: try to get rid of redundant parenthesis here.
>
> Note to self: cgen_ifcond() and docgen_ifcond() are almost identical.
> Refactor?
>
> >
> >
> >  def gen_if(cond: str) -> str:
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index cf98923fa6..b5187bfbca 100644
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
> John hasn't answered my question whether :forms: makes sensw without
> :sugared:.  If it doesn't, I can drop it in my tree.
>
> >
> >      :param expr: The expression containing the ``if`` member to
> validate.
> >      :param info: QAPI schema source file information.
> > @@ -275,31 +273,45 @@ def check_if(expr: _JSONObject, info:
> QAPISourceInfo, source: str) -> None:
> >      :raise QAPISemError:
> >          When the "if" member fails validation, or when there are no
> >          non-empty conditions.
> > -    :return: None, ``expr`` is normalized in-place as needed.
> > +    :return: None
> >      """
> >      ifcond =3D expr.get('if')
> >      if ifcond is None:
> >          return
> >
> > -    if isinstance(ifcond, list):
> > -        if not ifcond:
> > -            raise QAPISemError(
> > -                info, "'if' condition [] of %s is useless" % source)
> > -    else:
> > -        # Normalize to a list
> > -        ifcond =3D expr['if'] =3D [ifcond]
> > +    def _check_if(cond: Union[str, object]) -> None:
> > +        if isinstance(cond, str):
> > +            if not cond.strip():
> > +                raise QAPISemError(
> > +                    info,
> > +                    "'if' condition '%s' of %s makes no sense"
> > +                    % (cond, source))
> > +            return
> >
> > -    for elt in ifcond:
> > -        if not isinstance(elt, str):
> > +        if not isinstance(cond, dict):
> >              raise QAPISemError(
> >                  info,
> > -                "'if' condition of %s must be a string or a list of
> strings"
> > -                % source)
> > -        if not elt.strip():
> > +                "'if' condition of %s must be a string or a dict" %
> source)
> > +        if len(cond) !=3D 1:
> >              raise QAPISemError(
> >                  info,
> > -                "'if' condition '%s' of %s makes no sense"
> > -                % (elt, source))
> > +                "'if' condition dict of %s must have one key: "
> > +                "'all'" % source)
> > +        check_keys(cond, info, "'if' condition", [],
> > +                   ["all"])
> > +
> > +        oper, operands =3D next(iter(cond.items()))
> > +        if not operands:
> > +            raise QAPISemError(
> > +                info, "'if' condition [] of %s is useless" % source)
> > +
> > +        if oper in ("all") and not isinstance(operands, list):
> > +            raise QAPISemError(
> > +                info, "'%s' condition of %s must be a list" % (oper,
> source))
> > +        for operand in operands:
> > +            _check_if(operand)
> > +
> > +    _check_if(ifcond)
>
> Mind if I squash in the move of the helper function to the beginning?
>
>
No problem

>
> >
> >  def normalize_members(members: object) -> None:
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index ff9c4f0a17..627735a431 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -32,7 +32,7 @@
> >
> >  class QAPISchemaIfCond:
> >      def __init__(self, ifcond=3DNone):
> > -        self.ifcond =3D ifcond or []
> > +        self.ifcond =3D ifcond or {}
>
> This is slightly subtle.
>
> QAPISchemaIfCond.ifcond can look like one of
>
> * {'all': [COND, ...]}
>
> * {'any': [COND, ...]}          (only after PATCH 07)
>
> * {'not': COND}                 (only after PATCH 08)
>
> * STRING
>
> * {}
>
> This is just like the AST, except "absent" is now {} instead of None.
> It can occur only at the root.
>
> cgen_ifcond() and docgen_ifcond() are recursive, which means they
> happily accept {} anywhere, and generate crap.
>
> I believe the code works anyway, because it only ever creates {} in
> QAPISchemaIfCond.__init__(), i.e. at the root.
>
> Non-local correctness argument.  I'd like to try my hand at tweaking the
> code so it's more obviously correct.  Not now.
>
> >
> >      def cgen(self):
> >          return cgen_ifcond(self.ifcond)
> [Tests skipped for now...]
>
>
>
thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005408d305c8d057fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 5:42 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
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
&gt;=C2=A0 tests/qapi-schema/bad-if-all.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-all.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-all.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-empty-list.json=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-key.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-key.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-key.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-keys.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-keys.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-keys.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-list.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
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
&gt;=C2=A0 tests/qapi-schema/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.json=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 25 ++++----<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.out=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 62 +++++++++----------<br>
&gt;=C2=A0 .../qapi-schema/struct-member-if-invalid.err=C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 .../qapi-schema/union-branch-if-invalid.json=C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 26 files changed, 138 insertions(+), 84 deletions(-)<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-all.err<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-all.json<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-all.out<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-key.err<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-key.json<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-key.out<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-keys.err<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-keys.json<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/bad-if-keys.out<br>
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
Looks like you forgot to un-swap cgen_ifcond() and docgen_ifcond().=C2=A0 C=
an<br>
do in my tree.<br></blockquote><div><br></div><div>Oops, I did it though, I=
 wonder where it went..!</div><div> <br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
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
&gt;=C2=A0 <br>
&gt; -def docgen_ifcond(ifcond: Union[str, List[str]]) -&gt; str:<br>
&gt; +<br>
&gt; +def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 return &#39; and &#39;.join(ifcond)<br>
&gt; +=C2=A0 =C2=A0 if isinstance(ifcond, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 oper, operands =3D next(iter(ifcond.items()))<br>
&gt; +=C2=A0 =C2=A0 oper =3D {&#39;all&#39;: &#39;&amp;&amp;&#39;}[oper]<br=
>
&gt; +=C2=A0 =C2=A0 operands =3D [cgen_ifcond(o) for o in operands]<br>
&gt; +=C2=A0 =C2=A0 return &#39;(&#39; + (&#39;) &#39; + oper + &#39; (&#39=
;).join(operands) + &#39;)&#39;<br>
<br>
I suggested a more legible version in review of v6.=C2=A0 Not worth a respi=
n<br>
by itself.<br>
<br>
Note to self: try to get rid of redundant parenthesis here.<br>
<br>
Note to self: cgen_ifcond() and docgen_ifcond() are almost identical.<br>
Refactor?<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def gen_if(cond: str) -&gt; str:<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index cf98923fa6..b5187bfbca 100644<br>
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
John hasn&#39;t answered my question whether :forms: makes sensw without<br=
>
:sugared:.=C2=A0 If it doesn&#39;t, I can drop it in my tree.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 :param expr: The expression containing the ``if`` =
member to validate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :param info: QAPI schema source file information.<=
br>
&gt; @@ -275,31 +273,45 @@ def check_if(expr: _JSONObject, info: QAPISource=
Info, source: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :raise QAPISemError:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 When the &quot;if&quot; member fails=
 validation, or when there are no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 non-empty conditions.<br>
&gt; -=C2=A0 =C2=A0 :return: None, ``expr`` is normalized in-place as neede=
d.<br>
&gt; +=C2=A0 =C2=A0 :return: None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ifcond is None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if isinstance(ifcond, list):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;if&#39; condition [] of %s is useless&quot; % source)<br>
&gt; -=C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Normalize to a list<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr[&#39;if&#39;] =3D [ifcond=
]<br>
&gt; +=C2=A0 =C2=A0 def _check_if(cond: Union[str, object]) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(cond, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cond.strip():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISem=
Error(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;&#39;if&#39; condition &#39;%s&#39; of %s makes no sense&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 % (cond, source))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 for elt in ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(elt, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(cond, dict):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition of %s must be a string or a list of strings&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % source)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not elt.strip():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition of %s must be a string or a dict&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(cond) !=3D 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition &#39;%s&#39; of %s makes no sense&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (elt, sourc=
e))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition dict of %s must have one key: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;al=
l&#39;&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_keys(cond, info, &quot;&#39;if&#39;=
 condition&quot;, [],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[&quot;all&quot;])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oper, operands =3D next(iter(cond.items()=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not operands:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;if&#39; condition [] of %s is useless&quot; % source)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if oper in (&quot;all&quot;) and not isin=
stance(operands, list):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;%s&#39; condition of %s must be a list&quot; % (oper, source))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for operand in operands:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _check_if(operand)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 _check_if(ifcond)<br>
<br>
Mind if I squash in the move of the helper function to the beginning?<br>
<br></blockquote><div><br></div><div>No problem<br></div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def normalize_members(members: object) -&gt; None:<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index ff9c4f0a17..627735a431 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -32,7 +32,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class QAPISchemaIfCond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or {}<br>
<br>
This is slightly subtle.<br>
<br>
QAPISchemaIfCond.ifcond can look like one of<br>
<br>
* {&#39;all&#39;: [COND, ...]}<br>
<br>
* {&#39;any&#39;: [COND, ...]}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (only afte=
r PATCH 07)<br>
<br>
* {&#39;not&#39;: COND}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(only after PATCH 08)<br>
<br>
* STRING<br>
<br>
* {}<br>
<br>
This is just like the AST, except &quot;absent&quot; is now {} instead of N=
one.<br>
It can occur only at the root.<br>
<br>
cgen_ifcond() and docgen_ifcond() are recursive, which means they<br>
happily accept {} anywhere, and generate crap.<br>
<br>
I believe the code works anyway, because it only ever creates {} in<br>
QAPISchemaIfCond.__init__(), i.e. at the root.<br>
<br>
Non-local correctness argument.=C2=A0 I&#39;d like to try my hand at tweaki=
ng the<br>
code so it&#39;s more obviously correct.=C2=A0 Not now.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def cgen(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cgen_ifcond(self.ifcond)<br>
[Tests skipped for now...]<br>
<br>
<br>
</blockquote></div><div><br></div><div>thanks<br></div><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005408d305c8d057fc--

