Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399082F7578
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:32:31 +0100 (CET)
Received: from localhost ([::1]:52940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LT4-0000VH-AT
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0LRG-0008Kd-VS
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:30:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0LRB-0007vb-Ee
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610703032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxw/mkuu4Ji5Y/LBycBPeajGIVm5OQFrfEFC9uM221s=;
 b=b/6vGf2EAzeP+Ujw7wTO/TeFu7nTmj/eeihn5JCKaCFzicB8UMLvh3obmel9yP2sGOlMTb
 11np2an6JxIJeLofGB6fUMC2uVKgSweacq7Fcmtb0SEZ0+Dx+AUWGoyDwXRBYrpplkorXO
 ea04CBMzqIlhxt+T9O/ODELps5+pPb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-9_h3V-muPxCrsQTx1VI9uA-1; Fri, 15 Jan 2021 04:30:28 -0500
X-MC-Unique: 9_h3V-muPxCrsQTx1VI9uA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FF5F1922021;
 Fri, 15 Jan 2021 09:30:27 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-144.ams2.redhat.com
 [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37E9A60BF3;
 Fri, 15 Jan 2021 09:30:25 +0000 (UTC)
Subject: Re: [PATCH v3 09/10] iotests/129: Clean up pylint and mypy complaints
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-10-mreitz@redhat.com>
 <CAKJDGDZ+NGeuXbH0WuH73JyHYYnWVrLyNQberqOqF3b5p89pRg@mail.gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3bba8b87-da1a-b951-bb1f-835ee85b00b8@redhat.com>
Date: Fri, 15 Jan 2021 10:30:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZ+NGeuXbH0WuH73JyHYYnWVrLyNQberqOqF3b5p89pRg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.01.21 21:02, Willian Rampazzo wrote:
> On Thu, Jan 14, 2021 at 2:41 PM Max Reitz <mreitz@redhat.com> wrote:
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/129 | 4 ++--
>>   tests/qemu-iotests/297 | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
>> index 6d21470cd7..201d9e0a0b 100755
>> --- a/tests/qemu-iotests/129
>> +++ b/tests/qemu-iotests/129
>> @@ -20,7 +20,6 @@
>>
>>   import os
>>   import iotests
>> -import time
>>
>>   class TestStopWithBlockJob(iotests.QMPTestCase):
>>       test_img = os.path.join(iotests.test_dir, 'test.img')
>> @@ -32,7 +31,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.base_img, "1G")
>>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
>>                            "-b", self.base_img, '-F', iotests.imgfmt)
>> -        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
>> +        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M',
>> +                        self.test_img)
>>           self.vm = iotests.VM()
>>           self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
>>
>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>> index bfa26d280b..1dce1d1b1c 100755
>> --- a/tests/qemu-iotests/297
>> +++ b/tests/qemu-iotests/297
>> @@ -27,7 +27,7 @@ import iotests
>>   # TODO: Empty this list!
>>   SKIP_FILES = (
>>       '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
>> -    '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
>> +    '096', '118', '124', '132', '136', '139', '147', '148', '149',
> 
> Is this also part of mypy/pylint cleanup? It seems you are doing more
> than that here. It would be good to have this listed in the commit
> message.

Sure, why not.  Something like “And consequentially drop it from 297's 
skip list.”?

Though I think making a test pass pylint+mypy complaints basically means 
exactly to remove it from 297's skip list and then making 297 pass, so 
I’m not entirely sure it’s necessary.  But it can’t hurt, so.

> Despite that,
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>

Thanks!

Max

>>       '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
>>       '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
>>       '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
>> --
>> 2.29.2
>>
>>
> 


