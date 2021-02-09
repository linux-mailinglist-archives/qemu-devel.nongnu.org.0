Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3770E314B54
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:20:07 +0100 (CET)
Received: from localhost ([::1]:36110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PBm-0006yS-6s
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9P9f-0005Gg-F7
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:17:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9P9b-0006ut-6V
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612862269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I7XYH21dXTMNIREFOugGF7bMf9UHinCOpAtaRA35lr0=;
 b=MoIL37hGQsUenaB+nmPKsnE+QBHx+cF4cYRLX/ao+fecitxyrmezSmIBNX6LUteCCokOCY
 QLJLdJXHh/Nq8wQsa0uJ/hhCr9KXIWIu+3rTveqsU55l7YzEeW3ELCCh3GgEAcbWpniP4F
 1nb7wYBIVCnhcSn/mowG7bk/OmPj6As=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-ga5RMXsMOp2jISwm7XRaBA-1; Tue, 09 Feb 2021 04:17:46 -0500
X-MC-Unique: ga5RMXsMOp2jISwm7XRaBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4B5479EC1
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 09:17:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B73660C04;
 Tue,  9 Feb 2021 09:17:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2322113865F; Tue,  9 Feb 2021 10:17:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 12/15] qapi/introspect.py: add type hint annotations
References: <20210204003207.2856909-1-jsnow@redhat.com>
 <20210204003207.2856909-13-jsnow@redhat.com>
 <87im723766.fsf@dusky.pond.sub.org>
 <eaa0ed74-226c-4268-9227-c19a704bb2a7@redhat.com>
Date: Tue, 09 Feb 2021 10:17:43 +0100
In-Reply-To: <eaa0ed74-226c-4268-9227-c19a704bb2a7@redhat.com> (John Snow's
 message of "Mon, 8 Feb 2021 15:45:21 -0500")
Message-ID: <878s7xvbuw.fsf@dusky.pond.sub.org>
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/8/21 10:34 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>
>>> ---
>>>
>>> See the next patch for an optional amendment that helps to clarify what
>>> _DObject is meant to be.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/introspect.py | 117 ++++++++++++++++++++++++++-----------
>>>   scripts/qapi/mypy.ini      |   5 --
>>>   scripts/qapi/schema.py     |   2 +-
>>>   3 files changed, 84 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>> index cf0e4e05c5c..3afcdda7446 100644
>>> --- a/scripts/qapi/introspect.py
>>> +++ b/scripts/qapi/introspect.py
>>> @@ -30,10 +30,19 @@
>>>   )
>>>   from .gen import QAPISchemaMonolithicCVisitor
>>>   from .schema import (
>>> +    QAPISchema,
>>>       QAPISchemaArrayType,
>>>       QAPISchemaBuiltinType,
>>> +    QAPISchemaEntity,
>>> +    QAPISchemaEnumMember,
>>> +    QAPISchemaFeature,
>>> +    QAPISchemaObjectType,
>>> +    QAPISchemaObjectTypeMember,
>>>       QAPISchemaType,
>>> +    QAPISchemaVariant,
>>> +    QAPISchemaVariants,
>>>   )
>>> +from .source import QAPISourceInfo
>>>   
>>>   
>>>   # This module constructs a tree data structure that is used to
>>> @@ -57,6 +66,10 @@
>>     _stub = Any
>>     _scalar = Union[str, bool, None]
>>     _nonscalar = Union[Dict[str, _stub], List[_stub]]
>>>   _value = Union[_scalar, _nonscalar]
>>>   TreeValue = Union[_value, 'Annotated[_value]']
>>>   
>>> +# This is an alias for an arbitrary JSON object, represented here as a Dict.
>>> +# It is stricter on the value type than the recursive definition above.
>>> +# It is used to represent SchemaInfo-related structures exclusively.
>>> +_DObject = Dict[str, object]
>> 
>> Please work in an abridged version of your helpful reply to my ignorant
>> questions in review of v4.
>> 
>
> Maybe not needed after we squash the named aliases patch in?.
>
>> My comments below are based on the following understanding:
>> 
>> _value has a Dict[str, Any] branch.
>> 
>> _DObject is Dict[str, object].
>> 
>> Both types are for the tree's dict nodes.  Both under-constrain the
>> dict's values in the sense that anything can go into the dict.  The
>> difference is static type checking on use of dict values: none with the
>> former, overly strict with the latter (to actually do something
>> interesting with a value, you usually have to narrow its static type to
>> a more specific one than object).
>> 
>> So, having _DObject in addition to the _value branch buys us a little
>> more static type checking.  I don't understand what type checking
>> exactly, and therefore can't judge whether it's worth the price in
>> complexity.  If you can enlighten me, I'm all ears.
>> 
>
> It enables type checking on any value that a _DObject (SchemaInfo and 
> its union arm types) may have.
>
> foo: SchemaInfo = {}  # Dict[str, object]
>
> says that the values here must be an object. Everything is an object, so 
> this doesn't constrain much in the write direction, but it constrains a 
> lot in the read direction.
>
> the type of this expression:
>
> foo.get('key')
>
> is object, not "Any". Which means if we do this:
>
> x = foo.get('key') + 5
>
> that is a type error for mypy. If we pass this value on to any function 
> that is looking for or expects a specific type, it will also be an 
> error. If we treat this value in any way beyond the capabilities of 
> Python's most basic, abstract type, it will be an error.
>
> When you use 'Any', it actually *disables* type checking at that 
> boundary instead. If you pass an "Any" on to an interface that expects 
> "int", mypy will just assume you're right about that.
>
> When I started this series I wasn't as clear on the distinction myself, 
> but during review and re-iteration I've shifted to using 'object' 
> absolutely whenever I can if I need to describe an abstract value.
>
> Summary:
>
> - I prefer "object" to "Any", when possible
> - We have to use "Any" for the recursive stubs
> - I use _DObject (and later SchemaInfo et al) to represent specific 
> types, not abstract recursive types, so they get the stricter 'object'.

