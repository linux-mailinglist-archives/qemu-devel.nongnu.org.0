Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122983AC8EB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:35:00 +0200 (CEST)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBpz-0002Er-1o
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1luBn8-0005n7-Ea
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:32:03 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1luBn4-0004DR-2D
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:32:02 -0400
Received: by mail-ed1-x534.google.com with SMTP id t7so7964210edd.5
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PL/3AmmeSNvZdaEfSMyGTUHPcwo/XdHO6ZWRAFtzCUE=;
 b=BZsZyiPw3UYsOFsjTCt7V75K72KG6pA8p9R0eEmkYU+sp3jhHRMzGJ5Dv/Uw2I4tLm
 m59ld6yvrVkBHzhgqGjphQakwfkw9h6jGCMfwYQlRsgEqUQNIxtCfXdlP4oicS0kGOgP
 E/zw+6JrK+rFXjum3M7Jipar7YTHCR/BeUvpYsUaJrG/elAkFjJlNwejntSFHgokuk1p
 JEF3CF4r+yhIJaPBxF+H3wZHhsBldYxI0a33bGrKx6DmjmfQuM93PNl7HYfafcMeXz3g
 aEX0ZcukbPs3509CeHeMvk4czUbdXFHEQKJcpl0K6a0PKtLKE/QwOnIFVOmaLDV3LhjS
 yYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PL/3AmmeSNvZdaEfSMyGTUHPcwo/XdHO6ZWRAFtzCUE=;
 b=NpbIL+DAl9J0VkMx67dBoP0Dk/lmLBjRKskIkUoOZOI+ITa3BAw4dqXPvnkqFDZhSp
 BK3MVZ91JRkzBS3zxM6m24Dawo9W4v4V0CAjoOEJ8l+amFUiwTV7f9xH3ZNrN2+SSPRi
 /iAdvlse6jtl7JDSb2aYYAM+mXMKc6QOKnQKB+Ti7K++iyNW4kxNRBnemkVn+f8n4kEy
 AgHMMcML5V8D7diICLGxaHErkoCu3Q+WUKWJOA5c82EkuV5dektTG+c50Rn/8mWNP83S
 JekI3ePBrppFYxbhKuJMks9gbiMdVHh8/bzPa9Clp18pRWMNtnG/aIJNknstXDH5ffW3
 Is0w==
X-Gm-Message-State: AOAM53044W9RpHvavY1KHFJELDW29jUzlyJLyG67NWlttPlhRERMZtaS
 oVwHYxIAqHhjmUSGA5B8M6kcOEa/ovayJ9mQDco=
X-Google-Smtp-Source: ABdhPJycLKERjawGnH5m1SAQg79pMDEcukTUMtYBfB0LLMVYluDhqycWaTGpLt0O2zHjOqcln6t2xUkMpKCuplBQzUM=
X-Received: by 2002:a05:6402:18f6:: with SMTP id
 x54mr4127519edy.53.1624012314048; 
 Fri, 18 Jun 2021 03:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-5-marcandre.lureau@redhat.com>
 <87bl88y0is.fsf@dusky.pond.sub.org>
In-Reply-To: <87bl88y0is.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 18 Jun 2021 14:31:41 +0400
Message-ID: <CAJ+F1CJDP4U8Bj32i+3AMgFivNm+VL0REgK++Fx_H7NjeD3=_g@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] qapi: start building an 'if' predicate tree
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000016fa8205c507d564"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
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

