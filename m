Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCEE2DE9AA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:16:57 +0100 (CET)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLFI-0002DS-J7
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kqLD8-0001WS-78
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kqLD5-0001Xt-3d
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608318877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oveX/rUtPerERmkapj6pb5QvGFqFjiwRTJoKoy5Tk7U=;
 b=C5g0+6KMIxXU5DK4HESFKNeX5fyHyTuCLASiK/bdV8CPS9lPIAFVGsGh9mF1Kh3v/3lp/g
 fO6BG3CmuaOz2DFakJw169DaVgrOGhtiQZBYAmkps8tfwvqWSWwjHe9YbmVYRan4VOQWl8
 tGeAnkIPhf7rvNYpQfn2iAlaW+W8oCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-rNKV9DYHMWK7n9iU7sjkhg-1; Fri, 18 Dec 2020 14:14:33 -0500
X-MC-Unique: rNKV9DYHMWK7n9iU7sjkhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E3BC1DDE0
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 19:14:32 +0000 (UTC)
Received: from [10.10.112.131] (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEACD60C15;
 Fri, 18 Dec 2020 19:14:23 +0000 (UTC)
Subject: Re: [PATCH 06/12] qapi/source: Add builtin null-object sentinel
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-7-jsnow@redhat.com>
 <87r1nqrtp7.fsf@dusky.pond.sub.org>
 <d8f468e9-a17d-6ff7-4cf1-369085d8edd3@redhat.com>
 <87a6uck3y4.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <1dac428c-6cd4-5922-0f0d-7aa37a0ecba8@redhat.com>
Date: Fri, 18 Dec 2020 14:14:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87a6uck3y4.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 7:33 AM, Markus Armbruster wrote:
> A patch limited to the first aspect merely tweaks an implementation
> detail.
> 
> As soon as we include the second aspect, we get to debate how to handle
> programming errors, and maybe whether any of the errors involving a
> QAPISourceInfo.builtin() are*not*  programming errors.
> 
> I'd prefer this series to remain focused on "enabling strict optional
> checking in mypy for everything we have typed so far".

That is still the focus -- I believe adding a poison pill as you suggest 
actually causes more errors instead of "maintaining" them; it doesn't 
maintain a status quo.

Now, I understand the concern that this is opening a chance to allow a 
new class of errors to slip by undetected, but I don't believe it does 
in a meaningful way.

I didn't intend for this info object to be a poison; it wasn't designed 
as one, nor should it be. It's merely a SourceInfo that represents the 
degenerate case that something-or-other does not have an explicit user 
source.

You're right that it probably shouldn't be seen in normal conditions, 
but if it has; my take is that something *else* has already gone 
horribly wrong and we aren't just sweeping dust under the mat, actually.


Here's a recap of my thinking process in identifying the problem and my 
fix for it:

- Many functions expect that QAPISourceInfo *will* be present. Largely, 
they are correct in expecting this, but very few of them check or assert 
this. This is perfectly normal for untyped Python.

- Taxonomically, however, this is untrue, because the built-in entities 
do not need to specify one.

- This can be addressed in typed python by adding assertions everywhere 
("assert info is not None"), or it can be addressed by making the core 
assumption true ("QAPISourceInfo is not Optional").

I opted to make the core assumption true; which does introduce a new 
ambiguity that may not have been present before:

"If we have an info object, is it a real user-source info object, or is 
it the built-in sentinel?"

I *think* this is where you start to get worried; we have "lost" the 
ability to know, in an "obvious" way if this object is "valid" for a 
given context. The assumption is that the code will explode violently if 
we are passed None instead of a valid source info.

I don't think this assumption is true, though. mypy informs me that we 
were never checking to see if it was valid anyway, so we already have 
this ambiguity in the code today. Given that the 'info' object is, in 
most cases, not used until *after we have detected another error*, 
changing the info object to be non-none does not suppress any errors 
that didn't already exist in these contexts.

What about places where QAPISourceInfo is used outside of an 
error-handling context to gain contextual information about an entity? 
Do we open ourselves up to new cases where we may have had an implicit 
error, but now we do not?


Explicit usages of QAPISourceInfo are here:

1. QAPISchemaEntity._set_module(), which uses the info fname to find the 
QAPISchemaModule object. This already checks for "None" info now, and 
will check for the "./builtin" info after the series.

2. QAPISchemaEntity.is_implicit(), which uses the falsey nature of info 
to intuit that it is a built-in definition. No change in behavior.

3. QAPISchemaArrayType.check(), which uses the falsey nature of 
self.info to conditionally pass self.info.defn_meta to 
QAPISchema.resolve_type().

Found a bug (previously fixed in part 6 prior to enabling type checking 
on schema.py, which is why it went undetected here. I am moving the fix 
forward into this series):

info and info.defn_meta will evaluate to the sentinel QAPISourceInfo 
instead of an empty string or None, but it can be changed simply to just 
"info.defn_meta" to take the None value from the builtin source info's 
defn_meta field; easy.

4. QAPISchemaMember.describe(), which uses info.defn_name. This is only 
ever called in error-handling contexts, so we aren't reducing total 
error coverage here, either.

5. QAPISchemaCommand.check(), which uses info.pragma.returns_whitelist. 
This might legitimately create a new avenue where we succeed where we 
used to fail, if we were to create a built-in command. Whether or not 
this is desirable depends on how you want pragma directives to work 
long-term; per-file or per-schema. (Do you want to let user-defined 
schemas dictate how built-in commands work?)

I don't think this is an issue.

6. QAPISchema._def_entity(), which asserts that info must be true-ish, 
or we are in the predefining state. This logic doesn't change.

7. QAPISchema._def_entity(), which uses the true-ish nature of 
other_ent.info to print a different error message. This logic doesn't 
change.

8. expr.py:check_type(), which uses info.pragma.returns_whitelist. This 
theoretically adds slack, but parser.py always gives us real info objects.

9. expr.py:check_exprs(), which calls info.set_defn(meta, name). 
Obviously this must not be None because parser.py does not create 
"built-in" source objects; we know with certainty here that we cannot 
get such a thing.

10. expr.py:check_exprs() again, checking info.pragma.doc_required. As 
above, we know this is always a true source info.

11. QAPIError's str() method itself will call str(info), but if info is 
None, it doesn't crash -- you just get "None". Now you'll get 
"[builtin]". Doesn't permit any new error cases.



Conclusions:

- There are users that use info to decide on behavior outside of an 
error context, but they are already cared for.

- There are some pre-schema.py uses of info that may cause less problems 
than they used to, but would require someone to add the placeholder 
object into parser.py. We can throw a single assertion in expr.py to 
make sure it never happens by accident.

- There are no, and I doubt there ever will be, users who use str(info) 
to decide on behavior. There are only exception handlers that use this 
method. There is no value to making str(info) in particular a poison pill.

- There might be some limited benefit to poisoning info.pragma, depending.


Ultimately, I consider this the standard idiomatic usage of info:

```
def some_func(info):
     if (error):
         raise QAPISemError(info, "you forgot to defrobulate")
```

When we go to print the error message to the user, the exception handler 
is going to fault because str(info) is poisoned. Is it useful to poison 
the exception handler here?

I don't think so; especially considering that even "None" here will work 
just fine!


So I suppose I would prefer not to add poison, because I don't think 
it's necessary, or improves anything materially.

--js


