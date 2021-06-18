Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348D3AC8F5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:39:19 +0200 (CEST)
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBuA-0002hi-55
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1luBrd-0007jG-F4
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:36:41 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1luBrY-0007Ut-W8
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:36:41 -0400
Received: by mail-ej1-x634.google.com with SMTP id he7so15077413ejc.13
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o6z5pX4jCcCsSuzU73N1qg6XmbnfR0C6HsimjKbncqw=;
 b=SYz9ozXtEUKBw1oO3/6aAkh7Uko8pziaul36QZu5BIwmPB5GfYAMco1ae+Z2eTIKrR
 EBK0O/5zD/HYgKPKBXzKDhEZp6ve4eU/Jz7u7iq/E7NHwSmTqeOQb2eLs4ExydauszIP
 sNZqJxSZ7asgTWqKCGRob1Vnb8XVJzSfkOVubNM+B7+Lpck6DK/WbOOlX3e2R/hyb1BD
 Lj8zmUsmZCYGxvCkjmIW3LGNjKsz8gFFWiIJ6ZVDGAUZF44XNxQ6xWhJjJZjOEM5oKGb
 kitAulghjbdGpQN6uzjwDcJRAHsndcyyTQAZVjCanoRlkBVRaCWnZf4WsNpFB04Pc2n/
 a7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o6z5pX4jCcCsSuzU73N1qg6XmbnfR0C6HsimjKbncqw=;
 b=iigHTQ6mvd04kjTyU5679TZoqR+6H8UdpunWG2UPS2pniS7EwtIiHtqONEBvnNaqnJ
 SpvKHsUSM2YPrdCiS1KtPGfgndwXIjqZhMKADFbgu37Vx+C6HXCM778fk/HUfYJm/QQK
 5Wv/ObODJcT43129eNaJ9S3Cbzx/L06J+IbQg4xnVPkDgCPHckUO8DQYw6POQU6ChQ9A
 u4XwdHb2qv20SgfKEfnCIKag2Txd8qCaRPHKP8kAgc0TEyeZ64Hu5cmHLZaR0uPgmYKk
 YlaN6QwHae6Ac27iLMrxbO6gMWmInMEHK/l/MXOnzSZiPbG307OVAz3OMMGu/M1pKZTT
 Jt5g==
X-Gm-Message-State: AOAM533pp1IA1bSXZMIM123Wm4l4w1aXvMwgMfa0XkksWV+IKE0cHug8
 O0ZqWIitZVOEsWUhRoNlGHizMuygq8vyWV5kUis=
X-Google-Smtp-Source: ABdhPJyqPFLZBxa8wvoyAlKMYfg3krsQxMT5DnCpmVDz0hY0CpC5HHUaoeWc+p21A/VTnBJSJnChaSWPCKPHgFf+wls=
X-Received: by 2002:a17:906:7203:: with SMTP id
 m3mr10169393ejk.381.1624012594480; 
 Fri, 18 Jun 2021 03:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-8-marcandre.lureau@redhat.com>
 <87zgvrqs47.fsf@dusky.pond.sub.org>
In-Reply-To: <87zgvrqs47.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 18 Jun 2021 14:36:22 +0400
Message-ID: <CAJ+F1CLcbpLJNDMOs6dGQqCn2i42aeWL5Fy31Zn530BDDVh9Ug@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] qapi: normalize 'if' condition to IfPredicate tree
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ce08a005c507e565"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
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

--000000000000ce08a005c507e565
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jun 15, 2021 at 3:34 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Modify check_if() to normalize the condition tree.
>
> How is it normalized?  Let me rephrase my question: how does the IR
> change?  If the generated code changes, how?
>

Not anymore, since we dropped the sugar form. Updated in v6.


