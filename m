Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD66316D04
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:42:25 +0100 (CET)
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tVQ-0004md-KC
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l9tLI-0001bj-R7
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:31:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l9tLF-0005cV-QX
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612978313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0IzOzjLTdqyAclfs/CszsiFum/isFY5/8/vqnhUqYw=;
 b=eWVOqiNw3+9J3fSIAbMDw9T8rY13bfc0kkV3hbTIt7MUUwI4PZSNCkRIpYNOSBugt8uXBX
 fFDRW9lUj45Gzsr+O1mchxy1w8pS/D0Tizcup8ImVZ5Z7JvsNMGxuLzEj5XswNdwOiYVWO
 u+G9F25qunQOjosAtGZPIz4lPI96NOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-E-TCmZOGPeuqUvscr2zr7g-1; Wed, 10 Feb 2021 12:31:51 -0500
X-MC-Unique: E-TCmZOGPeuqUvscr2zr7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06D9B8030CC;
 Wed, 10 Feb 2021 17:31:50 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E7E8190D0;
 Wed, 10 Feb 2021 17:31:49 +0000 (UTC)
Subject: Re: [PATCH v4 11/14] qapi/introspect.py: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-12-jsnow@redhat.com>
 <87r1lxqj2e.fsf@dusky.pond.sub.org>
 <ee95f545-7c43-0587-642b-e70589b4a0e6@redhat.com>
 <87tuqq1vii.fsf@dusky.pond.sub.org>
 <a1d1c67e-8066-3154-1117-6c86c6f8d9b6@redhat.com>
 <87lfbxvcds.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b74f2441-8f53-6dbd-f6ed-35ad798a327c@redhat.com>
Date: Wed, 10 Feb 2021 12:31:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87lfbxvcds.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 2/9/21 4:06 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
>> On 2/5/21 8:42 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:

> https://www.python.org/dev/peps/pep-0484/#type-aliases
> 
>      Note that we recommend capitalizing alias names, since they
>      represent user-defined types, which (like user-defined classes) are
>      typically spelled that way.
> 
> I think this wants names like _Scalar, _NonScalar, _Value, TreeValue.
> 

Yeah, that seems like the only way to make it consistent and not have 
pylint yell at me. I will try to adhere to this in the future, but maybe 
pylint needs a bug report to make it complain in these cases, too.

[...]

>>
>> ... as long as you don't feel that's incorrect to do. We are free to
>> name those structures SchemaInfo but type _tree_to_qlit() in terms of
>> generic Dict objects, leaving us without a middle-abstract thing to name
>> at all.
>>
>> Based on your review of the "dummy types" patch, I'm going to assume
>> that's fine.
> 
> I guess it's okayish enough.  It still feels more complicated to me than
> it needs to be.
> 
> QAPISchemaGenIntrospectVisitor an abstract representation of "QObject
> with #if and comments" for each SchemaInfo.
> 
> This is not really a representation of SchemaInfo.  We can choose to
> name it that way regardless, if it helps, and we explain it properly.

In that: SchemaInfo do not have annotations, but we do. Our SchemaInfo 
objects here are in a kind of superposition in that we have not yet 
applied the if conditionals.

Still, I do think it is *very* helpful to name those instances after the 
SchemaInfo types, because that is absolutely the interface we are 
matching. The keys are not arbitrary. The types of the values associated 
with those keys are not arbitrary.

So, I am not sure how useful it is to make such a careful distinction. 
My instinct is "not very, especially for passers-by to this module."

> 
> Once we hand off the data to _tree_to_qlit(), we can't name it that way
> anymore, simply because _tree_to_qlit() treats it as the stupid
> recursive data structure it is, and doesn't need or want to know about
> SchemaInfo.
> 

Yes, this is fine: the data is being interpreted in a new semantic 
context. It keeps the mechanical type but loses the semantic 
information. That sounds normal to me.

"Why bother, then?"

Mostly for the notational benefit in the code BUILDING the objects. 
_tree_to_qlit is so generic you can barely describe it, but the objects 
we build to feed it are quite concrete and have names and definitions 
that can be referenced.

> I think I'd dispense with _DObject entirely, and use TreeValue
> throughout.  Yes, we'd use Any a bit more.  I doubt the additional
> complexity to *sometimes* use object instead is worthwhile.  This data

I have gotten rid of _DObject entirely in v5; though using "Any" 
everywhere doesn't seem like an obvious win to me, because I'd need to 
turn this:

_NonScalar = Union[Dict[str, _Stub], List[_Stub]]
[...]
SchemaInfo = Dict[str, object]
[...]

into this:

_JSONObject = Dict[str, _Stub]
_JSONArray = List[_Stub]
_NonScalar = Union[_JSONObject, _JSONArray]
[...]
SchemaInfo = _JSONObject
[...]

Which doesn't really strike me as any simpler or nicer on either the 
semantic or mechanical axes.

