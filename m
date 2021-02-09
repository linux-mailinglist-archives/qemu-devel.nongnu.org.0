Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2F314B70
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:25:19 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PGo-0004H3-0r
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9Oyi-0000hO-JS
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:06:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9Oyd-0001lG-8L
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612861589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Co14NYKqvrzBacvVUm1j4nkHsDubyq4Fpi3kDbKWPCE=;
 b=OGg0iUP5G2GmEKImo72yVw6fp8f3ETIeCLRH2erZpJrv1/gbf7POACajrKywFGr9Xlimz9
 fhDyuYw+apaEgnudcHVg68AY89paHT1AYNrYEM3qmwL+MqDv6wJqWxCcFbB5vxvoO0eI6d
 fZVkYqrBEOVditMrqAgw5fmp/Is7UjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-iPPyx7yYPkuwoLYX7L7f_A-1; Tue, 09 Feb 2021 04:06:26 -0500
X-MC-Unique: iPPyx7yYPkuwoLYX7L7f_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68D9E192CC43;
 Tue,  9 Feb 2021 09:06:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E056F60C04;
 Tue,  9 Feb 2021 09:06:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 75170113865F; Tue,  9 Feb 2021 10:06:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 11/14] qapi/introspect.py: add type hint annotations
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-12-jsnow@redhat.com>
 <87r1lxqj2e.fsf@dusky.pond.sub.org>
 <ee95f545-7c43-0587-642b-e70589b4a0e6@redhat.com>
 <87tuqq1vii.fsf@dusky.pond.sub.org>
 <a1d1c67e-8066-3154-1117-6c86c6f8d9b6@redhat.com>
Date: Tue, 09 Feb 2021 10:06:23 +0100
In-Reply-To: <a1d1c67e-8066-3154-1117-6c86c6f8d9b6@redhat.com> (John Snow's
 message of "Mon, 8 Feb 2021 16:39:12 -0500")
Message-ID: <87lfbxvcds.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/5/21 8:42 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 2/3/21 10:15 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
>>>>
>>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>>> ---
>>>>>    scripts/qapi/introspect.py | 115 ++++++++++++++++++++++++++-----------
>>>>>    scripts/qapi/mypy.ini      |   5 --
>>>>>    scripts/qapi/schema.py     |   2 +-
>>>>>    3 files changed, 82 insertions(+), 40 deletions(-)
>>>>>
>>>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>>>> index 60ec326d2c7..b7f2a6cf260 100644
>>>>> --- a/scripts/qapi/introspect.py
>>>>> +++ b/scripts/qapi/introspect.py
>>>>> @@ -30,10 +30,19 @@
>>>>>    )
>>>>>    from .gen import QAPISchemaMonolithicCVisitor
>>>>>    from .schema import (
>>>>> +    QAPISchema,
>>>>>        QAPISchemaArrayType,
>>>>>        QAPISchemaBuiltinType,
>>>>> +    QAPISchemaEntity,
>>>>> +    QAPISchemaEnumMember,
>>>>> +    QAPISchemaFeature,
>>>>> +    QAPISchemaObjectType,
>>>>> +    QAPISchemaObjectTypeMember,
>>>>>        QAPISchemaType,
>>>>> +    QAPISchemaVariant,
>>>>> +    QAPISchemaVariants,
>>>>>    )
>>>>> +from .source import QAPISourceInfo
>>>>>    
>>>>>    
>>>>>    # This module constructs a tree data structure that is used to
>>>>> @@ -57,6 +66,8 @@
>>>>      # generate the introspection information for QEMU. It behaves similarly
>>>>      # to a JSON value.
>>>>      #
>>>>      # A complexity over JSON is that our values may or may not be annotated.
>>>>      #
>>>>      # Un-annotated values may be:
>>>>      #     Scalar: str, bool, None.
>>>>      #     Non-scalar: List, Dict
>>>>      # _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
>>>>      #
>>>>      # With optional annotations, the type of all values is:
>>>>      # TreeValue = Union[_value, Annotated[_value]]
>>>>      #
>>>>      # Sadly, mypy does not support recursive types, so we must approximate this.
>>>>      _stub = Any
>>>>      _scalar = Union[str, bool, None]
>>>>      _nonscalar = Union[Dict[str, _stub], List[_stub]]
>>>>>    _value = Union[_scalar, _nonscalar]
>>>>>    TreeValue = Union[_value, 'Annotated[_value]']
>> 
>> I'm once again terminally confused about when to use _lower_case and
>> when to use CamelCase for such variables.
>> 
>
> That's my fault for not using them consistently.
>
> Generally:
>
> TitleCase: Classes, Real Type Names :tm:
> lowercase: instance names (and certain built-in types like str/bool/int)
> UPPERCASE: "Constants". This is an extremely loose idea in Python.
>
> I use the "_" prefix for any of the above categories to indicate 
> something not intended to be used outside of the current scope. These 
> types won't be accessible outside the module by default.
>
> TypeVars I use "T", "U", "V", etc unless I bind them to another type; 
> then I use e.g. NodeT instead.
>
> When it comes to things like type aliases, I believe I instinctively 
> used lowercase because I am not creating a new Real Type and wanted some 
> visual distinction from a real class name. (aliases created in this way 
> cannot be used with isinstance and hold no significance to mypy.)
>
> That's why I used _stub, _scalar, _nonscalar, and _value for those types 
> there. Then I disregarded my own convention and used TreeValue; perhaps 
> that ought to be tree_value for consistency as it's not a Real Type :tm:
>
> ...but then we have the SchemaInfo type aliases, which I named using the 
> same type name as they use in QAPI to help paint the association (and 
> pick up 'git grep' searchers.)
>
> Not fantastically consistent, sorry. Feel free to express a preference, 
> I clearly don't have a universally applied one.
>
> (Current leaning: rename TreeValue to tree_value, but leave everything 
> else as it is.)

