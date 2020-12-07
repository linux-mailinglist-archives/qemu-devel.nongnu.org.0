Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA062D1C32
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:34:43 +0100 (CET)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmO9a-00009o-Jy
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmO56-0007MY-4L
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:30:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmO53-0005Ip-UO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607376600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAOUetvZQ+zvw3SX3Nr1f1wqkwahZYP0hBxiCfcNvTI=;
 b=PYrSet7u0F1+sLExS/NiGQlGmeHvA+s9qc/yrUJHRU4z0i6/v5MYD0wLuMcY4ULOzay5Py
 peHNhKTHJtLxP9QYwfFnnAARnZteUO4sAqrnfQEOmTElfFAUuHxR2SbHURziswyiSAntOG
 RqRzedTHjKDcX1dT93V0iLtwRKvE9VU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-mKkC2KmhM02U9yH7TNs5nw-1; Mon, 07 Dec 2020 16:29:58 -0500
X-MC-Unique: mKkC2KmhM02U9yH7TNs5nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD11107ACE6
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 21:29:57 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11B1660BE2;
 Mon,  7 Dec 2020 21:29:56 +0000 (UTC)
Subject: Re: [PATCH v2 05/11] qapi/introspect.py: add preliminary type hint
 annotations
To: Cleber Rosa <crosa@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-6-jsnow@redhat.com>
 <20201107021142.GA2208@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <bcdf0009-127e-d1c1-986f-3c581fdd8fdb@redhat.com>
Date: Mon, 7 Dec 2020 16:29:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201107021142.GA2208@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/20 9:12 PM, Cleber Rosa wrote:
> On Mon, Oct 26, 2020 at 03:42:45PM -0400, John Snow wrote:
>> The typing of _make_tree and friends is a bit involved, but it can be
>> done with some stubbed out types and a bit of elbow grease. The
>> forthcoming patches attempt to make some simplifications, but having the
>> type hints in advance may aid in review of subsequent patches.
>>
>>
>> Some notes on the abstract types used at this point, and what they
>> represent:
>>
>> - TreeValue represents any object in the type tree. _make_tree is an
>>    optional call -- not every node in the final type tree will have been
>>    passed to _make_tree, so this type encompasses not only what is passed
>>    to _make_tree (dicts, strings) or returned from it (dicts, strings, a
>>    2-tuple), but any recursive value for any of the dicts passed to
>>    _make_tree -- which includes lists, strings, integers, null constants,
>>    and so on.
>>
>> - _DObject is a type alias I use to mean "A JSON-style object,
>>    represented as a Python dict." There is no "JSON" type in Python, they
>>    are converted natively to recursively nested dicts and lists, with
>>    leaf values of str, int, float, None, True/False and so on. This type
>>    structure is not possible to accurately portray in mypy yet, so a
>>    placeholder is used.
>>
>>    In this case, _DObject is being used to refer to SchemaInfo-like
>>    structures as defined in qapi/introspect.json, OR any sub-object
>>    values they may reference. We don't have strong typing available for
>>    those, so a generic alternative is used.
>>
>> - Extra refers explicitly to the dict containing "extra" information
>>    about a node in the tree. mypy does not offer per-key typing for dicts
>>    in Python 3.6, so this is the best we can do here.
>>
>> - Annotated refers to (one of) the return types of _make_tree:
>>    It represents a 2-tuple of (TreeValue, Extra).
>>
>>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 157 ++++++++++++++++++++++++++++---------
>>   scripts/qapi/mypy.ini      |   5 --
>>   scripts/qapi/schema.py     |   2 +-
>>   3 files changed, 121 insertions(+), 43 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 63f721ebfb6..803288a64e7 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -10,7 +10,16 @@
>>   See the COPYING file in the top-level directory.
>>   """
>>   
>> -from typing import Optional, Sequence, cast
>> +from typing import (
>> +    Any,
>> +    Dict,
>> +    List,
>> +    Optional,
>> +    Sequence,
>> +    Tuple,
>> +    Union,
>> +    cast,
>> +)
>>   
>>   from .common import (
>>       c_name,
>> @@ -20,13 +29,56 @@
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
>> -def _make_tree(obj, ifcond, features, extra=None):
>> +# This module constructs a tree-like data structure that is used to
>> +# generate the introspection information for QEMU. It behaves similarly
>> +# to a JSON value.
>> +#
>> +# A complexity over JSON is that our values may or may not be annotated.
>> +#
>> +# Un-annotated values may be:
>> +#     Scalar: str, bool, None.
>> +#     Non-scalar: List, Dict
>> +# _Value = Union[str, bool, None, Dict[str, Value], List[Value]]
> 
> Here (and in a few other places) you mention `_Value`, but then define it as
> `_value` (lowercase).
> 

This was maybe too subtle: I didn't intend for it to be the "same" as 
_value; this is the "idealized version". And then I went and re-used the 
same exact name of "TreeValue", which muddied the waters.

Let's just err back on the side of synchronicity and say:

# _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
# TreeValue = Union[_value, Annotated[_value]] 


>> +#
>> +# With optional annotations, the type of all values is:
>> +# TreeValue = Union[_Value, Annotated[_Value]]
>> +#
>> +# Sadly, mypy does not support recursive types, so we must approximate this.
>> +_stub = Any
>> +_scalar = Union[str, bool, None]
>> +_nonscalar = Union[Dict[str, _stub], List[_stub]]
> 
> Why not use `Any` here instead of declaring/using `_stub`?
> 

This was my way of calling visual attention to the exact places in the 
type tree we are breaking recursion with a stubbed type.

I wanted to communicate that we didn't WANT the any type, but we were 
forced to accept a "stub" type. (Which we implement with the Any type.)

>> +_value = Union[_scalar, _nonscalar]
>> +TreeValue = Union[_value, 'Annotated']
>> +
> 
> Maybe declare `Annotations` first, then `Annotated`, then *use*
> `Annotated` proper here?
> 

As long as that doesn't lose clarity and synchronicity with the little 
comment blurb, or cause problems later in the patch. I will see if there 
was a reason I couldn't.

Otherwise, it's not really too important to shuffle around things to 
avoid strings; it doesn't change anything for mypy or for the runtime.

> - Cleber.
> 

Thanks!
--js


