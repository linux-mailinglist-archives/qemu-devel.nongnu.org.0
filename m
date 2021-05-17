Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B89382AF4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:26:36 +0200 (CEST)
Received: from localhost ([::1]:35342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libON-0005kM-C8
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libGD-0002lm-Sb
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libG8-0004Q0-5P
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kuyNXLWwOkLpi13P7OE6DcvL1CA0kxHLG/Q9RqT9GUc=;
 b=WrtuSuppV5r9v8FG+x4JPcRc0tptL/D098x+FPUD1v2Zu2TN7dbgqJIDFNXrxuERWfm/YW
 tkRvSDA/XF4KM7v5+I59Mel7DHcbciqVPPvGVAGOeRXyoaojo/85emQ4xMB3IvVfwsYcN0
 NY3pxYh0By107xLwZx2LCvSKn+t9WT8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-SnGZ3o_VNcyXVqQ8shPu6g-1; Mon, 17 May 2021 07:17:56 -0400
X-MC-Unique: SnGZ3o_VNcyXVqQ8shPu6g-1
Received: by mail-pl1-f199.google.com with SMTP id
 k3-20020a170902f283b02900f0d51a7a1cso1275489plc.22
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kuyNXLWwOkLpi13P7OE6DcvL1CA0kxHLG/Q9RqT9GUc=;
 b=btCi3Zsd9MjD+oU1gOy8w7oCMomSYu2cKTbYSLnneV4OQBKcgi07QMRnXKoAoj2UlT
 V65rtwOlDJTEmHFDOVO6kMabW7bcqiyUQbYmp0TCgV6nGJq36SQh5asFRIa8RapgXjXf
 5jDYY+woZYj2UdXjyZFEsmpzV4B/Yps30ST/nyAvpXrTUIahRDSMBvUhFZs7FYzN/Nok
 ETgLDuh5b22lVprN4keGmSM55BexvFSYQKYRG8Naut1+TRibhRwLSubBJo/L/P0+13Ai
 Ucqf44S1uRRcylLShXD9C1mUsOefVNdylBiBVJE3UR+U2wZBfEIBpmK1rKmceVnVPlYC
 ElBQ==
X-Gm-Message-State: AOAM532o9Gs65GOqonHqPPsrlAyMJjyj07scEiAGO/D0HkmpYLmyH391
 krsRpK7V+kYcb7bMJxofE4is9Hkdv3C8OFxVZKhXFYL+fiHy2YnGThRVsMj+QWtIx417ov2lRtu
 Bo8SPNhWWL9qluRxJNl2T1P2aYv/qWJY=
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr65082130pjh.97.1621250274909; 
 Mon, 17 May 2021 04:17:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4GVKcadFZK1IF/OSSvGV6KlR+uVCQAPB9FFBhIoAFjNF3qowN82x3pZ1Cl+fOPSPPNVUovCM2ZEDNNGYV/g4=
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr65082100pjh.97.1621250274493; 
 Mon, 17 May 2021 04:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-2-marcandre.lureau@redhat.com>
 <e1782f26-8ceb-f79e-19d9-3714ad79aa0f@redhat.com>
In-Reply-To: <e1782f26-8ceb-f79e-19d9-3714ad79aa0f@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 May 2021 15:17:43 +0400
Message-ID: <CAMxuvaxZDZF_=CY6h41QktAqAwHZvGwqvpTb3hfTCgxE73H3eg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] qapi: replace List[str] by QAPISchemaIfCond
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b41f0905c284be1e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b41f0905c284be1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 13, 2021 at 12:53 AM John Snow <jsnow@redhat.com> wrote:

