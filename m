Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7E31DDBD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:57:22 +0100 (CET)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQ8e-0005iN-EA
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCQ7I-0005Cg-Db
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:55:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCQ7F-0005BK-7y
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613580951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=906ooPGepci+DnHnCqvxVsd5cWbWOOL7Edznx89dcHg=;
 b=GjbvGJ+Dz0tLrr6q1rm7ssd1FAjl75nmvofpBiXF1gV458G1TcqN/EVYlo5SSFKsQJb0aT
 YnBbR9OQDFd0YJIK+iDyI5g+ZkjJZbKuqN7ejzxwXs5aj9pkY0I/zRj2xJYYq0SWm80Q0f
 pkOCcVOgFhz+YsqEIZ93toGSCPPHilw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-ViZGvCzQOLy6NhcN5_pIjg-1; Wed, 17 Feb 2021 11:55:48 -0500
X-MC-Unique: ViZGvCzQOLy6NhcN5_pIjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FDEC801977;
 Wed, 17 Feb 2021 16:55:47 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2B335D748;
 Wed, 17 Feb 2021 16:55:46 +0000 (UTC)
Subject: Re: [PATCH v6 15/19] qapi/introspect.py: Add docstrings to _gen_tree
 and _tree_to_qlit
To: Markus Armbruster <armbru@redhat.com>
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-16-jsnow@redhat.com>
 <875z2r6njn.fsf@dusky.pond.sub.org>
 <377a32a9-2ace-dac2-dfd6-3db8d581f72c@redhat.com>
 <87eeheodna.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <5024aa7f-0b60-0bcb-35ed-1d37bb9ab7a5@redhat.com>