I understand that now.  I doubt it's worth the extra complexity here.
Being discussed in reply to PATCH 11.  Let's continue there.

>>>   
>>>   _NodeT = TypeVar('_NodeT', bound=_value)
>>>   
>>> @@ -76,9 +89,11 @@ def __init__(self, value: _NodeT, ifcond: Iterable[str],
>>>           self.ifcond: Tuple[str, ...] = tuple(ifcond)
>>>   
>>>   
>>> -def _tree_to_qlit(obj, level=0, dict_value=False):
>>> +def _tree_to_qlit(obj: TreeValue,
>>> +                  level: int = 0,
>>> +                  dict_value: bool = False) -> str:
>>>   
>>> -    def indent(level):
>>> +    def indent(level: int) -> str:
>>>           return level * 4 * ' '
>>>   
>>>       if isinstance(obj, Annotated):
>>> @@ -135,21 +150,21 @@ def indent(level):
>>>       return ret
>>>   
>>>   
>>> -def to_c_string(string):
>>> +def to_c_string(string: str) -> str:
>>>       return '"' + string.replace('\\', r'\\').replace('"', r'\"') + '"'
>>>   
>>>   
>>>   class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
>>>   
>>> -    def __init__(self, prefix, unmask):
>>> +    def __init__(self, prefix: str, unmask: bool):
>>>           super().__init__(
>>>               prefix, 'qapi-introspect',
>>>               ' * QAPI/QMP schema introspection', __doc__)
>>>           self._unmask = unmask
>>> -        self._schema = None
>>> -        self._trees = []
>>> -        self._used_types = []
>>> -        self._name_map = {}
>>> +        self._schema: Optional[QAPISchema] = None
>>> +        self._trees: List[Annotated[_DObject]] = []
>>> +        self._used_types: List[QAPISchemaType] = []
>>> +        self._name_map: Dict[str, str] = {}
>>>           self._genc.add(mcgen('''
>>>   #include "qemu/osdep.h"
>>>   #include "%(prefix)sqapi-introspect.h"
>>> @@ -157,10 +172,10 @@ def __init__(self, prefix, unmask):
>>>   ''',
>>>                                prefix=prefix))
>>>   
>>> -    def visit_begin(self, schema):
>>> +    def visit_begin(self, schema: QAPISchema) -> None:
>>>           self._schema = schema
>>>   
>>> -    def visit_end(self):
>>> +    def visit_end(self) -> None:
>>>           # visit the types that are actually used
>>>           for typ in self._used_types:
>>>               typ.visit(self)
>>> @@ -182,18 +197,18 @@ def visit_end(self):
>>>           self._used_types = []
>>>           self._name_map = {}
>>>   
>>> -    def visit_needed(self, entity):
>>> +    def visit_needed(self, entity: QAPISchemaEntity) -> bool:
>>>           # Ignore types on first pass; visit_end() will pick up used types
>>>           return not isinstance(entity, QAPISchemaType)
>>>   
>>> -    def _name(self, name):
>>> +    def _name(self, name: str) -> str:
>>>           if self._unmask:
>>>               return name
>>>           if name not in self._name_map:
>>>               self._name_map[name] = '%d' % len(self._name_map)
>>>           return self._name_map[name]
>>>   
>>> -    def _use_type(self, typ):
>>> +    def _use_type(self, typ: QAPISchemaType) -> str:
>>>           assert self._schema is not None
>>>   
>>>           # Map the various integer types to plain int
>>> @@ -215,10 +230,13 @@ def _use_type(self, typ):
>>>           return self._name(typ.name)
>>>   
>>>       @staticmethod
>>> -    def _gen_features(features):
>>> +    def _gen_features(features: List[QAPISchemaFeature]
>>> +                      ) -> List[Annotated[str]]:
>>>           return [Annotated(f.name, f.ifcond) for f in features]
>>>   
>>> -    def _gen_tree(self, name, mtype, obj, ifcond, features):
>>> +    def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>> +                  ifcond: List[str],
>>> +                  features: Optional[List[QAPISchemaFeature]]) -> None:
>> 
>> Recycling my review of v2...
>> 
>> * @name corresponds to SchemaInfo member name, which is indeed str.
>>    Okay.
>> 
>> * @mtype corresponds to member meta-type, which is enum SchemaMetaType.
>>    It's not a Python Enum, because those were off limits when this code
>>    was written.  We type what we have, and we have str.  Okay.
>> 
>
> I can *make* it an enum if you'd like. I'll throw it on the end of the 
> series as an optional patch that can be kept or dropped at your discretion.

