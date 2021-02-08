Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8473141BE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:28:30 +0100 (CET)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9E56-0001A1-NN
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l98YS-00035d-JV
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l98YO-00062R-06
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612798457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5WiDFDc2WL8GoTLvtiXLEMEq+4MXtwSd2vs+sCZM+8=;
 b=fyki1dZyZ3kRdxndRb757s9xvho3u0OPyUOc53yFFfX8a4FQQc/E8Aizsa+dCgqRDjSIfN
 vjgU0nbypPsfiZHbvTtjeNzaJWgA+9gXY/1z092qZSy8zLDuwVI77Fkie/FoyTblN/ni8M
 FOJUSSdj6SwxVBkILMBRzUaQX1yizVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-PUhWx9o9NR-ubevmTFT4Vg-1; Mon, 08 Feb 2021 10:34:13 -0500
X-MC-Unique: PUhWx9o9NR-ubevmTFT4Vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36426835E35
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 15:34:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADC9360C05;
 Mon,  8 Feb 2021 15:34:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D90F113865F; Mon,  8 Feb 2021 16:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 12/15] qapi/introspect.py: add type hint annotations
References: <20210204003207.2856909-1-jsnow@redhat.com>
 <20210204003207.2856909-13-jsnow@redhat.com>
Date: Mon, 08 Feb 2021 16:34:09 +0100
In-Reply-To: <20210204003207.2856909-13-jsnow@redhat.com> (John Snow's message
 of "Wed, 3 Feb 2021 19:32:04 -0500")
Message-ID: <87im723766.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> See the next patch for an optional amendment that helps to clarify what
> _DObject is meant to be.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 117 ++++++++++++++++++++++++++-----------
>  scripts/qapi/mypy.ini      |   5 --
>  scripts/qapi/schema.py     |   2 +-
>  3 files changed, 84 insertions(+), 40 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index cf0e4e05c5c..3afcdda7446 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -30,10 +30,19 @@
>  )
>  from .gen import QAPISchemaMonolithicCVisitor
>  from .schema import (
> +    QAPISchema,
>      QAPISchemaArrayType,
>      QAPISchemaBuiltinType,
> +    QAPISchemaEntity,
> +    QAPISchemaEnumMember,
> +    QAPISchemaFeature,
> +    QAPISchemaObjectType,
> +    QAPISchemaObjectTypeMember,
>      QAPISchemaType,
> +    QAPISchemaVariant,
> +    QAPISchemaVariants,
>  )
> +from .source import QAPISourceInfo
>  
>  
>  # This module constructs a tree data structure that is used to
> @@ -57,6 +66,10 @@
   _stub = Any
   _scalar = Union[str, bool, None]
   _nonscalar = Union[Dict[str, _stub], List[_stub]]
>  _value = Union[_scalar, _nonscalar]
>  TreeValue = Union[_value, 'Annotated[_value]']
>  
> +# This is an alias for an arbitrary JSON object, represented here as a Dict.
> +# It is stricter on the value type than the recursive definition above.
> +# It is used to represent SchemaInfo-related structures exclusively.
> +_DObject = Dict[str, object]

Please work in an abridged version of your helpful reply to my ignorant
questions in review of v4.

My comments below are based on the following understanding:

_value has a Dict[str, Any] branch.

_DObject is Dict[str, object].

Both types are for the tree's dict nodes.  Both under-constrain the
dict's values in the sense that anything can go into the dict.  The
difference is static type checking on use of dict values: none with the
former, overly strict with the latter (to actually do something
interesting with a value, you usually have to narrow its static type to
a more specific one than object).

So, having _DObject in addition to the _value branch buys us a little
more static type checking.  I don't understand what type checking
exactly, and therefore can't judge whether it's worth the price in
complexity.  If you can enlighten me, I'm all ears.