--00000000000016fa8205c507d564
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 14, 2021 at 6:39 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The following patches are going to express schema 'if' conditions in a
> > target language agnostic way. For that, let's start building a predicat=
e
> > tree of the configuration options.
> >
> > This intermediary steps still uses C-preprocessor expressions as
> > the predicates:
> >
> > "if: [STR, ..]" is translated to a "IfCond -> IfAll ->
> > [IfOption, ..]" tree, which will generate "#if STR && .." C code.
> >
> > Once the boolean operation tree nodes are introduced, the 'if'
> > expressions will be converted to replace the C syntax (no more
> > !defined(), &&, ...) and based only on option identifiers.
> >
> > For now, the condition tree will be less expressive than a full C macro
> > expression as it will only support these operations: 'all', 'any' and
> > 'not', the only ones needed so far.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/sphinx/qapidoc.py                 |  6 +--
> >  scripts/qapi/common.py                 | 53 ++++++++++++++++++++++-
> >  scripts/qapi/schema.py                 | 17 ++++++--
> >  tests/qapi-schema/doc-good.out         | 12 +++---
> >  tests/qapi-schema/qapi-schema-test.out | 58 +++++++++++++-------------
> >  tests/qapi-schema/test-qapi.py         |  2 +-
> >  6 files changed, 103 insertions(+), 45 deletions(-)
> >
> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> > index b737949007..0f87fb16ce 100644
> > --- a/docs/sphinx/qapidoc.py
> > +++ b/docs/sphinx/qapidoc.py
> > @@ -112,12 +112,10 @@ def _make_section(self, title):
> >      def _nodes_for_ifcond(self, ifcond, with_if=3DTrue):
> >          """Return list of Text, literal nodes for the ifcond
> >
> > -        Return a list which gives text like ' (If: cond1, cond2,
> cond3)', where
> > -        the conditions are in literal-text and the commas are not.
> > +        Return a list which gives text like ' (If: condition)'.
> >          If with_if is False, we don't return the "(If: " and ")".
> >          """
> > -        condlist =3D intersperse([nodes.literal('', c) for c in
> ifcond.ifcond],
> > -                               nodes.Text(', '))
> > +        condlist =3D [nodes.literal('', ifcond.docgen())]
> >          if not with_if:
> >              return condlist
> >
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index c305aaf2f1..01e3203545 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -12,7 +12,7 @@
> >  # See the COPYING file in the top-level directory.
> >
> >  import re
> > -from typing import Match, Optional
> > +from typing import Match, Optional, Sequence
> >
> >
> >  #: Magic string that gets removed along with all space to its right.
> > @@ -214,3 +214,54 @@ def must_match(pattern: str, string: str) ->
> Match[str]:
> >      match =3D re.match(pattern, string)
> >      assert match is not None
> >      return match
> > +
> > +
> > +class IfPredicate:
>
> This is the abstract base class of the two (soon four) forms 'if'.
> qapi-code-gen.txt calls them "conditionals", and the code so far uses
> names like @ifcond.  I'd prefer not to throw "predicate" into the
> cauldron.  IfCond?  IfConditional?
>
>
ok


> > +    """An 'if' condition predicate"""
> > +
> > +    def cgen(self) -> str:
> > +        raise NotImplementedError()
> > +
> > +    def docgen(self) -> str:
> > +        raise NotImplementedError()
> > +
> > +
> > +class IfOption(IfPredicate):
>
> The name IfOption tells me nothing.
>
> At this point in the series, the IfOption are arbitrary C preprocessor
> expressions.
>
> At the end of the series, they are operands of the C preprocessor's
> unary operator defined, i.e. a C macro name.
>
> Once I know that, IfOption kind of makes sense.  Hmm.  IfConfigOption?
> IfIdentifier?  IfLeaf?  I'm not quite sure which one I dislike the least
> :)
>

Ok IfConfigOption.

>
> > +    def __init__(self, option: str):
> > +        self.option =3D option
> > +
> > +    def cgen(self) -> str:
> > +        return self.option
> > +
> > +    def docgen(self) -> str:
> > +        return self.option
> > +
> > +    def __repr__(self) -> str:
> > +        return f"{type(self).__name__}({self.option!r})"
>
> Intended use?
>

%s in test-qapi


> > +
> > +    def __eq__(self, other: object) -> bool:
> > +        if not isinstance(other, IfOption):
> > +            return NotImplemented
> > +        return self.option =3D=3D other.option
>
> Why raise on type mismatch?  Feels rather un-pythonic to me.
>

removed


> > +
> > +
> > +class IfAll(IfPredicate):
> > +    def __init__(self, pred_list: Sequence[IfPredicate]):
> > +        self.pred_list =3D pred_list
> > +
> > +    def cgen(self) -> str:
> > +        return " && ".join([p.cgen() for p in self.pred_list])
>
> Fragile.  See my review of PATCH 3.
>
>
ok

> +
> > +    def docgen(self) -> str:
> > +        return " and ".join([p.docgen() for p in self.pred_list])
> > +
> > +    def __bool__(self) -> bool:
> > +        return bool(self.pred_list)
>
> Not as confusing as QAPISchemaIfCond.__bool__() as long as it's kept
> well away from None.  Still, I'm not sure I like it.
>
>
removed

> +
> > +    def __repr__(self) -> str:
> > +        return f"{type(self).__name__}({self.pred_list!r})"
> > +
> > +    def __eq__(self, other: object) -> bool:
> > +        if not isinstance(other, IfAll):
> > +            return NotImplemented
> > +        return self.pred_list =3D=3D other.pred_list
>
> Same as above.
>
> Why are these classes in common.py?
>

moved to schema.py


