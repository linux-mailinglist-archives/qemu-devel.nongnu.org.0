Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912BD360F5D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:49:27 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4FC-0001Jb-Ma
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lX4AS-00074C-PX
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:44:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lX4AQ-00011K-Gz
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618501469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSoxrnmrLihu7bzABe/1uWYK98r0gesArDVMIZ+d4Bs=;
 b=M9X5vmAnC6sSXjteiuPG+k7Xftnd4uSgCIkKTUELytV6dfQdangV2BnaB9sAaL0yy+pY44
 CB1+zvelcbbd8IGXqa9syxGGDzImEip9JV0bcRSb0Qok1Z8/yqIVuX67NQr2D5CGQ6Vrh9
 S5x+nQYj2WG0l3NRYIYX7tlAKcCjd0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-TjFAcImpPbCQxUsQAPdJ5A-1; Thu, 15 Apr 2021 11:44:26 -0400
X-MC-Unique: TjFAcImpPbCQxUsQAPdJ5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC6DC501FB;
 Thu, 15 Apr 2021 15:44:25 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D655C1880F;
 Thu, 15 Apr 2021 15:44:24 +0000 (UTC)
Subject: Re: [PATCH v2 4/8] qapi/error: Change assertion
To: Markus Armbruster <armbru@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-5-jsnow@redhat.com>
 <e760661b-0c3f-bb9b-0b4d-6c5ff77cfd70@redhat.com>
 <87blagghg5.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <7436de5c-afda-160a-068d-18bed05a6a68@redhat.com>
Date: Thu, 15 Apr 2021 11:44:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87blagghg5.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On 4/15/21 3:00 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 3/30/21 1:18 PM, John Snow wrote:
>>
>> Realizing now that this commit topic is wrong :)
>>
>> A prior version modified the assertion, I decided it was less churn to
>> simply add one.
>>
>> I think ideally we'd have no assertions here and we'd rely on the type
>> hints, but I don't think I can prove that this is safe until after part
>> 6, so I did this for now instead.
>>
>>> Eventually, we'll be able to prove that 'info.line' must be an int and
>>> is never None at static analysis time, and this assert can go
>>> away. Until then, it's a type error to assume that self.info is not
>>> None.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>    scripts/qapi/error.py | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
>>> index d179a3bd0c..d0bc7af6e7 100644
>>> --- a/scripts/qapi/error.py
>>> +++ b/scripts/qapi/error.py
>>> @@ -25,6 +25,7 @@ def __init__(self, info, msg, col=None):
>>>            self.col = col
>>>    
>>>        def __str__(self):
>>> +        assert self.info is not None
>>>            loc = str(self.info)
>>>            if self.col is not None:
>>>                assert self.info.line is not None
>>>
> 
> Please show us the revised commit message.  I'm asking because the
> patch's purpose isn't quite clear to me.  Peeking ahead at PATCH 7, I
> see that info becomes Optional[QAPISourceInfo].  This means something
> passes None for info (else you wouldn't make it optional).  None info
> Works (in the sense of "doesn't crash") as long as col is also None.
> After the patch, it doesn't.  I'm not saying that's bad, only that I
> don't quite understand what you're trying to accomplish here.
> 

Sure.

If you recall, I tried to enforce that QAPISourceInfo was *never* None 
by creating a special value for QSI that represented "No Source Info". 
Ultimately, that idea didn't go through and we solidified that the 
'info' parameter that gets passed around can sometimes be None.

Hence, this property is Optional[QAPISourceInfo].

Since I know you wanted to crash messily in the case that we allowed a 
None-info to leak into a context like this, I added the new assertion to 
make sure this remains the case.

(since str(None) evaluates to "None", it seemed like there was already 
the implicit assumption that info would never be None. Plus, if 'col' is 
set, mypy notices that we are performing an unsafe check on 
self.info.line, which had to be remedied.)

Later in the series, after schema.py is typed, it may be possible to 
remove these assertions as we may be able to rely on the strict typing 
to prove that this situation can never occur. However, since schema.py 
is not yet typed, we can't yet.



Alright. So given that, I think what you'd like to see for a commit 
message is:

qapi/error: assert QAPISourceInfo is not None

We implicitly assume that self.info will never be None, as the error 
reporting function will not produce meaningful output in this case, and 
will crash if self.col was set. Assert that self.info is not None in 
order to formalize this assumption.

We can not yet change the type of the initializer to prove that this is 
provably true at static analysis time until the rest of this library is 
fully typed.


--js


