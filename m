Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE9375053
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:43:01 +0200 (CEST)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYey-0004i7-SD
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leYdn-00043b-3x
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leYdj-00007a-Hc
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620286902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+ggcmo21xNyGLXNnKPqbKPOyEw8SUk831cgOAuyEug=;
 b=S1IwclWTx96udBnO5fCcBZ3G7kWhIBgyUZ0nogYB3CBH5sKAUbOyLE1wlwMoeNorDAN8Kc
 jGz+9MBIFKag9FKAyRNEqK1qN0zdyOMTVG131rYFfBuNR631ubJIdy5dovM/ewkzO3/BiX
 7BybkhqoTmnhtei6T6YtTW7QsBVPiR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-Q7Lvm7j-P4G6hPgPHkl3eg-1; Thu, 06 May 2021 03:41:40 -0400
X-MC-Unique: Q7Lvm7j-P4G6hPgPHkl3eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 767D4801107;
 Thu,  6 May 2021 07:41:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-220.ams2.redhat.com
 [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78BDE5D6A8;
 Thu,  6 May 2021 07:41:37 +0000 (UTC)
Subject: Re: [PATCH v2 9/9] block/write-threshold: drop extra includes
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-10-vsementsov@virtuozzo.com>
 <908586ae-f631-d626-3963-5b96d0c69b05@redhat.com>
 <a7ecc2ec-0c3f-41b8-7093-1bd193648a4f@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5ce22fba-6b8c-f362-5abf-7a32835ee97e@redhat.com>
Date: Thu, 6 May 2021 09:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a7ecc2ec-0c3f-41b8-7093-1bd193648a4f@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
Cc: fam@euphon.net, kwolf@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.05.21 22:34, Vladimir Sementsov-Ogievskiy wrote:
> 05.05.2021 19:23, Max Reitz wrote:
>> On 04.05.21 10:25, Vladimir Sementsov-Ogievskiy wrote:
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   block/write-threshold.c | 3 ---
>>>   1 file changed, 3 deletions(-)
>>>
>>> diff --git a/block/write-threshold.c b/block/write-threshold.c
>>> index fbf4e6f5c4..db271c5537 100644
>>> --- a/block/write-threshold.c
>>> +++ b/block/write-threshold.c
>>> @@ -12,10 +12,7 @@
>>>    */
>>>   #include "qemu/osdep.h"
>>> -#include "block/block_int.h"
>>
>> We need this (for bs->write_threshold_offset), but it’s included 
>> through block/block_int.h.  I’m not sure whether we should drop it 
>> from the includes.
>>
>> Perhaps we should instead drop block_int.h from write-threshold.h? 
>> Shouldn’t including qemu/osdep.h (which includes qemu/typedefs.h, 
>> which forward-declares BDS) be sufficient there?
>>
>>> -#include "qemu/coroutine.h"
>>>   #include "block/write-threshold.h"
>>> -#include "qemu/notify.h"
>>>   #include "qapi/error.h"
>>>   #include "qapi/qapi-commands-block-core.h"
>>>   #include "qapi/qapi-events-block-core.h"
>>
>> Btw, where does qemu/atomic.h come in?  Looks like it comes through 
>> block_int.h.  I think we should include it explicitly.
>>
> 
> I'm not sure. If something is included through another include, why to 
> include it explicitly?

Because the other include may change.  I’d include something if you need 
the feature, and we need atomics here.

And block_int.h doesn’t even provide atomic.h, it comes through various 
of its includes (which are probably not included to provide atomics). 
So this is already indirect and basically just incidental; block_int.h 
doesn’t guarantee atomic.h.

Another thing: I see that other fields in BDS that are to be accessed 
with atomic ops have a comment saying so.  I think 
write_threshold_offset should have, too.

Max

> For me, if statement can be removed with no effect, it's an extra 
> statement.
> 
> 