>
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index aa4715c519..f52caaeecc 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -19,7 +19,12 @@
> >  import re
> >  from typing import Optional
> >
> > -from .common import POINTER_SUFFIX, c_name
> > +from .common import (
> > +    POINTER_SUFFIX,
> > +    IfAll,
> > +    IfOption,
> > +    c_name,
> > +)
> >  from .error import QAPIError, QAPISemError, QAPISourceError
> >  from .expr import check_exprs
> >  from .parser import QAPISchemaParser
> > @@ -28,18 +33,22 @@
> >  class QAPISchemaIfCond:
> >      def __init__(self, ifcond=3DNone):
> >          self.ifcond =3D ifcond or []
> > +        self.pred =3D IfAll([IfOption(opt) for opt in self.ifcond])
>
> In the common case of just one element, we get a no-op IfAll wrapped
> around it.  Okay.
>
> self.ifcond goes away in PATCH 7.  Okay.
>
> > +
> > +    def docgen(self):
> > +        return self.pred.docgen()
> >
> >      def cgen(self):
> > -        return ' && '.join(self.ifcond)
> > +        return self.pred.cgen()
> >
> >      # Returns true if the condition is not void
> >      def __bool__(self):
> > -        return bool(self.ifcond)
> > +        return bool(self.pred)
> >
> >      def __eq__(self, other):
> >          if not isinstance(other, QAPISchemaIfCond):
> >              return NotImplemented
> > -        return self.ifcond =3D=3D other.ifcond
> > +        return self.pred =3D=3D other.pred
>
> Not much left in this class, and it's going to get even thinner.
>

Yes, see v7.


