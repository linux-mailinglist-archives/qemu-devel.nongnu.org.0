Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C300F30E754
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 00:29:13 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7RaC-0003c1-EW
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 18:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7RYf-00033Y-JN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:27:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7RYa-0006Ea-I7
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612394850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raTQcRPXmw6pGy1SghmnKwnqALduGQKtjcBwHC7cktA=;
 b=IZd9Z5oWDblY/jf8yE7a/6bZtnat8pqkWPf20VKLeFkvhjq3bfcw7pGoVgyHjxCVGyFKXf
 NhF0xYPw7VTAnp5iTdYNFT3heZuHCkOTQn8C8KZ6w0u4SKmq5dX6aQdU6IZaH2b9M5g3IJ
 M0g4JnuO9699pLgAXpRWz3Trj4Tc3iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-G5Dc13gjPYW6aGlk_81A-g-1; Wed, 03 Feb 2021 18:27:28 -0500
X-MC-Unique: G5Dc13gjPYW6aGlk_81A-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90BE106BB2A;
 Wed,  3 Feb 2021 23:27:27 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBA235C1B4;
 Wed,  3 Feb 2021 23:27:23 +0000 (UTC)
Subject: Re: [PATCH v4 11/14] qapi/introspect.py: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-12-jsnow@redhat.com>
 <87r1lxqj2e.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <ee95f545-7c43-0587-642b-e70589b4a0e6@redhat.com>
Date: Wed, 3 Feb 2021 18:27:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87r1lxqj2e.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/3/21 10:15 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 115 ++++++++++++++++++++++++++-----------
>>   scripts/qapi/mypy.ini      |   5 --
>>   scripts/qapi/schema.py     |   2 +-
>>   3 files changed, 82 insertions(+), 40 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 60ec326d2c7..b7f2a6cf260 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -30,10 +30,19 @@
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
>> @@ -57,6 +66,8 @@
>     # generate the introspection information for QEMU. It behaves similarly
>     # to a JSON value.
>     #
>     # A complexity over JSON is that our values may or may not be annotated.
>     #
>     # Un-annotated values may be:
>     #     Scalar: str, bool, None.
>     #     Non-scalar: List, Dict
>     # _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
>     #
>     # With optional annotations, the type of all values is:
>     # TreeValue = Union[_value, Annotated[_value]]
>     #
>     # Sadly, mypy does not support recursive types, so we must approximate this.
>     _stub = Any
>     _scalar = Union[str, bool, None]
>     _nonscalar = Union[Dict[str, _stub], List[_stub]]
>>   _value = Union[_scalar, _nonscalar]
>>   TreeValue = Union[_value, 'Annotated[_value]']
>>   
>> +# This is a (strict) alias for an arbitrary object non-scalar, as above:
>> +_DObject = Dict[str, object]
> 
> Sounds greek :)
> 

Admittedly it is still not explained well ... until the next patch. I'm 
going to leave it alone for now until you have a chance to respond to 
these walls of text.

> It's almost the Dict part of _nonscalar, but not quite: object vs. Any.
> 
> I naively expect something closer to
> 
>     _scalar = ...
>     _object = Dict[str, _stub]
>     _nonscalar = Union[_object, List[_stub]
> 
> and (still naively) expect _object to be good enough to serve as type
> annotation for dicts representing JSON objects.

"_object" would be good, except ... I am trying to avoid using that word 
because what does it mean? Python object? JSON object? Here at the 
boundary between two worlds, nothing makes sense.

(See patch 12/14 for A More Betterer Understanding of what _DObject is 
used for. It will contribute to A Greater Understanding.)

Anyway, to your questions;

(1) _DObject was my shorthand garbage way of saying "This is a Python 
Dict that represents a JSON object". Hence Dict-Object, "DObject". I 
have also derisively called this a "dictly-typed" object at times.

(2) Dict[str, Any] and Dict[str, object] are similar, but do have a 
semantic difference. I alluded to it by calling this a "(strict) alias"; 
which does not help you understand any of the following points:

Whenever you use "Any", it basically turns off type-checking at that 
boundary; it is the gradually typed boundary type. Avoid it whenever 
reasonably possible.

Example time:


def foo(thing: Any) -> None:
     print(thing.value)  # Sure, I guess! We'll believe you.


def foo(thing: object) -> None:
     print(thing.value)  # BZZT, Python object has no value prop.


Use "Any" when you really just cannot constrain the type, because you're 
out of bourbon or you've decided to give in to the darkness inside your 
heart.

Use "object" when the type of the value actually doesn't matter, because 
you are only passing it on to something else later that will do its own 
type analysis or introspection on the object.

For introspect.py, 'object' is actually a really good type when we can 
use it, because we interrogate the type exhaustively upon receipt in 
_tree_to_qlit.


That leaves one question you would almost assuredly ask as a followup:

"Why didn't you use object for the stub type to begin with?"

Let's say we define _stub as `object` instead, the Python object. When 
_tree_to_qlit recurses on non-scalar structures, the held value there is 
only known as "object" and not as str/bool/None, which causes a typing 
error at that point.

Moving the stub to "Any" tells mypy to ... not worry about what type we 
actually passed here. I gave in to the darkness in my heart. It's just 
too annoying without real recursion.

--js


