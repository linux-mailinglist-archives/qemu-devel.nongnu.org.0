Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACAD374D16
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:52:07 +0200 (CEST)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTBO-0003h8-2j
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1leT8y-0002jG-Tm
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1leT8u-0004CI-3X
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620265770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ohssr7zpgwuqmcCclE7YZZxqeITGSjAFlne5CoBQ5VQ=;
 b=AobnNlN8M1XFN14ly8hEtoajpj1Mw0Aa1tSWeTM77k1Xl5krwrmOKH6uHxg03mkDN5OfUh
 OGFWPQUHw9C9eAy6Gm501+paTEw78eSYf5tlxMH3pVwBqcdgYGuPPDKmHAJnBe1aewJQw2
 CWjPfBd9hy9Xc5ZQN5qzh6CMK+Bg90U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-6NK0DdoJPQyORNr7woK0Vw-1; Wed, 05 May 2021 21:49:28 -0400
X-MC-Unique: 6NK0DdoJPQyORNr7woK0Vw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1124C801B14;
 Thu,  6 May 2021 01:49:27 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2CC41002D71;
 Thu,  6 May 2021 01:49:25 +0000 (UTC)
Subject: Re: [PATCH 12/22] qapi/parser: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-13-jsnow@redhat.com>
 <87zgxm5yrp.fsf@dusky.pond.sub.org>
 <07ad14a5-a1bb-691f-cdc1-93ef82b28e77@redhat.com>
 <87tuns2k3p.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <da9be44a-6e54-e411-8cbc-28811c7cf1ee@redhat.com>
Date: Wed, 5 May 2021 21:49:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87tuns2k3p.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 4:43 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 4/25/21 8:34 AM, Markus Armbruster wrote:
>>> value: object isn't wrong, but why not _ExprValue?
>>>
>>
>> Updated excuse:
>>
>> because all the way back outside in _parse, we know that:
>>
>> 1. expr is a dict (because of get_expr(False))
>> 2. expr['pragma'] is also a dict, because we explicitly check it there.
> 
> Yes:
> 
>                  pragma = expr['pragma']
> -->             if not isinstance(pragma, dict):
> -->                 raise QAPISemError(
> -->                     info, "value of 'pragma' must be an object")
>                  for name, value in pragma.items():
>                      self._pragma(name, value, info)
> 
>> 3. We iterate over the keys; all we know so far is that the values are
>> ... something.
> 
> Actually, *we* know more about the values.  get_expr() returns a tree
> whose inner nodes are dict or list, and whose leaves are str or bool.
> Therefore, the values are dict, list, str, or bool.
> 
> It's *mypy* that doesn't know, because it lacks recursive types.
> 
> I know that you're prbably using "we" in the sense of "the toolchain".
> I'm annoying you with the difference between "the toolchain" and "we
> (you, me, and other humans) because I'm concerned about us humans
> dumbing ourselves down to mypy's level of understanding.
> 

Put in a gentler way: The risk is that type annotations that assume less 
because they *must* assume less will potentially miscommunicate the 
reality of the interface to future developers.

I agree, that is a genuine risk.

but ...

> To be honest, I'm less and less sure typing these trees without the
> necessary typing tools is worth the bother.  The notational overhead it
> more oppressive than elsewhere, and yet the typing remains weak.  The
> result fails to satisfy, and that's a constant source of discussions
> (between us as well as just in my head) on how to best mitigate.
> 

... What's the alternative? I still think strict typing has strong 
benefits -- it's found a few bugs, albeit small. It offers good 
refactoring assurance and can help communicate the expected types in an 
interface *very* quickly.

Whenever I type something as Dict[str, object] that is my genuine 
attempt at just cutting my losses and saying "It gets ... something. 
Figure it out, like you did before Python 3.6."

I could use 'Any', but that really just effectively shuts the checker 
off. You could pass <Lasagna> to the interface and mypy won't flinch.

Dict[str, object] at least enforces:

- It must be a dict
- 100% of its keys must be strings
- You cannot safely do anything with its values until you interrogate 
them at runtime

...And I think that's perfectly accurate. I tried too hard to accurately 
type introspect.py, and I am avoiding repeating that mistake.

>> 4. _pragma()'s job is to validate the type(s) anyway.
> 
> _pragma() can safely assume @value is dict, list, str, or bool.  It just
> happens not to rely on this assumption.
> 

Correct. Though, there's not too many operations that dict/list/str/bool 
all share, so you're going to be interrogating these types at runtime 
anyway.

Really, just about everything they share as an interface is probably 
perfectly summed up by the python object type.

So ... I dunno. I share your frustrations at the lack of expressiveness 
in recursive types, and it has been a major bummer while working on ... 
a recursive expression parser.

* abandons series *

/s

>> More or less, the _ExprValue type union isn't remembered here -- even
>> though it was once upon a time something returned by get_expr, it
>> happened in a nested call that is now opaque to mypy in this context.
> 
> Understand.
> 
>> So, it's some combination of "That's all we know about it" and "It
>> happens to be exactly sufficient for this function to operate."
> 
> I can accept "it's all mypy can figure out by itself, and it's good
> enough to get the static checking we want".
> 

Yep. I think the typing of this particular interface is as good as it 
can be for the moment, so I recommend leaving it as Dict[str, object].

--js