> >
> >
> >  class QAPISchemaEntity:
> > diff --git a/tests/qapi-schema/doc-good.out
> b/tests/qapi-schema/doc-good.out
> > index 8f54ceff2e..db1d23c6bf 100644
> > --- a/tests/qapi-schema/doc-good.out
> > +++ b/tests/qapi-schema/doc-good.out
> > @@ -12,15 +12,15 @@ enum QType
> >  module doc-good.json
> >  enum Enum
> >      member one
> > -        if ['defined(IFONE)']
> > +        if IfAll([IfOption('defined(IFONE)')])
> >      member two
> > -    if ['defined(IFCOND)']
> > +    if IfAll([IfOption('defined(IFCOND)')])
> >      feature enum-feat
> >  object Base
> >      member base1: Enum optional=3DFalse
> >  object Variant1
> >      member var1: str optional=3DFalse
> > -        if ['defined(IFSTR)']
> > +        if IfAll([IfOption('defined(IFSTR)')])
> >          feature member-feat
> >      feature variant1-feat
> >  object Variant2
> > @@ -29,7 +29,7 @@ object Object
> >      tag base1
> >      case one: Variant1
> >      case two: Variant2
> > -        if ['IFTWO']
> > +        if IfAll([IfOption('IFTWO')])
> >      feature union-feat1
> >  object q_obj_Variant1-wrapper
> >      member data: Variant1 optional=3DFalse
> > @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
> >  enum SugaredUnionKind
> >      member one
> >      member two
> > -        if ['IFTWO']
> > +        if IfAll([IfOption('IFTWO')])
> >  object SugaredUnion
> >      member type: SugaredUnionKind optional=3DFalse
> >      tag type
> >      case one: q_obj_Variant1-wrapper
> >      case two: q_obj_Variant2-wrapper
> > -        if ['IFTWO']
> > +        if IfAll([IfOption('IFTWO')])
> >      feature union-feat2
> >  alternate Alternate
> >      tag type
> > diff --git a/tests/qapi-schema/qapi-schema-test.out
> b/tests/qapi-schema/qapi-schema-test.out
> > index e0b8a5f0b6..e4e0fb173a 100644
> > --- a/tests/qapi-schema/qapi-schema-test.out
> > +++ b/tests/qapi-schema/qapi-schema-test.out
> > @@ -298,65 +298,65 @@ command __org.qemu_x-command
> q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
> >  object TestIfStruct
> >      member foo: int optional=3DFalse
> >      member bar: int optional=3DFalse
> > -        if ['defined(TEST_IF_STRUCT_BAR)']
> > -    if ['defined(TEST_IF_STRUCT)']
> > +        if IfAll([IfOption('defined(TEST_IF_STRUCT_BAR)')])
> > +    if IfAll([IfOption('defined(TEST_IF_STRUCT)')])
> >  enum TestIfEnum
> >      member foo
> >      member bar
> > -        if ['defined(TEST_IF_ENUM_BAR)']
> > -    if ['defined(TEST_IF_ENUM)']
> > +        if IfAll([IfOption('defined(TEST_IF_ENUM_BAR)')])
> > +    if IfAll([IfOption('defined(TEST_IF_ENUM)')])
> >  object q_obj_TestStruct-wrapper
> >      member data: TestStruct optional=3DFalse
> >  enum TestIfUnionKind
> >      member foo
> >      member bar
> > -        if ['defined(TEST_IF_UNION_BAR)']
> > -    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
> > +        if IfAll([IfOption('defined(TEST_IF_UNION_BAR)')])
> > +    if IfAll([IfOption('defined(TEST_IF_UNION) &&
> defined(TEST_IF_STRUCT)')])
> >  object TestIfUnion
> >      member type: TestIfUnionKind optional=3DFalse
> >      tag type
> >      case foo: q_obj_TestStruct-wrapper
> >      case bar: q_obj_str-wrapper
> > -        if ['defined(TEST_IF_UNION_BAR)']
> > -    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
> > +        if IfAll([IfOption('defined(TEST_IF_UNION_BAR)')])
> > +    if IfAll([IfOption('defined(TEST_IF_UNION) &&
> defined(TEST_IF_STRUCT)')])
> >  object q_obj_test-if-union-cmd-arg
> >      member union-cmd-arg: TestIfUnion optional=3DFalse
> > -    if ['defined(TEST_IF_UNION)']
> > +    if IfAll([IfOption('defined(TEST_IF_UNION)')])
> >  command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
> >      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preco=
nfig=3DFalse
> > -    if ['defined(TEST_IF_UNION)']
> > +    if IfAll([IfOption('defined(TEST_IF_UNION)')])
> >  alternate TestIfAlternate
> >      tag type
> >      case foo: int
> >      case bar: TestStruct
> > -        if ['defined(TEST_IF_ALT_BAR)']
> > -    if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
> > +        if IfAll([IfOption('defined(TEST_IF_ALT_BAR)')])
> > +    if IfAll([IfOption('defined(TEST_IF_ALT) &&
> defined(TEST_IF_STRUCT)')])
> >  object q_obj_test-if-alternate-cmd-arg
> >      member alt-cmd-arg: TestIfAlternate optional=3DFalse
> > -    if ['defined(TEST_IF_ALT)']
> > +    if IfAll([IfOption('defined(TEST_IF_ALT)')])
> >  command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
> >      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preco=
nfig=3DFalse
> > -    if ['defined(TEST_IF_ALT)']
> > +    if IfAll([IfOption('defined(TEST_IF_ALT)')])
> >  object q_obj_test-if-cmd-arg
> >      member foo: TestIfStruct optional=3DFalse
> >      member bar: TestIfEnum optional=3DFalse
> > -        if ['defined(TEST_IF_CMD_BAR)']
> > -    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
> > +        if IfAll([IfOption('defined(TEST_IF_CMD_BAR)')])
> > +    if IfAll([IfOption('defined(TEST_IF_CMD)'),
> IfOption('defined(TEST_IF_STRUCT)')])
> >  command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
> >      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preco=
nfig=3DFalse
> > -    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
> > +    if IfAll([IfOption('defined(TEST_IF_CMD)'),
> IfOption('defined(TEST_IF_STRUCT)')])
> >  command test-cmd-return-def-three None -> UserDefThree
> >      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preco=
nfig=3DFalse
> >  array TestIfEnumList TestIfEnum
> > -    if ['defined(TEST_IF_ENUM)']
> > +    if IfAll([IfOption('defined(TEST_IF_ENUM)')])
> >  object q_obj_TEST_IF_EVENT-arg
> >      member foo: TestIfStruct optional=3DFalse
> >      member bar: TestIfEnumList optional=3DFalse
> > -        if ['defined(TEST_IF_EVT_BAR)']
> > -    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
> > +        if IfAll([IfOption('defined(TEST_IF_EVT_BAR)')])
> > +    if IfAll([IfOption('defined(TEST_IF_EVT) &&
> defined(TEST_IF_STRUCT)')])
> >  event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
> >      boxed=3DFalse
> > -    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
> > +    if IfAll([IfOption('defined(TEST_IF_EVT) &&
> defined(TEST_IF_STRUCT)')])
> >  object FeatureStruct0
> >      member foo: int optional=3DFalse
> >  object FeatureStruct1
> > @@ -379,17 +379,17 @@ object FeatureStruct4
> >  object CondFeatureStruct1
> >      member foo: int optional=3DFalse
> >      feature feature1
> > -        if ['defined(TEST_IF_FEATURE_1)']
> > +        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
> >  object CondFeatureStruct2
> >      member foo: int optional=3DFalse
> >      feature feature1
> > -        if ['defined(TEST_IF_FEATURE_1)']
> > +        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
> >      feature feature2
> > -        if ['defined(TEST_IF_FEATURE_2)']
> > +        if IfAll([IfOption('defined(TEST_IF_FEATURE_2)')])
> >  object CondFeatureStruct3
> >      member foo: int optional=3DFalse
> >      feature feature1
> > -        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
> > +        if IfAll([IfOption('defined(TEST_IF_COND_1)'),
> IfOption('defined(TEST_IF_COND_2)')])
> >  enum FeatureEnum1
> >      member eins
> >      member zwei
> > @@ -429,17 +429,17 @@ command test-command-features3 None -> None
> >  command test-command-cond-features1 None -> None
> >      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preco=
nfig=3DFalse
> >      feature feature1
> > -        if ['defined(TEST_IF_FEATURE_1)']
> > +        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
> >  command test-command-cond-features2 None -> None
> >      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preco=
nfig=3DFalse
> >      feature feature1
> > -        if ['defined(TEST_IF_FEATURE_1)']
> > +        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
> >      feature feature2
> > -        if ['defined(TEST_IF_FEATURE_2)']
> > +        if IfAll([IfOption('defined(TEST_IF_FEATURE_2)')])
> >  command test-command-cond-features3 None -> None
> >      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preco=
nfig=3DFalse
> >      feature feature1
> > -        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
> > +        if IfAll([IfOption('defined(TEST_IF_COND_1)'),
> IfOption('defined(TEST_IF_COND_2)')])
> >  event TEST_EVENT_FEATURES0 FeatureStruct1
> >      boxed=3DFalse
> >  event TEST_EVENT_FEATURES1 None
> > diff --git a/tests/qapi-schema/test-qapi.py
> b/tests/qapi-schema/test-qapi.py
> > index 2ec328b22e..631e255fba 100755
> > --- a/tests/qapi-schema/test-qapi.py
> > +++ b/tests/qapi-schema/test-qapi.py
> > @@ -95,7 +95,7 @@ def _print_variants(variants):
> >      @staticmethod
> >      def _print_if(ifcond, indent=3D4):
> >          if ifcond:
> > -            print('%sif %s' % (' ' * indent, ifcond.ifcond))
> > +            print('%sif %s' % (' ' * indent, ifcond.pred))
> >
> >      @classmethod
> >      def _print_features(cls, features, indent=3D4):
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000016fa8205c507d564
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 14, 2021 at 6:39 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">a=
rmbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The following patches are going to express schema &#39;if&#39; conditi=
ons in a<br>
&gt; target language agnostic way. For that, let&#39;s start building a pre=
dicate<br>
&gt; tree of the configuration options.<br>
&gt;<br>
&gt; This intermediary steps still uses C-preprocessor expressions as<br>
&gt; the predicates:<br>
&gt;<br>
&gt; &quot;if: [STR, ..]&quot; is translated to a &quot;IfCond -&gt; IfAll =
-&gt;<br>
&gt; [IfOption, ..]&quot; tree, which will generate &quot;#if STR &amp;&amp=
; ..&quot; C code.<br>
&gt;<br>
&gt; Once the boolean operation tree nodes are introduced, the &#39;if&#39;=
<br>
&gt; expressions will be converted to replace the C syntax (no more<br>
&gt; !defined(), &amp;&amp;, ...) and based only on option identifiers.<br>
&gt;<br>
&gt; For now, the condition tree will be less expressive than a full C macr=
o<br>
&gt; expression as it will only support these operations: &#39;all&#39;, &#=
39;any&#39; and<br>
&gt; &#39;not&#39;, the only ones needed so far.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
&gt;=C2=A0 scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 53 ++++++++++++++++++++++-<br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 17 ++++++--<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 12 +++---<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.out | 58 +++++++++++++-------=
------<br>
&gt;=C2=A0 tests/qapi-schema/test-qapi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
&gt;=C2=A0 6 files changed, 103 insertions(+), 45 deletions(-)<br>
&gt;<br>
&gt; diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py<br>
&gt; index b737949007..0f87fb16ce 100644<br>
&gt; --- a/docs/sphinx/qapidoc.py<br>
&gt; +++ b/docs/sphinx/qapidoc.py<br>
&gt; @@ -112,12 +112,10 @@ def _make_section(self, title):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _nodes_for_ifcond(self, ifcond, with_if=3DTrue=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return list of Tex=
t, literal nodes for the ifcond<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return a list which gives text like &#39;=
 (If: cond1, cond2, cond3)&#39;, where<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 the conditions are in literal-text and th=
e commas are not.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return a list which gives text like &#39;=
 (If: condition)&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If with_if is False, we don&#39;t re=
turn the &quot;(If: &quot; and &quot;)&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D intersperse([nodes.literal(&=
#39;&#39;, c) for c in ifcond.ifcond],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodes.Text(&#39;, &#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D [nodes.literal(&#39;&#39;, i=
fcond.docgen())]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not with_if:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return condlist<br>
&gt;=C2=A0 <br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index c305aaf2f1..01e3203545 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -12,7 +12,7 @@<br>
&gt;=C2=A0 # See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import re<br>
&gt; -from typing import Match, Optional<br>
&gt; +from typing import Match, Optional, Sequence<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #: Magic string that gets removed along with all space to its ri=
ght.<br>
&gt; @@ -214,3 +214,54 @@ def must_match(pattern: str, string: str) -&gt; M=
atch[str]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 match =3D re.match(pattern, string)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert match is not None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return match<br>
&gt; +<br>
&gt; +<br>
&gt; +class IfPredicate:<br>
<br>
This is the abstract base class of the two (soon four) forms &#39;if&#39;.<=
br>
qapi-code-gen.txt calls them &quot;conditionals&quot;, and the code so far =
uses<br>
names like @ifcond.=C2=A0 I&#39;d prefer not to throw &quot;predicate&quot;=
 into the<br>
cauldron.=C2=A0 IfCond?=C2=A0 IfConditional?<br>
<br></blockquote><div><br></div><div>ok<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;An &#39;if&#39; condition predicate&q=
uot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def cgen(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise NotImplementedError()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def docgen(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise NotImplementedError()<br>
&gt; +<br>
&gt; +<br>
&gt; +class IfOption(IfPredicate):<br>
<br>
The name IfOption tells me nothing.<br>
<br>
At this point in the series, the IfOption are arbitrary C preprocessor<br>
expressions.<br>
<br>
At the end of the series, they are operands of the C preprocessor&#39;s<br>
unary operator defined, i.e. a C macro name.<br>
<br>
Once I know that, IfOption kind of makes sense.=C2=A0 Hmm.=C2=A0 IfConfigOp=
tion?<br>
IfIdentifier?=C2=A0 IfLeaf?=C2=A0 I&#39;m not quite sure which one I dislik=
e the least<br>
:)<br></blockquote><div><br></div><div>Ok IfConfigOption.<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, option: str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.option =3D option<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def cgen(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.option<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def docgen(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.option<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __repr__(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;{type(self).__name__}({self=
.option!r})&quot;<br>
<br>
Intended use?<br></blockquote><div><br></div><div>%s in test-qapi</div><div=
> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __eq__(self, other: object) -&gt; bool:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, IfOption):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NotImplemented<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.option =3D=3D other.option<br=
>
<br>
Why raise on type mismatch?=C2=A0 Feels rather un-pythonic to me.<br></bloc=
kquote><div><br></div><div>removed</div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +<br>
&gt; +class IfAll(IfPredicate):<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, pred_list: Sequence[IfPredicate]):<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pred_list =3D pred_list<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def cgen(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot; &amp;&amp; &quot;.join([p.c=
gen() for p in self.pred_list])<br>
<br>
Fragile.=C2=A0 See my review of PATCH 3.<br>
<br></blockquote><div><br></div><div>ok</div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def docgen(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot; and &quot;.join([p.docgen()=
 for p in self.pred_list])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __bool__(self) -&gt; bool:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.pred_list)<br>
<br>
Not as confusing as QAPISchemaIfCond.__bool__() as long as it&#39;s kept<br=
>
well away from None.=C2=A0 Still, I&#39;m not sure I like it.<br>
<br></blockquote><div><br></div><div>removed</div><div> <br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __repr__(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;{type(self).__name__}({self=
.pred_list!r})&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __eq__(self, other: object) -&gt; bool:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, IfAll):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NotImplemented<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred_list =3D=3D other.pred_l=
ist<br>
<br>
Same as above.<br>
<br>
Why are these classes in common.py?<br></blockquote><div><br></div><div>mov=
ed to schema.py<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index aa4715c519..f52caaeecc 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -19,7 +19,12 @@<br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 from typing import Optional<br>
&gt;=C2=A0 <br>
&gt; -from .common import POINTER_SUFFIX, c_name<br>
&gt; +from .common import (<br>
&gt; +=C2=A0 =C2=A0 POINTER_SUFFIX,<br>
&gt; +=C2=A0 =C2=A0 IfAll,<br>
&gt; +=C2=A0 =C2=A0 IfOption,<br>
&gt; +=C2=A0 =C2=A0 c_name,<br>
&gt; +)<br>
&gt;=C2=A0 from .error import QAPIError, QAPISemError, QAPISourceError<br>
&gt;=C2=A0 from .expr import check_exprs<br>
&gt;=C2=A0 from .parser import QAPISchemaParser<br>
&gt; @@ -28,18 +33,22 @@<br>
&gt;=C2=A0 class QAPISchemaIfCond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pred =3D IfAll([IfOption(opt) for op=
t in self.ifcond])<br>
<br>
In the common case of just one element, we get a no-op IfAll wrapped<br>
around it.=C2=A0 Okay.<br>
<br>
self.ifcond goes away in PATCH 7.=C2=A0 Okay.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def docgen(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred.docgen()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def cgen(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39; &amp;&amp; &#39;.join(self.i=
fcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred.cgen()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Returns true if the condition is not void<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __bool__(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.pred)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __eq__(self, other):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, QAPISchemaI=
fCond):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NotImplemented<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.ifcond =3D=3D other.ifcond<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred =3D=3D other.pred<br>
<br>
Not much left in this class, and it&#39;s going to get even thinner.<br></b=
lockquote><div><br></div><div>Yes, see v7.</div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class QAPISchemaEntity:<br>
&gt; diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-go=
od.out<br>
&gt; index 8f54ceff2e..db1d23c6bf 100644<br>
&gt; --- a/tests/qapi-schema/doc-good.out<br>
&gt; +++ b/tests/qapi-schema/doc-good.out<br>
&gt; @@ -12,15 +12,15 @@ enum QType<br>
&gt;=C2=A0 module doc-good.json<br>
&gt;=C2=A0 enum Enum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member one<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(IFONE)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(IFONE)&#3=
9;)])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member two<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(IFCOND)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(IFCOND)&#39;)])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature enum-feat<br>
&gt;=C2=A0 object Base<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member base1: Enum optional=3DFalse<br>
&gt;=C2=A0 object Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member var1: str optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(IFSTR)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(IFSTR)&#3=
9;)])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature member-feat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature variant1-feat<br>
&gt;=C2=A0 object Variant2<br>
&gt; @@ -29,7 +29,7 @@ object Object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag base1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case one: Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case two: Variant2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;IFTWO&#39;)])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature union-feat1<br>
&gt;=C2=A0 object q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member data: Variant1 optional=3DFalse<br>
&gt; @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper<br>
&gt;=C2=A0 enum SugaredUnionKind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member two<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;IFTWO&#39;)])<br>
&gt;=C2=A0 object SugaredUnion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member type: SugaredUnionKind optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case one: q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case two: q_obj_Variant2-wrapper<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;IFTWO&#39;)])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature union-feat2<br>
&gt;=C2=A0 alternate Alternate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag type<br>
&gt; diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schem=
a/qapi-schema-test.out<br>
&gt; index e0b8a5f0b6..e4e0fb173a 100644<br>
&gt; --- a/tests/qapi-schema/qapi-schema-test.out<br>
&gt; +++ b/tests/qapi-schema/qapi-schema-test.out<br>
&gt; @@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-=
command-arg -&gt; __org.qemu_x-Unio<br>
&gt;=C2=A0 object TestIfStruct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member bar: int optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_STRUCT_BAR)&#39;=
]<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_S=
TRUCT_BAR)&#39;)])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_STRUCT)&#39;)])=
<br>
&gt;=C2=A0 enum TestIfEnum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member bar<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ENUM_BAR)&#39;]<=
br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ENUM)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_E=
NUM_BAR)&#39;)])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_ENUM)&#39;)])<b=
r>
&gt;=C2=A0 object q_obj_TestStruct-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member data: TestStruct optional=3DFalse<br>
&gt;=C2=A0 enum TestIfUnionKind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member bar<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION_BAR)&#39;]=
<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION) &amp;&amp; defined(TEST=
_IF_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_U=
NION_BAR)&#39;)])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_UNION) &amp;&am=
p; defined(TEST_IF_STRUCT)&#39;)])<br>
&gt;=C2=A0 object TestIfUnion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member type: TestIfUnionKind optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case foo: q_obj_TestStruct-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case bar: q_obj_str-wrapper<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION_BAR)&#39;]=
<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION) &amp;&amp; defined(TEST=
_IF_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_U=
NION_BAR)&#39;)])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_UNION) &amp;&am=
p; defined(TEST_IF_STRUCT)&#39;)])<br>
&gt;=C2=A0 object q_obj_test-if-union-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member union-cmd-arg: TestIfUnion optional=3DFalse=
<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_UNION)&#39;)])<=
br>
&gt;=C2=A0 command test-if-union-cmd q_obj_test-if-union-cmd-arg -&gt; None=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen=3DTrue success_response=3DTrue boxed=3DFalse o=
ob=3DFalse preconfig=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_UNION)&#39;)])<=
br>
&gt;=C2=A0 alternate TestIfAlternate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case foo: int<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case bar: TestStruct<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ALT_BAR)&#39;]<b=
r>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ALT) &amp;&amp; defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_A=
LT_BAR)&#39;)])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_ALT) &amp;&amp;=
 defined(TEST_IF_STRUCT)&#39;)])<br>