https://www.python.org/dev/peps/pep-0484/#type-aliases

    Note that we recommend capitalizing alias names, since they
    represent user-defined types, which (like user-defined classes) are
    typically spelled that way.

I think this wants names like _Scalar, _NonScalar, _Value, TreeValue.

>> The reader has to connect _stub = Any back "we must approximate this".
>> Hmm... "we approximate with Any"?
>> 
>
> I can try to be more explicit about it.
>
>>>>>    
>>>>> +# This is a (strict) alias for an arbitrary object non-scalar, as above:
>>>>> +_DObject = Dict[str, object]
>>>>
>>>> Sounds greek :)
>>>>
>>>
>>> Admittedly it is still not explained well ... until the next patch. I'm
>>> going to leave it alone for now until you have a chance to respond to
>>> these walls of text.
>> 
>> You explain it some futher down.
>> 
>>>> It's almost the Dict part of _nonscalar, but not quite: object vs. Any.
>>>>
>>>> I naively expect something closer to
>>>>
>>>>      _scalar = ...
>>>>      _object = Dict[str, _stub]
>>>>      _nonscalar = Union[_object, List[_stub]
>>>>
>>>> and (still naively) expect _object to be good enough to serve as type
>>>> annotation for dicts representing JSON objects.
>>>
>>> "_object" would be good, except ... I am trying to avoid using that word
>>> because what does it mean? Python object? JSON object? Here at the
>>> boundary between two worlds, nothing makes sense.
>> 
>> Naming is hard.
>> 
>
> Yep. We can skip this debate by just naming the incoming types 
> SchemaInfo and similar... (cont'd below)
>
>> We talked about these names in review of v2.  Let me try again.
>> 
>> introspect.py needs to generate (a suitable C representation of) an
>> instance of QAPI type '[SchemaInfo]'.
>> 
>> Its current choice of "suitable C representation" is "a QLitQObject
>> initializer with #if and comments".  This is a "lose" representation:
>> QLitQObject can encode pretty much anything, not just instances of
>> '[SchemaInfo]'.
>> 
>> C code converts this QLitQObject to a SchemaInfoList object[*].
>> SchemaInfoList is the C type for QAPI type '[SchemaInfo]'.  Automated
>> tests ensure this conversion cannot fail, i.e. the "lose" QLitQObject
>> actually encodes a '[SchemaInfo]'.
>> 
>> introspect.py separates concerns: it first builds an abstract
>> representation of "set of QObject with #if and comments", then generates
>> C code from that.
>> 
>> Why "QObject with #if and comments", and not "QLitQObject with #if and
>> comments"?  Because QLitQObject is *one* way to represent QObject, and
>> we don't care which way outside C code generation.
>> 
>> A QObject represents a JSON value.  We could just as well say "JSON
>> value with #if and comments".
>> 
>> So, the abstract representation of "JSON value with #if and comments" is
>> what we're trying to type.  If you'd rather say "QObject with #if and
>> comments", that's fine.
>> 
>> Our abstract representation is a tree, where
>> 
>> * JSON null / QNull is represented as Python None
>> 
>> * JSON string / QString as str
>> 
>> * JSON true and false / QBool as bool
>> 
>> * JSON number / QNum is not implemented
>> 
>> * JSON object / QDict is dict mapping string keys to sub-trees
>> 
>> * JSON array / QList is list of sub-trees
>> 
>> * #if and comment tacked to a sub-tree is represented by wrapping the
>>    subtree in Annotated
>> 
>>    Wrapping a sub-tree that is already wrapped seems mostly useless, but
>>    the code doesn't care.
>> 
>>    Wrapping dictionary values makes no sense.  The code doesn't care, and
>>    gives you GIGO.
>> 
>>    Making the code reject these two feels out of scope.  If you want to
>>    anyway, I won't object unless it gets in the way of "in scope" stuff
>>    (right now it doesn't seem to).
>> 
>> Let me stress once again: this is *not* an abstract representation of a
>> 'SchemaInfo'.  Such a representation would also work, and you might like
>> it better, but it's simply not what we have.  Evidence: _tree_to_qlit()
>> works fine for *any* tree, not just for trees that encode instances of
>> 'SchemaInfo'.
>> 
>
> ... as long as you don't feel that's incorrect to do. We are free to 
> name those structures SchemaInfo but type _tree_to_qlit() in terms of 
> generic Dict objects, leaving us without a middle-abstract thing to name 
> at all.
>
> Based on your review of the "dummy types" patch, I'm going to assume 
> that's fine.

I guess it's okayish enough.  It still feels more complicated to me than
it needs to be.

QAPISchemaGenIntrospectVisitor an abstract representation of "QObject
with #if and comments" for each SchemaInfo.

This is not really a representation of SchemaInfo.  We can choose to
name it that way regardless, if it helps, and we explain it properly.

Once we hand off the data to _tree_to_qlit(), we can't name it that way
anymore, simply because _tree_to_qlit() treats it as the stupid
recursive data structure it is, and doesn't need or want to know about
SchemaInfo.

I think I'd dispense with _DObject entirely, and use TreeValue
throughout.  Yes, we'd use Any a bit more.  I doubt the additional
complexity to *sometimes* use object instead is worthwhile.  This data
structure is used only within this file.  It pretty much never changes
(because JSON doesn't).  It's basically write-only in
QAPISchemaGenIntrospectVisitor.  This means all the extra typing work
buys us is use of object instead of Any where it doesn't actually
matter.

I would use a more telling name than TreeValue, though.  One that
actually hints at the kind of value "representation of QObject with #if
and comment".

>> Since each (sub-)tree represents a JSON value / QObject, possibly with
>> annotations, I'd like to propose a few "obvious" (hahaha) names:
>> 
>> * an unannotated QObject: QObject
>> 
>> * an annotated QObject: AnnotatedQObject
>> 
>> * a possibly annotated QObject: PossiblyAnnotatedQObject
>> 
>>    Too long.  Rename QObject to BareQObject, then call this one QObject.
>> 
>> This gives us:
>> 
>>      _BareQObject = Union[None, str, bool, Dict[str, Any], List[Any]]
>>      _AnnotatedQObject = Annotated[_QObject]
>>      _QObject = Union[_BareQObject, _AnnotatedQObject]
>> 
>> Feel free to replace QObject by JsonValue in these names if you like
>> that better.  I think I'd slightly prefer JsonValue right now.
>> 
>> Now back to _DObject:
>> 
>>> (See patch 12/14 for A More Betterer Understanding of what _DObject is
>>> used for. It will contribute to A Greater Understanding.)
>>>
>>> Anyway, to your questions;
>>>
>>> (1) _DObject was my shorthand garbage way of saying "This is a Python
>>> Dict that represents a JSON object". Hence Dict-Object, "DObject". I
>>> have also derisively called this a "dictly-typed" object at times.
>> 
>> In the naming system I proposed, this is BareQDict, with an additional
>> complication: we actually have two different types for the same thing,
>> an anonymous one within _BareQObject, and a named one.
>> 
>>> (2) Dict[str, Any] and Dict[str, object] are similar, but do have a
>> 
>> The former is the anonymous one, the latter the named one.
>> 
>
> Kinda-sorta. I am talking about pure mypy here, and the differences 
> between typing two things this way.
>
> Though I think you're right: I used the "Any" form for the anonymous 
> type (inherent to the structure of a JSON compound type) and the 
> "object" form for the named forms (The SchemaInfo objects we build in 
> the visitors to pass to the generator later).
>
>>> semantic difference. I alluded to it by calling this a "(strict) alias";
>>> which does not help you understand any of the following points:
>>>
>>> Whenever you use "Any", it basically turns off type-checking at that
>>> boundary; it is the gradually typed boundary type. Avoid it whenever
>>> reasonably possible.
>>>
>>> Example time:
>>>
>>>
>>> def foo(thing: Any) -> None:
>>>       print(thing.value)  # Sure, I guess! We'll believe you.
>>>
>>>
>>> def foo(thing: object) -> None:
>>>       print(thing.value)  # BZZT, Python object has no value prop.
>>>
>>>
>>> Use "Any" when you really just cannot constrain the type, because you're
>>> out of bourbon or you've decided to give in to the darkness inside your
>>> heart.
>>>
>>> Use "object" when the type of the value actually doesn't matter, because
>>> you are only passing it on to something else later that will do its own
>>> type analysis or introspection on the object.
>>>
>>> For introspect.py, 'object' is actually a really good type when we can
>>> use it, because we interrogate the type exhaustively upon receipt in
>>> _tree_to_qlit.
>>>
>>>
>>> That leaves one question you would almost assuredly ask as a followup:
>>>
>>> "Why didn't you use object for the stub type to begin with?"
>>>
>>> Let's say we define _stub as `object` instead, the Python object. When
>>> _tree_to_qlit recurses on non-scalar structures, the held value there is
>>> only known as "object" and not as str/bool/None, which causes a typing
>>> error at that point.
>>>
>>> Moving the stub to "Any" tells mypy to ... not worry about what type we
>>> actually passed here. I gave in to the darkness in my heart. It's just
>>> too annoying without real recursion.
>> 
>> May I have an abridged version of this in the comments?  It might look
>> quaint in ten years, when we're all fluent in Python type annotations.
>> But right now, at least some readers aren't, and they can use a bit of
>> help.
>> 
>
> Yeah, I'm sympathetic to that.... though I'm not sure what to write or 
> where. I can add some reference points in the commit message, like this one:
>
> https://mypy.readthedocs.io/en/stable/dynamic_typing.html#any-vs-object
>
> maybe in conjunction with the named type aliases patch this is actually 
> sufficient?

I can see two solutions right now:

1. Use Dict[str, Any] throughout

   All we need to explain is

   * What the data structure is about (JSON annotated with ifconds and
     comments; got that, could use improvement perhaps)

   * Your work-around for the lack of recursive types (got that
     already)

   * That the use of Any bypasses type static checking on use (shouldn't
     be hard)

   * Where such uses are (I believe only in _tree_to_qlit(), were Any
     can't be avoided anyway).

2. Use Dict[str, object] where we can

   Now we get to explain a few more things:

   * Why we bother (to get stricter static type checks on use)

   * Where such uses are (I can't see any offhand)

   * Maybe also where we go from one static type to the other.

In either case, we also need to pick names that need no explanation, or
explain them.

>> [*] Actually, we take a shortcut and convert straight to QObject, but
>> that's just laziness.  See qmp_query_qmp_schema()'s "Minor hack:"
>> comment.
>> 
>
> :)


