Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39D34EF47
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:22:35 +0200 (CEST)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRI4Y-0002Cl-HM
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRI18-0000I8-Ga
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRI0z-0003Wf-Qk
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617124731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmf7j9CyAs4NzTSRbrPfH8cj1lI17psnHQJCtBig6Gs=;
 b=W/IUSATJf5jV++abduiTGUe8udHQiHFbxNQCU1cQokwrbdio7zwfM/4EVhmnf8L7ennSTJ
 x86f1HevAET09/TZxNq8BHkTJHgHwFohGrSqilkOBjh0wdLEvDVQyIo9HPOIXITT+Mt0I4
 ACf08iZKRmL5laoXN+xhn3DfxAs7WOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-jR-31LnNPhmAbPnt-UQiag-1; Tue, 30 Mar 2021 13:18:49 -0400
X-MC-Unique: jR-31LnNPhmAbPnt-UQiag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4B41005D54;
 Tue, 30 Mar 2021 17:18:47 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-220.ams2.redhat.com
 [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F3E5DDAD;
 Tue, 30 Mar 2021 17:18:46 +0000 (UTC)
Subject: Re: [PATCH 2/4] migrate-bitmaps-postcopy-test: Fix pylint warnings
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-3-mreitz@redhat.com>
 <0f1f876b-e93c-4234-4c4c-3de19a3c577c@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3fea2027-c8a3-ab65-cd3a-01f7d0c6bb15@redhat.com>
Date: Tue, 30 Mar 2021 19:18:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0f1f876b-e93c-4234-4c4c-3de19a3c577c@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
> 29.03.2021 16:26, Max Reitz wrote:
>> pylint complains that discards1_sha256 and all_discards_sha256 are first
>> set in non-__init__ methods.  Let's make it happy.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test 
>> b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
>> index 584062b412..013e94fc39 100755
>> --- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
>> +++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
>> @@ -76,6 +76,9 @@ def check_bitmaps(vm, count):
>>   class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
>> +    discards1_sha256 = None
>> +    all_discards_sha256 = None
>> +
>>       def tearDown(self):
>>           if debug:
>>               self.vm_a_events += self.vm_a.get_qmp_events()
>>
> 
> I'd prefer not making them class-variables. I think initializing them in 
> setUp should work (as a lot of other variables are initialized in 
> setUp() and pylint doesn't complain). And better thing is return it 
> together with event_resume from start_postcopy(), as actually it's a 
> kind of result of the function.

Oh, that sounds good.  Is a list fine, i.e. return (event_resume, 
discards1_sha256, all_discards_sha256)?

(We could also make it an object.  I don’t know what Python prefers. :))

Max