>  
>  _NodeT = TypeVar('_NodeT', bound=_value)
>  
> @@ -76,9 +89,11 @@ def __init__(self, value: _NodeT, ifcond: Iterable[str],
>          self.ifcond: Tuple[str, ...] = tuple(ifcond)
>  
>  
> -def _tree_to_qlit(obj, level=0, dict_value=False):
> +def _tree_to_qlit(obj: TreeValue,
> +                  level: int = 0,
> +                  dict_value: bool = False) -> str:
>  
> -    def indent(level):
> +    def indent(level: int) -> str:
>          return level * 4 * ' '
>  
>      if isinstance(obj, Annotated):
> @@ -135,21 +150,21 @@ def indent(level):
>      return ret
>  
>  
> -def to_c_string(string):
> +def to_c_string(string: str) -> str:
>      return '"' + string.replace('\\', r'\\').replace('"', r'\"') + '"'
>  
>  
>  class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
>  
> -    def __init__(self, prefix, unmask):
> +    def __init__(self, prefix: str, unmask: bool):
>          super().__init__(
>              prefix, 'qapi-introspect',
>              ' * QAPI/QMP schema introspection', __doc__)
>          self._unmask = unmask
> -        self._schema = None
> -        self._trees = []
> -        self._used_types = []
> -        self._name_map = {}
> +        self._schema: Optional[QAPISchema] = None
> +        self._trees: List[Annotated[_DObject]] = []
> +        self._used_types: List[QAPISchemaType] = []
> +        self._name_map: Dict[str, str] = {}
>          self._genc.add(mcgen('''
>  #include "qemu/osdep.h"
>  #include "%(prefix)sqapi-introspect.h"
> @@ -157,10 +172,10 @@ def __init__(self, prefix, unmask):
>  ''',
>                               prefix=prefix))
>  
> -    def visit_begin(self, schema):
> +    def visit_begin(self, schema: QAPISchema) -> None:
>          self._schema = schema
>  
> -    def visit_end(self):
> +    def visit_end(self) -> None:
>          # visit the types that are actually used
>          for typ in self._used_types:
>              typ.visit(self)
> @@ -182,18 +197,18 @@ def visit_end(self):
>          self._used_types = []
>          self._name_map = {}
>  
> -    def visit_needed(self, entity):
> +    def visit_needed(self, entity: QAPISchemaEntity) -> bool:
>          # Ignore types on first pass; visit_end() will pick up used types
>          return not isinstance(entity, QAPISchemaType)
>  
> -    def _name(self, name):
> +    def _name(self, name: str) -> str:
>          if self._unmask:
>              return name
>          if name not in self._name_map:
>              self._name_map[name] = '%d' % len(self._name_map)
>          return self._name_map[name]
>  
> -    def _use_type(self, typ):
> +    def _use_type(self, typ: QAPISchemaType) -> str:
>          assert self._schema is not None
>  
>          # Map the various integer types to plain int
> @@ -215,10 +230,13 @@ def _use_type(self, typ):
>          return self._name(typ.name)
>  
>      @staticmethod
> -    def _gen_features(features):
> +    def _gen_features(features: List[QAPISchemaFeature]
> +                      ) -> List[Annotated[str]]:
>          return [Annotated(f.name, f.ifcond) for f in features]
>  
> -    def _gen_tree(self, name, mtype, obj, ifcond, features):
> +    def _gen_tree(self, name: str, mtype: str, obj: _DObject,
> +                  ifcond: List[str],
> +                  features: Optional[List[QAPISchemaFeature]]) -> None:

Recycling my review of v2...

* @name corresponds to SchemaInfo member name, which is indeed str.
  Okay.

* @mtype corresponds to member meta-type, which is enum SchemaMetaType.
  It's not a Python Enum, because those were off limits when this code
  was written.  We type what we have, and we have str.  Okay.

* @obj will be turned by _gen_tree() into the tree for a SchemaInfo.
  _DObject fits the bill.

* ifcond: List[str] should work, but gen_if(), gen_endif() use
  Sequence[str].  When I pointed this out for v2, you replied "should
  probable be using Sequence".

  More instances of ifcond: List[str] elsewhere; I'm not flagging them.

* features: Optional[List[QAPISchemaFeature]] is correct.  "No features"
  has two representations: None and [].  I guess we could eliminate
  None, trading a tiny bit of efficiency for simpler typing.  Not a
  demand.

>          comment: Optional[str] = None

"No annotations" is represented as None here, not {}.  I guess we could
use {} for simpler typing.  When I pointed this out for v2, you replied
it'll go away later.  Good enough for me.

>          if mtype not in ('command', 'event', 'builtin', 'array'):
>              if not self._unmask:
> @@ -232,47 +250,67 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
>              obj['features'] = self._gen_features(features)
>          self._trees.append(Annotated(obj, ifcond, comment))
>  
> -    def _gen_member(self, member):
> -        obj = {'name': member.name, 'type': self._use_type(member.type)}
> +    def _gen_member(self, member: QAPISchemaObjectTypeMember
> +                    ) -> Annotated[_DObject]:
> +        obj: _DObject = {
> +            'name': member.name,
> +            'type': self._use_type(member.type)
> +        }
>          if member.optional:
>              obj['default'] = None
>          if member.features:
>              obj['features'] = self._gen_features(member.features)
>          return Annotated(obj, member.ifcond)
>  
> -    def _gen_variants(self, tag_name, variants):
> +    def _gen_variants(self, tag_name: str,
> +                      variants: List[QAPISchemaVariant]) -> _DObject:
>          return {'tag': tag_name,
>                  'variants': [self._gen_variant(v) for v in variants]}
>  
> -    def _gen_variant(self, variant):
> -        obj = {'case': variant.name, 'type': self._use_type(variant.type)}
> +    def _gen_variant(self, variant: QAPISchemaVariant) -> Annotated[_DObject]:
> +        obj: _DObject = {
> +            'case': variant.name,
> +            'type': self._use_type(variant.type)
> +        }
>          return Annotated(obj, variant.ifcond)
>  
> -    def visit_builtin_type(self, name, info, json_type):
> +    def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
> +                           json_type: str) -> None:

