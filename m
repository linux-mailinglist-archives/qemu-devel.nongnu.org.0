Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D72329639
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 06:31:30 +0100 (CET)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGxd3-0003Dc-5q
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 00:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGxbW-0002gd-QZ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:29:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGxbU-000242-Ry
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614662992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bz2XnI1HFIiWbENQypJocvyOVlb8ENqFejStVGo3Wlg=;
 b=SCCuzhPaayfq/Cj+mOuGpdVRxCz67C5GIRXi48oRKCPi7i7dnZy92kUKe5YXJQ+jkMqLkD
 obGJXxFjIrHxwWgspzFXYpw9ltWJeIEWNZlojqzwEAJmB1+DnjeMUkIlSVqAn0Yzu+Qjv1
 Lja615XYUr37nSKzV6uT9yfna87aOMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-Nz5VxWPrN8ab697PsTDPoQ-1; Tue, 02 Mar 2021 00:29:49 -0500
X-MC-Unique: Nz5VxWPrN8ab697PsTDPoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 360011005501;
 Tue,  2 Mar 2021 05:29:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B73423AA2;
 Tue,  2 Mar 2021 05:29:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E516113860F; Tue,  2 Mar 2021 06:29:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 08/16] qapi/expr.py: add type hint annotations
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-9-jsnow@redhat.com>
 <87wnuwb68s.fsf@dusky.pond.sub.org>
 <6ce7f875-7598-ed9a-4935-5073ae2b5ec0@redhat.com>
Date: Tue, 02 Mar 2021 06:29:46 +0100
In-Reply-To: <6ce7f875-7598-ed9a-4935-5073ae2b5ec0@redhat.com> (John Snow's
 message of "Thu, 25 Feb 2021 15:54:01 -0500")
Message-ID: <874khunmwl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/25/21 8:56 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Annotations do not change runtime behavior.
>>> This commit *only* adds annotations.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>   scripts/qapi/expr.py  | 71 ++++++++++++++++++++++++++++---------------
>>>   scripts/qapi/mypy.ini |  5 ---
>>>   2 files changed, 46 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>> index f45d6be1f4c..df6c64950fa 100644
>>> --- a/scripts/qapi/expr.py
>>> +++ b/scripts/qapi/expr.py
>>> @@ -15,7 +15,14 @@
>>>   # See the COPYING file in the top-level directory.
>>>   
>>>   import re
>>> -from typing import MutableMapping, Optional, cast
>>> +from typing import (
>>> +    Iterable,
>>> +    List,
>>> +    MutableMapping,
>>> +    Optional,
>>> +    Union,
>>> +    cast,
>>> +)
>>>   
>>>   from .common import c_name
>>>   from .error import QAPISemError
>>> @@ -23,9 +30,10 @@
>>>   from .source import QAPISourceInfo
>>>   
>>>   
>>> -# Expressions in their raw form are JSON-like structures with arbitrary forms.
>>> -# Minimally, their top-level form must be a mapping of strings to values.
>>> -Expression = MutableMapping[str, object]
>>> +# Arbitrary form for a JSON-like object.
>>> +_JSObject = MutableMapping[str, object]
>>> +# Expressions in their raw form are (just) JSON-like objects.
>>> +Expression = _JSObject
>> 
>> We solved a similar, slightly more involved typing problem in
>> introspect.py.
>> 
>> Whereas expr.py uses Python dict, list, and scalars to represent the
>> output of a JSON parser, introspect.py uses them to represent the input
>> of a quasi-JSON formatter ("quasi-JSON" because it spits out a C
>> initializer for a C representation of JSON, but that's detail).
>> 
>> introspect.py additionally supports comments and #if conditionals.
>> 
>> This is the solution we're using in introspect.py.  The Annotated[] part
>> is for comments and conditionals; ignore that.
>> 
>>    # This module constructs a tree data structure that is used to
>>    # generate the introspection information for QEMU. It is shaped
>>    # like a JSON value.
>>    #
>>    # A complexity over JSON is that our values may or may not be annotated.
>>    #
>>    # Un-annotated values may be:
>>    #     Scalar: str, bool, None.
>>    #     Non-scalar: List, Dict
>>    # _value = Union[str, bool, None, Dict[str, JSONValue], List[JSONValue]]
>>    #
>>    # With optional annotations, the type of all values is:
>>    # JSONValue = Union[_Value, Annotated[_Value]]
>>    #
>>    # Sadly, mypy does not support recursive types; so the _Stub alias is used to
>>    # mark the imprecision in the type model where we'd otherwise use JSONValue.
>>    _Stub = Any
>>    _Scalar = Union[str, bool, None]
>>    _NonScalar = Union[Dict[str, _Stub], List[_Stub]]
>>    _Value = Union[_Scalar, _NonScalar]
>>    JSONValue = Union[_Value, 'Annotated[_Value]']
>> 
>> introspect.py then adds some more type aliases to convey meaning:
>> 
>>    # These types are based on structures defined in QEMU's schema, so we
>>    # lack precise types for them here. Python 3.6 does not offer
>>    # TypedDict constructs, so they are broadly typed here as simple
>>    # Python Dicts.
>>    SchemaInfo = Dict[str, object]
>>    SchemaInfoObject = Dict[str, object]
>>    SchemaInfoObjectVariant = Dict[str, object]
>>    SchemaInfoObjectMember = Dict[str, object]
>>    SchemaInfoCommand = Dict[str, object]
>> 
>> I'm not asking you to factor out common typing.
>> 
>> I'm not even asking you to rework expr.py to maximize similarity.
>> 
>> I am asking you to consider stealing applicable parts from
>> introspect.py's comments.
>> 
>> _JSObject seems to serve the same purpose as JSONValue.  Correct?
>> 
>> Expression seems to serve a comparable purpose as SchemaInfo.  Correct?
>> 
>> [...]
>> 
>
> Similar, indeed.
>
> Without annotations:
>
> _Stub = Any
> _Scalar = Union[str, bool, None]
> _NonScalar = Union[Dict[str, _Stub], List[_Stub]]
> _Value = Union[_Scalar, _NonScalar]
> JSONValue = _Value
>
> (Or skip the intermediate _Value name. No matter.)
>
> Though expr.py has no use of anything except the Object form itself, 
> because it is inherently a validator and it doesn't actually really 
> require any specific type, necessarily.
>
> So I only really needed the object form, which we never named in 
> introspect.py. We actually avoided naming it.
>
> All I really need is, I think:
>
> _JSONObject = Dict[str, object]
>
> with a comment explaining that object can be any arbitrary JSONValue 
> (within limit for what parser.py is capable of producing), and that the 
> exact form of such will be evaluated by the various check_definition() 
> functions.
>
> Is that suitable, or do you have something else in mind?

Sounds good.


