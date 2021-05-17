Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A398382B0F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:29:51 +0200 (CEST)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libRW-0003pP-JG
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libGz-0004kf-4r
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libGv-0005KE-5q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=533XPUbqxGbaE9NJu/QTGNQH6oFXBsKNrwpNnaZaue0=;
 b=Ou6UrFHI0eVdBecva5rpsDVOmHjrnD2rKcEb860jykBHeuHyanNQ48LnFD3Y2X7SwiH+GI
 /w5+QZj7ADzFYCaOZ2AK0dWqLRHr3Qq8w5avToP1A1x9Bx4a/kLNkQ7cEgFaf51+rMsJd5
 o8vKLbIJVfs4ptQOJRkrRZ0dx6dF4kE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-75JTC0pmM3-4PGVj6Hgo8Q-1; Mon, 17 May 2021 07:18:50 -0400
X-MC-Unique: 75JTC0pmM3-4PGVj6Hgo8Q-1
Received: by mail-pj1-f71.google.com with SMTP id
 x11-20020a17090a970bb029015d09295809so3117745pjo.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=533XPUbqxGbaE9NJu/QTGNQH6oFXBsKNrwpNnaZaue0=;
 b=l0QR+uOB84jWBkxzT7chSqkbsAhGUN1aMu9OpyGWFM4C9ELzPf4tIbPPPkL+ftEO7d
 qRJl5S91D2yF4A+k4JzV85ZmHotmkDs03hGBsswXI1nsyuML88JMj7AIF1/duBpbH30t
 hHrGY/GwR4PttKnvBrnvxwpqXmXBO4j35/KavKauQGWaWgRZiyoupc4D6ZMvaMfJCNDZ
 /iEV9wG8/uM+NZPP9bm1tUaQFwbnZEdLGUjOchJa6n6wV19vLdHDIdkgakw4MFX2Vjv5
 CKfBO8wTXqKUtYl9q7yzRNxnIDACHJZjtbCIIA6gkScked6BCbWZweC8yn+8pyBCusTP
 VN3g==
X-Gm-Message-State: AOAM5300rLOSe8X+AJA70Mq77+Es0SSL9PHnsI0ELZZbZaMRXf1NeguO
 inUJLR55kGFMZMrq9Rvvc3P4fO4JMdA6ECXYR+JwJI+KRCJcbhQZkSd2nPlkj9aRJRk6G4cxu+N
 9OBZ9RrI8yxMutkjemjoRgRYBF3DccOs=
X-Received: by 2002:a62:1d0f:0:b029:2d5:3ec2:feb8 with SMTP id
 d15-20020a621d0f0000b02902d53ec2feb8mr17531866pfd.19.1621250328967; 
 Mon, 17 May 2021 04:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK0owtZA638oBQUQ/77FPL4pkEeP3fkJxQOCXlBwGoayRjrbEck4O6n/DyBbqegN4nTBByXvJCQpav5R1h6xo=
X-Received: by 2002:a62:1d0f:0:b029:2d5:3ec2:feb8 with SMTP id
 d15-20020a621d0f0000b02902d53ec2feb8mr17531845pfd.19.1621250328613; Mon, 17
 May 2021 04:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-4-marcandre.lureau@redhat.com>
 <5d0a776e-e597-6996-c407-cd2d91883eac@redhat.com>
In-Reply-To: <5d0a776e-e597-6996-c407-cd2d91883eac@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 May 2021 15:18:37 +0400
Message-ID: <CAMxuvazaW17gNHtMD=agbtP04ru6UOVQWcG34tG0i8c7NecCpg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] qapi: start building an 'if' predicate tree
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000edee4a05c284c116"
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

--000000000000edee4a05c284c116
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 13, 2021 at 1:39 AM John Snow <jsnow@redhat.com> wrote:

> On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
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
> > ---
> >   docs/sphinx/qapidoc.py                 |  6 +--
> >   scripts/qapi/common.py                 | 54 +++++++++++++++++++++++-
> >   scripts/qapi/schema.py                 | 42 ++++++++++++-------
> >   tests/qapi-schema/doc-good.out         | 12 +++---
> >   tests/qapi-schema/qapi-schema-test.out | 58 +++++++++++++------------=
-
> >   5 files changed, 116 insertions(+), 56 deletions(-)
> >
> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> > index b737949007..a93f3f1c4d 100644
> > --- a/docs/sphinx/qapidoc.py
> > +++ b/docs/sphinx/qapidoc.py
> > @@ -112,12 +112,10 @@ def _make_section(self, title):
> >       def _nodes_for_ifcond(self, ifcond, with_if=3DTrue):
> >           """Return list of Text, literal nodes for the ifcond
> >
> > -        Return a list which gives text like ' (If: cond1, cond2,
> cond3)', where
> > -        the conditions are in literal-text and the commas are not.
> > +        Return a list which gives text like ' (If: condition)'.
> >           If with_if is False, we don't return the "(If: " and ")".
> >           """
> > -        condlist =3D intersperse([nodes.literal('', c) for c in
> ifcond.ifcond],
> > -                               nodes.Text(', '))
>
> was this the last user of intersperse?
>
> mm, no, there's one more.
>
> > +        condlist =3D [nodes.literal('', ifcond.gen_doc())]
> >           if not with_if:
> >               return condlist
> >
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index b7f475a160..59a7ee2f32 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -11,8 +11,9 @@
> >   # This work is licensed under the terms of the GNU GPL, version 2.
> >   # See the COPYING file in the top-level directory.
> >
> > +from abc import ABC, abstractmethod
> >   import re
> > -from typing import Optional
> > +from typing import Optional, Sequence
> >
> >
> >   #: Magic string that gets removed along with all space to its right.
> > @@ -192,3 +193,54 @@ def guardend(name: str) -> str:
> >   #endif /* %(name)s */
> >   ''',
> >                    name=3Dc_fname(name).upper())
> > +
> > +
> > +class IfPredicate(ABC):
> > +    @abstractmethod
> > +    def cgen(self) -> str:
>
> Like the review to patch 2, I'm not sure we want to bake cgen stuff
> directly into this class. Are you going to have cgen() and rustgen()
> methods all here?
>
>
As discussed, we'll see that when we get to it, I don't remember.

> +        pass
> > +
>
> I think you want raise NotImplementedError to specify a function that
> the inheriting class MUST implement. Otherwise, there's little value to
> allow a child class to call super() on a method that doesn't have a
> default implementation.
>
> You *could* drop the (ABC) and the @abstractmethod decorators if you do s=
o.
>
> Matters of taste and style.
>

ok


> > +    @abstractmethod
> > +    def docgen(self) -> str:
> > +        pass
> > + > +
> > +class IfOption(IfPredicate):
>
> missing a docstring here, but I suppose I haven't written a style guide
> on how to write those yet.
>
> I assume IfOption is one single element?
>

e.g. X && Y && Z is
>
> All(
>      Option(X),
>      Option(Y),
>      Option(Z),
> )
>
> Right?
>
>
Correct


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
> > +        return repr(self.option)
> > +
>
> type(self).__name__ + f"({self.option!r})"
>
> or just hard-code the IfOption in there
>

ok


> > +    def __eq__(self, other: object) -> bool:
> > +        if not isinstance(other, IfOption):
> > +            return False
>
> maybe NotImplemented?
>
> (Admitting I don't know the FULL consequences of doing it either way,
> just prompting you for an explanation.)
>

 Apparently NotImplemented is the best thing to do, as it will fallback in
other ways.

It doesn't really matter it seems, let's use NotImplemented.


> > +        return self.option =3D=3D other.option
> > +
> > +
> > +class IfAll(IfPredicate):
> > +    def __init__(self, pred_list: Sequence[IfPredicate]):
> > +        self.pred_list =3D pred_list
> > +
> > +    def cgen(self) -> str:
> > +        return " && ".join([p.cgen() for p in self.pred_list])
> > +
> > +    def docgen(self) -> str:
> > +        return " and ".join([p.docgen() for p in self.pred_list])
> > +
> > +    def __bool__(self) -> bool:
> > +        return bool(self.pred_list)
> > +
> > +    def __repr__(self) -> str:
> > +        return f"IfAll({self.pred_list})"
> > +
>
> {self.pred_list!r} to get the recursive repr.
>

ok


> You can consider adding a __str__ method to add a kind of short-hand
> that skips the class names and stuff and keeps the output less chatty.
>
>
ok

> +    def __eq__(self, other: object) -> bool:
> > +        if not isinstance(other, IfAll):
> > +            return False
>
> NotImplemented again?
>
> > +        return self.pred_list =3D=3D other.pred_list
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index 8e6d0a5296..366a53ab64 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -19,7 +19,13 @@
> >   import re
> >   from typing import Optional
> >
> > -from .common import POINTER_SUFFIX, c_name, mcgen
> > +from .common import (
> > +    POINTER_SUFFIX,
> > +    IfAll,
> > +    IfOption,
> > +    c_name,
> > +    mcgen,
> > +)
> >   from .error import QAPISemError, QAPISourceError
> >   from .expr import check_exprs
> >   from .parser import QAPISchemaParser
> > @@ -27,34 +33,38 @@
> >
> >   class QAPISchemaIfCond:
> >       def __init__(self, ifcond=3DNone):
> > -        self.ifcond =3D ifcond or []
> > +        pred_list =3D [IfOption(opt) for opt in ifcond or []]
> > +        self.pred =3D IfAll(pred_list)
> > +
> > +    def gen_doc(self):
> > +        if self.pred:
> > +            return self.pred.docgen()
> > +        return ""
> >
>
> pred should always be IfAll as of here, can we remove the conditional?
> .join() will deform to the empty string when it's given an empty sequence
>
>
ok

>       def gen_if(self):
> > -        ret =3D ''
> > -        for ifc in self.ifcond:
> > -            ret +=3D mcgen('''
> > +        if self.pred:
> > +            return mcgen('''
> >   #if %(cond)s
> > -''', cond=3Difc)
> > -        return ret
> > +''', cond=3Dself.pred.cgen())
> > +        return ""
> >
> >       def gen_endif(self):
> > -        ret =3D ''
> > -        for ifc in reversed(self.ifcond):
> > -            ret +=3D mcgen('''
> > -#endif /* %(cond)s */
> > -''', cond=3Difc)
> > -        return ret
> > +        if self.pred:
> > +            return mcgen('''
> > +#endif // %(cond)s
> > +''', cond=3Dself.pred.cgen())
> > +        return ""
> >
> >       def __bool__(self):
> > -        return bool(self.ifcond)
> > +        return bool(self.pred)
> >
> >       def __repr__(self):
> > -        return repr(self.ifcond)
> > +        return repr(self.pred)
> >
> >       def __eq__(self, other):
> >           if not isinstance(other, QAPISchemaIfCond):
> >               return NotImplemented
> > -        return self.ifcond =3D=3D other.ifcond
> > +        return self.pred =3D=3D other.pred
> >
> >
> >   class QAPISchemaEntity:
> > diff --git a/tests/qapi-schema/doc-good.out
> b/tests/qapi-schema/doc-good.out
> > index 8f54ceff2e..6bf996f539 100644
> > --- a/tests/qapi-schema/doc-good.out
> > +++ b/tests/qapi-schema/doc-good.out
> > @@ -12,15 +12,15 @@ enum QType
> >   module doc-good.json
> >   enum Enum
> >       member one
> > -        if ['defined(IFONE)']
> > +        if IfAll(['defined(IFONE)'])
>
> I suppose the test output changing, no longer representing a single
> language makes sense.
>
> >       member two
> > -    if ['defined(IFCOND)']
> > +    if IfAll(['defined(IFCOND)'])
> >       feature enum-feat
> >   object Base
> >       member base1: Enum optional=3DFalse
> >   object Variant1
> >       member var1: str optional=3DFalse
> > -        if ['defined(IFSTR)']
> > +        if IfAll(['defined(IFSTR)'])
> >           feature member-feat
> >       feature variant1-feat
> >   object Variant2
> > @@ -29,7 +29,7 @@ object Object
> >       tag base1
> >       case one: Variant1
> >       case two: Variant2
> > -        if ['IFTWO']
> > +        if IfAll(['IFTWO'])
> >       feature union-feat1
> >   object q_obj_Variant1-wrapper
> >       member data: Variant1 optional=3DFalse
> > @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
> >   enum SugaredUnionKind
> >       member one
> >       member two
> > -        if ['IFTWO']
> > +        if IfAll(['IFTWO'])
> >   object SugaredUnion
> >       member type: SugaredUnionKind optional=3DFalse
> >       tag type
> >       case one: q_obj_Variant1-wrapper
> >       case two: q_obj_Variant2-wrapper
> > -        if ['IFTWO']
> > +        if IfAll(['IFTWO'])
> >       feature union-feat2
> >   alternate Alternate
> >       tag type
> > diff --git a/tests/qapi-schema/qapi-schema-test.out
> b/tests/qapi-schema/qapi-schema-test.out
> > index e0b8a5f0b6..c2d303aa18 100644
> > --- a/tests/qapi-schema/qapi-schema-test.out
> > +++ b/tests/qapi-schema/qapi-schema-test.out
> > @@ -298,65 +298,65 @@ command __org.qemu_x-command
> q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
> >   object TestIfStruct
> >       member foo: int optional=3DFalse
> >       member bar: int optional=3DFalse
> > -        if ['defined(TEST_IF_STRUCT_BAR)']
> > -    if ['defined(TEST_IF_STRUCT)']
> > +        if IfAll(['defined(TEST_IF_STRUCT_BAR)'])
> > +    if IfAll(['defined(TEST_IF_STRUCT)'])
> >   enum TestIfEnum
> >       member foo
> >       member bar
> > -        if ['defined(TEST_IF_ENUM_BAR)']
> > -    if ['defined(TEST_IF_ENUM)']
> > +        if IfAll(['defined(TEST_IF_ENUM_BAR)'])
> > +    if IfAll(['defined(TEST_IF_ENUM)'])
> >   object q_obj_TestStruct-wrapper
> >       member data: TestStruct optional=3DFalse
> >   enum TestIfUnionKind
> >       member foo
> >       member bar
> > -        if ['defined(TEST_IF_UNION_BAR)']
> > -    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
> > +        if IfAll(['defined(TEST_IF_UNION_BAR)'])
> > +    if IfAll(['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)'])
> >   object TestIfUnion
> >       member type: TestIfUnionKind optional=3DFalse
> >       tag type
> >       case foo: q_obj_TestStruct-wrapper
> >       case bar: q_obj_str-wrapper
> > -        if ['defined(TEST_IF_UNION_BAR)']
> > -    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
> > +        if IfAll(['defined(TEST_IF_UNION_BAR)'])
> > +    if IfAll(['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)'])
> >   object q_obj_test-if-union-cmd-arg
> >       member union-cmd-arg: TestIfUnion optional=3DFalse
> > -    if ['defined(TEST_IF_UNION)']
> > +    if IfAll(['defined(TEST_IF_UNION)'])
> >   command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> > -    if ['defined(TEST_IF_UNION)']
> > +    if IfAll(['defined(TEST_IF_UNION)'])
> >   alternate TestIfAlternate
> >       tag type
> >       case foo: int
> >       case bar: TestStruct
> > -        if ['defined(TEST_IF_ALT_BAR)']
> > -    if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
> > +        if IfAll(['defined(TEST_IF_ALT_BAR)'])
> > +    if IfAll(['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)'])
> >   object q_obj_test-if-alternate-cmd-arg
> >       member alt-cmd-arg: TestIfAlternate optional=3DFalse
> > -    if ['defined(TEST_IF_ALT)']
> > +    if IfAll(['defined(TEST_IF_ALT)'])
> >   command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> > -    if ['defined(TEST_IF_ALT)']
> > +    if IfAll(['defined(TEST_IF_ALT)'])
> >   object q_obj_test-if-cmd-arg
> >       member foo: TestIfStruct optional=3DFalse
> >       member bar: TestIfEnum optional=3DFalse
> > -        if ['defined(TEST_IF_CMD_BAR)']
> > -    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
> > +        if IfAll(['defined(TEST_IF_CMD_BAR)'])
> > +    if IfAll(['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])
> >   command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> > -    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
> > +    if IfAll(['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])
> >   command test-cmd-return-def-three None -> UserDefThree
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >   array TestIfEnumList TestIfEnum
> > -    if ['defined(TEST_IF_ENUM)']
> > +    if IfAll(['defined(TEST_IF_ENUM)'])
> >   object q_obj_TEST_IF_EVENT-arg
> >       member foo: TestIfStruct optional=3DFalse
> >       member bar: TestIfEnumList optional=3DFalse
> > -        if ['defined(TEST_IF_EVT_BAR)']
> > -    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
> > +        if IfAll(['defined(TEST_IF_EVT_BAR)'])
> > +    if IfAll(['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'])
> >   event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
> >       boxed=3DFalse
> > -    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
> > +    if IfAll(['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'])
> >   object FeatureStruct0
> >       member foo: int optional=3DFalse
> >   object FeatureStruct1
> > @@ -379,17 +379,17 @@ object FeatureStruct4
> >   object CondFeatureStruct1
> >       member foo: int optional=3DFalse
> >       feature feature1
> > -        if ['defined(TEST_IF_FEATURE_1)']
> > +        if IfAll(['defined(TEST_IF_FEATURE_1)'])
> >   object CondFeatureStruct2
> >       member foo: int optional=3DFalse
> >       feature feature1
> > -        if ['defined(TEST_IF_FEATURE_1)']
> > +        if IfAll(['defined(TEST_IF_FEATURE_1)'])
> >       feature feature2
> > -        if ['defined(TEST_IF_FEATURE_2)']
> > +        if IfAll(['defined(TEST_IF_FEATURE_2)'])
> >   object CondFeatureStruct3
> >       member foo: int optional=3DFalse
> >       feature feature1
> > -        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
> > +        if IfAll(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'=
])
> >   enum FeatureEnum1
> >       member eins
> >       member zwei
> > @@ -429,17 +429,17 @@ command test-command-features3 None -> None
> >   command test-command-cond-features1 None -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >       feature feature1
> > -        if ['defined(TEST_IF_FEATURE_1)']
> > +        if IfAll(['defined(TEST_IF_FEATURE_1)'])
> >   command test-command-cond-features2 None -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >       feature feature1
> > -        if ['defined(TEST_IF_FEATURE_1)']
> > +        if IfAll(['defined(TEST_IF_FEATURE_1)'])
> >       feature feature2
> > -        if ['defined(TEST_IF_FEATURE_2)']
> > +        if IfAll(['defined(TEST_IF_FEATURE_2)'])
> >   command test-command-cond-features3 None -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >       feature feature1
> > -        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
> > +        if IfAll(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'=
])
> >   event TEST_EVENT_FEATURES0 FeatureStruct1
> >       boxed=3DFalse
> >   event TEST_EVENT_FEATURES1 None
> >
>
> Tested-by: John Snow <jsnow@redhat.com>
>
> Seems fine again, minor style qualms about Python I am not that direly
> opinionated on. More worried about the integration of cgen and docgen,
> though I see why with a predicate tree it becomes *extremely* convenient
> to integrate them right into the class.
>
> Is there a way to have our cake and eat it, too ... ?
>
> (Maybe a visitor of some kind is the right way to go?)
>

That's also what I thought (it was in my commit message comments).
Repeating myself, I'd defer this, there is no urge to make the code more
complex yet. It can easily be done in a following iteration.

--000000000000edee4a05c284c116
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 1:39 AM John Snow &lt=
;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 4=
/29/21 9:40 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The following patches are going to express schema &#39;if&#39; conditi=
ons in a<br>
&gt; target language agnostic way. For that, let&#39;s start building a pre=
dicate<br>
&gt; tree of the configuration options.<br>
&gt; <br>
&gt; This intermediary steps still uses C-preprocessor expressions as<br>
&gt; the predicates:<br>
&gt; <br>
&gt; &quot;if: [STR, ..]&quot; is translated to a &quot;IfCond -&gt; IfAll =
-&gt;<br>
&gt; [IfOption, ..]&quot; tree, which will generate &quot;#if STR &amp;&amp=
; ..&quot; C code.<br>
&gt; <br>
&gt; Once the boolean operation tree nodes are introduced, the &#39;if&#39;=
<br>
&gt; expressions will be converted to replace the C syntax (no more<br>
&gt; !defined(), &amp;&amp;, ...) and based only on option identifiers.<br>
&gt; <br>
&gt; For now, the condition tree will be less expressive than a full C macr=
o<br>
&gt; expression as it will only support these operations: &#39;all&#39;, &#=
39;any&#39; and<br>
&gt; &#39;not&#39;, the only ones needed so far.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
&gt;=C2=A0 =C2=A0scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 54 +++++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 42 ++++++++++++-------<br>
&gt;=C2=A0 =C2=A0tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 12 +++---<br>
&gt;=C2=A0 =C2=A0tests/qapi-schema/qapi-schema-test.out | 58 +++++++++++++-=
------------<br>
&gt;=C2=A0 =C2=A05 files changed, 116 insertions(+), 56 deletions(-)<br>
&gt; <br>
&gt; diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py<br>
&gt; index b737949007..a93f3f1c4d 100644<br>
&gt; --- a/docs/sphinx/qapidoc.py<br>
&gt; +++ b/docs/sphinx/qapidoc.py<br>
&gt; @@ -112,12 +112,10 @@ def _make_section(self, title):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _nodes_for_ifcond(self, ifcond, with_if=
=3DTrue):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Return list =
of Text, literal nodes for the ifcond<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return a list which gives text like &#39;=
 (If: cond1, cond2, cond3)&#39;, where<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 the conditions are in literal-text and th=
e commas are not.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return a list which gives text like &#39;=
 (If: condition)&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If with_if is False, we don&#3=
9;t return the &quot;(If: &quot; and &quot;)&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D intersperse([nodes.literal(&=
#39;&#39;, c) for c in ifcond.ifcond],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodes.Text(&#39;, &#39;))<br>
<br>
was this the last user of intersperse?<br>
<br>
mm, no, there&#39;s one more.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D [nodes.literal(&#39;&#39;, i=
fcond.gen_doc())]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not with_if:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return condlist<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index b7f475a160..59a7ee2f32 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -11,8 +11,9 @@<br>
&gt;=C2=A0 =C2=A0# This work is licensed under the terms of the GNU GPL, ve=
rsion 2.<br>
&gt;=C2=A0 =C2=A0# See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +from abc import ABC, abstractmethod<br>
&gt;=C2=A0 =C2=A0import re<br>
&gt; -from typing import Optional<br>
&gt; +from typing import Optional, Sequence<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#: Magic string that gets removed along with all space to =
its right.<br>
&gt; @@ -192,3 +193,54 @@ def guardend(name: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0#endif /* %(name)s */<br>
&gt;=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n=
ame=3Dc_fname(name).upper())<br>
&gt; +<br>
&gt; +<br>
&gt; +class IfPredicate(ABC):<br>
&gt; +=C2=A0 =C2=A0 @abstractmethod<br>
&gt; +=C2=A0 =C2=A0 def cgen(self) -&gt; str:<br>
<br>
Like the review to patch 2, I&#39;m not sure we want to bake cgen stuff <br=
>
directly into this class. Are you going to have cgen() and rustgen() <br>
methods all here?<br>
<br></blockquote><div><br></div><div>As discussed, we&#39;ll see that when =
we get to it, I don&#39;t remember.<br></div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +<br>
<br>
I think you want raise NotImplementedError to specify a function that <br>
the inheriting class MUST implement. Otherwise, there&#39;s little value to=
 <br>
allow a child class to call super() on a method that doesn&#39;t have a <br=
>
default implementation.<br>
<br>
You *could* drop the (ABC) and the @abstractmethod decorators if you do so.=
<br>
<br>
Matters of taste and style.<br></blockquote><div><br></div><div>ok</div><di=
v> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 @abstractmethod<br>
&gt; +=C2=A0 =C2=A0 def docgen(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; + &gt; +<br>
&gt; +class IfOption(IfPredicate):<br>
<br>
missing a docstring here, but I suppose I haven&#39;t written a style guide=
 <br>
on how to write those yet.<br>
<br>
I assume IfOption is one single element?<br>
=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
e.g. X &amp;&amp; Y &amp;&amp; Z is<br>
<br>
All(<br>
=C2=A0 =C2=A0 =C2=A0Option(X),<br>
=C2=A0 =C2=A0 =C2=A0Option(Y),<br>
=C2=A0 =C2=A0 =C2=A0Option(Z),<br>
)<br>
<br>
Right?<br>
<br></blockquote><div><br></div><div>Correct<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return repr(self.option)<br>
&gt; +<br>
<br>
type(self).__name__ + f&quot;({self.option!r})&quot;<br>
<br>
or just hard-code the IfOption in there<br></blockquote><div><br></div><div=
>ok</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 def __eq__(self, other: object) -&gt; bool:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, IfOption):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
<br>
maybe NotImplemented?<br>
<br>
(Admitting I don&#39;t know the FULL consequences of doing it either way, <=
br>
just prompting you for an explanation.)<br></blockquote><div><br></div><div=
>=C2=A0Apparently NotImplemented is the best thing to do, as it will fallba=
ck in other ways.</div><div><br></div><div>It doesn&#39;t really matter it =
seems, let&#39;s use NotImplemented.<br></div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.option =3D=3D other.option<br=
>
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
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def docgen(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot; and &quot;.join([p.docgen()=
 for p in self.pred_list])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __bool__(self) -&gt; bool:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.pred_list)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __repr__(self) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;IfAll({self.pred_list})&quo=
t;<br>
&gt; +<br>
<br>
{self.pred_list!r} to get the recursive repr.<br></blockquote><div><br></di=
v><div>ok</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
You can consider adding a __str__ method to add a kind of short-hand <br>
that skips the class names and stuff and keeps the output less chatty.<br>
<br></blockquote><div><br></div><div>ok</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 def __eq__(self, other: object) -&gt; bool:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, IfAll):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
<br>
NotImplemented again?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred_list =3D=3D other.pred_l=
ist<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index 8e6d0a5296..366a53ab64 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -19,7 +19,13 @@<br>
&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0from typing import Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from .common import POINTER_SUFFIX, c_name, mcgen<br>
&gt; +from .common import (<br>
&gt; +=C2=A0 =C2=A0 POINTER_SUFFIX,<br>
&gt; +=C2=A0 =C2=A0 IfAll,<br>
&gt; +=C2=A0 =C2=A0 IfOption,<br>
&gt; +=C2=A0 =C2=A0 c_name,<br>
&gt; +=C2=A0 =C2=A0 mcgen,<br>
&gt; +)<br>
&gt;=C2=A0 =C2=A0from .error import QAPISemError, QAPISourceError<br>
&gt;=C2=A0 =C2=A0from .expr import check_exprs<br>
&gt;=C2=A0 =C2=A0from .parser import QAPISchemaParser<br>
&gt; @@ -27,34 +33,38 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0class QAPISchemaIfCond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __init__(self, ifcond=3DNone):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pred_list =3D [IfOption(opt) for opt in i=
fcond or []]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pred =3D IfAll(pred_list)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def gen_doc(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.pred:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred.docgen()<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
<br>
pred should always be IfAll as of here, can we remove the conditional? <br>
.join() will deform to the empty string when it&#39;s given an empty sequen=
ce<br>
<br></blockquote><div><br></div><div>ok</div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def gen_if(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ifc in self.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#=
39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.pred:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mcgen(&#39;&#39;&#39=
;<br>
&gt;=C2=A0 =C2=A0#if %(cond)s<br>
&gt; -&#39;&#39;&#39;, cond=3Difc)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt; +&#39;&#39;&#39;, cond=3Dself.pred.cgen())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def gen_endif(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ifc in reversed(self.ifcond):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#=
39;<br>
&gt; -#endif /* %(cond)s */<br>
&gt; -&#39;&#39;&#39;, cond=3Difc)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.pred:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mcgen(&#39;&#39;&#39=
;<br>
&gt; +#endif // %(cond)s<br>
&gt; +&#39;&#39;&#39;, cond=3Dself.pred.cgen())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __bool__(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.pred)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __repr__(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return repr(self.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return repr(self.pred)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __eq__(self, other):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not isinstance(other, QAPIS=
chemaIfCond):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NotImplem=
ented<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.ifcond =3D=3D other.ifcond<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred =3D=3D other.pred<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0class QAPISchemaEntity:<br>
&gt; diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-go=
od.out<br>
&gt; index 8f54ceff2e..6bf996f539 100644<br>
&gt; --- a/tests/qapi-schema/doc-good.out<br>
&gt; +++ b/tests/qapi-schema/doc-good.out<br>
&gt; @@ -12,15 +12,15 @@ enum QType<br>
&gt;=C2=A0 =C2=A0module doc-good.json<br>
&gt;=C2=A0 =C2=A0enum Enum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member one<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(IFONE)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(IFONE)&#39;])<br>
<br>
I suppose the test output changing, no longer representing a single <br>
language makes sense.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member two<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(IFCOND)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(IFCOND)&#39;])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature enum-feat<br>
&gt;=C2=A0 =C2=A0object Base<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member base1: Enum optional=3DFalse<br>
&gt;=C2=A0 =C2=A0object Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member var1: str optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(IFSTR)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(IFSTR)&#39;])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feature member-feat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature variant1-feat<br>
&gt;=C2=A0 =C2=A0object Variant2<br>
&gt; @@ -29,7 +29,7 @@ object Object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag base1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case one: Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case two: Variant2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;IFTWO&#39;])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature union-feat1<br>
&gt;=C2=A0 =C2=A0object q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member data: Variant1 optional=3DFalse<br>
&gt; @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper<br>
&gt;=C2=A0 =C2=A0enum SugaredUnionKind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member two<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;IFTWO&#39;])<br>
&gt;=C2=A0 =C2=A0object SugaredUnion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member type: SugaredUnionKind optional=3DFal=
se<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case one: q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case two: q_obj_Variant2-wrapper<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;IFTWO&#39;])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature union-feat2<br>
&gt;=C2=A0 =C2=A0alternate Alternate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag type<br>
&gt; diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schem=
a/qapi-schema-test.out<br>
&gt; index e0b8a5f0b6..c2d303aa18 100644<br>
&gt; --- a/tests/qapi-schema/qapi-schema-test.out<br>
&gt; +++ b/tests/qapi-schema/qapi-schema-test.out<br>
&gt; @@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-=
command-arg -&gt; __org.qemu_x-Unio<br>
&gt;=C2=A0 =C2=A0object TestIfStruct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar: int optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_STRUCT_BAR)&#39;=
]<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_STRUCT_BAR=
)&#39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0enum TestIfEnum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ENUM_BAR)&#39;]<=
br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ENUM)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ENUM_BAR)&=
#39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ENUM)&#39;])<br>
&gt;=C2=A0 =C2=A0object q_obj_TestStruct-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member data: TestStruct optional=3DFalse<br>
&gt;=C2=A0 =C2=A0enum TestIfUnionKind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION_BAR)&#39;]=
<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION) &amp;&amp; defined(TEST=
_IF_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION_BAR)=
&#39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION) &amp;&amp; define=
d(TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0object TestIfUnion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member type: TestIfUnionKind optional=3DFals=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case foo: q_obj_TestStruct-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case bar: q_obj_str-wrapper<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION_BAR)&#39;]=
<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION) &amp;&amp; defined(TEST=
_IF_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION_BAR)=
&#39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION) &amp;&amp; define=
d(TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0object q_obj_test-if-union-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member union-cmd-arg: TestIfUnion optional=
=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION)&#39;])<br>
&gt;=C2=A0 =C2=A0command test-if-union-cmd q_obj_test-if-union-cmd-arg -&gt=
; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_UNION)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION)&#39;])<br>
&gt;=C2=A0 =C2=A0alternate TestIfAlternate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case foo: int<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case bar: TestStruct<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ALT_BAR)&#39;]<b=
r>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ALT) &amp;&amp; defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT_BAR)&#=
39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT) &amp;&amp; defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0object q_obj_test-if-alternate-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member alt-cmd-arg: TestIfAlternate optional=
=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ALT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT)&#39;])<br>
&gt;=C2=A0 =C2=A0command test-if-alternate-cmd q_obj_test-if-alternate-cmd-=
arg -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ALT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT)&#39;])<br>
&gt;=C2=A0 =C2=A0object q_obj_test-if-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: TestIfStruct optional=3DFalse<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar: TestIfEnum optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_CMD_BAR)&#39;]<b=
r>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_CMD)&#39;, &#39;defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_CMD_BAR)&#=
39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_CMD)&#39;, &#39;defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0command test-if-cmd q_obj_test-if-cmd-arg -&gt; UserDefThr=
ee<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_CMD)&#39;, &#39;defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_CMD)&#39;, &#39;defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0command test-cmd-return-def-three None -&gt; UserDefThree<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0array TestIfEnumList TestIfEnum<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_ENUM)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ENUM)&#39;])<br>
&gt;=C2=A0 =C2=A0object q_obj_TEST_IF_EVENT-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: TestIfStruct optional=3DFalse<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar: TestIfEnumList optional=3DFalse<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_EVT_BAR)&#39;]<b=
r>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_EVT) &amp;&amp; defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_EVT_BAR)&#=
39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_EVT) &amp;&amp; defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0boxed=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(TEST_IF_EVT) &amp;&amp; defined(TEST_I=
F_STRUCT)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_EVT) &amp;&amp; defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0object FeatureStruct0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0object FeatureStruct1<br>
&gt; @@ -379,17 +379,17 @@ object FeatureStruct4<br>
&gt;=C2=A0 =C2=A0object CondFeatureStruct1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_1)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_1)=
&#39;])<br>
&gt;=C2=A0 =C2=A0object CondFeatureStruct2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_1)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_1)=
&#39;])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_2)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_2)=
&#39;])<br>
&gt;=C2=A0 =C2=A0object CondFeatureStruct3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_COND_1)&#39;, &#=
39;defined(TEST_IF_COND_2)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_COND_1)&#3=
9;, &#39;defined(TEST_IF_COND_2)&#39;])<br>
&gt;=C2=A0 =C2=A0enum FeatureEnum1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member eins<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member zwei<br>
&gt; @@ -429,17 +429,17 @@ command test-command-features3 None -&gt; None<b=
r>
&gt;=C2=A0 =C2=A0command test-command-cond-features1 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_1)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_1)=
&#39;])<br>
&gt;=C2=A0 =C2=A0command test-command-cond-features2 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_1)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_1)=
&#39;])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_FEATURE_2)&#39;]=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_2)=
&#39;])<br>
&gt;=C2=A0 =C2=A0command test-command-cond-features3 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(TEST_IF_COND_1)&#39;, &#=
39;defined(TEST_IF_COND_2)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_COND_1)&#3=
9;, &#39;defined(TEST_IF_COND_2)&#39;])<br>
&gt;=C2=A0 =C2=A0event TEST_EVENT_FEATURES0 FeatureStruct1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0boxed=3DFalse<br>
&gt;=C2=A0 =C2=A0event TEST_EVENT_FEATURES1 None<br>
&gt; <br>
<br>
Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_bla=
nk">jsnow@redhat.com</a>&gt;<br>
<br>
Seems fine again, minor style qualms about Python I am not that direly <br>
opinionated on. More worried about the integration of cgen and docgen, <br>
though I see why with a predicate tree it becomes *extremely* convenient <b=
r>
to integrate them right into the class.<br>
<br>
Is there a way to have our cake and eat it, too ... ?<br>
<br>
(Maybe a visitor of some kind is the right way to go?)<br></blockquote><div=
><br></div>That&#39;s also what I thought (it was in my commit message comm=
ents). Repeating myself, I&#39;d defer this, there is no urge to make the c=
ode more complex yet. It can easily be done in a following iteration.<br></=
div></div>

--000000000000edee4a05c284c116--