> On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Wrap the 'if' condition in a higher-level object. Not only this allows
> > more type safety but also further refactoring without too much churn.
> >
>
> Would have done it myself if I had gotten to it first. I like having a
> named type for this, it matches the other properties we have.
>
> > The following patches will change the syntax of the schema 'if'
> > conditions to be predicate expressions, and will generate code for
> > different target languages (C, and Rust in another series).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   docs/sphinx/qapidoc.py     |  2 +-
> >   scripts/qapi/commands.py   |  4 +-
> >   scripts/qapi/events.py     |  5 ++-
> >   scripts/qapi/gen.py        | 14 +++----
> >   scripts/qapi/introspect.py | 26 ++++++-------
> >   scripts/qapi/schema.py     | 78 +++++++++++++++++++++++++++----------=
-
> >   scripts/qapi/types.py      | 33 ++++++++--------
> >   scripts/qapi/visit.py      | 23 +++++------
> >   8 files changed, 110 insertions(+), 75 deletions(-)
> >
> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> > index 87c67ab23f..b737949007 100644
> > --- a/docs/sphinx/qapidoc.py
> > +++ b/docs/sphinx/qapidoc.py
> > @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue)=
:
> >           the conditions are in literal-text and the commas are not.
> >           If with_if is False, we don't return the "(If: " and ")".
> >           """
> > -        condlist =3D intersperse([nodes.literal('', c) for c in ifcond=
],
> > +        condlist =3D intersperse([nodes.literal('', c) for c in
> ifcond.ifcond],
> >                                  nodes.Text(', '))
> >           if not with_if:
> >               return condlist
> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > index 0e13d51054..3654825968 100644
> > --- a/scripts/qapi/commands.py
> > +++ b/scripts/qapi/commands.py
> > @@ -17,7 +17,6 @@
> >       Dict,
> >       List,
> >       Optional,
> > -    Sequence,
> >       Set,
> >   )
> >
> > @@ -31,6 +30,7 @@
> >   from .schema import (
> >       QAPISchema,
> >       QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >       QAPISchemaObjectType,
> >       QAPISchemaType,
> >   )
> > @@ -301,7 +301,7 @@ def visit_end(self) -> None:
> >       def visit_command(self,
> >                         name: str,
> >                         info: Optional[QAPISourceInfo],
> > -                      ifcond: Sequence[str],
> > +                      ifcond: QAPISchemaIfCond,
> >                         features: List[QAPISchemaFeature],
> >                         arg_type: Optional[QAPISchemaObjectType],
> >                         ret_type: Optional[QAPISchemaType],
> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> > index fee8c671e7..82475e84ec 100644
> > --- a/scripts/qapi/events.py
> > +++ b/scripts/qapi/events.py
> > @@ -12,7 +12,7 @@
> >   See the COPYING file in the top-level directory.
> >   """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >   from .common import c_enum_const, c_name, mcgen
> >   from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
> > @@ -20,6 +20,7 @@
> >       QAPISchema,
> >       QAPISchemaEnumMember,
> >       QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >       QAPISchemaObjectType,
> >   )
> >   from .source import QAPISourceInfo
> > @@ -227,7 +228,7 @@ def visit_end(self) -> None:
> >       def visit_event(self,
> >                       name: str,
> >                       info: Optional[QAPISourceInfo],
> > -                    ifcond: Sequence[str],
> > +                    ifcond: QAPISchemaIfCond,
> >                       features: List[QAPISchemaFeature],
> >                       arg_type: Optional[QAPISchemaObjectType],
> >                       boxed: bool) -> None:
> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> > index 1fa503bdbd..1c5b190276 100644
> > --- a/scripts/qapi/gen.py
> > +++ b/scripts/qapi/gen.py
> > @@ -18,7 +18,6 @@
> >       Dict,
> >       Iterator,
> >       Optional,
> > -    Sequence,
> >       Tuple,
> >   )
> >
> > @@ -32,6 +31,7 @@
> >       mcgen,
> >   )
> >   from .schema import (
> > +    QAPISchemaIfCond,
> >       QAPISchemaModule,
> >       QAPISchemaObjectType,
> >       QAPISchemaVisitor,
> > @@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
> >                   fp.write(text)
> >
> >
> > -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> st=
r:
> > +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) ->
> str:
> >       if before =3D=3D after:
> >           return after   # suppress empty #if ... #endif
> >
> > @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str,
> after: str) -> str:
> >       if added[0] =3D=3D '\n':
> >           out +=3D '\n'
> >           added =3D added[1:]
> > -    out +=3D gen_if(ifcond)
> > +    out +=3D gen_if(ifcond.ifcond)
> >       out +=3D added
> > -    out +=3D gen_endif(ifcond)
> > +    out +=3D gen_endif(ifcond.ifcond)
> >       return out
> >
> >
> > @@ -127,9 +127,9 @@ def build_params(arg_type:
> Optional[QAPISchemaObjectType],
> >   class QAPIGenCCode(QAPIGen):
> >       def __init__(self, fname: str):
> >           super().__init__(fname)
> > -        self._start_if: Optional[Tuple[Sequence[str], str, str]] =3D N=
one
> > +        self._start_if: Optional[Tuple[QAPISchemaIfCond, str, str]] =
=3D
> None
> >
> > -    def start_if(self, ifcond: Sequence[str]) -> None:
> > +    def start_if(self, ifcond: QAPISchemaIfCond) -> None:
> >           assert self._start_if is None
> >           self._start_if =3D (ifcond, self._body, self._preamble)
> >
> > @@ -187,7 +187,7 @@ def _bottom(self) -> str:
> >
> >
> >   @contextmanager
> > -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) ->
> Iterator[None]:
> > +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) ->
> Iterator[None]:
> >       """
> >       A with-statement context manager that wraps with `start_if()` /
> `end_if()`.
> >
> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> > index 9a348ca2e5..77a8c33ad4 100644
> > --- a/scripts/qapi/introspect.py
> > +++ b/scripts/qapi/introspect.py
> > @@ -15,11 +15,9 @@
> >       Any,
> >       Dict,
> >       Generic,
> > -    Iterable,
> >       List,
> >       Optional,
> >       Sequence,
> > -    Tuple,
> >       TypeVar,
> >       Union,
> >   )
> > @@ -38,6 +36,7 @@
> >       QAPISchemaEntity,
> >       QAPISchemaEnumMember,
> >       QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >       QAPISchemaObjectType,
> >       QAPISchemaObjectTypeMember,
> >       QAPISchemaType,
> > @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):
> >       """
> >       # TODO: Remove after Python 3.7 adds @dataclass:
> >       # pylint: disable=3Dtoo-few-public-methods
> > -    def __init__(self, value: _ValueT, ifcond: Iterable[str],
> > +    def __init__(self, value: _ValueT, ifcond: QAPISchemaIfCond,
> >                    comment: Optional[str] =3D None):
> >           self.value =3D value
> >           self.comment: Optional[str] =3D comment
> > -        self.ifcond: Tuple[str, ...] =3D tuple(ifcond)
> > +        self.ifcond =3D ifcond
> >
> >
> >   def _tree_to_qlit(obj: JSONValue,
> > @@ -125,10 +124,10 @@ def indent(level: int) -> str:
> >           if obj.comment:
> >               ret +=3D indent(level) + f"/* {obj.comment} */\n"
> >           if obj.ifcond:
> > -            ret +=3D gen_if(obj.ifcond)
> > +            ret +=3D gen_if(obj.ifcond.ifcond)
> >           ret +=3D _tree_to_qlit(obj.value, level)
> >           if obj.ifcond:
> > -            ret +=3D '\n' + gen_endif(obj.ifcond)
> > +            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
> >           return ret
> >
> >       ret =3D ''
> > @@ -254,7 +253,7 @@ def _gen_features(features:
> Sequence[QAPISchemaFeature]
> >           return [Annotated(f.name, f.ifcond) for f in features]
> >
> >       def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object]=
,
> > -                  ifcond: Sequence[str] =3D (),
> > +                  ifcond: QAPISchemaIfCond =3D QAPISchemaIfCond(),
> >                     features: Sequence[QAPISchemaFeature] =3D ()) -> No=
ne:
> >           """
> >           Build and append a SchemaInfo object to self._trees.
> > @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >           self._gen_tree(name, 'builtin', {'json-type': json_type})
> >
> >       def visit_enum_type(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                           features: List[QAPISchemaFeature],
> >                           members: List[QAPISchemaEnumMember],
> >                           prefix: Optional[str]) -> None:
> > @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >           )
> >
> >       def visit_array_type(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                            element_type: QAPISchemaType) -> None:
> >           element =3D self._use_type(element_type)
> >           self._gen_tree('[' + element + ']', 'array', {'element-type':
> element},
> >                          ifcond)
> >
> >       def visit_object_type_flat(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                               ifcond: Sequence[str],
> > +                               ifcond: QAPISchemaIfCond,
> >                                  features: List[QAPISchemaFeature],
> >                                  members:
> List[QAPISchemaObjectTypeMember],
> >                                  variants: Optional[QAPISchemaVariants]=
)
> -> None:
> > @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info:
> Optional[QAPISourceInfo],
> >           self._gen_tree(name, 'object', obj, ifcond, features)
> >
> >       def visit_alternate_type(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                                features: List[QAPISchemaFeature],
> >                                variants: QAPISchemaVariants) -> None:
> >           self._gen_tree(
> > @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >           )
> >
> >       def visit_command(self, name: str, info: Optional[QAPISourceInfo]=
,
> > -                      ifcond: Sequence[str],
> > +                      ifcond: QAPISchemaIfCond,
> >                         features: List[QAPISchemaFeature],
> >                         arg_type: Optional[QAPISchemaObjectType],
> >                         ret_type: Optional[QAPISchemaType], gen: bool,
> > @@ -367,7 +366,8 @@ def visit_command(self, name: str, info:
> Optional[QAPISourceInfo],
> >           self._gen_tree(name, 'command', obj, ifcond, features)
> >
> >       def visit_event(self, name: str, info: Optional[QAPISourceInfo],
> > -                    ifcond: Sequence[str], features:
> List[QAPISchemaFeature],
> > +                    ifcond: QAPISchemaIfCond,
> > +                    features: List[QAPISchemaFeature],
> >                       arg_type: Optional[QAPISchemaObjectType],
> >                       boxed: bool) -> None:
> >           assert self._schema is not None
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index 3a4172fb74..7d6f390fa6 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -25,6 +25,22 @@
> >   from .parser import QAPISchemaParser
> >
> >
> > +class QAPISchemaIfCond:
> > +    def __init__(self, ifcond=3DNone):
> > +        self.ifcond =3D ifcond or []
> > +
> > +    def __bool__(self):
> > +        return bool(self.ifcond)
> > +
> > +    def __repr__(self):
> > +        return repr(self.ifcond)
> > +
>
> I suggest using:
>
> f"QAPISchemaIfCond({self.ifcond!r})"
>
> unless future patches make that weirder. It's nice when repr() returns
> something you can use to make a new, equivalent object.
>
> eval(repr(x)) =3D=3D x
>
>
I implemented it this way for compatibility with test-qapi output. But it
is simpler to actually no implement __repr__ and just change the test.

> +    def __eq__(self, other):
> > +        if not isinstance(other, QAPISchemaIfCond):
> > +            return NotImplemented
> > +        return self.ifcond =3D=3D other.ifcond
> > +
> > +
>
> Missing annotations, but ... yeah, schema.py isn't typed yet so I will
> handle it myself in pt6. No biggie.
>

There used to be annotations all over in earlier versions, but I rebased
and had to drop most of them.


> >   class QAPISchemaEntity:
> >       meta: Optional[str] =3D None
> >
> > @@ -42,7 +58,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNon=
e,
> features=3DNone):
> >           # such place).
> >           self.info =3D info
> >           self.doc =3D doc
> > -        self._ifcond =3D ifcond or []
> > +        self._ifcond =3D ifcond or QAPISchemaIfCond()
> >           self.features =3D features or []
> >           self._checked =3D False
> >
> > @@ -77,7 +93,7 @@ def set_module(self, schema):
> >
> >       @property
> >       def ifcond(self):
> > -        assert self._checked
> > +        assert self._checked and isinstance(self._ifcond,
> QAPISchemaIfCond)
> >           return self._ifcond
> >
> >       def is_implicit(self):
> > @@ -601,7 +617,7 @@ def check(self, schema, seen):
> >           else:                   # simple union
> >               assert isinstance(self.tag_member.type, QAPISchemaEnumTyp=
e)
> >               assert not self.tag_member.optional
> > -            assert self.tag_member.ifcond =3D=3D []
> > +            assert not self.tag_member.ifcond
> >           if self._tag_name:    # flat union
> >               # branches that are not explicitly covered get an empty
> type
> >               cases =3D {v.name for v in self.variants}
> > @@ -646,7 +662,7 @@ def __init__(self, name, info, ifcond=3DNone):
> >           assert isinstance(name, str)
> >           self.name =3D name
> >           self.info =3D info
> > -        self.ifcond =3D ifcond or []
> > +        self.ifcond =3D ifcond or QAPISchemaIfCond()
> >           self.defined_in =3D None
> >
> >       def set_defined_in(self, name):
> > @@ -958,14 +974,20 @@ def _def_predefineds(self):
> >           self._def_entity(QAPISchemaEnumType('QType', None, None, None=
,
> None,
> >                                               qtype_values, 'QTYPE'))
> >
> > +    def _get_if(self, f) -> QAPISchemaIfCond:
> > +        ifcond =3D f.get('if')
> > +        if isinstance(ifcond, QAPISchemaIfCond):
>
> would "is not None" suffice here?
>

> > +            return ifcond
> > +        return QAPISchemaIfCond(ifcond)
>
> Under which circumstances do we expect 'ifcond' here to be something
> other than None but *not* a QAPISchemaIfCond?
>
> This helper seems a little suspect in the sense that it appears to be
> taking liberties with the dynamic runtime object system.
>

Yes, this is due to the adhoc enum being created in _def_union_type().
There, the ifcond of the variant is used, which is already a
QAPISchemaIfCond. I'll lower it again to the list form.


> > + >       def _make_features(self, features, info):
> >           if features is None:
> >               return []
> > -        return [QAPISchemaFeature(f['name'], info, f.get('if'))
> > +        return [QAPISchemaFeature(f['name'], info, self._get_if(f))
> >                   for f in features]
> >
> >       def _make_enum_members(self, values, info):
> > -        return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
> > +        return [QAPISchemaEnumMember(v['name'], info, self._get_if(v))
> >                   for v in values]
> >
> >       def _make_implicit_enum_type(self, name, info, ifcond, values):
> > @@ -1001,7 +1023,7 @@ def _make_implicit_object_type(self, name, info,
> ifcond, role, members):
> >               # TODO kill simple unions or implement the disjunction
> >
> >               # pylint: disable=3Dprotected-access
> > -            assert (ifcond or []) =3D=3D typ._ifcond
> > +            assert ifcond =3D=3D typ._ifcond
> >           else:
> >               self._def_entity(QAPISchemaObjectType(
> >                   name, info, None, ifcond, None, None, members, None))
> > @@ -1011,7 +1033,7 @@ def _def_enum_type(self, expr, info, doc):
> >           name =3D expr['enum']
> >           data =3D expr['data']
> >           prefix =3D expr.get('prefix')
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >           features =3D self._make_features(expr.get('features'), info)
> >           self._def_entity(QAPISchemaEnumType(
> >               name, info, doc, ifcond, features,
> > @@ -1029,7 +1051,8 @@ def _make_member(self, name, typ, ifcond,
> features, info):
> >
>  self._make_features(features, info))
> >
> >       def _make_members(self, data, info):
> > -        return [self._make_member(key, value['type'], value.get('if'),
> > +        return [self._make_member(key, value['type'],
> > +                                  QAPISchemaIfCond(value.get('if')),
> >                                     value.get('features'), info)
> >                   for (key, value) in data.items()]
> >
> > @@ -1037,7 +1060,7 @@ def _def_struct_type(self, expr, info, doc):
> >           name =3D expr['struct']
> >           base =3D expr.get('base')
> >           data =3D expr['data']
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >           features =3D self._make_features(expr.get('features'), info)
> >           self._def_entity(QAPISchemaObjectType(
> >               name, info, doc, ifcond, features, base,
> > @@ -1060,7 +1083,7 @@ def _def_union_type(self, expr, info, doc):
> >           name =3D expr['union']
> >           data =3D expr['data']
> >           base =3D expr.get('base')
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >           features =3D self._make_features(expr.get('features'), info)
> >           tag_name =3D expr.get('discriminator')
> >           tag_member =3D None
> > @@ -1069,14 +1092,20 @@ def _def_union_type(self, expr, info, doc):
> >                   name, info, ifcond,
> >                   'base', self._make_members(base, info))
> >           if tag_name:
> > -            variants =3D [self._make_variant(key, value['type'],
> > -                                           value.get('if'), info)
> > -                        for (key, value) in data.items()]
> > +            variants =3D [
> > +                self._make_variant(key, value['type'],
> > +                                   QAPISchemaIfCond(value.get('if')),
> > +                                   info)
> > +                for (key, value) in data.items()
> > +            ]
> >               members =3D []
> >           else:
> > -            variants =3D [self._make_simple_variant(key, value['type']=
,
> > -                                                  value.get('if'), inf=
o)
> > -                        for (key, value) in data.items()]
> > +            variants =3D [
> > +                self._make_simple_variant(key, value['type'],
> > +
> QAPISchemaIfCond(value.get('if')),
> > +                                          info)
> > +                for (key, value) in data.items()
> > +            ]
> >               enum =3D [{'name': v.name, 'if': v.ifcond} for v in
> variants]
> >               typ =3D self._make_implicit_enum_type(name, info, ifcond,
> enum)
> >               tag_member =3D QAPISchemaObjectTypeMember('type', info, t=
yp,
> False)
> > @@ -1090,11 +1119,14 @@ def _def_union_type(self, expr, info, doc):
> >       def _def_alternate_type(self, expr, info, doc):
> >           name =3D expr['alternate']
> >           data =3D expr['data']
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >           features =3D self._make_features(expr.get('features'), info)
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
> >           tag_member =3D QAPISchemaObjectTypeMember('type', info, 'QTyp=
e',
> False)
> >           self._def_entity(
> >               QAPISchemaAlternateType(name, info, doc, ifcond, features=
,
> > @@ -1111,7 +1143,7 @@ def _def_command(self, expr, info, doc):
> >           allow_oob =3D expr.get('allow-oob', False)
> >           allow_preconfig =3D expr.get('allow-preconfig', False)
> >           coroutine =3D expr.get('coroutine', False)
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >           features =3D self._make_features(expr.get('features'), info)
> >           if isinstance(data, OrderedDict):
> >               data =3D self._make_implicit_object_type(
> > @@ -1130,7 +1162,7 @@ def _def_event(self, expr, info, doc):
> >           name =3D expr['event']
> >           data =3D expr.get('data')
> >           boxed =3D expr.get('boxed', False)
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >           features =3D self._make_features(expr.get('features'), info)
> >           if isinstance(data, OrderedDict):
> >               data =3D self._make_implicit_object_type(
> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> > index 20d572a23a..3673cf0f49 100644
> > --- a/scripts/qapi/types.py
> > +++ b/scripts/qapi/types.py
> > @@ -13,7 +13,7 @@
> >   # See the COPYING file in the top-level directory.
> >   """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >   from .common import (
> >       c_enum_const,
> > @@ -27,6 +27,7 @@
> >       QAPISchema,
> >       QAPISchemaEnumMember,
> >       QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >       QAPISchemaObjectType,
> >       QAPISchemaObjectTypeMember,
> >       QAPISchemaType,
> > @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,
> >   ''',
> >                   c_name=3Dc_name(name))
> >       for memb in members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >           index =3D c_enum_const(name, memb.name, prefix)
> >           ret +=3D mcgen('''
> >           [%(index)s] =3D "%(name)s",
> >   ''',
> >                        index=3Dindex, name=3Dmemb.name)
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >       ret +=3D mcgen('''
> >       },
> > @@ -80,12 +81,12 @@ def gen_enum(name: str,
> >                   c_name=3Dc_name(name))
> >
> >       for memb in enum_members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >           ret +=3D mcgen('''
> >       %(c_enum)s,
> >   ''',
> >                        c_enum=3Dc_enum_const(name, memb.name, prefix))
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >       ret +=3D mcgen('''
> >   } %(c_name)s;
> > @@ -125,7 +126,7 @@ def gen_array(name: str, element_type:
> QAPISchemaType) -> str:
> >   def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) ->
> str:
> >       ret =3D ''
> >       for memb in members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >           if memb.optional:
> >               ret +=3D mcgen('''
> >       bool has_%(c_name)s;
> > @@ -135,11 +136,11 @@ def gen_struct_members(members:
> List[QAPISchemaObjectTypeMember]) -> str:
> >       %(c_type)s %(c_name)s;
> >   ''',
> >                        c_type=3Dmemb.type.c_type(), c_name=3Dc_name(
> memb.name))
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >       return ret
> >
> >
> > -def gen_object(name: str, ifcond: Sequence[str],
> > +def gen_object(name: str, ifcond: QAPISchemaIfCond,
> >                  base: Optional[QAPISchemaObjectType],
> >                  members: List[QAPISchemaObjectTypeMember],
> >                  variants: Optional[QAPISchemaVariants]) -> str:
> > @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],
> >       ret +=3D mcgen('''
> >
> >   ''')
> > -    ret +=3D gen_if(ifcond)
> > +    ret +=3D gen_if(ifcond.ifcond)
> >       ret +=3D mcgen('''
> >   struct %(c_name)s {
> >   ''',
> > @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],
> >       ret +=3D mcgen('''
> >   };
> >   ''')
> > -    ret +=3D gen_endif(ifcond)
> > +    ret +=3D gen_endif(ifcond.ifcond)
> >
> >       return ret
> >
> > @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) ->
> str:
> >       for var in variants.variants:
> >           if var.type.name =3D=3D 'q_empty':
> >               continue
> > -        ret +=3D gen_if(var.ifcond)
> > +        ret +=3D gen_if(var.ifcond.ifcond)
> >           ret +=3D mcgen('''
> >           %(c_type)s %(c_name)s;
> >   ''',
> >                        c_type=3Dvar.type.c_unboxed_type(),
> >                        c_name=3Dc_name(var.name))
> > -        ret +=3D gen_endif(var.ifcond)
> > +        ret +=3D gen_endif(var.ifcond.ifcond)
> >
> >       ret +=3D mcgen('''
> >       } u;
> > @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -> None:
> >       def visit_enum_type(self,
> >                           name: str,
> >                           info: Optional[QAPISourceInfo],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                           features: List[QAPISchemaFeature],
> >                           members: List[QAPISchemaEnumMember],
> >                           prefix: Optional[str]) -> None:
> > @@ -318,7 +319,7 @@ def visit_enum_type(self,
> >       def visit_array_type(self,
> >                            name: str,
> >                            info: Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                            element_type: QAPISchemaType) -> None:
> >           with ifcontext(ifcond, self._genh, self._genc):
> >               self._genh.preamble_add(gen_fwd_object_or_array(name))
> > @@ -328,7 +329,7 @@ def visit_array_type(self,
> >       def visit_object_type(self,
> >                             name: str,
> >                             info: Optional[QAPISourceInfo],
> > -                          ifcond: Sequence[str],
> > +                          ifcond: QAPISchemaIfCond,
> >                             features: List[QAPISchemaFeature],
> >                             base: Optional[QAPISchemaObjectType],
> >                             members: List[QAPISchemaObjectTypeMember],
> > @@ -351,7 +352,7 @@ def visit_object_type(self,
> >       def visit_alternate_type(self,
> >                                name: str,
> >                                info: Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                                features: List[QAPISchemaFeature],
> >                                variants: QAPISchemaVariants) -> None:
> >           with ifcontext(ifcond, self._genh):
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index 9e96f3c566..67721b2470 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -13,7 +13,7 @@
> >   See the COPYING file in the top-level directory.
> >   """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >   from .common import (
> >       c_enum_const,
> > @@ -29,6 +29,7 @@
> >       QAPISchemaEnumMember,
> >       QAPISchemaEnumType,
> >       QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >       QAPISchemaObjectType,
> >       QAPISchemaObjectTypeMember,
> >       QAPISchemaType,
> > @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,
> >
> >       for memb in members:
> >           deprecated =3D 'deprecated' in [f.name for f in memb.features=
]
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >           if memb.optional:
> >               ret +=3D mcgen('''
> >       if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
> > @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,
> >               ret +=3D mcgen('''
> >       }
> >   ''')
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >       if variants:
> >           tag_member =3D variants.tag_member
> > @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,
> >           for var in variants.variants:
> >               case_str =3D c_enum_const(tag_member.type.name, var.name,
> >                                       tag_member.type.prefix)
> > -            ret +=3D gen_if(var.ifcond)
> > +            ret +=3D gen_if(var.ifcond.ifcond)
> >               if var.type.name =3D=3D 'q_empty':
> >                   # valid variant and nothing to do
> >                   ret +=3D mcgen('''
> > @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,
> >                                case=3Dcase_str,
> >                                c_type=3Dvar.type.c_name(), c_name=3Dc_n=
ame(
> var.name))
> >
> > -            ret +=3D gen_endif(var.ifcond)
> > +            ret +=3D gen_endif(var.ifcond.ifcond)
> >           ret +=3D mcgen('''
> >       default:
> >           abort();
> > @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants:
> QAPISchemaVariants) -> str:
> >                   c_name=3Dc_name(name))
> >
> >       for var in variants.variants:
> > -        ret +=3D gen_if(var.ifcond)
> > +        ret +=3D gen_if(var.ifcond.ifcond)
> >           ret +=3D mcgen('''
> >       case %(case)s:
> >   ''',
> > @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants:
> QAPISchemaVariants) -> str:
> >           ret +=3D mcgen('''
> >           break;
> >   ''')
> > -        ret +=3D gen_endif(var.ifcond)
> > +        ret +=3D gen_endif(var.ifcond.ifcond)
> >
> >       ret +=3D mcgen('''
> >       case QTYPE_NONE:
> > @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -> None:
> >       def visit_enum_type(self,
> >                           name: str,
> >                           info: Optional[QAPISourceInfo],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                           features: List[QAPISchemaFeature],
> >                           members: List[QAPISchemaEnumMember],
> >                           prefix: Optional[str]) -> None:
> > @@ -363,7 +364,7 @@ def visit_enum_type(self,
> >       def visit_array_type(self,
> >                            name: str,
> >                            info: Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                            element_type: QAPISchemaType) -> None:
> >           with ifcontext(ifcond, self._genh, self._genc):
> >               self._genh.add(gen_visit_decl(name))
> > @@ -372,7 +373,7 @@ def visit_array_type(self,
> >       def visit_object_type(self,
> >                             name: str,
> >                             info: Optional[QAPISourceInfo],
> > -                          ifcond: Sequence[str],
> > +                          ifcond: QAPISchemaIfCond,
> >                             features: List[QAPISchemaFeature],
> >                             base: Optional[QAPISchemaObjectType],
> >                             members: List[QAPISchemaObjectTypeMember],
> > @@ -394,7 +395,7 @@ def visit_object_type(self,
> >       def visit_alternate_type(self,
> >                                name: str,
> >                                info: Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                                features: List[QAPISchemaFeature],
> >                                variants: QAPISchemaVariants) -> None:
> >           with ifcontext(ifcond, self._genh, self._genc):
> >
>
> looks good.
>
> Tested-by: John Snow <jsnow@redhat.com>
>
>

--000000000000b41f0905c284be1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 12:53 AM Jo=
hn Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 4/29/21 9:40 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" t=
arget=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Wrap the &#39;if&#39; condition in a higher-level object. Not only thi=
s allows<br>
&gt; more type safety but also further refactoring without too much churn.<=
br>
&gt; <br>
<br>
Would have done it myself if I had gotten to it first. I like having a <br>
named type for this, it matches the other properties we have.<br>
<br>
&gt; The following patches will change the syntax of the schema &#39;if&#39=
;<br>
&gt; conditions to be predicate expressions, and will generate code for<br>
&gt; different target languages (C, and Rust in another series).<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0scripts/qapi/commands.py=C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A0scripts/qapi/events.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++-<br=
>
&gt;=C2=A0 =C2=A0scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++---=
-<br>
&gt;=C2=A0 =C2=A0scripts/qapi/introspect.py | 26 ++++++-------<br>
&gt;=C2=A0 =C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0| 78 +++++++++++=
++++++++++++++++-----------<br>
&gt;=C2=A0 =C2=A0scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 | 33 ++++++++---=
-----<br>
&gt;=C2=A0 =C2=A0scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 | 23 +++++------=
<br>
&gt;=C2=A0 =C2=A08 files changed, 110 insertions(+), 75 deletions(-)<br>
&gt; <br>
&gt; diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py<br>
&gt; index 87c67ab23f..b737949007 100644<br>
&gt; --- a/docs/sphinx/qapidoc.py<br>
&gt; +++ b/docs/sphinx/qapidoc.py<br>
&gt; @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the conditions are in literal-=
text and the commas are not.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If with_if is False, we don&#3=
9;t return the &quot;(If: &quot; and &quot;)&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D intersperse([nodes.literal(&=
#39;&#39;, c) for c in ifcond],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D intersperse([nodes.literal(&=
#39;&#39;, c) for c in ifcond.ifcond],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodes.Text(&#39;, &#39;))<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not with_if:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return condlist<=
br>
&gt; diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py<br>
&gt; index 0e13d51054..3654825968 100644<br>
&gt; --- a/scripts/qapi/commands.py<br>
&gt; +++ b/scripts/qapi/commands.py<br>
&gt; @@ -17,7 +17,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0List,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Optional,<br>
&gt; -=C2=A0 =C2=A0 Sequence,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Set,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -31,6 +30,7 @@<br>
&gt;=C2=A0 =C2=A0from .schema import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaType,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt; @@ -301,7 +301,7 @@ def visit_end(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_command(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret_type: Optional[QAPISchemaType],<br>
&gt; diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py<br>
&gt; index fee8c671e7..82475e84ec 100644<br>
&gt; --- a/scripts/qapi/events.py<br>
&gt; +++ b/scripts/qapi/events.py<br>
&gt; @@ -12,7 +12,7 @@<br>
&gt;=C2=A0 =C2=A0See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0from .common import c_enum_const, c_name, mcgen<br>
&gt;=C2=A0 =C2=A0from .gen import QAPISchemaModularCVisitor, build_params, =
ifcontext<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0from .source import QAPISourceInfo<br>
&gt; @@ -227,7 +228,7 @@ def visit_end(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_event(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0boxed: bool) -&gt; None:<br>
&gt; diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py<br>
&gt; index 1fa503bdbd..1c5b190276 100644<br>
&gt; --- a/scripts/qapi/gen.py<br>
&gt; +++ b/scripts/qapi/gen.py<br>
&gt; @@ -18,7 +18,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Iterator,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Optional,<br>
&gt; -=C2=A0 =C2=A0 Sequence,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Tuple,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -32,6 +31,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mcgen,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0from .schema import (<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaModule,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaVisitor,<br>
&gt; @@ -85,7 +85,7 @@ def write(self, output_dir: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp=
.write(text)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -&gt=
; str:<br>
&gt; +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if before =3D=3D after:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return after=C2=A0 =C2=A0# sup=
press empty #if ... #endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str,=
 after: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if added[0] =3D=3D &#39;\n&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out +=3D &#39;\n&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0added =3D added[1:]<br>
&gt; -=C2=A0 =C2=A0 out +=3D gen_if(ifcond)<br>
&gt; +=C2=A0 =C2=A0 out +=3D gen_if(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0out +=3D added<br>
&gt; -=C2=A0 =C2=A0 out +=3D gen_endif(ifcond)<br>
&gt; +=C2=A0 =C2=A0 out +=3D gen_endif(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return out<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -127,9 +127,9 @@ def build_params(arg_type: Optional[QAPISchemaObje=
ctType],<br>
&gt;=C2=A0 =C2=A0class QAPIGenCCode(QAPIGen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __init__(self, fname: str):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(fname)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_if: Optional[Tuple[Sequence[s=
tr], str, str]] =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_if: Optional[Tuple[QAPISchema=
IfCond, str, str]] =3D None<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 def start_if(self, ifcond: Sequence[str]) -&gt; None:<b=
r>
&gt; +=C2=A0 =C2=A0 def start_if(self, ifcond: QAPISchemaIfCond) -&gt; None=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert self._start_if is None<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._start_if =3D (ifcond, se=
lf._body, self._preamble)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -187,7 +187,7 @@ def _bottom(self) -&gt; str:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0@contextmanager<br>
&gt; -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -&gt; Itera=
tor[None]:<br>
&gt; +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -&gt; It=
erator[None]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0A with-statement context manager that wraps =
with `start_if()` / `end_if()`.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py<b=
r>
&gt; index 9a348ca2e5..77a8c33ad4 100644<br>
&gt; --- a/scripts/qapi/introspect.py<br>
&gt; +++ b/scripts/qapi/introspect.py<br>
&gt; @@ -15,11 +15,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Any,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Generic,<br>
&gt; -=C2=A0 =C2=A0 Iterable,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0List,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Optional,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Sequence,<br>
&gt; -=C2=A0 =C2=A0 Tuple,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TypeVar,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Union,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt; @@ -38,6 +36,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaEntity,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaType,<br>
&gt; @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# TODO: Remove after Python 3.7 adds @datacl=
ass:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# pylint: disable=3Dtoo-few-public-methods<b=
r>
&gt; -=C2=A0 =C2=A0 def __init__(self, value: _ValueT, ifcond: Iterable[str=
],<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, value: _ValueT, ifcond: QAPISchemaIf=
Cond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
omment: Optional[str] =3D None):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.value =3D value<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.comment: Optional[str] =
=3D comment<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond: Tuple[str, ...] =3D tuple(if=
cond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def _tree_to_qlit(obj: JSONValue,<br>
&gt; @@ -125,10 +124,10 @@ def indent(level: int) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if obj.comment:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D indent(=
level) + f&quot;/* {obj.comment} */\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if obj.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond.=
ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D _tree_to_qlit(obj.val=
ue, level)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if obj.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen=
_endif(obj.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen=
_endif(obj.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D &#39;&#39;<br>
&gt; @@ -254,7 +253,7 @@ def _gen_features(features: Sequence[QAPISchemaFea=
ture]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return [Annotated(<a href=3D"h=
ttp://f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a>, f.ifcond) fo=
r f in features]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _gen_tree(self, name: str, mtype: str, o=
bj: Dict[str, object],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond=
: Sequence[str] =3D (),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond=
: QAPISchemaIfCond =3D QAPISchemaIfCond(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0features: Sequence[QAPISchemaFeature] =3D ()) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Build and append a SchemaInfo =
object to self._trees.<br>
&gt; @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info: Opti=
onal[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._gen_tree(name, &#39;buil=
tin&#39;, {&#39;json-type&#39;: json_type})<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_enum_type(self, name: str, info: O=
ptional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info: Optio=
nal[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_array_type(self, name: str, info: =
Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0element =3D self._use_type(ele=
ment_type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._gen_tree(&#39;[&#39; + e=
lement + &#39;]&#39;, &#39;array&#39;, {&#39;element-type&#39;: element},<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ifcond)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_object_type_flat(self, name: str, =
info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaF=
eature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaOb=
jectTypeMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants: Optional[QAPISch=
emaVariants]) -&gt; None:<br>
&gt; @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info: =
Optional[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._gen_tree(name, &#39;obje=
ct&#39;, obj, ifcond, features)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_alternate_type(self, name: str, in=
fo: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature]=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants: QAPISchemaVariants) -&g=
t; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._gen_tree(<br>
&gt; @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info: Op=
tional[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_command(self, name: str, info: Opt=
ional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret_type: Optional[QAPISchemaType], gen: bool,<br>
&gt; @@ -367,7 +366,8 @@ def visit_command(self, name: str, info: Optional[=
QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._gen_tree(name, &#39;comm=
and&#39;, obj, ifcond, features)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_event(self, name: str, info: Optio=
nal[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: Sequence[str], features: List[QAPISchemaFeature],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: QAPISchemaIfCond,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0boxed: bool) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert self._schema is not Non=
e<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index 3a4172fb74..7d6f390fa6 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -25,6 +25,22 @@<br>
&gt;=C2=A0 =C2=A0from .parser import QAPISchemaParser<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +class QAPISchemaIfCond:<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __bool__(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.ifcond)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __repr__(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return repr(self.ifcond)<br>
&gt; +<br>
<br>
I suggest using:<br>
<br>
f&quot;QAPISchemaIfCond({self.ifcond!r})&quot;<br>
<br>
unless future patches make that weirder. It&#39;s nice when repr() returns =
<br>
something you can use to make a new, equivalent object.<br>
<br>
eval(repr(x)) =3D=3D x<br>
<br></blockquote><div><br></div><div>I implemented it this way for compatib=
ility with test-qapi output. But it is simpler to actually no implement __r=
epr__ and just change the test.<br></div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 def __eq__(self, other):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, QAPISchemaIfCond=
):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NotImplemented<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.ifcond =3D=3D other.ifcond<br=
>
&gt; +<br>
&gt; +<br>
<br>
Missing annotations, but ... yeah, schema.py isn&#39;t typed yet so I will =
<br>
handle it myself in pt6. No biggie.<br></blockquote><div><br></div><div>The=
re used to be annotations all over in earlier versions, but I rebased and h=
ad to drop most of them.</div><div> <br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0class QAPISchemaEntity:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta: Optional[str] =3D None<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -42,7 +58,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNo=
ne, features=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# such place).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.info" r=
el=3D"noreferrer" target=3D"_blank">self.info</a> =3D info<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.doc =3D doc<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ifcond =3D ifcond or QAPISchemaIfCo=
nd()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.features =3D features or =
[]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._checked =3D False<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -77,7 +93,7 @@ def set_module(self, schema):<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@property<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def ifcond(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._checked<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._checked and isinstance(self.=
_ifcond, QAPISchemaIfCond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self._ifcond<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def is_implicit(self):<br>
&gt; @@ -601,7 +617,7 @@ def check(self, schema, seen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# simple union<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert isinstanc=
e(self.tag_member.type, QAPISchemaEnumType)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert not self.=
tag_member.optional<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self.tag_member.ifco=
nd =3D=3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not self.tag_member.=
ifcond<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self._tag_name:=C2=A0 =C2=
=A0 # flat union<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# branches that =
are not explicitly covered get an empty type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cases =3D {<a hr=
ef=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a> for v =
in self.variants}<br>
&gt; @@ -646,7 +662,7 @@ def __init__(self, name, info, ifcond=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert isinstance(name, str)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.name" r=
el=3D"noreferrer" target=3D"_blank">self.name</a> =3D name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.info" r=
el=3D"noreferrer" target=3D"_blank">self.info</a> =3D info<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or QAPISchemaIfCon=
d()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.defined_in =3D None<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def set_defined_in(self, name):<br>
&gt; @@ -958,14 +974,20 @@ def _def_predefineds(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._def_entity(QAPISchemaEnu=
mType(&#39;QType&#39;, None, None, None, None,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qtype_values, &#39;QTYPE&#39;))<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 def _get_if(self, f) -&gt; QAPISchemaIfCond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D f.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(ifcond, QAPISchemaIfCond):<=
br>
<br>
would &quot;is not None&quot; suffice here? <br></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return QAPISchemaIfCond(ifcond)<br>
<br>
Under which circumstances do we expect &#39;ifcond&#39; here to be somethin=
g <br>
other than None but *not* a QAPISchemaIfCond?<br>
<br>
This helper seems a little suspect in the sense that it appears to be <br>
taking liberties with the dynamic runtime object system.<br></blockquote><d=
iv><br></div><div>Yes, this is due to the adhoc enum being created in _def_=
union_type(). There, the ifcond of the variant is used, which is already a =
QAPISchemaIfCond. I&#39;ll lower it again to the list form.<br></div><div> =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; + &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _make_features(self, features, in=
fo):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if features is None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaFeature(f[&#39;name&#39=
;], info, f.get(&#39;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaFeature(f[&#39;name&#39=
;], info, self._get_if(f))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fo=
r f in features]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _make_enum_members(self, values, info):<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&=
#39;], info, v.get(&#39;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&=
#39;], info, self._get_if(v))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fo=
r v in values]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _make_implicit_enum_type(self, name, inf=
o, ifcond, values):<br>
&gt; @@ -1001,7 +1023,7 @@ def _make_implicit_object_type(self, name, info,=
 ifcond, role, members):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# TODO kill simp=
le unions or implement the disjunction<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# pylint: disabl=
e=3Dprotected-access<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (ifcond or []) =3D=
=3D typ._ifcond<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert ifcond =3D=3D typ._i=
fcond<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._def_entity=
(QAPISchemaObjectType(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me, info, None, ifcond, None, None, members, None))<br>
&gt; @@ -1011,7 +1033,7 @@ def _def_enum_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D expr[&#39;enum&#39;]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D expr[&#39;data&#39;]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix =3D expr.get(&#39;prefi=
x&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D self._make_featur=
es(expr.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._def_entity(QAPISchemaEnu=
mType(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name, info, doc,=
 ifcond, features,<br>
&gt; @@ -1029,7 +1051,8 @@ def _make_member(self, name, typ, ifcond, featur=
es, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self._make_features(features, info))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _make_members(self, data, info):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [self._make_member(key, value[&#39=
;type&#39;], value.get(&#39;if&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [self._make_member(key, value[&#39=
;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaIfCond(value.ge=
t(&#39;if&#39;)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value.get(&#3=
9;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fo=
r (key, value) in data.items()]<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1037,7 +1060,7 @@ def _def_struct_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D expr[&#39;struct&#39;=
]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D expr.get(&#39;base&#3=
9;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D expr[&#39;data&#39;]<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D self._make_featur=
es(expr.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._def_entity(QAPISchemaObj=
ectType(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name, info, doc,=
 ifcond, features, base,<br>
&gt; @@ -1060,7 +1083,7 @@ def _def_union_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D expr[&#39;union&#39;]=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D expr[&#39;data&#39;]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D expr.get(&#39;base&#3=
9;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D self._make_featur=
es(expr.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tag_name =3D expr.get(&#39;dis=
criminator&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tag_member =3D None<br>
&gt; @@ -1069,14 +1092,20 @@ def _def_union_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me, info, ifcond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;base&#39;, self._make_members(base, info))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tag_name:<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0members =3D []<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [self._make_si=
mple_variant(key, value[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value.get(&#39;if&#39;), info)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for (key, value) in data.items()]<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum =3D [{&#39;=
name&#39;: <a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v=
.name</a>, &#39;if&#39;: v.ifcond} for v in variants]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typ =3D self._ma=
ke_implicit_enum_type(name, info, ifcond, enum)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tag_member =3D Q=
APISchemaObjectTypeMember(&#39;type&#39;, info, typ, False)<br>
&gt; @@ -1090,11 +1119,14 @@ def _def_union_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _def_alternate_type(self, expr, info, do=
c):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D expr[&#39;alternate&#=
39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D expr[&#39;data&#39;]<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D self._make_featur=
es(expr.get(&#39;features&#39;), info)<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tag_member =3D QAPISchemaObjec=
tTypeMember(&#39;type&#39;, info, &#39;QType&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._def_entity(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaAltern=
ateType(name, info, doc, ifcond, features,<br>
&gt; @@ -1111,7 +1143,7 @@ def _def_command(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allow_oob =3D expr.get(&#39;al=
low-oob&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allow_preconfig =3D expr.get(&=
#39;allow-preconfig&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0coroutine =3D expr.get(&#39;co=
routine&#39;, False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D self._make_featur=
es(expr.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(data, OrderedDic=
t):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D self._m=
ake_implicit_object_type(<br>
&gt; @@ -1130,7 +1162,7 @@ def _def_event(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D expr[&#39;event&#39;]=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D expr.get(&#39;data&#3=
9;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boxed =3D expr.get(&#39;boxed&=
#39;, False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D self._make_featur=
es(expr.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(data, OrderedDic=
t):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D self._m=
ake_implicit_object_type(<br>
&gt; diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py<br>
&gt; index 20d572a23a..3673cf0f49 100644<br>
&gt; --- a/scripts/qapi/types.py<br>
&gt; +++ b/scripts/qapi/types.py<br>
&gt; @@ -13,7 +13,7 @@<br>
&gt;=C2=A0 =C2=A0# See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0from .common import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0c_enum_const,<br>
&gt; @@ -27,6 +27,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaType,<br>
&gt; @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_=
name=3Dc_name(name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index =3D c_enum_const(name, <=
a href=3D"http://memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name<=
/a>, prefix)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[%(index)s] =3D &quot;%(name)s=
&quot;,<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 index=3Dindex, name=3D<a href=3D"http://memb.name" rel=3D"nor=
eferrer" target=3D"_blank">memb.name</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; @@ -80,12 +81,12 @@ def gen_enum(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_=
name=3Dc_name(name))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for memb in enum_members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0%(c_enum)s,<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 c_enum=3Dc_enum_const(name, <a href=3D"http://memb.name" rel=
=3D"noreferrer" target=3D"_blank">memb.name</a>, prefix))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0} %(c_name)s;<br>
&gt; @@ -125,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaT=
ype) -&gt; str:<br>
&gt;=C2=A0 =C2=A0def gen_struct_members(members: List[QAPISchemaObjectTypeM=
ember]) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if memb.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&=
#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_%(c_name)s;<br>
&gt; @@ -135,11 +136,11 @@ def gen_struct_members(members: List[QAPISchemaO=
bjectTypeMember]) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0%(c_type)s %(c_name)s;<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 c_type=3Dmemb.type.c_type(), c_name=3Dc_name(<a href=3D"http:=
//memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name</a>))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -def gen_object(name: str, ifcond: Sequence[str],<br>
&gt; +def gen_object(name: str, ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base: Op=
tional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 members:=
 List[QAPISchemaObjectTypeMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants=
: Optional[QAPISchemaVariants]) -&gt; str:<br>
&gt; @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 ret +=3D gen_if(ifcond)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D gen_if(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0struct %(c_name)s {<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
&gt; @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 ret +=3D gen_endif(ifcond)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D gen_endif(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for var in variants.variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if <a href=3D"http://var.type.=
name" rel=3D"noreferrer" target=3D"_blank">var.type.name</a> =3D=3D &#39;q_=
empty&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%(c_type)s %(c_name)s;<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 c_type=3Dvar.type.c_unboxed_type(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 c_name=3Dc_name(<a href=3D"http://var.name" rel=3D"noreferrer=
" target=3D"_blank">var.name</a>))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} u;<br>
&gt; @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -&gt; None:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -318,7 +319,7 @@ def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with ifcontext(ifcond, self._g=
enh, self._genc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._genh.pream=
ble_add(gen_fwd_object_or_array(name))<br>
&gt; @@ -328,7 +329,7 @@ def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0members: List[QAPISchemaObjectTypeMember]=
,<br>
&gt; @@ -351,7 +352,7 @@ def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_alternate_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature]=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants: QAPISchemaVariants) -&g=
t; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with ifcontext(ifcond, self._g=
enh):<br>
&gt; diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py<br>
&gt; index 9e96f3c566..67721b2470 100644<br>
&gt; --- a/scripts/qapi/visit.py<br>
&gt; +++ b/scripts/qapi/visit.py<br>
&gt; @@ -13,7 +13,7 @@<br>
&gt;=C2=A0 =C2=A0See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0from .common import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0c_enum_const,<br>
&gt; @@ -29,6 +29,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaEnumType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaType,<br>
&gt; @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for memb in members:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deprecated =3D &#39;deprecated=
&#39; in [<a href=3D"http://f.name" rel=3D"noreferrer" target=3D"_blank">f.=
name</a> for f in memb.features]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if memb.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&=
#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (visit_optional(v, &quot;%(name)s&quot;, =
&amp;obj-&gt;has_%(c_name)s)) {<br>
&gt; @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&=
#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tag_member =3D variants.tag_me=
mber<br>
&gt; @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for var in variants.variants:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case_str =3D c_e=
num_const(<a href=3D"http://tag_member.type.name" rel=3D"noreferrer" target=
=3D"_blank">tag_member.type.name</a>, <a href=3D"http://var.name" rel=3D"no=
referrer" target=3D"_blank">var.name</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tag_me=
mber.type.prefix)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.=
ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if <a href=3D"ht=
tp://var.type.name" rel=3D"noreferrer" target=3D"_blank">var.type.name</a> =
=3D=3D &#39;q_empty&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# =
valid variant and nothing to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
t +=3D mcgen(&#39;&#39;&#39;<br>
&gt; @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case=3Dcase_str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_type=3Dvar.type.c_name(), c_nam=
e=3Dc_name(<a href=3D"http://var.name" rel=3D"noreferrer" target=3D"_blank"=
>var.name</a>))<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifco=
nd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifco=
nd.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
&gt; @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_=
name=3Dc_name(name))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for var in variants.variants:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case %(case)s:<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
&gt; @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case QTYPE_NONE:<br>
&gt; @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -&gt; None=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -363,7 +364,7 @@ def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with ifcontext(ifcond, self._g=
enh, self._genc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._genh.add(g=
en_visit_decl(name))<br>
&gt; @@ -372,7 +373,7 @@ def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0members: List[QAPISchemaObjectTypeMember]=
,<br>
&gt; @@ -394,7 +395,7 @@ def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def visit_alternate_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature]=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants: QAPISchemaVariants) -&g=
t; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with ifcontext(ifcond, self._g=
enh, self._genc):<br>
&gt; <br>
<br>
looks good.<br>
<br>
Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_bla=
nk">jsnow@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div>

--000000000000b41f0905c284be1e--