> > Add _make_if() to build a QAPISchemaIfCond tree.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/unit/test-qmp-cmds.c                    |  1 +
> >  scripts/qapi/expr.py                          | 51 +++++++++------
> >  scripts/qapi/schema.py                        | 62 +++++++++++++------
> >  tests/qapi-schema/bad-if-empty-list.json      |  2 +-
> >  tests/qapi-schema/bad-if-list.json            |  2 +-
> >  tests/qapi-schema/bad-if.err                  |  3 +-
> >  tests/qapi-schema/doc-good.out                | 12 ++--
> >  tests/qapi-schema/enum-if-invalid.err         |  3 +-
> >  tests/qapi-schema/features-if-invalid.err     |  2 +-
> >  tests/qapi-schema/qapi-schema-test.json       | 32 ++++++----
> >  tests/qapi-schema/qapi-schema-test.out        | 59 ++++++++++--------
> >  .../qapi-schema/struct-member-if-invalid.err  |  2 +-
> >  .../qapi-schema/union-branch-if-invalid.json  |  2 +-
> >  13 files changed, 143 insertions(+), 90 deletions(-)
> >
> > diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> > index 1b0b7d99df..83efa39720 100644
> > --- a/tests/unit/test-qmp-cmds.c
> > +++ b/tests/unit/test-qmp-cmds.c
> > @@ -51,6 +51,7 @@ FeatureStruct1 *qmp_test_features0(bool has_fs0,
> FeatureStruct0 *fs0,
> >                                     bool has_cfs1, CondFeatureStruct1
> *cfs1,
> >                                     bool has_cfs2, CondFeatureStruct2
> *cfs2,
> >                                     bool has_cfs3, CondFeatureStruct3
> *cfs3,
> > +                                   bool has_cfs4, CondFeatureStruct4
> *cfs4,
> >                                     Error **errp)
> >  {
> >      return g_new0(FeatureStruct1, 1);
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index 496f7e0333..60ffe9ef03 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -261,12 +261,12 @@ def check_if(expr: _JSONObject, info:
> QAPISourceInfo, source: str) -> None:
> >      """
> >      Normalize and validate the ``if`` member of an object.
> >
> > -    The ``if`` member may be either a ``str`` or a ``List[str]``.
> > -    A ``str`` value will be normalized to ``List[str]``.
>
> Double-checking: is this doc comment correct before this patch?
>

I think it was


> > +    The ``if`` field may be either a ``str`` or a dict.
> > +    A ``str`` element will be normalized to ``{'all': List[str]}``.
> >
> >      :forms:
> > -      :sugared: ``Union[str, List[str]]``
> > -      :canonical: ``List[str]``
> > +      :sugared: ``Union[str, dict]``
> > +      :canonical: ``Union[str, dict]``
> >
> >      :param expr: The expression containing the ``if`` member to
> validate.
> >      :param info: QAPI schema source file information.
> > @@ -281,25 +281,38 @@ def check_if(expr: _JSONObject, info:
> QAPISourceInfo, source: str) -> None:
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
> > -
> > -    for elt in ifcond:
> > -        if not isinstance(elt, str):
> > +    def normalize(cond: Union[str, object]) -> Union[str, object]:
>
> This definition is in the middle of check_if()'s body.  Intentional?
>

why not


> > +        if isinstance(cond, str):
> > +            if not cond.strip():
> > +                raise QAPISemError(
> > +                    info,
> > +                    "'if' condition '%s' of %s makes no sense"
> > +                    % (cond, source))
> > +            return cond
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
>
> Exactly one key, to be precise.
>
> > +                "'all', 'any' or 'not'" % source)
> > +        check_keys(cond, info, "'if' condition", [],
> > +                   ["all", "any", "not"])
>
> Hmmm.  Getting members of @cond before check_keys() would be wrong, but
> you don't do that.  Still, I like to call check_keys() early, just to
> reduce the chance for accidents.
>
> If we check_keys() first, we're left with just two possible errors:
> empty dict (len(cond)=3D=3D0), and conflicting keys (len(cond)>1).  We co=
uld
> choose to diagnose them separately, but it's probably not worth the
> bother.
>
> > +        oper, operands =3D next(iter(cond.items()))
> > +        if not operands:
> > +            raise QAPISemError(
> > +                info, "'if' condition [] of %s is useless" % source)
> > +        if oper =3D=3D "not":
> > +            return {oper: normalize(operands)}
> > +        if oper in ("all", "any") and not isinstance(operands, list):
> > +            raise QAPISemError(
> > +                info, "'%s' condition of %s must be a list" % (oper,
> source))
> > +        operands =3D [normalize(o) for o in operands]
> > +        return {oper: operands}
>
> I guess making this a function enables writing
>
>                return NE
>
> instead of
>
>                expr['if] =3D NE
>                return
>
> which is slightly more compact, and factors out the assignment's left
> hand side.  Feels like a wash, but up to you.
>
>
gone in v6

> +
> > +    expr['if'] =3D normalize(ifcond)
> >
> >
> >  def normalize_members(members: object) -> None:
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index f52caaeecc..9864e49c54 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -22,6 +22,8 @@
> >  from .common import (
> >      POINTER_SUFFIX,
> >      IfAll,
> > +    IfAny,
> > +    IfNot,
> >      IfOption,
> >      c_name,
> >  )
> > @@ -31,15 +33,14 @@
> >
> >
> >  class QAPISchemaIfCond:
> > -    def __init__(self, ifcond=3DNone):
> > -        self.ifcond =3D ifcond or []
> > -        self.pred =3D IfAll([IfOption(opt) for opt in self.ifcond])
> > +    def __init__(self, pred=3DNone):
> > +        self.pred =3D pred
> >
> >      def docgen(self):
> > -        return self.pred.docgen()
> > +        return self and self.pred.docgen()
>
> The more code relying on your __bool__() methods I see, the less I like
> them.
>
> Can we do self.pred and self.pred.docgen()?
>
> >
> >      def cgen(self):
> > -        return self.pred.cgen()
> > +        return self and self.pred.cgen()
>
> Likewise.
>
> >
> >      # Returns true if the condition is not void
> >      def __bool__(self):
> > @@ -991,16 +992,41 @@ def _def_predefineds(self):
> >          self._def_entity(QAPISchemaEnumType('QType', None, None, None,
> None,
> >                                              qtype_values, 'QTYPE'))
> >
> > +    def _make_if(self, cond):
> > +        if isinstance(cond, QAPISchemaIfCond):
> > +            return cond
> > +        if cond is None:
> > +            return QAPISchemaIfCond()
> > +
> > +        def make_pred(node):
> > +            if isinstance(node, str):
> > +                return IfOption(node)
> > +            oper, operands =3D next(iter(node.items()))
> > +            op2cls =3D {
> > +                'all': IfAll,
> > +                'any': IfAny,
> > +                'not': IfNot,
> > +            }
> > +
> > +            if isinstance(operands, list):
> > +                operands =3D [make_pred(o) for o in operands]
> > +            else:
> > +                operands =3D make_pred(operands)
> > +
> > +            return op2cls[oper](operands)
> > +
> > +        return QAPISchemaIfCond(make_pred(cond))
>
> Maybe it's the weather, but I find this pretty impenetrable right now.
>
> make_if() appears to accept either QAPISchemaIfCond, None, or a tree
> whose inner nodes are {'any': List[tree]}, {'all': List[tree]}, {'not':
> tree}, or str.  Quite the omnivore.
>
> None of the callers I can see pass QAPISchemaIfCond.  Am I confused?
>
> make_pred() appears to accept the tree.  The part dealing with str is
> obvious.
>
> next(iter(node.items())) appears to map a dict {key: val} to a tuple
> (key, val).  Too clever by half.
>
> val, and thus @operands then is either a list of trees (all, any), or a
> tree (not).
>
> The tree(s) in @operands get recursively processed.  Now @operands is
> either a List[IfPredicate], or an IfPredicate.
>
> IfAll and IfAny take the former, IfNot takes the latter.  Works out
> (*quack*), but I'm not sure mypy will be happy with it.
>

I removed the IfCond AST altogether in v6.


> > +
> >      def _make_features(self, features, info):
> >          if features is None:
> >              return []
> >          return [QAPISchemaFeature(f['name'], info,
> > -                                  QAPISchemaIfCond(f.get('if')))
> > +                                  self._make_if(f.get('if')))
> >                  for f in features]
> >
> >      def _make_enum_members(self, values, info):
> >          return [QAPISchemaEnumMember(v['name'], info,
> > -                                     QAPISchemaIfCond(v.get('if')))
> > +                                     self._make_if(v.get('if')))
> >                  for v in values]
> >
> >      def _make_implicit_enum_type(self, name, info, ifcond, values):
> > @@ -1046,7 +1072,7 @@ def _def_enum_type(self, expr, info, doc):
> >          name =3D expr['enum']
> >          data =3D expr['data']
> >          prefix =3D expr.get('prefix')
> > -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> > +        ifcond =3D self._make_if(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          self._def_entity(QAPISchemaEnumType(
> >              name, info, doc, ifcond, features,
> > @@ -1065,7 +1091,7 @@ def _make_member(self, name, typ, ifcond,
> features, info):
> >
> >      def _make_members(self, data, info):
> >          return [self._make_member(key, value['type'],
> > -                                  QAPISchemaIfCond(value.get('if')),
> > +                                  self._make_if(value.get('if')),
> >                                    value.get('features'), info)
> >                  for (key, value) in data.items()]
> >
> > @@ -1073,7 +1099,7 @@ def _def_struct_type(self, expr, info, doc):
> >          name =3D expr['struct']
> >          base =3D expr.get('base')
> >          data =3D expr['data']
> > -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> > +        ifcond =3D self._make_if(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          self._def_entity(QAPISchemaObjectType(
> >              name, info, doc, ifcond, features, base,
> > @@ -1096,7 +1122,7 @@ def _def_union_type(self, expr, info, doc):
> >          name =3D expr['union']
> >          data =3D expr['data']
> >          base =3D expr.get('base')
> > -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> > +        ifcond =3D self._make_if(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          tag_name =3D expr.get('discriminator')
> >          tag_member =3D None
> > @@ -1107,7 +1133,7 @@ def _def_union_type(self, expr, info, doc):
> >          if tag_name:
> >              variants =3D [
> >                  self._make_variant(key, value['type'],
> > -                                   QAPISchemaIfCond(value.get('if')),
> > +                                   self._make_if(value.get('if')),
> >                                     info)
> >                  for (key, value) in data.items()
> >              ]
> > @@ -1115,11 +1141,11 @@ def _def_union_type(self, expr, info, doc):
> >          else:
> >              variants =3D [
> >                  self._make_simple_variant(key, value['type'],
> > -
> QAPISchemaIfCond(value.get('if')),
> > +
> self._make_if(value.get('if')),
> >                                            info)
> >                  for (key, value) in data.items()
> >              ]
> > -            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in
> variants]
> > +            enum =3D [{'name': v.name, 'if': v.ifcond} for v in varian=
ts]
>
> Another riddle for me to solve?
>

See [PATCH v6 04/11] qapi: _make_enum_members() to work with pre-built
QAPISchemaIfCond


> >              typ =3D self._make_implicit_enum_type(name, info, ifcond,
> enum)
> >              tag_member =3D QAPISchemaObjectTypeMember('type', info, ty=
p,
> False)
> >              members =3D [tag_member]
> > @@ -1132,11 +1158,11 @@ def _def_union_type(self, expr, info, doc):
> >      def _def_alternate_type(self, expr, info, doc):
> >          name =3D expr['alternate']
> >          data =3D expr['data']
> > -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> > +        ifcond =3D self._make_if(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          variants =3D [
> >              self._make_variant(key, value['type'],
> > -                               QAPISchemaIfCond(value.get('if')),
> > +                               self._make_if(value.get('if')),
> >                                 info)
> >              for (key, value) in data.items()
> >          ]
> > @@ -1156,7 +1182,7 @@ def _def_command(self, expr, info, doc):
> >          allow_oob =3D expr.get('allow-oob', False)
> >          allow_preconfig =3D expr.get('allow-preconfig', False)
> >          coroutine =3D expr.get('coroutine', False)
> > -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> > +        ifcond =3D self._make_if(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          if isinstance(data, OrderedDict):
> >              data =3D self._make_implicit_object_type(
> > @@ -1175,7 +1201,7 @@ def _def_event(self, expr, info, doc):
> >          name =3D expr['event']
> >          data =3D expr.get('data')
> >          boxed =3D expr.get('boxed', False)
> > -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> > +        ifcond =3D self._make_if(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          if isinstance(data, OrderedDict):
> >              data =3D self._make_implicit_object_type(
> > diff --git a/tests/qapi-schema/bad-if-empty-list.json
> b/tests/qapi-schema/bad-if-empty-list.json
> > index 94f2eb8670..b62b5671df 100644
> > --- a/tests/qapi-schema/bad-if-empty-list.json
> > +++ b/tests/qapi-schema/bad-if-empty-list.json
> > @@ -1,3 +1,3 @@
> >  # check empty 'if' list
> >  { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> > -  'if': [] }
> > +  'if': { 'all': [] } }
> > diff --git a/tests/qapi-schema/bad-if-list.json
> b/tests/qapi-schema/bad-if-list.json
> > index ea3d95bb6b..1fefef16a7 100644
> > --- a/tests/qapi-schema/bad-if-list.json
> > +++ b/tests/qapi-schema/bad-if-list.json
> > @@ -1,3 +1,3 @@
> >  # check invalid 'if' content
> >  { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> > -  'if': ['foo', ' '] }
> > +  'if': { 'all': ['foo', ' '] } }
> > diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.er=
r
> > index f83dee65da..454fbae387 100644
> > --- a/tests/qapi-schema/bad-if.err
> > +++ b/tests/qapi-schema/bad-if.err
> > @@ -1,2 +1,3 @@
> >  bad-if.json: In struct 'TestIfStruct':
> > -bad-if.json:2: 'if' condition of struct must be a string or a list of
> strings
> > +bad-if.json:2: 'if' condition has unknown key 'value'
> > +Valid keys are 'all', 'any', 'not'.
> > diff --git a/tests/qapi-schema/doc-good.out
> b/tests/qapi-schema/doc-good.out
> > index db1d23c6bf..4d951f97ee 100644
> > --- a/tests/qapi-schema/doc-good.out
> > +++ b/tests/qapi-schema/doc-good.out
> > @@ -12,15 +12,15 @@ enum QType
> >  module doc-good.json
> >  enum Enum
> >      member one
> > -        if IfAll([IfOption('defined(IFONE)')])
> > +        if IfOption('defined(IFONE)')
> >      member two
> > -    if IfAll([IfOption('defined(IFCOND)')])
> > +    if IfOption('defined(IFCOND)')
> >      feature enum-feat
> >  object Base
> >      member base1: Enum optional=3DFalse
> >  object Variant1
> >      member var1: str optional=3DFalse
> > -        if IfAll([IfOption('defined(IFSTR)')])
> > +        if IfOption('defined(IFSTR)')
> >          feature member-feat
> >      feature variant1-feat
> >  object Variant2
> > @@ -29,7 +29,7 @@ object Object
> >      tag base1
> >      case one: Variant1
> >      case two: Variant2
> > -        if IfAll([IfOption('IFTWO')])
> > +        if IfOption('IFTWO')
> >      feature union-feat1
> >  object q_obj_Variant1-wrapper
> >      member data: Variant1 optional=3DFalse
> > @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
> >  enum SugaredUnionKind
> >      member one
> >      member two
> > -        if IfAll([IfOption('IFTWO')])
> > +        if IfOption('IFTWO')
> >  object SugaredUnion
> >      member type: SugaredUnionKind optional=3DFalse
> >      tag type
> >      case one: q_obj_Variant1-wrapper
> >      case two: q_obj_Variant2-wrapper
> > -        if IfAll([IfOption('IFTWO')])
> > +        if IfOption('IFTWO')
> >      feature union-feat2
> >  alternate Alternate
> >      tag type
> [...]
>
> Skipping the tests for now because I'm running out of brain-juice.
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ce08a005c507e565
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 15, 2021 at 3:34 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">a=
rmbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Modify check_if() to normalize the condition tree.<br>
<br>
How is it normalized?=C2=A0 Let me rephrase my question: how does the IR<br=
>
change?=C2=A0 If the generated code changes, how?<br></blockquote><div><br>=
</div><div>Not anymore, since we dropped the sugar form. Updated in v6.<br>=
</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Add _make_if() to build a QAPISchemaIfCond tree.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/unit/test-qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 51 +++++++++------<br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 62 +++++++++++++------<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-empty-list.json=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-list.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 12 ++--<br>
&gt;=C2=A0 tests/qapi-schema/enum-if-invalid.err=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 tests/qapi-schema/features-if-invalid.err=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.json=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 32 ++++++----<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.out=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 59 ++++++++++--------<br>
&gt;=C2=A0 .../qapi-schema/struct-member-if-invalid.err=C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 .../qapi-schema/union-branch-if-invalid.json=C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 13 files changed, 143 insertions(+), 90 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c<b=
r>
&gt; index 1b0b7d99df..83efa39720 100644<br>
&gt; --- a/tests/unit/test-qmp-cmds.c<br>
&gt; +++ b/tests/unit/test-qmp-cmds.c<br>
&gt; @@ -51,6 +51,7 @@ FeatureStruct1 *qmp_test_features0(bool has_fs0, Fea=
tureStruct0 *fs0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_cfs1=
, CondFeatureStruct1 *cfs1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_cfs2=
, CondFeatureStruct2 *cfs2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_cfs3=
, CondFeatureStruct3 *cfs3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_cfs4, Cond=
FeatureStruct4 *cfs4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)=
<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return g_new0(FeatureStruct1, 1);<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index 496f7e0333..60ffe9ef03 100644<br>
&gt; --- a/scripts/qapi/expr.py<br>
&gt; +++ b/scripts/qapi/expr.py<br>
&gt; @@ -261,12 +261,12 @@ def check_if(expr: _JSONObject, info: QAPISource=
Info, source: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Normalize and validate the ``if`` member of an obj=
ect.<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 The ``if`` member may be either a ``str`` or a ``List[s=
tr]``.<br>
&gt; -=C2=A0 =C2=A0 A ``str`` value will be normalized to ``List[str]``.<br=
>
<br>
Double-checking: is this doc comment correct before this patch?<br></blockq=
uote><div><br></div><div>I think it was</div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 The ``if`` field may be either a ``str`` or a dict.<br>
&gt; +=C2=A0 =C2=A0 A ``str`` element will be normalized to ``{&#39;all&#39=
;: List[str]}``.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 :forms:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 :sugared: ``Union[str, List[str]]``<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 :canonical: ``List[str]``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :sugared: ``Union[str, dict]``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :canonical: ``Union[str, dict]``<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 :param expr: The expression containing the ``if`` =
member to validate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :param info: QAPI schema source file information.<=
br>
&gt; @@ -281,25 +281,38 @@ def check_if(expr: _JSONObject, info: QAPISource=
Info, source: str) -&gt; None:<br>
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
&gt; -<br>
&gt; -=C2=A0 =C2=A0 for elt in ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(elt, str):<br>
&gt; +=C2=A0 =C2=A0 def normalize(cond: Union[str, object]) -&gt; Union[str=
, object]:<br>
<br>
This definition is in the middle of check_if()&#39;s body.=C2=A0 Intentiona=
l?<br></blockquote><div><br></div><div>why not</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cond<br>
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
<br>
Exactly one key, to be precise.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;al=
l&#39;, &#39;any&#39; or &#39;not&#39;&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_keys(cond, info, &quot;&#39;if&#39;=
 condition&quot;, [],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[&quot;all&quot;, &quot;any&quot;, &quot;not&quot;])<br>
<br>
Hmmm.=C2=A0 Getting members of @cond before check_keys() would be wrong, bu=
t<br>
you don&#39;t do that.=C2=A0 Still, I like to call check_keys() early, just=
 to<br>
reduce the chance for accidents.<br>
<br>
If we check_keys() first, we&#39;re left with just two possible errors:<br>
empty dict (len(cond)=3D=3D0), and conflicting keys (len(cond)&gt;1).=C2=A0=
 We could<br>
choose to diagnose them separately, but it&#39;s probably not worth the<br>
bother.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oper, operands =3D next(iter(cond.items()=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not operands:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;if&#39; condition [] of %s is useless&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if oper =3D=3D &quot;not&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return {oper: normalize(ope=
rands)}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if oper in (&quot;all&quot;, &quot;any&qu=
ot;) and not isinstance(operands, list):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;%s&#39; condition of %s must be a list&quot; % (oper, source))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 operands =3D [normalize(o) for o in opera=
nds]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return {oper: operands}<br>
<br>
I guess making this a function enables writing<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NE<br>
<br>
instead of<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expr[&#39;if] =3D NE=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
which is slightly more compact, and factors out the assignment&#39;s left<b=
r>
hand side.=C2=A0 Feels like a wash, but up to you.<br>
<br></blockquote><div><br></div><div>gone in v6<br></div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 expr[&#39;if&#39;] =3D normalize(ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def normalize_members(members: object) -&gt; None:<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index f52caaeecc..9864e49c54 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -22,6 +22,8 @@<br>
&gt;=C2=A0 from .common import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 POINTER_SUFFIX,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IfAll,<br>
&gt; +=C2=A0 =C2=A0 IfAny,<br>
&gt; +=C2=A0 =C2=A0 IfNot,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IfOption,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c_name,<br>
&gt;=C2=A0 )<br>
&gt; @@ -31,15 +33,14 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class QAPISchemaIfCond:<br>
&gt; -=C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pred =3D IfAll([IfOption(opt) for op=
t in self.ifcond])<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, pred=3DNone):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pred =3D pred<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def docgen(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred.docgen()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self and self.pred.docgen()<br>
<br>
The more code relying on your __bool__() methods I see, the less I like<br>
them.<br>
<br>
Can we do self.pred and self.pred.docgen()?<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def cgen(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pred.cgen()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self and self.pred.cgen()<br>
<br>
Likewise.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Returns true if the condition is not void<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __bool__(self):<br>
&gt; @@ -991,16 +992,41 @@ def _def_predefineds(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPISchemaEnumType(=
&#39;QType&#39;, None, None, None, None,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qtype_values, &#39;QTYPE&#39;))<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def _make_if(self, cond):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(cond, QAPISchemaIfCond):<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cond<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cond is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return QAPISchemaIfCond()<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def make_pred(node):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(node, str):<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IfOpti=
on(node)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oper, operands =3D next(ite=
r(node.items()))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op2cls =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;all&#39;=
: IfAll,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;any&#39;=
: IfAny,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;not&#39;=
: IfNot,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(operands, lis=
t):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 operands =3D =
[make_pred(o) for o in operands]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 operands =3D =
make_pred(operands)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return op2cls[oper](operand=
s)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return QAPISchemaIfCond(make_pred(cond))<=
br>
<br>
Maybe it&#39;s the weather, but I find this pretty impenetrable right now.<=
br>
<br>
make_if() appears to accept either QAPISchemaIfCond, None, or a tree<br>
whose inner nodes are {&#39;any&#39;: List[tree]}, {&#39;all&#39;: List[tre=
e]}, {&#39;not&#39;:<br>
tree}, or str.=C2=A0 Quite the omnivore.<br>
<br>
None of the callers I can see pass QAPISchemaIfCond.=C2=A0 Am I confused?<b=
r>
<br>
make_pred() appears to accept the tree.=C2=A0 The part dealing with str is<=
br>
obvious.<br>
<br>
next(iter(node.items())) appears to map a dict {key: val} to a tuple<br>
(key, val).=C2=A0 Too clever by half.<br>
<br>
val, and thus @operands then is either a list of trees (all, any), or a<br>
tree (not).<br>
<br>
The tree(s) in @operands get recursively processed.=C2=A0 Now @operands is<=
br>
either a List[IfPredicate], or an IfPredicate.<br>
<br>
IfAll and IfAny take the former, IfNot takes the latter.=C2=A0 Works out<br=
>
(*quack*), but I&#39;m not sure mypy will be happy with it.<br></blockquote=
><div><br></div><div>I removed the IfCond AST altogether in v6.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_features(self, features, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if features is None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaFeature(f[&#39;nam=
e&#39;], info,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaIfCond(f.get(&#=
39;if&#39;)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_if(f.get(&#39;=
if&#39;)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in=
 features]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_enum_members(self, values, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;=
name&#39;], info,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIf=
Cond(v.get(&#39;if&#39;)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._make_i=
f(v.get(&#39;if&#39;)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for v in=
 values]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_implicit_enum_type(self, name, info, ifc=
ond, values):<br>
&gt; @@ -1046,7 +1072,7 @@ def _def_enum_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;enum&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D expr.get(&#39;prefix&#39;=
)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D self._make_if(expr.get(&#39;if=
&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPISchemaEnumType(=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, info, doc, ifcon=
d, features,<br>
&gt; @@ -1065,7 +1091,7 @@ def _make_member(self, name, typ, ifcond, featur=
es, info):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_members(self, data, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return [self._make_member(key, value=
[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaIfCond(value.ge=
t(&#39;if&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_if(value.get(&=
#39;if&#39;)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value.get(&#39;feat=
ures&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key=
, value) in data.items()]<br>
&gt;=C2=A0 <br>
&gt; @@ -1073,7 +1099,7 @@ def _def_struct_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;struct&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D expr.get(&#39;base&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D self._make_if(expr.get(&#39;if=
&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPISchemaObjectTyp=
e(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, info, doc, ifcon=
d, features, base,<br>
&gt; @@ -1096,7 +1122,7 @@ def _def_union_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;union&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D expr.get(&#39;base&#39;)<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D self._make_if(expr.get(&#39;if=
&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_name =3D expr.get(&#39;discrimin=
ator&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D None<br>
&gt; @@ -1107,7 +1133,7 @@ def _def_union_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tag_name:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ma=
ke_variant(key, value[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond(va=
lue.get(&#39;if&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._make_if(value=
.get(&#39;if&#39;)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key=
, value) in data.items()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; @@ -1115,11 +1141,11 @@ def _def_union_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ma=
ke_simple_variant(key, value[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 QAPISchemaIfCond(value.get(&#39;if&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._make_if(value.get(&#39;if&#39;)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key=
, value) in data.items()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: =
<a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, =
&#39;if&#39;: v.ifcond.ifcond} for v in variants]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: =
<a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, =
&#39;if&#39;: v.ifcond} for v in variants]<br>
<br>
Another riddle for me to solve?<br></blockquote><div><br></div><div>See [PA=
TCH v6 04/11] qapi: _make_enum_members() to work with pre-built QAPISchemaI=
fCond</div><div><br> </div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typ =3D self._make_imp=
licit_enum_type(name, info, ifcond, enum)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D QAPISch=
emaObjectTypeMember(&#39;type&#39;, info, typ, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 members =3D [tag_membe=
r]<br>
&gt; @@ -1132,11 +1158,11 @@ def _def_union_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 def _def_alternate_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;alternate&#39;]<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D self._make_if(expr.get(&#39;if=
&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_variant(key=
, value[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond(value.get(&#39;i=
f&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._make_if(value.get(&#39;if&#=
39;)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, value) in da=
ta.items()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; @@ -1156,7 +1182,7 @@ def _def_command(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_oob =3D expr.get(&#39;allow-oo=
b&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_preconfig =3D expr.get(&#39;al=
low-preconfig&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coroutine =3D expr.get(&#39;coroutin=
e&#39;, False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D self._make_if(expr.get(&#39;if=
&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(data, OrderedDict):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D self._make_im=
plicit_object_type(<br>
&gt; @@ -1175,7 +1201,7 @@ def _def_event(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;event&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr.get(&#39;data&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boxed =3D expr.get(&#39;boxed&#39;, =
False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D self._make_if(expr.get(&#39;if=
&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(data, OrderedDict):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D self._make_im=
plicit_object_type(<br>
&gt; diff --git a/tests/qapi-schema/bad-if-empty-list.json b/tests/qapi-sch=
ema/bad-if-empty-list.json<br>
&gt; index 94f2eb8670..b62b5671df 100644<br>
&gt; --- a/tests/qapi-schema/bad-if-empty-list.json<br>
&gt; +++ b/tests/qapi-schema/bad-if-empty-list.json<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # check empty &#39;if&#39; list<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;TestIfStruct&#39;, &#39;data&#39;: { &#=
39;foo&#39;: &#39;int&#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: [] }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;all&#39;: [] } }<br>
&gt; diff --git a/tests/qapi-schema/bad-if-list.json b/tests/qapi-schema/ba=
d-if-list.json<br>
&gt; index ea3d95bb6b..1fefef16a7 100644<br>
&gt; --- a/tests/qapi-schema/bad-if-list.json<br>
&gt; +++ b/tests/qapi-schema/bad-if-list.json<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # check invalid &#39;if&#39; content<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;TestIfStruct&#39;, &#39;data&#39;: { &#=
39;foo&#39;: &#39;int&#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: [&#39;foo&#39;, &#39; &#39;] }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;all&#39;: [&#39;foo&#39;, &#39; &#39;] } =
}<br>
&gt; diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.e=
rr<br>
&gt; index f83dee65da..454fbae387 100644<br>
&gt; --- a/tests/qapi-schema/bad-if.err<br>
&gt; +++ b/tests/qapi-schema/bad-if.err<br>
&gt; @@ -1,2 +1,3 @@<br>
&gt;=C2=A0 bad-if.json: In struct &#39;TestIfStruct&#39;:<br>
&gt; -bad-if.json:2: &#39;if&#39; condition of struct must be a string or a=
 list of strings<br>
&gt; +bad-if.json:2: &#39;if&#39; condition has unknown key &#39;value&#39;=
<br>
&gt; +Valid keys are &#39;all&#39;, &#39;any&#39;, &#39;not&#39;.<br>
&gt; diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-go=
od.out<br>
&gt; index db1d23c6bf..4d951f97ee 100644<br>
&gt; --- a/tests/qapi-schema/doc-good.out<br>
&gt; +++ b/tests/qapi-schema/doc-good.out<br>
&gt; @@ -12,15 +12,15 @@ enum QType<br>
&gt;=C2=A0 module doc-good.json<br>
&gt;=C2=A0 enum Enum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member one<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(IFONE)&#3=
9;)])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfOption(&#39;defined(IFONE)&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member two<br>
&gt; -=C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(IFCOND)&#39;)])<br>
&gt; +=C2=A0 =C2=A0 if IfOption(&#39;defined(IFCOND)&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature enum-feat<br>
&gt;=C2=A0 object Base<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member base1: Enum optional=3DFalse<br>
&gt;=C2=A0 object Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member var1: str optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;defined(IFSTR)&#3=
9;)])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfOption(&#39;defined(IFSTR)&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature member-feat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature variant1-feat<br>
&gt;=C2=A0 object Variant2<br>
&gt; @@ -29,7 +29,7 @@ object Object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag base1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case one: Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case two: Variant2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;IFTWO&#39;)])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfOption(&#39;IFTWO&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature union-feat1<br>
&gt;=C2=A0 object q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member data: Variant1 optional=3DFalse<br>
&gt; @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper<br>
&gt;=C2=A0 enum SugaredUnionKind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member two<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;IFTWO&#39;)])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfOption(&#39;IFTWO&#39;)<br>
&gt;=C2=A0 object SugaredUnion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member type: SugaredUnionKind optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case one: q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case two: q_obj_Variant2-wrapper<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([IfOption(&#39;IFTWO&#39;)])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfOption(&#39;IFTWO&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature union-feat2<br>
&gt;=C2=A0 alternate Alternate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag type<br>
[...]<br>
<br>
Skipping the tests for now because I&#39;m running out of brain-juice.<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000ce08a005c507e565--