Date: Wed, 17 Feb 2021 11:55:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87eeheodna.fsf@dusky.pond.sub.org>
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 11:35 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 2/17/21 4:39 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    scripts/qapi/introspect.py | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>>> index 45284af1330..5d4f5e23f7e 100644
>>>> --- a/scripts/qapi/introspect.py
>>>> +++ b/scripts/qapi/introspect.py
>>>> @@ -99,6 +99,15 @@ def __init__(self, value: _ValueT, ifcond: Iterable[str],
>>>>    def _tree_to_qlit(obj: JSONValue,
>>>>                      level: int = 0,
>>>>                      dict_value: bool = False) -> str:
>>>> +    """
>>>> +    Convert the type tree into a QLIT C string, recursively.
>>>> +
>>>> +    :param obj: The value to convert.
>>>> +                This value may not be Annotated when dict_value is True.
>>>> +    :param level: The indentation level for this particular value.
>>>> +    :param dict_value: True when the value being processed belongs to a
>>>> +                       dict key; which suppresses the output indent.
>>>> +    """
>>>>    
>>>>        def indent(level: int) -> str:
>>>>            return level * 4 * ' '
>>>> @@ -244,6 +253,15 @@ def _gen_features(features: List[QAPISchemaFeature]
>>>>        def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>>>>                      ifcond: Sequence[str],
>>>>                      features: Optional[List[QAPISchemaFeature]]) -> None:
>>>> +        """
>>>> +        Build and append a SchemaInfo object to self._trees.
>>>> +
>>>> +        :param name: The entity's name.
>>>> +        :param mtype: The entity's meta-type.
>>>> +        :param obj: Additional entity fields, as appropriate for the meta-type.
>>>
>>> "Additional members", since we're talking about a JSON object.
>>>
>>
>> I thought "field" was also appropriate for JSON, but I suppose the spec
>> doesn't use that word.
> 
> Correct.
> 
>>                         Over time, "field", "member" and "property" have
>> become just meaningless word-slurry to me.
> 
> Perfectly understandable.
> 
>> OK.
>>
>> "Additional members as appropriate for the meta-type."
> 
> Let's stick in a SchemaInfo for clarity:
> 
>          :param obj: Additional SchemaInfo members, as appropriate for
>                      the meta-type.
> 

Sure, why not?

>>>> +        :param ifcond: Sequence of conditionals that apply to this entity.
>>>> +        :param features: Optional features field for SchemaInfo.
>>>
>>> Likewise.
>>>
>>
>> "Optional features member for SchemaInfo" ?
>>
>> Sure.
> 
> What about
> 
>          :param features: The SchemaInfo's features.
> 

Sure, why not? x2

>>> Sure we want to restate parts of the type ("Sequence of", "Optional") in
>>> the doc string?
>>>
>>
>> I usually avoid it, but sometimes for non-scalars I found that it read
>> better to give a nod to the plural, as in:
>>
>> [ifcond is a] sequence of conditionals ...
>>
>> but, yes, I haven't been consistent about it. right below for @obj I
>> omit the type of the container.
>>
>> "Conditionals that apply to this entity" feels almost too terse in
>> isolation.
> 
> Similarly terse, just with SchemaInfo:
> 
>          :param ifcond: Conditionals to apply to the SchemaInfo.
> 

Sure, why not! x3

> Or "Conditionals to guard the SchemaInfo with".  Doesn't read any
> better, I fear.  Ideas?
> 
>> I don't feel like it's a requisite to state the type, but in some cases
>> I unconsciously chose to mention the structure.
> 
> Then let's work with the informal rule not to repeat types, unless where
> repeating them makes the text easier to read.  Makes sense to you?
> 

Subjectively I was doing this. Maybe half-heartedly. :~)

> I suspect the answer we'll give in the long term depends on tooling.
> When all the tools can show you is the doc string, the doc string better
> includes type information.  But if the tools show you the types,
> repeating them wastes precious reader bandwidth.
> 

Yep. Sphinx shows type in the signature, but it doesn't necessarily 
repeat it for the :param list: entries; So you can correlate it with 
your eyeballs, but it isn't done for you.

Maybe that'll change. Maybe I'll change it with my own Sphinx plugin 
eventually that does the cool stuff I dream about.

Maybe Maybe Maybe. I need to study the docutils API and learn how to 
make even a simple plugin... There are definitely a few ideas that I 
have that I want to bring to life that I think will help people like me 
adhere to a more consistent style.

>> With regards to "Optional", I use this word specifically to indicate
>> parameters that have default values -- distinct from a type that's
>> Optional[], which is really actually like Nullable[T] ... If it makes
>> you feel better, Guido says he regrets that naming decision. Oops!
> 
> He's right.
> 
> The "has default value" kind of optional is not part of the type, thus
> not covered by the proposed informal rule.  Similar, if separate
> question: sure we want to restate the (presence of a) default value in
> the doc string?
> 

I tend to state what a default is if the default is a special value that 
implies something else. Like: "The default is to not add this member." I 
have generally avoided "The default is 3."

I do sometimes say "Defaults to true/false" for boolean options just to 
add emphasis on "which way" the boolean leans, in case the name doesn't 
make that clear in isolation.

I haven't been consistent, but I will try to be a bit more conscious 
about it going forward.

(the expr.py series, up next, is gonna be a playground for docstring 
style reviews, because I added a ton.)

> Again, the long-term answer will likely depend on tooling.
> 

If it reads better to you to remove the "Optional, " then go ahead and 
make those cuts for the time-being, and I can try to hit things with a 
docstring beautifying beam later when we actually try to develop and 
publish a manual.

(After my python packaging series and after this QAPI cleanup series.)

>> I'm probably not consistent about when I decided to write it, though.
>>
>> Ehm. If it's not harmful to leave it as-is, I think it'd be okay to do
>> so. If you prefer a consistency all one way or all the other, I'd have
>> to run the vacuum back over the series to check for it.
> 
> Just five patches add comments, and just two doc strings.  I had a look
> at all of them, and found nothing else in need of vacuuming.
> 

Go with whatcha feel, but I'll try to write that "style guide" we 
discussed during part 1 and we can hem and haw over the guidelines for 
ourselves.

I will want to apply it to all of ./scripts/qapi and ./python/qemu both.

>>>> +        """
>>>>            comment: Optional[str] = None
>>>>            if mtype not in ('command', 'event', 'builtin', 'array'):
>>>>                if not self._unmask:
>>>
>>> Also: more line-wrapping for PEP 8.
>>>
>>
>> I thought the 72 column limit was for things like comments and docstrings.
> 
> I put this in the wrong spot, I meant the doc string, not the code.
> sorry for the confusion!
> 

Ah, phew. OK, yes, I've already capitulated on the comment line lengths, 
have at those :)