A built-in type's info is always None.  Perhaps we should drop the
parameter.

>          self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
>  
> -    def visit_enum_type(self, name, info, ifcond, features, members, prefix):
> +    def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
> +                        ifcond: List[str], features: List[QAPISchemaFeature],
> +                        members: List[QAPISchemaEnumMember],
> +                        prefix: Optional[str]) -> None:
>          self._gen_tree(
>              name, 'enum',
>              {'values': [Annotated(m.name, m.ifcond) for m in members]},
>              ifcond, features
>          )
>  
> -    def visit_array_type(self, name, info, ifcond, element_type):
> +    def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
> +                         ifcond: List[str],
> +                         element_type: QAPISchemaType) -> None:
>          element = self._use_type(element_type)
>          self._gen_tree('[' + element + ']', 'array', {'element-type': element},
>                         ifcond, None)
>  
> -    def visit_object_type_flat(self, name, info, ifcond, features,
> -                               members, variants):
> -        obj = {'members': [self._gen_member(m) for m in members]}
> +    def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
> +                               ifcond: List[str],
> +                               features: List[QAPISchemaFeature],
> +                               members: List[QAPISchemaObjectTypeMember],
> +                               variants: Optional[QAPISchemaVariants]) -> None:

We represent "no variants" as None, not as [].  I guess we could
eliminate use [], trading a tiny bit of efficiency for simpler typing.
When I pointed this out for v2, you replied we should turn
QAPISchemaVariants into an extension of Sequence[QAPISchemaVariant] in a
later series.  Okay.

