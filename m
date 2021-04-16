Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C373627A9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:25:40 +0200 (CEST)
Received: from localhost ([::1]:43496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXT9v-0007cq-LE
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXT8t-0007BV-AO
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXT8q-0007un-Mz
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618597471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KwMyUIRd9IVBKE3mnNvcs5cvGOxWkR19iOyYBJ8yjY=;
 b=PDdolBuN4s4AWgRcNipZvyLKdxo2MLACGtZflRoQqTr+SZzqVZYiSlCzMzil6Euvug1zjR
 Y0MRnshzkHySZeAYzRWUAwpRwXjKUIrs+sHrnFZJzow02iIdq7DOAcyY13s0pw6ze6UE4f
 vH/YkuBb6DeD8cEad4KxQLjYuCgz20g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-wXJQVQvkMSaicFlZPkc9cQ-1; Fri, 16 Apr 2021 14:24:27 -0400
X-MC-Unique: wXJQVQvkMSaicFlZPkc9cQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B77B5192AB9F;
 Fri, 16 Apr 2021 18:24:26 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53B656F439;
 Fri, 16 Apr 2021 18:24:24 +0000 (UTC)
Subject: Re: [PATCH v2 4/8] qapi/error: Change assertion
To: Markus Armbruster <armbru@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-5-jsnow@redhat.com>
 <e760661b-0c3f-bb9b-0b4d-6c5ff77cfd70@redhat.com>
 <87blagghg5.fsf@dusky.pond.sub.org>
 <7436de5c-afda-160a-068d-18bed05a6a68@redhat.com>
 <87eefarbwl.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <95994cdf-7e6b-6d76-578d-c7da27422cbc@redhat.com>
Date: Fri, 16 Apr 2021 14:24:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87eefarbwl.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 2:17 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 4/15/21 3:00 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> On 3/30/21 1:18 PM, John Snow wrote:
>>>>
>>>> Realizing now that this commit topic is wrong :)
>>>>
>>>> A prior version modified the assertion, I decided it was less churn to
>>>> simply add one.
>>>>
>>>> I think ideally we'd have no assertions here and we'd rely on the type
>>>> hints, but I don't think I can prove that this is safe until after part
>>>> 6, so I did this for now instead.
>>>>
>>>>> Eventually, we'll be able to prove that 'info.line' must be an int and
>>>>> is never None at static analysis time, and this assert can go
>>>>> away. Until then, it's a type error to assume that self.info is not
>>>>> None.
>>>>>
>>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>>> ---
>>>>>     scripts/qapi/error.py | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
>>>>> index d179a3bd0c..d0bc7af6e7 100644
>>>>> --- a/scripts/qapi/error.py
>>>>> +++ b/scripts/qapi/error.py
>>>>> @@ -25,6 +25,7 @@ def __init__(self, info, msg, col=None):
>>>>>             self.col = col
>>>>>            def __str__(self):
>>>>> +        assert self.info is not None
>>>>>             loc = str(self.info)
>>>>>             if self.col is not None:
>>>>>                 assert self.info.line is not None
>>>>>
>>> Please show us the revised commit message.  I'm asking because the
>>> patch's purpose isn't quite clear to me.  Peeking ahead at PATCH 7, I
>>> see that info becomes Optional[QAPISourceInfo].  This means something
>>> passes None for info (else you wouldn't make it optional).  None info
>>> Works (in the sense of "doesn't crash") as long as col is also None.
>>> After the patch, it doesn't.  I'm not saying that's bad, only that I
>>> don't quite understand what you're trying to accomplish here.
>>>
>>
>> Sure.
>>
>> If you recall, I tried to enforce that QAPISourceInfo was *never* None
>> by creating a special value for QSI that represented "No Source
>> Info". Ultimately, that idea didn't go through and we solidified that
>> the 'info' parameter that gets passed around can sometimes be None.
>>
>> Hence, this property is Optional[QAPISourceInfo].
>>
>> Since I know you wanted to crash messily in the case that we allowed a
>> None-info to leak into a context like this, I added the new assertion
>> to make sure this remains the case.
>>
>> (since str(None) evaluates to "None", it seemed like there was already
>> the implicit assumption that info would never be None. Plus, if 'col'
>> is set, mypy notices that we are performing an unsafe check on
>> self.info.line, which had to be remedied.)
>>
>> Later in the series, after schema.py is typed, it may be possible to
>> remove these assertions as we may be able to rely on the strict typing
>> to prove that this situation can never occur. However, since schema.py
>> is not yet typed, we can't yet.
>>
>>
>>
>> Alright. So given that, I think what you'd like to see for a commit
>> message is:
>>
>> qapi/error: assert QAPISourceInfo is not None
>>
>> We implicitly assume that self.info will never be None, as the error
>> reporting function will not produce meaningful output in this case,
>> and will crash if self.col was set. Assert that self.info is not None
>> in order to formalize this assumption.
>>
>> We can not yet change the type of the initializer to prove that this
>> is provably true at static analysis time until the rest of this
>> library is fully typed.
> 
> Let's insert another paragraph to make the intent even clearer, and
> adjust the remainder for it:
> 
>    qapi/error: assert QAPISourceInfo is not None
> 
>    Built-in stuff is not parsed from a source file, and therefore have no
>    QAPISourceInfo.  If such None info was used for reporting an error,
>    built-in stuff would be broken.  Programming error.  Instead of
>    reporting a confusing error with bogus source location then, we better
>    crash.
> 
>    We currently crash only if self.col was set.  Assert that self.info is
>    not None in order to crash reliably.
> 
>    We can not yet change the type of the initializer to prove this cannot
>    happen at static analysis time before the remainder of the code is
>    fully typed.
> 
> Note I also replaced "this library" because I'm not sure what it means.
> 

Wiggly-brain, wiggly-mouth. I meant "package". I get these terms 
consistently wrong, and I need to really make a very direct effort to 
treat them precisely correctly in the future.

MODULE: A single Python file. It may be a script, or serve only as a 
library meant for consumption by other scripts.

PACKAGE: A collection of one or more Python modules. QAPI is a package 
because it's a folder with an __init__.py file, containing several modules.

LIBRARY: No formal definition; however, I think of it as a Python module 
that is meant primarily to be consumed by another script or entry-point. 
It has some implications for things like Python's hierarchical logging 
library where the distinction is important for how logger setup is 
handled. Modules that use the "if __name__ == '__main__'" stanza serve 
dual purpose as a script *and* library.


In this case, I meant "package". I think I accidentally avoid this term 
because I don't want to imply that it is a "distributed package" in the 
sense of a "PyPI package" and my brain skips a clock cycle and picks 
another random word.

Bad habit. :(

> What do you think?
> 
> 

TLDR: I took your phrasing wholesale. Thanks!

--js

(Random aside on patch submission process: I do dislike how when I 
change the topic of a commit, I lose out on git-backport-diff 
functionality. I wish I had a persistent ID for commits that survived 
beyond title changes. Sometimes I debate scripting adding some kind of 
Patch-GUID: <...> tag, but I don't know if that would look like 
undesirable clutter in the git log to everyone else. Maybe a "WAS: 
old-topic-name-here" in the comment section would suffice well enough?)


