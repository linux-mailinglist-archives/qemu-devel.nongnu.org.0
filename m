Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE53A975A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:32:02 +0200 (CEST)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltSq1-0006bd-Ab
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ltSn8-0004PS-NN
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:29:03 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ltSn2-0000iA-KR
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:29:02 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t3so1973851edc.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 03:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZwmOY7AO7t27mei+23yAQKkc3mgZdpGaAEX0YS28OQ=;
 b=tNEEhCZi8z2ISFEvSGzmJFxv6pz2suLzodmDpgaHLd3JVxY8nQE01T7YkqP0iY+s0/
 zWRSLakJOssg8gwmM7qB2btj/x6iWTW8ZBSkicOXYhRNKZ/3T2B0tRh0FdP2KnFvRhtK
 u12uSDDbdqNU7BQ+axPPoFrunGWAL9S0OW+3DjDy1pDgVlzxldCgh2wBfrzOAdLXK/FW
 j59BHdFA54YOrvvh8CT2Vq+TsUhXeducBPnQjw/QRBVJj1kxrrdPciyFcY4Tje1LCx6x
 UWU0tZAIzdCcNh0yOwvmBRWIZHBFSTDy6hKwhEW8N9rXHuzk6XUU5yvpzmXBICoySDsJ
 nxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZwmOY7AO7t27mei+23yAQKkc3mgZdpGaAEX0YS28OQ=;
 b=NQ8DsNzF8DArDJSuU4xMovzofPm6hb/tYRQYbXNivNjHO+oUAnepqD+uDbXmG400yH
 vShQ/XGh24aNEjdzyrIbDWHiTYCyzbPKjd2Sc4tODdOLol9K3zsjp6Z1JqRn4HOy8t7g
 xYshwVpJw9BzQDggJ3mzITPCHkm6QvSDlOYNjyhXx3WHnIaTIDMoudxctxdRex1d1epZ
 emsWQl0yV3rteSUhKBwNx3XF+yRaJupHK7QGJfRSTc1NTkCFuvvA+tul4W8ubYJ7bFwv
 qRcBBi4f7CRwFq7MepxuZ004XOA7PugzKCnyCy7zgiOkoJtmlwE0BdoILbHbQVdH4SsK
 NPpg==
X-Gm-Message-State: AOAM533sj+7rM3A308de5DfsuXPoZU3cWHsiTggdWlgo0NiRfCeh0L0Y
 clYgr2Qrh8Vn5LVgWE/FqMMZgQT52+P4HbGH+SE=
X-Google-Smtp-Source: ABdhPJx90tx7RV0To1YtsZejryrM6+909iWUoXhUAry1asYIEiBKUi9xgOGmrVJuYawO+b7BMZWJ/9k9h9QFFcOigfs=
X-Received: by 2002:a05:6402:cb5:: with SMTP id
 cn21mr3221564edb.164.1623839334443; 
 Wed, 16 Jun 2021 03:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-3-marcandre.lureau@redhat.com>
 <87im2g1vug.fsf@dusky.pond.sub.org>
In-Reply-To: <87im2g1vug.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Jun 2021 14:28:41 +0400
Message-ID: <CAJ+F1CKiO9TMbdu1dFShv-iEED0nXwnDD7UbrK92by9T_aLdXg@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] qapi: replace List[str] by QAPISchemaIfCond
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b3ac6f05c4df8e2e"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52d.google.com
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

--000000000000b3ac6f05c4df8e2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 14, 2021 at 4:20 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Wrap the 'if' condition in a higher-level object. Not only does this
>
> I can see "wrap in an object".  I'm afraid don't get what makes it
> "higher-level".
>

ok


> > provide more type safety but it also enables further refactoring withou=
t
> > too much churn.
>
> I figure by "more type safety" you mean "can't accidentally confuse some
> other list of strings with a conditional", which is true, but isn't
> really about *type* safety.
>
> Maybe:
>
>   Wrap the 'if' condition in an object.  Not only is this a bit safer,
>   it also enables further refactoring without too much churn.
>
>
ok

> The following patches will change the syntax of the schema 'if'
> > conditions to be predicate expressions, and will generate code for
> > different target languages (C, and Rust in another series).
>
> Since different target languages aren't actually generated in this
> series, I'd say "and will enable generating code for different target
> languages, such as Rust."
>

ok


> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/sphinx/qapidoc.py         |  2 +-
> >  scripts/qapi/commands.py       |  4 +-
> >  scripts/qapi/events.py         |  5 ++-
> >  scripts/qapi/gen.py            | 14 +++----
> >  scripts/qapi/introspect.py     | 26 ++++++------
> >  scripts/qapi/schema.py         | 74 +++++++++++++++++++++++-----------
> >  scripts/qapi/types.py          | 33 +++++++--------
> >  scripts/qapi/visit.py          | 23 ++++++-----
> >  tests/qapi-schema/test-qapi.py |  2 +-
> >  9 files changed, 106 insertions(+), 77 deletions(-)
> >
> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> > index 87c67ab23f..b737949007 100644
> > --- a/docs/sphinx/qapidoc.py
> > +++ b/docs/sphinx/qapidoc.py
> > @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue)=
:
> >          the conditions are in literal-text and the commas are not.
> >          If with_if is False, we don't return the "(If: " and ")".
> >          """
> > -        condlist =3D intersperse([nodes.literal('', c) for c in ifcond=
],
> > +        condlist =3D intersperse([nodes.literal('', c) for c in
> ifcond.ifcond],
> >                                 nodes.Text(', '))
> >          if not with_if:
> >              return condlist
>
> Note for later: many hunks replace ifcond (the unwrapped Sequence[str])
> by ifcond.ifcond (the wrapped one, with the wrapper peeled off).
> Mechanical.
>
> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > index 0e13d51054..3654825968 100644
> > --- a/scripts/qapi/commands.py
> > +++ b/scripts/qapi/commands.py
> > @@ -17,7 +17,6 @@
> >      Dict,
> >      List,
> >      Optional,
> > -    Sequence,
> >      Set,
> >  )
> >
> > @@ -31,6 +30,7 @@
> >  from .schema import (
> >      QAPISchema,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >      QAPISchemaType,
> >  )
> > @@ -301,7 +301,7 @@ def visit_end(self) -> None:
> >      def visit_command(self,
> >                        name: str,
> >                        info: Optional[QAPISourceInfo],
> > -                      ifcond: Sequence[str],
> > +                      ifcond: QAPISchemaIfCond,
> >                        features: List[QAPISchemaFeature],
> >                        arg_type: Optional[QAPISchemaObjectType],
> >                        ret_type: Optional[QAPISchemaType],
>
> Note for later: many hunks replace ifcond: Sequence[str] or
> Iterable[str] by ifcond: QAPISchemaIfCond.  Mechanical.
>
> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> > index fee8c671e7..82475e84ec 100644
> > --- a/scripts/qapi/events.py
> > +++ b/scripts/qapi/events.py
> > @@ -12,7 +12,7 @@
> >  See the COPYING file in the top-level directory.
> >  """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >  from .common import c_enum_const, c_name, mcgen
> >  from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
> > @@ -20,6 +20,7 @@
> >      QAPISchema,
> >      QAPISchemaEnumMember,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >  )
> >  from .source import QAPISourceInfo
> > @@ -227,7 +228,7 @@ def visit_end(self) -> None:
> >      def visit_event(self,
> >                      name: str,
> >                      info: Optional[QAPISourceInfo],
> > -                    ifcond: Sequence[str],
> > +                    ifcond: QAPISchemaIfCond,
> >                      features: List[QAPISchemaFeature],
> >                      arg_type: Optional[QAPISchemaObjectType],
> >                      boxed: bool) -> None:
> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> > index 1fa503bdbd..1c5b190276 100644
> > --- a/scripts/qapi/gen.py
> > +++ b/scripts/qapi/gen.py
> > @@ -18,7 +18,6 @@
> >      Dict,
> >      Iterator,
> >      Optional,
> > -    Sequence,
> >      Tuple,
> >  )
> >
> > @@ -32,6 +31,7 @@
> >      mcgen,
> >  )
> >  from .schema import (
> > +    QAPISchemaIfCond,
> >      QAPISchemaModule,
> >      QAPISchemaObjectType,
> >      QAPISchemaVisitor,
> > @@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
> >                  fp.write(text)
> >
> >
> > -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> st=
r:
> > +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) ->
> str:
> >      if before =3D=3D after:
> >          return after   # suppress empty #if ... #endif
> >
> > @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str,
> after: str) -> str:
> >      if added[0] =3D=3D '\n':
> >          out +=3D '\n'
> >          added =3D added[1:]
> > -    out +=3D gen_if(ifcond)
> > +    out +=3D gen_if(ifcond.ifcond)
> >      out +=3D added
> > -    out +=3D gen_endif(ifcond)
> > +    out +=3D gen_endif(ifcond.ifcond)
> >      return out
> >
> >
> > @@ -127,9 +127,9 @@ def build_params(arg_type:
> Optional[QAPISchemaObjectType],
> >  class QAPIGenCCode(QAPIGen):
> >      def __init__(self, fname: str):
> >          super().__init__(fname)
> > -        self._start_if: Optional[Tuple[Sequence[str], str, str]] =3D N=
one
> > +        self._start_if: Optional[Tuple[QAPISchemaIfCond, str, str]] =
=3D
> None
> >
> > -    def start_if(self, ifcond: Sequence[str]) -> None:
> > +    def start_if(self, ifcond: QAPISchemaIfCond) -> None:
> >          assert self._start_if is None
> >          self._start_if =3D (ifcond, self._body, self._preamble)
> >
> > @@ -187,7 +187,7 @@ def _bottom(self) -> str:
> >
> >
> >  @contextmanager
> > -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) ->
> Iterator[None]:
> > +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) ->
> Iterator[None]:
> >      """
> >      A with-statement context manager that wraps with `start_if()` /
> `end_if()`.
> >
> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> > index 9a348ca2e5..77a8c33ad4 100644
> > --- a/scripts/qapi/introspect.py
> > +++ b/scripts/qapi/introspect.py
> > @@ -15,11 +15,9 @@
> >      Any,
> >      Dict,
> >      Generic,
> > -    Iterable,
> >      List,
> >      Optional,
> >      Sequence,
> > -    Tuple,
> >      TypeVar,
> >      Union,
> >  )
> > @@ -38,6 +36,7 @@
> >      QAPISchemaEntity,
> >      QAPISchemaEnumMember,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >      QAPISchemaObjectTypeMember,
> >      QAPISchemaType,
> > @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):
> >      """
> >      # TODO: Remove after Python 3.7 adds @dataclass:
> >      # pylint: disable=3Dtoo-few-public-methods
> > -    def __init__(self, value: _ValueT, ifcond: Iterable[str],
> > +    def __init__(self, value: _ValueT, ifcond: QAPISchemaIfCond,
> >                   comment: Optional[str] =3D None):
> >          self.value =3D value
> >          self.comment: Optional[str] =3D comment
> > -        self.ifcond: Tuple[str, ...] =3D tuple(ifcond)
> > +        self.ifcond =3D ifcond
> >
> >
> >  def _tree_to_qlit(obj: JSONValue,
> > @@ -125,10 +124,10 @@ def indent(level: int) -> str:
> >          if obj.comment:
> >              ret +=3D indent(level) + f"/* {obj.comment} */\n"
> >          if obj.ifcond:
> > -            ret +=3D gen_if(obj.ifcond)
> > +            ret +=3D gen_if(obj.ifcond.ifcond)
> >          ret +=3D _tree_to_qlit(obj.value, level)
> >          if obj.ifcond:
> > -            ret +=3D '\n' + gen_endif(obj.ifcond)
> > +            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
> >          return ret
> >
> >      ret =3D ''
> > @@ -254,7 +253,7 @@ def _gen_features(features:
> Sequence[QAPISchemaFeature]
> >          return [Annotated(f.name, f.ifcond) for f in features]
> >
> >      def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
> > -                  ifcond: Sequence[str] =3D (),
> > +                  ifcond: QAPISchemaIfCond =3D QAPISchemaIfCond(),
>
> The same QAPISchemaIfCond object gets reused every time we don't pass an
> @ifcond argument.  Looks a bit scary, but works, because we don't ever
> mutate it.
>
> Elsewhere, we None as default, though: QAPISchemaEntity.__init__(),
> QAPISchemaMember.__init__().
>

A mechanical change, isn't it?


> >                    features: Sequence[QAPISchemaFeature] =3D ()) -> Non=
e:
> >          """
> >          Build and append a SchemaInfo object to self._trees.
> > @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >          self._gen_tree(name, 'builtin', {'json-type': json_type})
> >
> >      def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo=
],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                          features: List[QAPISchemaFeature],
> >                          members: List[QAPISchemaEnumMember],
> >                          prefix: Optional[str]) -> None:
> > @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >          )
> >
> >      def visit_array_type(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                           element_type: QAPISchemaType) -> None:
> >          element =3D self._use_type(element_type)
> >          self._gen_tree('[' + element + ']', 'array', {'element-type':
> element},
> >                         ifcond)
> >
> >      def visit_object_type_flat(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                               ifcond: Sequence[str],
> > +                               ifcond: QAPISchemaIfCond,
> >                                 features: List[QAPISchemaFeature],
> >                                 members:
> List[QAPISchemaObjectTypeMember],
> >                                 variants: Optional[QAPISchemaVariants])
> -> None:
> > @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info:
> Optional[QAPISourceInfo],
> >          self._gen_tree(name, 'object', obj, ifcond, features)
> >
> >      def visit_alternate_type(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                               features: List[QAPISchemaFeature],
> >                               variants: QAPISchemaVariants) -> None:
> >          self._gen_tree(
> > @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >          )
> >
> >      def visit_command(self, name: str, info: Optional[QAPISourceInfo],
> > -                      ifcond: Sequence[str],
> > +                      ifcond: QAPISchemaIfCond,
> >                        features: List[QAPISchemaFeature],
> >                        arg_type: Optional[QAPISchemaObjectType],
> >                        ret_type: Optional[QAPISchemaType], gen: bool,
> > @@ -367,7 +366,8 @@ def visit_command(self, name: str, info:
> Optional[QAPISourceInfo],
> >          self._gen_tree(name, 'command', obj, ifcond, features)
> >
> >      def visit_event(self, name: str, info: Optional[QAPISourceInfo],
> > -                    ifcond: Sequence[str], features:
> List[QAPISchemaFeature],
> > +                    ifcond: QAPISchemaIfCond,
> > +                    features: List[QAPISchemaFeature],
> >                      arg_type: Optional[QAPISchemaObjectType],
> >                      boxed: bool) -> None:
> >          assert self._schema is not None
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index d1d27ff7ee..bc357ebbfa 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -25,6 +25,20 @@
> >  from .parser import QAPISchemaParser
> >
> >
> > +class QAPISchemaIfCond:
> > +    def __init__(self, ifcond=3DNone):
> > +        self.ifcond =3D ifcond or []
> > +
> > +    # Returns true if the condition is not void
> > +    def __bool__(self):
> > +        return bool(self.ifcond)
>
> I'm not sure I like this one.
>
> In the two places where we default parameter icond=3DNone, we use
>
>     ifcond or QAPISchemaIfCond()
>
> to flip to the default value we actually want.  Works as intended for
> None and for non-empty QAPISchemaIfCond.  For empty QAPISchemaIfCond, it
> throws away the value and creates a new, equivalent one.  Works, but
> kind of by accident.
>
> This is an instance of a more general problem: when I see an
> Optional[ObjectType], I expect it to be falsy if and only if it's None.
> Perhaps I shouldn't.  Doesn't mean we should press __bool__() into
> service for checking "is there a condition".  A boring non-dunder method
> might be clearer.
>
> I understand what you mean by "condition is void", but it sounds a bit
> odd to me.  How do you like "Is a condition present?"
>

The current code uses falsy values for ifcond (whether it is [], (), None
whatever). Implementing __bool__() allowed to keep the existing condition
code (ie: if ifcond).

After the wrapping object is introduced, we have "if ifcond.ifcond", which
is quite ugly.

If you think "if ifcond" isn't clear enough (with __bool__()), we can have
"if ifcond.is_present()". I don't have a preference.


> > +
> > +    def __eq__(self, other):
> > +        if not isinstance(other, QAPISchemaIfCond):
> > +            return NotImplemented
> > +        return self.ifcond =3D=3D other.ifcond
>
> Stupid question: why do we need to override __eq__()?
>
> Hmm, probably for _make_implicit_object_type().
>
>
Yes, the code works with schema objects and ifcond. I'll special case the
assertion for now, and remove that method.


> Why raise on type mismatch?  Feels rather un-pythonic to me.
>

What else should it do? Could probably be removed for now.


> > +
> > +
> >  class QAPISchemaEntity:
> >      meta: Optional[str] =3D None
> >
> > @@ -42,7 +56,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNon=
e,
> features=3DNone):
> >          # such place).
> >          self.info =3D info
> >          self.doc =3D doc
> > -        self._ifcond =3D ifcond or []
> > +        self._ifcond =3D ifcond or QAPISchemaIfCond()
> >          self.features =3D features or []
> >          self._checked =3D False
> >
> > @@ -77,7 +91,7 @@ def set_module(self, schema):
> >
> >      @property
> >      def ifcond(self):
> > -        assert self._checked
> > +        assert self._checked and isinstance(self._ifcond,
> QAPISchemaIfCond)
> >          return self._ifcond
> >
> >      def is_implicit(self):
> > @@ -601,7 +615,7 @@ def check(self, schema, seen):
> >          else:                   # simple union
> >              assert isinstance(self.tag_member.type, QAPISchemaEnumType=
)
> >              assert not self.tag_member.optional
> > -            assert self.tag_member.ifcond =3D=3D []
> > +            assert not self.tag_member.ifcond
> >          if self._tag_name:    # flat union
> >              # branches that are not explicitly covered get an empty ty=
pe
> >              cases =3D {v.name for v in self.variants}
> > @@ -646,7 +660,7 @@ def __init__(self, name, info, ifcond=3DNone):
> >          assert isinstance(name, str)
> >          self.name =3D name
> >          self.info =3D info
> > -        self.ifcond =3D ifcond or []
> > +        self.ifcond =3D ifcond or QAPISchemaIfCond()
> >          self.defined_in =3D None
> >
> >      def set_defined_in(self, name):
> > @@ -968,11 +982,13 @@ def _def_predefineds(self):
> >      def _make_features(self, features, info):
> >          if features is None:
> >              return []
> > -        return [QAPISchemaFeature(f['name'], info, f.get('if'))
> > +        return [QAPISchemaFeature(f['name'], info,
> > +                                  QAPISchemaIfCond(f.get('if')))
> >                  for f in features]
> >
> >      def _make_enum_members(self, values, info):
> > -        return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
> > +        return [QAPISchemaEnumMember(v['name'], info,
> > +                                     QAPISchemaIfCond(v.get('if')))
> >                  for v in values]
> >
>
> Note for later: several hunks wrap condition expressions in an object
> like this.  Mechanical.
>
> >      def _make_implicit_enum_type(self, name, info, ifcond, values):
> > @@ -1008,7 +1024,7 @@ def _make_implicit_object_type(self, name, info,
> ifcond, role, members):
> >              # TODO kill simple unions or implement the disjunction
> >
> >              # pylint: disable=3Dprotected-access
> > -            assert (ifcond or []) =3D=3D typ._ifcond
> > +            assert ifcond =3D=3D typ._ifcond
>
> I'm not sure I understand this part.  Leaving for later.
>
> >          else:
> >              self._def_entity(QAPISchemaObjectType(
> >                  name, info, None, ifcond, None, None, members, None))
> > @@ -1018,7 +1034,7 @@ def _def_enum_type(self, expr, info, doc):
> >          name =3D expr['enum']
> >          data =3D expr['data']
> >          prefix =3D expr.get('prefix')
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          self._def_entity(QAPISchemaEnumType(
> >              name, info, doc, ifcond, features,
> > @@ -1036,7 +1052,8 @@ def _make_member(self, name, typ, ifcond,
> features, info):
> >                                            self._make_features(features=
,
> info))
> >
> >      def _make_members(self, data, info):
> > -        return [self._make_member(key, value['type'], value.get('if'),
> > +        return [self._make_member(key, value['type'],
> > +                                  QAPISchemaIfCond(value.get('if')),
> >                                    value.get('features'), info)
> >                  for (key, value) in data.items()]
> >
> > @@ -1044,7 +1061,7 @@ def _def_struct_type(self, expr, info, doc):
> >          name =3D expr['struct']
> >          base =3D expr.get('base')
> >          data =3D expr['data']
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          self._def_entity(QAPISchemaObjectType(
> >              name, info, doc, ifcond, features, base,
> > @@ -1067,7 +1084,7 @@ def _def_union_type(self, expr, info, doc):
> >          name =3D expr['union']
> >          data =3D expr['data']
> >          base =3D expr.get('base')
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          tag_name =3D expr.get('discriminator')
> >          tag_member =3D None
> > @@ -1076,15 +1093,21 @@ def _def_union_type(self, expr, info, doc):
> >                  name, info, ifcond,
> >                  'base', self._make_members(base, info))
> >          if tag_name:
> > -            variants =3D [self._make_variant(key, value['type'],
> > -                                           value.get('if'), info)
> > -                        for (key, value) in data.items()]
> > +            variants =3D [
> > +                self._make_variant(key, value['type'],
> > +                                   QAPISchemaIfCond(value.get('if')),
> > +                                   info)
> > +                for (key, value) in data.items()
> > +            ]
>
> I think we more usually put the closing parenthesis like this:
>
>                variants =3D [
>                   ...
>                   for (key, value) in data.items()]
>
> More of the same below.
>

Works for me.


> >              members =3D []
> >          else:
> > -            variants =3D [self._make_simple_variant(key, value['type']=
,
> > -                                                  value.get('if'), inf=
o)
> > -                        for (key, value) in data.items()]
> > -            enum =3D [{'name': v.name, 'if': v.ifcond} for v in varian=
ts]
> > +            variants =3D [
> > +                self._make_simple_variant(key, value['type'],
> > +
> QAPISchemaIfCond(value.get('if')),
> > +                                          info)
> > +                for (key, value) in data.items()
> > +            ]
> > +            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in
> variants]
> >              typ =3D self._make_implicit_enum_type(name, info, ifcond,
> enum)
> >              tag_member =3D QAPISchemaObjectTypeMember('type', info, ty=
p,
> False)
> >              members =3D [tag_member]
> > @@ -1097,11 +1120,14 @@ def _def_union_type(self, expr, info, doc):
> >      def _def_alternate_type(self, expr, info, doc):
> >          name =3D expr['alternate']
> >          data =3D expr['data']
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> > -        variants =3D [self._make_variant(key, value['type'],
> value.get('if'),
> > -                                       info)
> > -                    for (key, value) in data.items()]
> > +        variants =3D [
> > +            self._make_variant(key, value['type'],
> > +                               QAPISchemaIfCond(value.get('if')),
> > +                               info)
> > +            for (key, value) in data.items()
> > +        ]
> >          tag_member =3D QAPISchemaObjectTypeMember('type', info, 'QType=
',
> False)
> >          self._def_entity(
> >              QAPISchemaAlternateType(name, info, doc, ifcond, features,
> > @@ -1118,7 +1144,7 @@ def _def_command(self, expr, info, doc):
> >          allow_oob =3D expr.get('allow-oob', False)
> >          allow_preconfig =3D expr.get('allow-preconfig', False)
> >          coroutine =3D expr.get('coroutine', False)
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          if isinstance(data, OrderedDict):
> >              data =3D self._make_implicit_object_type(
> > @@ -1137,7 +1163,7 @@ def _def_event(self, expr, info, doc):
> >          name =3D expr['event']
> >          data =3D expr.get('data')
> >          boxed =3D expr.get('boxed', False)
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          if isinstance(data, OrderedDict):
> >              data =3D self._make_implicit_object_type(
> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> > index 20d572a23a..3673cf0f49 100644
> > --- a/scripts/qapi/types.py
> > +++ b/scripts/qapi/types.py
> > @@ -13,7 +13,7 @@
> >  # See the COPYING file in the top-level directory.
> >  """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >  from .common import (
> >      c_enum_const,
> > @@ -27,6 +27,7 @@
> >      QAPISchema,
> >      QAPISchemaEnumMember,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >      QAPISchemaObjectTypeMember,
> >      QAPISchemaType,
> > @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,
> >  ''',
> >                  c_name=3Dc_name(name))
> >      for memb in members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >          index =3D c_enum_const(name, memb.name, prefix)
> >          ret +=3D mcgen('''
> >          [%(index)s] =3D "%(name)s",
> >  ''',
> >                       index=3Dindex, name=3Dmemb.name)
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >      ret +=3D mcgen('''
> >      },
> > @@ -80,12 +81,12 @@ def gen_enum(name: str,
> >                  c_name=3Dc_name(name))
> >
> >      for memb in enum_members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >          ret +=3D mcgen('''
> >      %(c_enum)s,
> >  ''',
> >                       c_enum=3Dc_enum_const(name, memb.name, prefix))
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >      ret +=3D mcgen('''
> >  } %(c_name)s;
> > @@ -125,7 +126,7 @@ def gen_array(name: str, element_type:
> QAPISchemaType) -> str:
> >  def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) ->
> str:
> >      ret =3D ''
> >      for memb in members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >          if memb.optional:
> >              ret +=3D mcgen('''
> >      bool has_%(c_name)s;
> > @@ -135,11 +136,11 @@ def gen_struct_members(members:
> List[QAPISchemaObjectTypeMember]) -> str:
> >      %(c_type)s %(c_name)s;
> >  ''',
> >                       c_type=3Dmemb.type.c_type(), c_name=3Dc_name(memb=
.name
> ))
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >      return ret
> >
> >
> > -def gen_object(name: str, ifcond: Sequence[str],
> > +def gen_object(name: str, ifcond: QAPISchemaIfCond,
> >                 base: Optional[QAPISchemaObjectType],
> >                 members: List[QAPISchemaObjectTypeMember],
> >                 variants: Optional[QAPISchemaVariants]) -> str:
> > @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],
> >      ret +=3D mcgen('''
> >
> >  ''')
> > -    ret +=3D gen_if(ifcond)
> > +    ret +=3D gen_if(ifcond.ifcond)
> >      ret +=3D mcgen('''
> >  struct %(c_name)s {
> >  ''',
> > @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],
> >      ret +=3D mcgen('''
> >  };
> >  ''')
> > -    ret +=3D gen_endif(ifcond)
> > +    ret +=3D gen_endif(ifcond.ifcond)
> >
> >      return ret
> >
> > @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) ->
> str:
> >      for var in variants.variants:
> >          if var.type.name =3D=3D 'q_empty':
> >              continue
> > -        ret +=3D gen_if(var.ifcond)
> > +        ret +=3D gen_if(var.ifcond.ifcond)
> >          ret +=3D mcgen('''
> >          %(c_type)s %(c_name)s;
> >  ''',
> >                       c_type=3Dvar.type.c_unboxed_type(),
> >                       c_name=3Dc_name(var.name))
> > -        ret +=3D gen_endif(var.ifcond)
> > +        ret +=3D gen_endif(var.ifcond.ifcond)
> >
> >      ret +=3D mcgen('''
> >      } u;
> > @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -> None:
> >      def visit_enum_type(self,
> >                          name: str,
> >                          info: Optional[QAPISourceInfo],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                          features: List[QAPISchemaFeature],
> >                          members: List[QAPISchemaEnumMember],
> >                          prefix: Optional[str]) -> None:
> > @@ -318,7 +319,7 @@ def visit_enum_type(self,
> >      def visit_array_type(self,
> >                           name: str,
> >                           info: Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                           element_type: QAPISchemaType) -> None:
> >          with ifcontext(ifcond, self._genh, self._genc):
> >              self._genh.preamble_add(gen_fwd_object_or_array(name))
> > @@ -328,7 +329,7 @@ def visit_array_type(self,
> >      def visit_object_type(self,
> >                            name: str,
> >                            info: Optional[QAPISourceInfo],
> > -                          ifcond: Sequence[str],
> > +                          ifcond: QAPISchemaIfCond,
> >                            features: List[QAPISchemaFeature],
> >                            base: Optional[QAPISchemaObjectType],
> >                            members: List[QAPISchemaObjectTypeMember],
> > @@ -351,7 +352,7 @@ def visit_object_type(self,
> >      def visit_alternate_type(self,
> >                               name: str,
> >                               info: Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                               features: List[QAPISchemaFeature],
> >                               variants: QAPISchemaVariants) -> None:
> >          with ifcontext(ifcond, self._genh):
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index 9e96f3c566..67721b2470 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -13,7 +13,7 @@
> >  See the COPYING file in the top-level directory.
> >  """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >  from .common import (
> >      c_enum_const,
> > @@ -29,6 +29,7 @@
> >      QAPISchemaEnumMember,
> >      QAPISchemaEnumType,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >      QAPISchemaObjectTypeMember,
> >      QAPISchemaType,
> > @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,
> >
> >      for memb in members:
> >          deprecated =3D 'deprecated' in [f.name for f in memb.features]
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >          if memb.optional:
> >              ret +=3D mcgen('''
> >      if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
> > @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,
> >              ret +=3D mcgen('''
> >      }
> >  ''')
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >      if variants:
> >          tag_member =3D variants.tag_member
> > @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,
> >          for var in variants.variants:
> >              case_str =3D c_enum_const(tag_member.type.name, var.name,
> >                                      tag_member.type.prefix)
> > -            ret +=3D gen_if(var.ifcond)
> > +            ret +=3D gen_if(var.ifcond.ifcond)
> >              if var.type.name =3D=3D 'q_empty':
> >                  # valid variant and nothing to do
> >                  ret +=3D mcgen('''
> > @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,
> >                               case=3Dcase_str,
> >                               c_type=3Dvar.type.c_name(), c_name=3Dc_na=
me(
> var.name))
> >
> > -            ret +=3D gen_endif(var.ifcond)
> > +            ret +=3D gen_endif(var.ifcond.ifcond)
> >          ret +=3D mcgen('''
> >      default:
> >          abort();
> > @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants:
> QAPISchemaVariants) -> str:
> >                  c_name=3Dc_name(name))
> >
> >      for var in variants.variants:
> > -        ret +=3D gen_if(var.ifcond)
> > +        ret +=3D gen_if(var.ifcond.ifcond)
> >          ret +=3D mcgen('''
> >      case %(case)s:
> >  ''',
> > @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants:
> QAPISchemaVariants) -> str:
> >          ret +=3D mcgen('''
> >          break;
> >  ''')
> > -        ret +=3D gen_endif(var.ifcond)
> > +        ret +=3D gen_endif(var.ifcond.ifcond)
> >
> >      ret +=3D mcgen('''
> >      case QTYPE_NONE:
> > @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -> None:
> >      def visit_enum_type(self,
> >                          name: str,
> >                          info: Optional[QAPISourceInfo],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                          features: List[QAPISchemaFeature],
> >                          members: List[QAPISchemaEnumMember],
> >                          prefix: Optional[str]) -> None:
> > @@ -363,7 +364,7 @@ def visit_enum_type(self,
> >      def visit_array_type(self,
> >                           name: str,
> >                           info: Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                           element_type: QAPISchemaType) -> None:
> >          with ifcontext(ifcond, self._genh, self._genc):
> >              self._genh.add(gen_visit_decl(name))
> > @@ -372,7 +373,7 @@ def visit_array_type(self,
> >      def visit_object_type(self,
> >                            name: str,
> >                            info: Optional[QAPISourceInfo],
> > -                          ifcond: Sequence[str],
> > +                          ifcond: QAPISchemaIfCond,
> >                            features: List[QAPISchemaFeature],
> >                            base: Optional[QAPISchemaObjectType],
> >                            members: List[QAPISchemaObjectTypeMember],
> > @@ -394,7 +395,7 @@ def visit_object_type(self,
> >      def visit_alternate_type(self,
> >                               name: str,
> >                               info: Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                               features: List[QAPISchemaFeature],
> >                               variants: QAPISchemaVariants) -> None:
> >          with ifcontext(ifcond, self._genh, self._genc):
> > diff --git a/tests/qapi-schema/test-qapi.py
> b/tests/qapi-schema/test-qapi.py
> > index f1c4deb9a5..2ec328b22e 100755
> > --- a/tests/qapi-schema/test-qapi.py
> > +++ b/tests/qapi-schema/test-qapi.py
> > @@ -95,7 +95,7 @@ def _print_variants(variants):
> >      @staticmethod
> >      def _print_if(ifcond, indent=3D4):
> >          if ifcond:
> > -            print('%sif %s' % (' ' * indent, ifcond))
> > +            print('%sif %s' % (' ' * indent, ifcond.ifcond))
> >
> >      @classmethod
> >      def _print_features(cls, features, indent=3D4):
>
> If feel this is a bit harder to review than necessary, because you take
> two steps at once:
>
> 1. Wrap Sequence[str] in an object
>
> 2. Add methods to the object to clean up the resulting mess some
>
> Step 1. by itself should be pretty much mechanical: adjust the type
> hints, create the wrapper object on write, peel it off on read.  The
> result will be slightly ugly in places.
>
> I'd expect step 2 to be much smaller, and easier to understand.  It
> could perhaps be split into one patch per method, but I hope it's
> reviewable just fine even without.
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b3ac6f05c4df8e2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 14, 2021 at 4:20 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">a=
rmbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Wrap the &#39;if&#39; condition in a higher-level object. Not only doe=
s this<br>
<br>
I can see &quot;wrap in an object&quot;.=C2=A0 I&#39;m afraid don&#39;t get=
 what makes it<br>
&quot;higher-level&quot;.<br></blockquote><div><br></div><div>ok</div><div>=
 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; provide more type safety but it also enables further refactoring witho=
ut<br>
&gt; too much churn.<br>
<br>
I figure by &quot;more type safety&quot; you mean &quot;can&#39;t accidenta=
lly confuse some<br>
other list of strings with a conditional&quot;, which is true, but isn&#39;=
t<br>
really about *type* safety.<br>
<br>
Maybe:<br>
<br>
=C2=A0 Wrap the &#39;if&#39; condition in an object.=C2=A0 Not only is this=
 a bit safer,<br>
=C2=A0 it also enables further refactoring without too much churn.<br>
<br></blockquote><div><br></div><div>ok</div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; The following patches will change the syntax of the schema &#39;if&#39=
;<br>
&gt; conditions to be predicate expressions, and will generate code for<br>
&gt; different target languages (C, and Rust in another series).<br>
<br>
Since different target languages aren&#39;t actually generated in this<br>
series, I&#39;d say &quot;and will enable generating code for different tar=
get<br>
languages, such as Rust.&quot;<br></blockquote><div><br></div><div>ok</div>=
<div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
&gt;=C2=A0 docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
&gt;=C2=A0 scripts/qapi/commands.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<=
br>
&gt;=C2=A0 scripts/qapi/events.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
5 ++-<br>
&gt;=C2=A0 scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
4 +++----<br>
&gt;=C2=A0 scripts/qapi/introspect.py=C2=A0 =C2=A0 =C2=A0| 26 ++++++------<=
br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 74 +++=
++++++++++++++++++++-----------<br>
&gt;=C2=A0 scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 33 +++=
++++--------<br>
&gt;=C2=A0 scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++=
+++-----<br>
&gt;=C2=A0 tests/qapi-schema/test-qapi.py |=C2=A0 2 +-<br>
&gt;=C2=A0 9 files changed, 106 insertions(+), 77 deletions(-)<br>
&gt;<br>
&gt; diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py<br>
&gt; index 87c67ab23f..b737949007 100644<br>
&gt; --- a/docs/sphinx/qapidoc.py<br>
&gt; +++ b/docs/sphinx/qapidoc.py<br>
&gt; @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the conditions are in literal-text a=
nd the commas are not.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If with_if is False, we don&#39;t re=
turn the &quot;(If: &quot; and &quot;)&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D intersperse([nodes.literal(&=
#39;&#39;, c) for c in ifcond],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D intersperse([nodes.literal(&=
#39;&#39;, c) for c in ifcond.ifcond],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodes.Text(&#39;, &#39;))<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not with_if:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return condlist<br>
<br>
Note for later: many hunks replace ifcond (the unwrapped Sequence[str])<br>
by ifcond.ifcond (the wrapped one, with the wrapper peeled off).<br>
Mechanical.<br>
<br>
&gt; diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py<br>
&gt; index 0e13d51054..3654825968 100644<br>
&gt; --- a/scripts/qapi/commands.py<br>
&gt; +++ b/scripts/qapi/commands.py<br>
&gt; @@ -17,7 +17,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt; -=C2=A0 =C2=A0 Sequence,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Set,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 <br>
&gt; @@ -31,6 +30,7 @@<br>
&gt;=C2=A0 from .schema import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaType,<br>
&gt;=C2=A0 )<br>
&gt; @@ -301,7 +301,7 @@ def visit_end(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_command(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ret_type: Optional[QAPISchemaType],<br>
<br>
Note for later: many hunks replace ifcond: Sequence[str] or<br>
Iterable[str] by ifcond: QAPISchemaIfCond.=C2=A0 Mechanical.<br>
<br>
&gt; diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py<br>
&gt; index fee8c671e7..82475e84ec 100644<br>
&gt; --- a/scripts/qapi/events.py<br>
&gt; +++ b/scripts/qapi/events.py<br>
&gt; @@ -12,7 +12,7 @@<br>
&gt;=C2=A0 See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 from .common import c_enum_const, c_name, mcgen<br>
&gt;=C2=A0 from .gen import QAPISchemaModularCVisitor, build_params, ifcont=
ext<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 from .source import QAPISourceInfo<br>
&gt; @@ -227,7 +228,7 @@ def visit_end(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_event(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 boxed: bool) -&gt; None:<br>
&gt; diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py<br>
&gt; index 1fa503bdbd..1c5b190276 100644<br>
&gt; --- a/scripts/qapi/gen.py<br>
&gt; +++ b/scripts/qapi/gen.py<br>
&gt; @@ -18,7 +18,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Iterator,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt; -=C2=A0 =C2=A0 Sequence,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Tuple,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 <br>
&gt; @@ -32,6 +31,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mcgen,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 from .schema import (<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaModule,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaVisitor,<br>
&gt; @@ -85,7 +85,7 @@ def write(self, output_dir: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp.write=
(text)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -&gt=
; str:<br>
&gt; +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if before =3D=3D after:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return after=C2=A0 =C2=A0# suppress =
empty #if ... #endif<br>
&gt;=C2=A0 <br>
&gt; @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str,=
 after: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if added[0] =3D=3D &#39;\n&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D &#39;\n&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 added =3D added[1:]<br>
&gt; -=C2=A0 =C2=A0 out +=3D gen_if(ifcond)<br>
&gt; +=C2=A0 =C2=A0 out +=3D gen_if(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 out +=3D added<br>
&gt; -=C2=A0 =C2=A0 out +=3D gen_endif(ifcond)<br>
&gt; +=C2=A0 =C2=A0 out +=3D gen_endif(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return out<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; @@ -127,9 +127,9 @@ def build_params(arg_type: Optional[QAPISchemaObje=
ctType],<br>
&gt;=C2=A0 class QAPIGenCCode(QAPIGen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, fname: str):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(fname)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_if: Optional[Tuple[Sequence[s=
tr], str, str]] =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_if: Optional[Tuple[QAPISchema=
IfCond, str, str]] =3D None<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def start_if(self, ifcond: Sequence[str]) -&gt; None:<b=
r>
&gt; +=C2=A0 =C2=A0 def start_if(self, ifcond: QAPISchemaIfCond) -&gt; None=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._start_if is None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_if =3D (ifcond, self._bo=
dy, self._preamble)<br>
&gt;=C2=A0 <br>
&gt; @@ -187,7 +187,7 @@ def _bottom(self) -&gt; str:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 @contextmanager<br>
&gt; -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -&gt; Itera=
tor[None]:<br>
&gt; +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -&gt; It=
erator[None]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 A with-statement context manager that wraps with `=
start_if()` / `end_if()`.<br>
&gt;=C2=A0 <br>
&gt; diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py<b=
r>
&gt; index 9a348ca2e5..77a8c33ad4 100644<br>
&gt; --- a/scripts/qapi/introspect.py<br>
&gt; +++ b/scripts/qapi/introspect.py<br>
&gt; @@ -15,11 +15,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Any,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Generic,<br>
&gt; -=C2=A0 =C2=A0 Iterable,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Sequence,<br>
&gt; -=C2=A0 =C2=A0 Tuple,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TypeVar,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Union,<br>
&gt;=C2=A0 )<br>
&gt; @@ -38,6 +36,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEntity,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaType,<br>
&gt; @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # TODO: Remove after Python 3.7 adds @dataclass:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 # pylint: disable=3Dtoo-few-public-methods<br>
&gt; -=C2=A0 =C2=A0 def __init__(self, value: _ValueT, ifcond: Iterable[str=
],<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, value: _ValueT, ifcond: QAPISchemaIf=
Cond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
mment: Optional[str] =3D None):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.value =3D value<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.comment: Optional[str] =3D comm=
ent<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond: Tuple[str, ...] =3D tuple(if=
cond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def _tree_to_qlit(obj: JSONValue,<br>
&gt; @@ -125,10 +124,10 @@ def indent(level: int) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.comment:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D indent(level)=
 + f&quot;/* {obj.comment} */\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond.=
ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D _tree_to_qlit(obj.value, le=
vel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen=
_endif(obj.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen=
_endif(obj.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt; @@ -254,7 +253,7 @@ def _gen_features(features: Sequence[QAPISchemaFea=
ture]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return [Annotated(<a href=3D"http://=
f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a>, f.ifcond) for f in=
 features]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _gen_tree(self, name: str, mtype: str, obj: Di=
ct[str, object],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond=
: Sequence[str] =3D (),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond=
: QAPISchemaIfCond =3D QAPISchemaIfCond(),<br>
<br>
The same QAPISchemaIfCond object gets reused every time we don&#39;t pass a=
n<br>
@ifcond argument.=C2=A0 Looks a bit scary, but works, because we don&#39;t =
ever<br>
mutate it.<br>
<br>
Elsewhere, we None as default, though: QAPISchemaEntity.__init__(),<br>
QAPISchemaMember.__init__().<br></blockquote><div><br></div><div>A mechanic=
al change, isn&#39;t it?</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
eatures: Sequence[QAPISchemaFeature] =3D ()) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Build and append a SchemaInfo object=
 to self._trees.<br>
&gt; @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info: Opti=
onal[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(name, &#39;builtin&#3=
9;, {&#39;json-type&#39;: json_type})<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_enum_type(self, name: str, info: Optiona=
l[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info: Optio=
nal[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_array_type(self, name: str, info: Option=
al[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 element =3D self._use_type(element_t=
ype)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(&#39;[&#39; + element=
 + &#39;]&#39;, &#39;array&#39;, {&#39;element-type&#39;: element},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_object_type_flat(self, name: str, info: =
Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFe=
ature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0members: List[QAPISchemaObj=
ectTypeMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants: Optional[QAPISche=
maVariants]) -&gt; None:<br>
&gt; @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info: =
Optional[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(name, &#39;object&#39=
;, obj, ifcond, features)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_alternate_type(self, name: str, info: Op=
tional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants: QAPISchemaVariants) -&gt=
; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(<br>
&gt; @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info: Op=
tional[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_command(self, name: str, info: Optional[=
QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ret_type: Optional[QAPISchemaType], gen: bool,<br>
&gt; @@ -367,7 +366,8 @@ def visit_command(self, name: str, info: Optional[=
QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(name, &#39;command&#3=
9;, obj, ifcond, features)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_event(self, name: str, info: Optional[QA=
PISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: Sequence[str], features: List[QAPISchemaFeature],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: QAPISchemaIfCond,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 boxed: bool) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._schema is not None<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index d1d27ff7ee..bc357ebbfa 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -25,6 +25,20 @@<br>
&gt;=C2=A0 from .parser import QAPISchemaParser<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +class QAPISchemaIfCond:<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Returns true if the condition is not void<br>
&gt; +=C2=A0 =C2=A0 def __bool__(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.ifcond)<br>
<br>
I&#39;m not sure I like this one.<br>
<br>
In the two places where we default parameter icond=3DNone, we use<br>
<br>
=C2=A0 =C2=A0 ifcond or QAPISchemaIfCond()<br>
<br>
to flip to the default value we actually want.=C2=A0 Works as intended for<=
br>
None and for non-empty QAPISchemaIfCond.=C2=A0 For empty QAPISchemaIfCond, =
it<br>
throws away the value and creates a new, equivalent one.=C2=A0 Works, but<b=
r>
kind of by accident.<br>
<br>
This is an instance of a more general problem: when I see an<br>
Optional[ObjectType], I expect it to be falsy if and only if it&#39;s None.=
<br>
Perhaps I shouldn&#39;t.=C2=A0 Doesn&#39;t mean we should press __bool__() =
into<br>
service for checking &quot;is there a condition&quot;.=C2=A0 A boring non-d=
under method<br>
might be clearer.<br>
<br>
I understand what you mean by &quot;condition is void&quot;, but it sounds =
a bit<br>
odd to me.=C2=A0 How do you like &quot;Is a condition present?&quot;<br></b=
lockquote><div><br></div><div>The current code uses falsy values for ifcond=
 (whether it is [], (), None whatever). Implementing __bool__() allowed to =
keep the existing condition code (ie: if ifcond).</div><div><br></div><div>=
After the wrapping object is introduced, we have &quot;if ifcond.ifcond&quo=
t;, which is quite ugly.</div><div><br></div><div>If you think &quot;if ifc=
ond&quot; isn&#39;t clear enough (with __bool__()), we can have &quot;if if=
cond.is_present()&quot;. I don&#39;t have a preference.<br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __eq__(self, other):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, QAPISchemaIfCond=
):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NotImplemented<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.ifcond =3D=3D other.ifcond<br=
>
<br>
Stupid question: why do we need to override __eq__()?<br>
<br>
Hmm, probably for _make_implicit_object_type().<br>
<br></blockquote><div><br></div><div>Yes, the code works with schema object=
s and ifcond. I&#39;ll special case the assertion for now, and remove that =
method.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Why raise on type mismatch?=C2=A0 Feels rather un-pythonic to me.<br></bloc=
kquote><div><br></div><div>What else should it do? Could probably be remove=
d for now.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 class QAPISchemaEntity:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta: Optional[str] =3D None<br>
&gt;=C2=A0 <br>
&gt; @@ -42,7 +56,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNo=
ne, features=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # such place).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.info" rel=3D"=
noreferrer" target=3D"_blank">self.info</a> =3D info<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.doc =3D doc<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ifcond =3D ifcond or QAPISchemaIfCo=
nd()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.features =3D features or []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._checked =3D False<br>
&gt;=C2=A0 <br>
&gt; @@ -77,7 +91,7 @@ def set_module(self, schema):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @property<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def ifcond(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._checked<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._checked and isinstance(self.=
_ifcond, QAPISchemaIfCond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._ifcond<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def is_implicit(self):<br>
&gt; @@ -601,7 +615,7 @@ def check(self, schema, seen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# simple union<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(self=
.tag_member.type, QAPISchemaEnumType)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not self.tag_me=
mber.optional<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self.tag_member.ifco=
nd =3D=3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not self.tag_member.=
ifcond<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._tag_name:=C2=A0 =C2=A0 # fl=
at union<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # branches that are no=
t explicitly covered get an empty type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cases =3D {<a href=3D"=
http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a> for v in sel=
f.variants}<br>
&gt; @@ -646,7 +660,7 @@ def __init__(self, name, info, ifcond=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(name, str)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.name" rel=3D"=
noreferrer" target=3D"_blank">self.name</a> =3D name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.info" rel=3D"=
noreferrer" target=3D"_blank">self.info</a> =3D info<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or QAPISchemaIfCon=
d()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.defined_in =3D None<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def set_defined_in(self, name):<br>
&gt; @@ -968,11 +982,13 @@ def _def_predefineds(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_features(self, features, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if features is None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaFeature(f[&#39;name&#39=
;], info, f.get(&#39;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaFeature(f[&#39;name&#39=
;], info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaIfCond(f.get(&#=
39;if&#39;)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in=
 features]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_enum_members(self, values, info):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&=
#39;], info, v.get(&#39;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&=
#39;], info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIf=
Cond(v.get(&#39;if&#39;)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for v in=
 values]<br>
&gt;=C2=A0 <br>
<br>
Note for later: several hunks wrap condition expressions in an object<br>
like this.=C2=A0 Mechanical.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_implicit_enum_type(self, name, info, ifc=
ond, values):<br>
&gt; @@ -1008,7 +1024,7 @@ def _make_implicit_object_type(self, name, info,=
 ifcond, role, members):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO kill simple uni=
ons or implement the disjunction<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # pylint: disable=3Dpr=
otected-access<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (ifcond or []) =3D=
=3D typ._ifcond<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert ifcond =3D=3D typ._i=
fcond<br>
<br>
I&#39;m not sure I understand this part.=C2=A0 Leaving for later.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPIS=
chemaObjectType(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, in=
fo, None, ifcond, None, None, members, None))<br>
&gt; @@ -1018,7 +1034,7 @@ def _def_enum_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;enum&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D expr.get(&#39;prefix&#39;=
)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPISchemaEnumType(=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, info, doc, ifcon=
d, features,<br>
&gt; @@ -1036,7 +1052,8 @@ def _make_member(self, name, typ, ifcond, featur=
es, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self._make_features(features, info))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_members(self, data, info):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [self._make_member(key, value[&#39=
;type&#39;], value.get(&#39;if&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [self._make_member(key, value[&#39=
;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaIfCond(value.ge=
t(&#39;if&#39;)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value.get(&#39;feat=
ures&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key=
, value) in data.items()]<br>
&gt;=C2=A0 <br>
&gt; @@ -1044,7 +1061,7 @@ def _def_struct_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;struct&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D expr.get(&#39;base&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPISchemaObjectTyp=
e(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, info, doc, ifcon=
d, features, base,<br>
&gt; @@ -1067,7 +1084,7 @@ def _def_union_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;union&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D expr.get(&#39;base&#39;)<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_name =3D expr.get(&#39;discrimin=
ator&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D None<br>
&gt; @@ -1076,15 +1093,21 @@ def _def_union_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, in=
fo, ifcond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bas=
e&#39;, self._make_members(base, info))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tag_name:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [self._make_va=
riant(key, value[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value.get(&#39;if&#39;), info)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for (key, value) in data.items()]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_va=
riant(key, value[&#39;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond(va=
lue.get(&#39;if&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, val=
ue) in data.items()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
<br>
I think we more usually put the closing parenthesis like this:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, va=
lue) in data.items()]<br>
<br>
More of the same below.<br></blockquote><div><br></div><div>Works for me.</=
div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 members =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [self._make_si=
mple_variant(key, value[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value.get(&#39;if&#39;), info)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for (key, value) in data.items()]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: =
<a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, =
&#39;if&#39;: v.ifcond} for v in variants]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_si=
mple_variant(key, value[&#39;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 QAPISchemaIfCond(value.get(&#39;if&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 info)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, val=
ue) in data.items()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: =
<a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, =
&#39;if&#39;: v.ifcond.ifcond} for v in variants]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typ =3D self._make_imp=
licit_enum_type(name, info, ifcond, enum)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D QAPISch=
emaObjectTypeMember(&#39;type&#39;, info, typ, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 members =3D [tag_membe=
r]<br>
&gt; @@ -1097,11 +1120,14 @@ def _def_union_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 def _def_alternate_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;alternate&#39;]<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [self._make_variant(key, val=
ue[&#39;type&#39;], value.get(&#39;if&#39;),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info)=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for (key, value) in data.items()]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_variant(key, val=
ue[&#39;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond(value.get(&#39;i=
f&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, value) in data.it=
ems()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D QAPISchemaObjectTypeM=
ember(&#39;type&#39;, info, &#39;QType&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaAlternateTyp=
e(name, info, doc, ifcond, features,<br>
&gt; @@ -1118,7 +1144,7 @@ def _def_command(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_oob =3D expr.get(&#39;allow-oo=
b&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_preconfig =3D expr.get(&#39;al=
low-preconfig&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coroutine =3D expr.get(&#39;coroutin=
e&#39;, False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(data, OrderedDict):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D self._make_im=
plicit_object_type(<br>
&gt; @@ -1137,7 +1163,7 @@ def _def_event(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;event&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr.get(&#39;data&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boxed =3D expr.get(&#39;boxed&#39;, =
False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(data, OrderedDict):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D self._make_im=
plicit_object_type(<br>
&gt; diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py<br>
&gt; index 20d572a23a..3673cf0f49 100644<br>
&gt; --- a/scripts/qapi/types.py<br>
&gt; +++ b/scripts/qapi/types.py<br>
&gt; @@ -13,7 +13,7 @@<br>
&gt;=C2=A0 # See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 from .common import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c_enum_const,<br>
&gt; @@ -27,6 +27,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaType,<br>
&gt; @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D c_enum_const(name, <a href=
=3D"http://memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name</a>, p=
refix)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [%(index)s] =3D &quot;%(name)s&quot;=
,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0index=3Dindex, name=3D<a href=3D"http://memb.name" rel=3D"nore=
ferrer" target=3D"_blank">memb.name</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; @@ -80,12 +81,12 @@ def gen_enum(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in enum_members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 %(c_enum)s,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_enum=3Dc_enum_const(name, <a href=3D"http://memb.name" rel=
=3D"noreferrer" target=3D"_blank">memb.name</a>, prefix))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 } %(c_name)s;<br>
&gt; @@ -125,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaT=
ype) -&gt; str:<br>
&gt;=C2=A0 def gen_struct_members(members: List[QAPISchemaObjectTypeMember]=
) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool has_%(c_name)s;<br>
&gt; @@ -135,11 +136,11 @@ def gen_struct_members(members: List[QAPISchemaO=
bjectTypeMember]) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 %(c_type)s %(c_name)s;<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_type=3Dmemb.type.c_type(), c_name=3Dc_name(<a href=3D"http:/=
/memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name</a>))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def gen_object(name: str, ifcond: Sequence[str],<br>
&gt; +def gen_object(name: str, ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base: Opt=
ional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0members: =
List[QAPISchemaObjectTypeMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants:=
 Optional[QAPISchemaVariants]) -&gt; str:<br>
&gt; @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 ret +=3D gen_if(ifcond)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D gen_if(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 struct %(c_name)s {<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt; @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 ret +=3D gen_endif(ifcond)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D gen_endif(ifcond.ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt; @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://var.type.name" =
rel=3D"noreferrer" target=3D"_blank">var.type.name</a> =3D=3D &#39;q_empty&=
#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %(c_type)s %(c_name)s;<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_type=3Dvar.type.c_unboxed_type(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_name=3Dc_name(<a href=3D"http://var.name" rel=3D"noreferrer"=
 target=3D"_blank">var.name</a>))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } u;<br>
&gt; @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -&gt; None:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -318,7 +319,7 @@ def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ifcontext(ifcond, self._genh, s=
elf._genc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genh.preamble_ad=
d(gen_fwd_object_or_array(name))<br>
&gt; @@ -328,7 +329,7 @@ def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 base: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaObjectTypeMember],<br>
&gt; @@ -351,7 +352,7 @@ def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_alternate_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants: QAPISchemaVariants) -&gt=
; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ifcontext(ifcond, self._genh):<=
br>
&gt; diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py<br>
&gt; index 9e96f3c566..67721b2470 100644<br>
&gt; --- a/scripts/qapi/visit.py<br>
&gt; +++ b/scripts/qapi/visit.py<br>
&gt; @@ -13,7 +13,7 @@<br>
&gt;=C2=A0 See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 from .common import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c_enum_const,<br>
&gt; @@ -29,6 +29,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaType,<br>
&gt; @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deprecated =3D &#39;deprecated&#39; =
in [<a href=3D"http://f.name" rel=3D"noreferrer" target=3D"_blank">f.name</=
a> for f in memb.features]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (visit_optional(v, &quot;%(name)s&quot;, &amp;o=
bj-&gt;has_%(c_name)s)) {<br>
&gt; @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D variants.tag_member<b=
r>
&gt; @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case_str =3D c_enum_co=
nst(<a href=3D"http://tag_member.type.name" rel=3D"noreferrer" target=3D"_b=
lank">tag_member.type.name</a>, <a href=3D"http://var.name" rel=3D"noreferr=
er" target=3D"_blank">var.name</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member.t=
ype.prefix)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.=
ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://v=
ar.type.name" rel=3D"noreferrer" target=3D"_blank">var.type.name</a> =3D=3D=
 &#39;q_empty&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # valid =
variant and nothing to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D=
 mcgen(&#39;&#39;&#39;<br>
&gt; @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case=3Dcase_str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_type=3Dvar.type.c_name(), c_name=
=3Dc_name(<a href=3D"http://var.name" rel=3D"noreferrer" target=3D"_blank">=
var.name</a>))<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifco=
nd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifco=
nd.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case %(case)s:<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt; @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case QTYPE_NONE:<br>
&gt; @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -&gt; None=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -363,7 +364,7 @@ def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ifcontext(ifcond, self._genh, s=
elf._genc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genh.add(gen_vis=
it_decl(name))<br>
&gt; @@ -372,7 +373,7 @@ def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 base: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaObjectTypeMember],<br>
&gt; @@ -394,7 +395,7 @@ def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_alternate_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants: QAPISchemaVariants) -&gt=
; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ifcontext(ifcond, self._genh, s=
elf._genc):<br>
&gt; diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-q=
api.py<br>
&gt; index f1c4deb9a5..2ec328b22e 100755<br>
&gt; --- a/tests/qapi-schema/test-qapi.py<br>
&gt; +++ b/tests/qapi-schema/test-qapi.py<br>
&gt; @@ -95,7 +95,7 @@ def _print_variants(variants):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 @staticmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _print_if(ifcond, indent=3D4):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;%sif %s&#39; % (=
&#39; &#39; * indent, ifcond))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;%sif %s&#39; % (=
&#39; &#39; * indent, ifcond.ifcond))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @classmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _print_features(cls, features, indent=3D4):<br=
>
<br>
If feel this is a bit harder to review than necessary, because you take<br>
two steps at once:<br>
<br>
1. Wrap Sequence[str] in an object<br>
<br>
2. Add methods to the object to clean up the resulting mess some<br>
<br>
Step 1. by itself should be pretty much mechanical: adjust the type<br>
hints, create the wrapper object on write, peel it off on read.=C2=A0 The<b=
r>
result will be slightly ugly in places.<br>
<br>
I&#39;d expect step 2 to be much smaller, and easier to understand.=C2=A0 I=
t<br>
could perhaps be split into one patch per method, but I hope it&#39;s<br>
reviewable just fine even without.<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000b3ac6f05c4df8e2e--

