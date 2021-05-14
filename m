Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1829380C8E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:10:29 +0200 (CEST)
Received: from localhost ([::1]:39564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZSO-0001pY-He
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhZQy-0000zs-Ep
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhZQu-0005HT-PS
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621004935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvf4taPGT+42GIf0OAzGDJcyPlkK01IKhnNIh22GHnQ=;
 b=C2lU5aHcypSsKkT8KhjtKeQ0+pHWsfIoum5eWCkCvzwPNNCt6ocfbX+I3O2+EI4qNJeB30
 XwR3cQSkvmE2EK0rlHy40cK0TnPZvfuHBDIaVMeD2kWGP0PLajlbkc3jdjdVHhM/Ij5fkh
 2Hl+La+TWBYFSGnE4Ge8NiGb7sWHB34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-PsW7EfdoPmyimiamS8J5xw-1; Fri, 14 May 2021 11:08:52 -0400
X-MC-Unique: PsW7EfdoPmyimiamS8J5xw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71F48107ACCA;
 Fri, 14 May 2021 15:08:51 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-49.ams2.redhat.com
 [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 648215D6D1;
 Fri, 14 May 2021 15:08:50 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] iotests/297: Cover tests/
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
References: <20210512174318.59466-1-mreitz@redhat.com>
 <15a189aa-f906-9b4d-e206-b1c8c31b855c@redhat.com>
Message-ID: <31e3e0fe-4cdd-e5eb-4fc5-8f4e68ac4f56@redhat.com>
Date: Fri, 14 May 2021 17:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <15a189aa-f906-9b4d-e206-b1c8c31b855c@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.05.21 13:02, Max Reitz wrote:
> On 12.05.21 19:43, Max Reitz wrote:
>> v1: 
>> https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg01471.html
>>
>>
>> Hi,
>>
>> When reviewing Vladimir’s new addition to tests/, I noticed that 297 so
>> far does not cover named tests.  That isn’t so good.
>>
>> This series makes it cover them, and because tests/ is rather sparse at
>> this point, I decided to also fix up the two tests in there that don’t
>> pass pylint’s scrutiny yet.  I think it would be nice if we could keep
>> all of tests/ clean.
>>
>>
>> v2:
>> - Changed patch 2 as per Vladimir’s suggestion
>>    (i.e. don’t let discards1_sha256 and all_discards_sha256 be class
>>    variables at all)
> 
> Thanks for the review, applied to my block branch:
> 
> https://github.com/XanClic/qemu/commits/block

...and dropping again, patch 3 embarrassingly breaks 
migrate-bitmaps-test.  The problem seems to be that contrastingly to 
pylint’s opinion, the `lambda self: mc(self)` is necessary, it can’t be 
contracted to just `mc`.  I suspect that `mc` (returned by 
`methodcaller`) has a variable argument list, and so without the lambda, 
`setattr` adds it as a argument-less function, so when it is called, it 
doesn’t receive the `self` parameter.  (It complains that it expected 1 
argument, but got 0.)

So we need the lambda to enforce that the `self` parameter is passed.

Max


