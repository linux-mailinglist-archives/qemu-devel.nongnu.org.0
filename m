Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95931CCAC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:11:31 +0100 (CET)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC20g-0005SZ-Lp
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC1y4-0002fv-Pj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:08:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC1y2-0006qO-Aw
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613488125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuJb9Rdf8a7isVyDbJQuS+WoYZmpjcgsO3YrfWJo0Rs=;
 b=jVK/sBW3hwK0tQmcupXBNsK90sc+XhSCz9xefTFyuSRZ2U1w6l7bLQCTavD1yHnwtNi8yX
 Upw/e0F+s7ga+CGLmu5b/oiJ+lDIuufNjM+dLSoPR8eV7zm/f8QC7eAvkno58Xu4cfBCWR
 fG4AAAX6fgaDHIK1suCn0b7cx7K7FOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-oFyezKIXMOmH59WBjema0Q-1; Tue, 16 Feb 2021 10:08:41 -0500
X-MC-Unique: oFyezKIXMOmH59WBjema0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33337801965;
 Tue, 16 Feb 2021 15:08:40 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65C365D74D;
 Tue, 16 Feb 2021 15:08:39 +0000 (UTC)
Subject: Re: [PATCH v6 19/19] qapi/introspect.py: add SchemaMetaType enum
To: Markus Armbruster <armbru@redhat.com>
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-20-jsnow@redhat.com>
 <87pn10nz57.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <ff534bd4-ad04-1afe-b820-cc1482c8566b@redhat.com>