> +        obj: _DObject = {'members': [self._gen_member(m) for m in members]}
>          if variants:
>              obj.update(self._gen_variants(variants.tag_member.name,
>                                            variants.variants))
>  
>          self._gen_tree(name, 'object', obj, ifcond, features)
>  
> -    def visit_alternate_type(self, name, info, ifcond, features, variants):
> +    def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
> +                             ifcond: List[str],
> +                             features: List[QAPISchemaFeature],
> +                             variants: QAPISchemaVariants) -> None:
>          self._gen_tree(
>              name, 'alternate',
>              {'members': [Annotated({'type': self._use_type(m.type)}, m.ifcond)
> @@ -280,27 +318,38 @@ def visit_alternate_type(self, name, info, ifcond, features, variants):
>              ifcond, features
>          )
>  
> -    def visit_command(self, name, info, ifcond, features,
> -                      arg_type, ret_type, gen, success_response, boxed,
> -                      allow_oob, allow_preconfig, coroutine):
> +    def visit_command(self, name: str, info: Optional[QAPISourceInfo],
> +                      ifcond: List[str],
> +                      features: List[QAPISchemaFeature],
> +                      arg_type: Optional[QAPISchemaObjectType],
> +                      ret_type: Optional[QAPISchemaType], gen: bool,
> +                      success_response: bool, boxed: bool, allow_oob: bool,
> +                      allow_preconfig: bool, coroutine: bool) -> None:
>          assert self._schema is not None
>  
>          arg_type = arg_type or self._schema.the_empty_object_type
>          ret_type = ret_type or self._schema.the_empty_object_type
> -        obj = {'arg-type': self._use_type(arg_type),
> -               'ret-type': self._use_type(ret_type)}
> +        obj: _DObject = {
> +            'arg-type': self._use_type(arg_type),
> +            'ret-type': self._use_type(ret_type)
> +        }
>          if allow_oob:
>              obj['allow-oob'] = allow_oob
>          self._gen_tree(name, 'command', obj, ifcond, features)
>  
> -    def visit_event(self, name, info, ifcond, features, arg_type, boxed):
> +    def visit_event(self, name: str, info: Optional[QAPISourceInfo],
> +                    ifcond: List[str], features: List[QAPISchemaFeature],
> +                    arg_type: Optional[QAPISchemaObjectType],
> +                    boxed: bool) -> None:
>          assert self._schema is not None
> +
>          arg_type = arg_type or self._schema.the_empty_object_type
>          self._gen_tree(name, 'event', {'arg-type': self._use_type(arg_type)},
>                         ifcond, features)
>  
>  
> -def gen_introspect(schema, output_dir, prefix, opt_unmask):
> +def gen_introspect(schema: QAPISchema, output_dir: str, prefix: str,
> +                   opt_unmask: bool) -> None:
>      vis = QAPISchemaGenIntrospectVisitor(prefix, opt_unmask)
>      schema.visit(vis)
>      vis.write(output_dir)
> diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
> index 04bd5db5278..0a000d58b37 100644
> --- a/scripts/qapi/mypy.ini
> +++ b/scripts/qapi/mypy.ini
> @@ -13,11 +13,6 @@ disallow_untyped_defs = False
>  disallow_incomplete_defs = False
>  check_untyped_defs = False
>  
> -[mypy-qapi.introspect]
> -disallow_untyped_defs = False
> -disallow_incomplete_defs = False
> -check_untyped_defs = False
> -
>  [mypy-qapi.parser]
>  disallow_untyped_defs = False
>  disallow_incomplete_defs = False
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 353e8020a27..ff16578f6de 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -28,7 +28,7 @@
>  class QAPISchemaEntity:
>      meta: Optional[str] = None
>  
> -    def __init__(self, name, info, doc, ifcond=None, features=None):
> +    def __init__(self, name: str, info, doc, ifcond=None, features=None):
>          assert name is None or isinstance(name, str)
>          for f in features or []:
>              assert isinstance(f, QAPISchemaFeature)