&gt;=C2=A0 object q_obj_test-if-alternate-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member alt-cmd-arg: TestIfAlternate optional=3DFal=
se<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ALT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_ALT)&#39;)])<br=
>
&gt;=C2=A0 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -&=
gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen=3DTrue success_response=3DTrue boxed=3DFalse o=
ob=3DFalse preconfig=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ALT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_ALT)&#39;)])<br=
>
&gt;=C2=A0 object q_obj_test-if-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo: TestIfStruct optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member bar: TestIfEnum optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_CMD_BAR)&#39;]<b=
r>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_CMD)&#39;, &#39;defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_C=
MD_BAR)&#39;)])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_CMD)&#39;), IfO=
ption(&#39;defined(TEST_IF_STRUCT)&#39;)])<br>
&gt;=C2=A0 command test-if-cmd q_obj_test-if-cmd-arg -&gt; UserDefThree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen=3DTrue success_response=3DTrue boxed=3DFalse o=
ob=3DFalse preconfig=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_CMD)&#39;, &#39;defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_CMD)&#39;), IfO=
ption(&#39;defined(TEST_IF_STRUCT)&#39;)])<br>
&gt;=C2=A0 command test-cmd-return-def-three None -&gt; UserDefThree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen=3DTrue success_response=3DTrue boxed=3DFalse o=
ob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 array TestIfEnumList TestIfEnum<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ENUM)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_ENUM)&#39;)])<b=
r>
&gt;=C2=A0 object q_obj_TEST_IF_EVENT-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo: TestIfStruct optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member bar: TestIfEnumList optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_EVT_BAR)&#39;]<b=
r>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_EVT) &amp;&amp; defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_E=
VT_BAR)&#39;)])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_EVT) &amp;&amp;=
 defined(TEST_IF_STRUCT)&#39;)])<br>