Date: Tue, 16 Feb 2021 10:08:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87pn10nz57.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On 2/16/21 4:24 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Follows the qapi/introspect.py definition of the same; this adds a more
>> precise typing to _gen_tree's mtype parameter.
>>
>> NB: print(SchemaMetaType.BUILTIN) would produce the string
>> "SchemaMetaType.BUILTIN", but when using format strings (.format or f-strings),
>> it relies on the __format__ method defined in the Enum class, which uses the
>> "value" of the enum instead, producing the string "builtin".
>>
>> For consistency with old-style format strings (which simply call the
>> __str__ method of an object), a __str__ dunder is added, though it is
>> not actually used here in this code.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 38 +++++++++++++++++++++++++++++---------
>>   1 file changed, 29 insertions(+), 9 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index c6f5cf8d874..008a21f5c4c 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -11,6 +11,7 @@
>>   See the COPYING file in the top-level directory.
>>   """
>>   
>> +from enum import Enum
>>   from typing import (
>>       Any,
>>       Dict,
>> @@ -79,6 +80,23 @@
>>   SchemaInfoCommand = Dict[str, object]
>>   
>>   
>> +class SchemaMetaType(str, Enum):
>> +    """
>> +    Mimics the SchemaMetaType enum from qapi/introspect.json.
>> +    """
>> +    BUILTIN = 'builtin'
>> +    ENUM = 'enum'
>> +    ARRAY = 'array'
>> +    OBJECT = 'object'
>> +    ALTERNATE = 'alternate'
>> +    COMMAND = 'command'
>> +    EVENT = 'event'
>> +
>> +    def __str__(self) -> str:
>> +        # Needed for intuitive behavior with old-style format strings.
>> +        return str(self.value)
>> +
>> +
> 
> The fanciness compared to plain Enum('SchemaMetaType', 'BUILTIN ...')
> avoids extra code to map the enum values to the strings with need.
> 

I wasn't even aware there was a short form. (TIL!)

This form allows me to inherit from str and pass the value around 
anywhere strings are used. Due to the generalized nature of 
tree_to_qlit, using the short constructor form (which creates ints) 
would need additional magic to be useful.

You can almost replicate it:

_values = ('builtin', 'enum', 'array')
_nv_pairs = [(value.upper(), value) for value in _values]
SchemaMetaType = enum.Enum('SchemaMetaType', _nv_pairs, type=str)

though this loses out on the __str__ method hack, and I don't think mypy 
will be able to introspect into this functional constructor.

>>   _ValueT = TypeVar('_ValueT', bound=_Value)
>>   
>>   
>> @@ -251,7 +269,8 @@ def _gen_features(features: Sequence[QAPISchemaFeature]
>>                         ) -> List[Annotated[str]]:
>>           return [Annotated(f.name, f.ifcond) for f in features]
>>   
>> -    def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>> +    def _gen_tree(self, name: str, mtype: SchemaMetaType,
>> +                  obj: Dict[str, object],
>>                     ifcond: Sequence[str] = (),
>>                     features: Sequence[QAPISchemaFeature] = ()) -> None:
>>           """
>> @@ -299,7 +318,7 @@ def _gen_variant(self, variant: QAPISchemaVariant
>>   
>>       def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>>                              json_type: str) -> None:
>> -        self._gen_tree(name, 'builtin', {'json-type': json_type})
>> +        self._gen_tree(name, SchemaMetaType.BUILTIN, {'json-type': json_type})
>>   
>>       def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>>                           ifcond: Sequence[str],
>> @@ -307,7 +326,7 @@ def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>>                           members: List[QAPISchemaEnumMember],
>>                           prefix: Optional[str]) -> None:
>>           self._gen_tree(
>> -            name, 'enum',
>> +            name, SchemaMetaType.ENUM,
>>               {'values': [Annotated(m.name, m.ifcond) for m in members]},
>>               ifcond, features
>>           )
>> @@ -316,8 +335,8 @@ def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>>                            ifcond: Sequence[str],
>>                            element_type: QAPISchemaType) -> None:
>>           element = self._use_type(element_type)
>> -        self._gen_tree('[' + element + ']', 'array', {'element-type': element},
>> -                       ifcond)
>> +        self._gen_tree('[' + element + ']', SchemaMetaType.ARRAY,
>> +                       {'element-type': element}, ifcond)
>>   
>>       def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>>                                  ifcond: Sequence[str],
>> @@ -330,14 +349,14 @@ def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>>           if variants:
>>               obj['tag'] = variants.tag_member.name
>>               obj['variants'] = [self._gen_variant(v) for v in variants.variants]
>> -        self._gen_tree(name, 'object', obj, ifcond, features)
>> +        self._gen_tree(name, SchemaMetaType.OBJECT, obj, ifcond, features)
>>   
>>       def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
>>                                ifcond: Sequence[str],
>>                                features: List[QAPISchemaFeature],
>>                                variants: QAPISchemaVariants) -> None:
>>           self._gen_tree(
>> -            name, 'alternate',
>> +            name, SchemaMetaType.ALTERNATE,
>>               {'members': [Annotated({'type': self._use_type(m.type)},
>>                                      m.ifcond)
>>                            for m in variants.variants]},
>> @@ -361,7 +380,7 @@ def visit_command(self, name: str, info: Optional[QAPISourceInfo],
>>           }
>>           if allow_oob:
>>               obj['allow-oob'] = allow_oob
>> -        self._gen_tree(name, 'command', obj, ifcond, features)
>> +        self._gen_tree(name, SchemaMetaType.COMMAND, obj, ifcond, features)
>>   
>>       def visit_event(self, name: str, info: Optional[QAPISourceInfo],
>>                       ifcond: Sequence[str], features: List[QAPISchemaFeature],
>> @@ -370,7 +389,8 @@ def visit_event(self, name: str, info: Optional[QAPISourceInfo],
>>           assert self._schema is not None
>>   
>>           arg_type = arg_type or self._schema.the_empty_object_type
>> -        self._gen_tree(name, 'event', {'arg-type': self._use_type(arg_type)},
>> +        self._gen_tree(name, SchemaMetaType.EVENT,
>> +                       {'arg-type': self._use_type(arg_type)},
>>                          ifcond, features)
> 
> Gain: _gen_tree()'s second argument's type now serves as documentation,
> and passing crap to it becomes harder.
> 
> Gut feeling: too much notational overhead for too little gain.
> 
> Opinions?
> 

No strong feelings one way or the other, honestly. I wrote this mostly 
to see how much the overhead would be based on your comment about the 
loose typing of meta-type as str.

If it's too much for too little for you, I'm okay without it too.

--js


