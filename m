Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF531CD10
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:37:39 +0100 (CET)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2Py-0006ll-PM
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC2MI-00050S-Kp
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:33:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC2ME-0001fr-LG
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613489624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1NC2IMPau2F3ej1NGstED6yLnsM0D2OgSWuemR/P/8=;
 b=AhnQzaSAQ+OKejKCDy77ixYnCGHN4NqkR4DtC/7vT2ctZagisl1Z/KI0Oelj8aOWVGBmaq
 B+G85EFJqT8rxwRqU9I0YetGD6S7vEHrwjRx4E57tiwPa5GGRbO/2bQpWS25wg9GA0Jwap
 OuoLBFs+msMm3FzufRLtu7ShLTesqK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-mGWM6fLRMPexmjCkOVGrzg-1; Tue, 16 Feb 2021 10:33:27 -0500
X-MC-Unique: mGWM6fLRMPexmjCkOVGrzg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6E8380196C;
 Tue, 16 Feb 2021 15:33:26 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9561719D6C;
 Tue, 16 Feb 2021 15:33:25 +0000 (UTC)
Subject: Re: [PATCH v6 14/19] qapi/introspect.py: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-15-jsnow@redhat.com>
 <87a6s4pf22.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <a724070a-0075-52ca-b11f-cf736d626279@redhat.com>
Date: Tue, 16 Feb 2021 10:33:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87a6s4pf22.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 3:55 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> NB: The type aliases (SchemaInfo et al) declare intent for some of the
>> "dictly-typed" objects we pass around in introspect.py. They do not
>> enforce the shape of those objects, and cannot, until Python 3.7 or
>> later. (And even then, it may not be "worth it".)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 124 +++++++++++++++++++++++++++----------
>>   scripts/qapi/mypy.ini      |   5 --
>>   scripts/qapi/schema.py     |   2 +-
>>   3 files changed, 92 insertions(+), 39 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index b0fcc4443c1..45284af1330 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -17,6 +17,7 @@
>>       Iterable,
>>       List,
>>       Optional,
>> +    Sequence,
>>       Tuple,
>>       TypeVar,
>>       Union,
>> @@ -30,10 +31,19 @@
>>   )
>>   from .gen import QAPISchemaMonolithicCVisitor
>>   from .schema import (
>> +    QAPISchema,
>>       QAPISchemaArrayType,
>>       QAPISchemaBuiltinType,
>> +    QAPISchemaEntity,
>> +    QAPISchemaEnumMember,
>> +    QAPISchemaFeature,
>> +    QAPISchemaObjectType,
>> +    QAPISchemaObjectTypeMember,
>>       QAPISchemaType,
>> +    QAPISchemaVariant,
>> +    QAPISchemaVariants,
>>   )
>> +from .source import QAPISourceInfo
>>   
>>   
>>   # This module constructs a tree data structure that is used to
>> @@ -58,6 +68,15 @@
>>   _Value = Union[_Scalar, _NonScalar]
>>   JSONValue = Union[_Value, 'Annotated[_Value]']
>>   
>> +# These types are based on structures defined in QEMU's schema, so we lack
>> +# precise types for them here. Python 3.6 does not offer TypedDict constructs,
>> +# so they are broadly typed here as simple Python Dicts.
> 
> PEP 8: "For flowing long blocks of text with fewer structural
> restrictions (docstrings or comments), the line length should be limited
> to 72 characters."
> 

I'm very likely going to keep violating this until some tool enforces it 
on me. I'm also very unlikely to enforce it for anyone else.

You can reflow it as you see fit, but I'll likely need better long-term 
assistance for remembering that 72/80 column DANGER ZONE.