Let's stick stick to "type what we have", and also take notes on
possible improvements for later.  We need this series to converge.

>> * @obj will be turned by _gen_tree() into the tree for a SchemaInfo.
>>    _DObject fits the bill.
>> 
>> * ifcond: List[str] should work, but gen_if(), gen_endif() use
>>    Sequence[str].  When I pointed this out for v2, you replied "should
>>    probable be using Sequence".
>> 
>>    More instances of ifcond: List[str] elsewhere; I'm not flagging them.
>> 
>
> Oh, yes.
>
> List winds up being correct, but is unnecessarily restrictive. It 
> doesn't wind up mattering, but we can use Sequence[str].
>
> I'll add a patch to fix the types-so-far at the beginning of the series, 
> and then squash the other annotation changes into this patch.

Sounds good.

>> * features: Optional[List[QAPISchemaFeature]] is correct.  "No features"
>>    has two representations: None and [].  I guess we could eliminate
>>    None, trading a tiny bit of efficiency for simpler typing.  Not a
>>    demand.
>> 
>
> This is easy enough to make happen. I didn't notice.
>
> I'll include it as an extra patch at the end of the series.

Only if it's really, really simple.  Else, stick to "type what we have".

>>>           comment: Optional[str] = None
>> 
>> "No annotations" is represented as None here, not {}.  I guess we could
>> use {} for simpler typing.  When I pointed this out for v2, you replied
>> it'll go away later.  Good enough for me.
>> 
>
> Something might have gotten garbled between then and now. I consider 
> "Annotations" to be both the if conditionals and comments; this field is 
> just the comment. Optional[str] is the right type for it here:
>
> self._trees.append(Annotated(obj, ifcond, comment))

You're right.

