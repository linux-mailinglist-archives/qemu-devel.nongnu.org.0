Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A84532852E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:52:30 +0100 (CET)
Received: from localhost ([::1]:45116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlmX-0005vZ-73
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lGlka-0004tX-Q3
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:50:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lGlkY-0007dS-2S
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614617423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VHUl9wETra+eKxLH58ExOGG8Y6AFkxfAuQGSwlDCFs=;
 b=W583j06DAS9LHDy2aILq0VpVhmilMa8ZUwHF2a1J2zjK9Gsb5pNhij4SUQy4Y5JaPHGtcq
 tb6DmhN0xUdG1fCpRxVwqk5GU/tW4hcywrMmjLbNyiqtobrOPiJB5/Zy/0i7Cs0Eod6Igl
 6MGcKsfqkGAGs+X1v8DnB8hTMqOgHOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-Le9--SAQOUKSBtLHkR_JFg-1; Mon, 01 Mar 2021 11:50:21 -0500
X-MC-Unique: Le9--SAQOUKSBtLHkR_JFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C550107ACE3;
 Mon,  1 Mar 2021 16:50:20 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B4C65D9E2;
 Mon,  1 Mar 2021 16:50:19 +0000 (UTC)
Subject: Re: [PATCH] iotests: Fix up python style in 300
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210215220518.1745469-1-eblake@redhat.com>
 <39d5d446-3271-a8fd-0755-6a0fbfe24c09@redhat.com>
 <82a77c1b-95b4-5d94-d5f9-db025422caf4@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <67022c10-74fd-b632-9cb5-b71be417cab2@redhat.com>
Date: Mon, 1 Mar 2021 11:50:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <82a77c1b-95b4-5d94-d5f9-db025422caf4@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 2:04 AM, Vladimir Sementsov-Ogievskiy wrote:
> 16.02.2021 02:21, John Snow wrote:
>> On 2/15/21 5:05 PM, Eric Blake wrote:
>>> Break some long lines, and relax our type hints to be more generic to
>>> any JSON, in order to more easily permit the additional JSON depth now
>>> possible in migration parameters.  Detected by iotest 297.
>>>
>>> Fixes: ca4bfec41d56
>>>   (qemu-iotests: 300: Add test case for modifying persistence of bitmap)
>>> Reported-by: Kevin Wolf <kwolf@redhat.com>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>
>> Reviewed-by: John Snow <jsnow@redhat.com>
>>
>>> ---
>>>   tests/qemu-iotests/300 | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
>>> index 63036f6a6e13..adb927629747 100755
>>> --- a/tests/qemu-iotests/300
>>> +++ b/tests/qemu-iotests/300
>>> @@ -22,7 +22,7 @@
>>>   import os
>>>   import random
>>>   import re
>>> -from typing import Dict, List, Optional, Union
>>> +from typing import Dict, List, Optional
>>>
>>>   import iotests
>>>
>>> @@ -30,7 +30,7 @@ import iotests
>>>   # pylint: disable=wrong-import-order
>>>   import qemu
>>>
>>> -BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
>>> +BlockBitmapMapping = List[Dict[str, object]]
>>>
>>
>> Assuming iotest 297 didn't yap about this, I think this has the 
>> necessary power for this file and we don't have to work any harder.
>>
>> If in the future you try to treat e.g. bmap['persistent'] as a 
>> particular kind of value (string? bool? int?) mypy will likely 
>> complain about that a little, saying it has no insight into the type 
>> beyond "object".
>>
>> If *that* becomes annoying, you can degrade this type to use 'Any' 
>> instead of 'object' and even those checks will cease.
> 
> Probably at some future moment we'll have generated python types for 
> QAPI structures ? :)
> 

That's my hope, yes!

Typing the QAPI generator is something I see as a step to doing this so 
that we can safely work on the QAPI generator a bit more vigorously.

Marc-Andre is adding rust backends, I'd like to add either a Python or a 
JSON-Schema backend to help generate a fully typed SDK for us in Python.

I don't know how suitable those tools will be to use in the test suite; 
I suspect that every last build of QEMU from the development tree will 
have to possibly re-generate such a Python module.

When I get a little closer to a prototype for this I will try to 
announce it. In the meantime I am very fastidiously trying to strictly 
type the QAPI generator and move it to ./python/qemu/qapi.

--js