>> +SchemaInfo = Dict[str, object]
>> +SchemaInfoObject = Dict[str, object]
>> +SchemaInfoObjectVariant = Dict[str, object]
>> +SchemaInfoObjectMember = Dict[str, object]
>> +SchemaInfoCommand = Dict[str, object]
>> +
>>   
>>   _ValueT = TypeVar('_ValueT', bound=_Value)
>>   
>> @@ -77,9 +96,11 @@ def __init__(self, value: _ValueT, ifcond: Iterable[str],
>>           self.ifcond: Tuple[str, ...] = tuple(ifcond)
>>   
>>   
>> -def _tree_to_qlit(obj, level=0, dict_value=False):
>> +def _tree_to_qlit(obj: JSONValue,
>> +                  level: int = 0,
>> +                  dict_value: bool = False) -> str:
>>   
>> -    def indent(level):
>> +    def indent(level: int) -> str:
>>           return level * 4 * ' '
>>   
>>       if isinstance(obj, Annotated):
>> @@ -136,21 +157,21 @@ def indent(level):
>>       return ret
>>   
>>   
>> -def to_c_string(string):
>> +def to_c_string(string: str) -> str:
>>       return '"' + string.replace('\\', r'\\').replace('"', r'\"') + '"'
>>   
>>   
>>   class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
>>   
>> -    def __init__(self, prefix, unmask):
>> +    def __init__(self, prefix: str, unmask: bool):
>>           super().__init__(
>>               prefix, 'qapi-introspect',
>>               ' * QAPI/QMP schema introspection', __doc__)
>>           self._unmask = unmask
>> -        self._schema = None
>> -        self._trees = []
>> -        self._used_types = []
>> -        self._name_map = {}
>> +        self._schema: Optional[QAPISchema] = None
>> +        self._trees: List[Annotated[SchemaInfo]] = []
>> +        self._used_types: List[QAPISchemaType] = []
>> +        self._name_map: Dict[str, str] = {}
>>           self._genc.add(mcgen('''
>>   #include "qemu/osdep.h"
>>   #include "%(prefix)sqapi-introspect.h"
>> @@ -158,10 +179,10 @@ def __init__(self, prefix, unmask):
>>   ''',
>>                                prefix=prefix))
>>   
>> -    def visit_begin(self, schema):
>> +    def visit_begin(self, schema: QAPISchema) -> None:
>>           self._schema = schema
>>   
>> -    def visit_end(self):
>> +    def visit_end(self) -> None:
>>           # visit the types that are actually used
>>           for typ in self._used_types:
>>               typ.visit(self)
>> @@ -183,18 +204,18 @@ def visit_end(self):
>>           self._used_types = []
>>           self._name_map = {}
>>   
>> -    def visit_needed(self, entity):
>> +    def visit_needed(self, entity: QAPISchemaEntity) -> bool:
>>           # Ignore types on first pass; visit_end() will pick up used types
>>           return not isinstance(entity, QAPISchemaType)
>>   
>> -    def _name(self, name):
>> +    def _name(self, name: str) -> str:
>>           if self._unmask:
>>               return name
>>           if name not in self._name_map:
>>               self._name_map[name] = '%d' % len(self._name_map)
>>           return self._name_map[name]
>>   
>> -    def _use_type(self, typ):
>> +    def _use_type(self, typ: QAPISchemaType) -> str:
>>           assert self._schema is not None
>>   
>>           # Map the various integer types to plain int
>> @@ -216,10 +237,13 @@ def _use_type(self, typ):
>>           return self._name(typ.name)
>>   
>>       @staticmethod
>> -    def _gen_features(features):
>> +    def _gen_features(features: List[QAPISchemaFeature]
>> +                      ) -> List[Annotated[str]]:
>>           return [Annotated(f.name, f.ifcond) for f in features]
>>   
>> -    def _gen_tree(self, name, mtype, obj, ifcond, features):
>> +    def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
> 
> Schould this be obj: SchemaInfo?
> 

Yes-ish. It's kind of like the dictly-typed object is being promoted to 
a SchemaInfo. In a sense, it isn't one yet (It's missing necessary 
keys), but we upgrade it into one in this very function.

I talk about TypedDict a lot and how we don't have it yet; one 
interesting feature of TypedDict is that it doesn't allow you to 
incrementally build the object -- it requires all of the necessary keys 
be present right away.