>>>           if mtype not in ('command', 'event', 'builtin', 'array'):
>>>               if not self._unmask:
>>> @@ -232,47 +250,67 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
>>>               obj['features'] = self._gen_features(features)
>>>           self._trees.append(Annotated(obj, ifcond, comment))
>>>   
>>> -    def _gen_member(self, member):
>>> -        obj = {'name': member.name, 'type': self._use_type(member.type)}
>>> +    def _gen_member(self, member: QAPISchemaObjectTypeMember
>>> +                    ) -> Annotated[_DObject]:
>>> +        obj: _DObject = {
>>> +            'name': member.name,
>>> +            'type': self._use_type(member.type)
>>> +        }
>>>           if member.optional:
>>>               obj['default'] = None
>>>           if member.features:
>>>               obj['features'] = self._gen_features(member.features)
>>>           return Annotated(obj, member.ifcond)
>>>   
>>> -    def _gen_variants(self, tag_name, variants):
>>> +    def _gen_variants(self, tag_name: str,
>>> +                      variants: List[QAPISchemaVariant]) -> _DObject:
>>>           return {'tag': tag_name,
>>>                   'variants': [self._gen_variant(v) for v in variants]}
>>>   
>>> -    def _gen_variant(self, variant):
>>> -        obj = {'case': variant.name, 'type': self._use_type(variant.type)}
>>> +    def _gen_variant(self, variant: QAPISchemaVariant) -> Annotated[_DObject]:
>>> +        obj: _DObject = {
>>> +            'case': variant.name,
>>> +            'type': self._use_type(variant.type)
>>> +        }
>>>           return Annotated(obj, variant.ifcond)
>>>   
>>> -    def visit_builtin_type(self, name, info, json_type):
>>> +    def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>>> +                           json_type: str) -> None:
>> 
>> A built-in type's info is always None.  Perhaps we should drop the
>> parameter.
>> 
>
> We could.
>
> For the moment, info cannot be "None" here because mypy thinks it 
> *might* be something.
>
> ...but we could just remove it for clarity. (As long as we don't later 
> re-add that built-in source info object style idea and then we'd want to 
> put it back, but ...)
>
> Later?

Okay.

>>>           self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
>>>   
>>> -    def visit_enum_type(self, name, info, ifcond, features, members, prefix):
>>> +    def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>>> +                        ifcond: List[str], features: List[QAPISchemaFeature],
>>> +                        members: List[QAPISchemaEnumMember],
>>> +                        prefix: Optional[str]) -> None:
>>>           self._gen_tree(
>>>               name, 'enum',
>>>               {'values': [Annotated(m.name, m.ifcond) for m in members]},
>>>               ifcond, features
>>>           )
>>>   
>>> -    def visit_array_type(self, name, info, ifcond, element_type):
>>> +    def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>>> +                         ifcond: List[str],
>>> +                         element_type: QAPISchemaType) -> None:
>>>           element = self._use_type(element_type)
>>>           self._gen_tree('[' + element + ']', 'array', {'element-type': element},
>>>                          ifcond, None)
>>>   
>>> -    def visit_object_type_flat(self, name, info, ifcond, features,
>>> -                               members, variants):
>>> -        obj = {'members': [self._gen_member(m) for m in members]}
>>> +    def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>>> +                               ifcond: List[str],
>>> +                               features: List[QAPISchemaFeature],
>>> +                               members: List[QAPISchemaObjectTypeMember],
>>> +                               variants: Optional[QAPISchemaVariants]) -> None:
>> 
>> We represent "no variants" as None, not as [].  I guess we could
>> eliminate use [], trading a tiny bit of efficiency for simpler typing.
>> When I pointed this out for v2, you replied we should turn
>> QAPISchemaVariants into an extension of Sequence[QAPISchemaVariant] in a
>> later series.  Okay.
>> 
>
> Yeah, that's a longer-term fix I think. Not for doing right now -- but 
> you're right, it stands out as suspect.
>
> I think ideally we'd have a Variants object that behaves like a 
> collection where the empty collection is false-ish and we'd always 
> create such a collection.
>
> (Though, that might create problems for tag_name vs tag_member where we 
> might now have circumstances where we have neither, maybe that makes 
> typing harder instead of easier. I'll need to experiment ... I have some 
> questions about how to achieve better typing for our collections class 
> that clash with the delayed-type-evaluation mechanisms we have. Ongoing 
> research.)

In short: later (maybe).

[...]