&gt;=C2=A0 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 boxed=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_EVT) &amp;&amp; defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_EVT) &amp;&amp;=
 defined(TEST_IF_STRUCT)&#39;)])<br>
&gt;=C2=A0 object FeatureStruct0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo: int optional=3DFalse<br>
&gt;=C2=A0 object FeatureStruct1<br>
&gt; @@ -379,17 +379,17 @@ object FeatureStruct4<br>
&gt;=C2=A0 object CondFeatureStruct1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_1)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_F=
EATURE_1)&#39;)])<br>
&gt;=C2=A0 object CondFeatureStruct2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_1)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_F=
EATURE_1)&#39;)])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature feature2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_2)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_F=
EATURE_2)&#39;)])<br>
&gt;=C2=A0 object CondFeatureStruct3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_COND_1)&#39;, &#=
39;defined(TEST_IF_COND_2)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_C=
OND_1)&#39;), IfOption(&#39;defined(TEST_IF_COND_2)&#39;)])<br>
&gt;=C2=A0 enum FeatureEnum1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member eins<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member zwei<br>
&gt; @@ -429,17 +429,17 @@ command test-command-features3 None -&gt; None<b=
r>
&gt;=C2=A0 command test-command-cond-features1 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen=3DTrue success_response=3DTrue boxed=3DFalse o=
ob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_1)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_F=
EATURE_1)&#39;)])<br>
&gt;=C2=A0 command test-command-cond-features2 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen=3DTrue success_response=3DTrue boxed=3DFalse o=
ob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_1)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_F=
EATURE_1)&#39;)])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature feature2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_2)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_F=
EATURE_2)&#39;)])<br>
&gt;=C2=A0 command test-command-cond-features3 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen=3DTrue success_response=3DTrue boxed=3DFalse o=
ob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_COND_1)&#39;, &#=
39;defined(TEST_IF_COND_2)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(TEST_IF_C=
OND_1)&#39;), IfOption(&#39;defined(TEST_IF_COND_2)&#39;)])<br>
&gt;=C2=A0 event TEST_EVENT_FEATURES0 FeatureStruct1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 boxed=3DFalse<br>
&gt;=C2=A0 event TEST_EVENT_FEATURES1 None<br>
&gt; diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-q=
api.py<br>
&gt; index 2ec328b22e..631e255fba 100755<br>
&gt; --- a/tests/qapi-schema/test-qapi.py<br>
&gt; +++ b/tests/qapi-schema/test-qapi.py<br>
&gt; @@ -95,7 +95,7 @@ def _print_variants(variants):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 @staticmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _print_if(ifcond, indent=3D4):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;%sif %s&#39; % (=
&#39; &#39; * indent, ifcond.ifcond))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;%sif %s&#39; % (=
&#39; &#39; * indent, ifcond.pred))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @classmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _print_features(cls, features, indent=3D4):<br=
>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000016fa8205c507d564--