If we were to have that kind of model in our heads, then this wouldn't 
be a SchemaInfo coming in.

So I'll admit here: I don't know. It depends on your perspective, 
honestly. It might be the sort of thing that a docstring comment would 
be best at addressing, since we're already in the margins for what mypy 
can reasonably enforce statically.

>> +                  ifcond: Sequence[str],
>> +                  features: Optional[List[QAPISchemaFeature]]) -> None:
>>           comment: Optional[str] = None
>>           if mtype not in ('command', 'event', 'builtin', 'array'):
>>               if not self._unmask:
>> @@ -233,42 +257,65 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
>>               obj['features'] = self._gen_features(features)
>>           self._trees.append(Annotated(obj, ifcond, comment))
>>   
>> -    def _gen_member(self, member):
>> -        obj = {'name': member.name, 'type': self._use_type(member.type)}
>> +    def _gen_member(self, member: QAPISchemaObjectTypeMember
>> +                    ) -> Annotated[SchemaInfoObjectMember]:
>> +        obj: SchemaInfoObjectMember = {
>> +            'name': member.name,
>> +            'type': self._use_type(member.type)
>> +        }
>>           if member.optional:
>>               obj['default'] = None
>>           if member.features:
>>               obj['features'] = self._gen_features(member.features)
>>           return Annotated(obj, member.ifcond)
>>   
>> -    def _gen_variant(self, variant):
>> -        obj = {'case': variant.name, 'type': self._use_type(variant.type)}
>> +    def _gen_variant(self, variant: QAPISchemaVariant
>> +                     ) -> Annotated[SchemaInfoObjectVariant]:
>> +        obj: SchemaInfoObjectVariant = {
>> +            'case': variant.name,
>> +            'type': self._use_type(variant.type)
>> +        }
>>           return Annotated(obj, variant.ifcond)
>>   
>> -    def visit_builtin_type(self, name, info, json_type):
>> +    def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>> +                           json_type: str) -> None:
>>           self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
>>   
>> -    def visit_enum_type(self, name, info, ifcond, features, members, prefix):
>> +    def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>> +                        ifcond: Sequence[str],
>> +                        features: List[QAPISchemaFeature],
>> +                        members: List[QAPISchemaEnumMember],
>> +                        prefix: Optional[str]) -> None:
>>           self._gen_tree(
>>               name, 'enum',
>>               {'values': [Annotated(m.name, m.ifcond) for m in members]},
>>               ifcond, features
>>           )
>>   
>> -    def visit_array_type(self, name, info, ifcond, element_type):
>> +    def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>> +                         ifcond: Sequence[str],
>> +                         element_type: QAPISchemaType) -> None:
>>           element = self._use_type(element_type)
>>           self._gen_tree('[' + element + ']', 'array', {'element-type': element},
>>                          ifcond, None)
>>   
>> -    def visit_object_type_flat(self, name, info, ifcond, features,
>> -                               members, variants):
>> -        obj = {'members': [self._gen_member(m) for m in members]}
>> +    def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>> +                               ifcond: Sequence[str],
>> +                               features: List[QAPISchemaFeature],
>> +                               members: List[QAPISchemaObjectTypeMember],
>> +                               variants: Optional[QAPISchemaVariants]) -> None:
>> +        obj: SchemaInfoObject = {
>> +            'members': [self._gen_member(m) for m in members]
>> +        }
>>           if variants:
>>               obj['tag'] = variants.tag_member.name
>>               obj['variants'] = [self._gen_variant(v) for v in variants.variants]
>>           self._gen_tree(name, 'object', obj, ifcond, features)
>>   
>> -    def visit_alternate_type(self, name, info, ifcond, features, variants):
>> +    def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
>> +                             ifcond: Sequence[str],
>> +                             features: List[QAPISchemaFeature],
>> +                             variants: QAPISchemaVariants) -> None:
>>           self._gen_tree(
>>               name, 'alternate',
>>               {'members': [Annotated({'type': self._use_type(m.type)},
>> @@ -277,27 +324,38 @@ def visit_alternate_type(self, name, info, ifcond, features, variants):
>>               ifcond, features
>>           )
>>   
>> -    def visit_command(self, name, info, ifcond, features,
>> -                      arg_type, ret_type, gen, success_response, boxed,
>> -                      allow_oob, allow_preconfig, coroutine):
>> +    def visit_command(self, name: str, info: Optional[QAPISourceInfo],
>> +                      ifcond: Sequence[str],
>> +                      features: List[QAPISchemaFeature],
>> +                      arg_type: Optional[QAPISchemaObjectType],
>> +                      ret_type: Optional[QAPISchemaType], gen: bool,
>> +                      success_response: bool, boxed: bool, allow_oob: bool,
>> +                      allow_preconfig: bool, coroutine: bool) -> None:
>>           assert self._schema is not None
>>   
>>           arg_type = arg_type or self._schema.the_empty_object_type
>>           ret_type = ret_type or self._schema.the_empty_object_type
>> -        obj = {'arg-type': self._use_type(arg_type),
>> -               'ret-type': self._use_type(ret_type)}
>> +        obj: SchemaInfoCommand = {
>> +            'arg-type': self._use_type(arg_type),
>> +            'ret-type': self._use_type(ret_type)
>> +        }
>>           if allow_oob:
>>               obj['allow-oob'] = allow_oob
>>           self._gen_tree(name, 'command', obj, ifcond, features)
>>   
>> -    def visit_event(self, name, info, ifcond, features, arg_type, boxed):
>> +    def visit_event(self, name: str, info: Optional[QAPISourceInfo],
>> +                    ifcond: Sequence[str], features: List[QAPISchemaFeature],
>> +                    arg_type: Optional[QAPISchemaObjectType],
>> +                    boxed: bool) -> None:
>>           assert self._schema is not None
>> +
>>           arg_type = arg_type or self._schema.the_empty_object_type
>>           self._gen_tree(name, 'event', {'arg-type': self._use_type(arg_type)},
>>                          ifcond, features)
>>   
>>   
>> -def gen_introspect(schema, output_dir, prefix, opt_unmask):
>> +def gen_introspect(schema: QAPISchema, output_dir: str, prefix: str,
>> +                   opt_unmask: bool) -> None:
>>       vis = QAPISchemaGenIntrospectVisitor(prefix, opt_unmask)
>>       schema.visit(vis)
>>       vis.write(output_dir)
>> diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
>> index 04bd5db5278..0a000d58b37 100644
>> --- a/scripts/qapi/mypy.ini
>> +++ b/scripts/qapi/mypy.ini
>> @@ -13,11 +13,6 @@ disallow_untyped_defs = False
>>   disallow_incomplete_defs = False
>>   check_untyped_defs = False
>>   
>> -[mypy-qapi.introspect]
>> -disallow_untyped_defs = False
>> -disallow_incomplete_defs = False
>> -check_untyped_defs = False
>> -
>>   [mypy-qapi.parser]
>>   disallow_untyped_defs = False
>>   disallow_incomplete_defs = False
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index 353e8020a27..ff16578f6de 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -28,7 +28,7 @@
>>   class QAPISchemaEntity:
>>       meta: Optional[str] = None
>>   
>> -    def __init__(self, name, info, doc, ifcond=None, features=None):
>> +    def __init__(self, name: str, info, doc, ifcond=None, features=None):
>>           assert name is None or isinstance(name, str)
>>           for f in features or []:
>>               assert isinstance(f, QAPISchemaFeature)
> 
> How is this hunk related to typing introspect.py
> 

I forget!

qapi/introspect.py:262: error: Returning Any from function declared to 
return "str"
Found 1 error in 1 file (checked 14 source files)

Oh, for this reason:

         if isinstance(typ, QAPISchemaBuiltinType):
             return typ.name

_use_type has a return type that is dependent upon the type of 
"typ.name", which required typing the QAPISchemaEntity initializer.


(Do you want this in its own preceding patch?)