> structure is used only within this file.  It pretty much never changes
> (because JSON doesn't).  It's basically write-only in
> QAPISchemaGenIntrospectVisitor.  This means all the extra typing work

Write-only variables need typing! mypy will assume these objects are 
Dict[str, str] otherwise. We have to type them as something.

And the way I typed them ... is correct, and avoided having to name two 
more intermediary types.

> buys us is use of object instead of Any where it doesn't actually
> matter.
> 

Maybe so. Comes down to habits. My current belief is "Do not use Any if 
you do not have to." I did not have to, so I didn't.

> I would use a more telling name than TreeValue, though.  One that
> actually hints at the kind of value "representation of QObject with #if
> and comment".
> 

We discussed this on IRC; ultimately I wasn't convinced of the utility 
of naming the tree type "QObject" on the logic that if QLit is a 
QObject, a function named "QObject to QLit" didn't make sense to me anymore.

>>> Since each (sub-)tree represents a JSON value / QObject, possibly with
>>> annotations, I'd like to propose a few "obvious" (hahaha) names:
>>>
>>> * an unannotated QObject: QObject
>>>
>>> * an annotated QObject: AnnotatedQObject
>>>
>>> * a possibly annotated QObject: PossiblyAnnotatedQObject
>>>
>>>     Too long.  Rename QObject to BareQObject, then call this one QObject.
>>>
>>> This gives us:
>>>
>>>       _BareQObject = Union[None, str, bool, Dict[str, Any], List[Any]]
>>>       _AnnotatedQObject = Annotated[_QObject]
>>>       _QObject = Union[_BareQObject, _AnnotatedQObject]
>>>
>>> Feel free to replace QObject by JsonValue in these names if you like
>>> that better.  I think I'd slightly prefer JsonValue right now.
>>>

On IRC, We agreed to disagree on the semantic name and use the more 
mechanically suggestive JsonValue instead. I'll give that a spin.

(It's also kinda-sorta wrong, but everything has felt kinda-sorta wrong 
to me so far. Guess it's no better or worse.)

>>> Now back to _DObject:
>>>
>>>> (See patch 12/14 for A More Betterer Understanding of what _DObject is
>>>> used for. It will contribute to A Greater Understanding.)
>>>>
>>>> Anyway, to your questions;
>>>>
>>>> (1) _DObject was my shorthand garbage way of saying "This is a Python
>>>> Dict that represents a JSON object". Hence Dict-Object, "DObject". I
>>>> have also derisively called this a "dictly-typed" object at times.
>>>
>>> In the naming system I proposed, this is BareQDict, with an additional
>>> complication: we actually have two different types for the same thing,
>>> an anonymous one within _BareQObject, and a named one.
>>>
>>>> (2) Dict[str, Any] and Dict[str, object] are similar, but do have a
>>>
>>> The former is the anonymous one, the latter the named one.
>>>
>>
>> Kinda-sorta. I am talking about pure mypy here, and the differences
>> between typing two things this way.
>>
>> Though I think you're right: I used the "Any" form for the anonymous
>> type (inherent to the structure of a JSON compound type) and the
>> "object" form for the named forms (The SchemaInfo objects we build in
>> the visitors to pass to the generator later).
>>
>>>> semantic difference. I alluded to it by calling this a "(strict) alias";
>>>> which does not help you understand any of the following points:
>>>>
>>>> Whenever you use "Any", it basically turns off type-checking at that
>>>> boundary; it is the gradually typed boundary type. Avoid it whenever
>>>> reasonably possible.
>>>>
>>>> Example time:
>>>>
>>>>
>>>> def foo(thing: Any) -> None:
>>>>        print(thing.value)  # Sure, I guess! We'll believe you.
>>>>
>>>>
>>>> def foo(thing: object) -> None:
>>>>        print(thing.value)  # BZZT, Python object has no value prop.
>>>>
>>>>
>>>> Use "Any" when you really just cannot constrain the type, because you're
>>>> out of bourbon or you've decided to give in to the darkness inside your
>>>> heart.
>>>>
>>>> Use "object" when the type of the value actually doesn't matter, because
>>>> you are only passing it on to something else later that will do its own
>>>> type analysis or introspection on the object.
>>>>
>>>> For introspect.py, 'object' is actually a really good type when we can
>>>> use it, because we interrogate the type exhaustively upon receipt in
>>>> _tree_to_qlit.
>>>>
>>>>
>>>> That leaves one question you would almost assuredly ask as a followup:
>>>>
>>>> "Why didn't you use object for the stub type to begin with?"
>>>>
>>>> Let's say we define _stub as `object` instead, the Python object. When
>>>> _tree_to_qlit recurses on non-scalar structures, the held value there is
>>>> only known as "object" and not as str/bool/None, which causes a typing
>>>> error at that point.
>>>>
>>>> Moving the stub to "Any" tells mypy to ... not worry about what type we
>>>> actually passed here. I gave in to the darkness in my heart. It's just
>>>> too annoying without real recursion.
>>>
>>> May I have an abridged version of this in the comments?  It might look
>>> quaint in ten years, when we're all fluent in Python type annotations.
>>> But right now, at least some readers aren't, and they can use a bit of
>>> help.
>>>
>>
>> Yeah, I'm sympathetic to that.... though I'm not sure what to write or
>> where. I can add some reference points in the commit message, like this one:
>>
>> https://mypy.readthedocs.io/en/stable/dynamic_typing.html#any-vs-object
>>
>> maybe in conjunction with the named type aliases patch this is actually
>> sufficient?
> 
> I can see two solutions right now:
> 
> 1. Use Dict[str, Any] throughout
> 
>     All we need to explain is
> 
>     * What the data structure is about (JSON annotated with ifconds and
>       comments; got that, could use improvement perhaps)
> 
>     * Your work-around for the lack of recursive types (got that
>       already)
> 
>     * That the use of Any bypasses type static checking on use (shouldn't
>       be hard)
> 
>     * Where such uses are (I believe only in _tree_to_qlit(), were Any
>       can't be avoided anyway).
> 
> 2. Use Dict[str, object] where we can
> 
>     Now we get to explain a few more things:
> 
>     * Why we bother (to get stricter static type checks on use)
> 
>     * Where such uses are (I can't see any offhand)
> 
>     * Maybe also where we go from one static type to the other.
> 
> In either case, we also need to pick names that need no explanation, or
> explain them.
> 

"that need no explanation" (to whom?) Suspect this is impossible; 
there's gonna be explanations anyway.

--js


