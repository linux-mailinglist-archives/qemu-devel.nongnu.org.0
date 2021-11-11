Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C360A44D38C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 09:54:20 +0100 (CET)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml5qc-0003xp-IZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 03:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ml5pl-0003J9-Uk
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:53:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ml5pj-0008N4-3G
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636620802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EA5Do+Az0AQIVYDQB2epv3HvwZQTu1fOmGYLsKTdic8=;
 b=GGlzieD7lE7wCnCsp+D+BPl95i8wQky/m4qBt3GLYUZBuHIbr5zB+Tt5ttb9ijPeTT8umD
 6x3NjRf0xJE43wxcoyU9VztZiS6K4lpUZukGMqibxVxxF1YW8rOnq0CySn0+cBXn+xH9i7
 bs6lIbCODx2gpn7Vccdetnwa9GcNQYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-sItmnc_dNHGp-kB5fkQ67A-1; Thu, 11 Nov 2021 03:53:19 -0500
X-MC-Unique: sItmnc_dNHGp-kB5fkQ67A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6400BAF83;
 Thu, 11 Nov 2021 08:53:17 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 531D49329;
 Thu, 11 Nov 2021 08:53:16 +0000 (UTC)
Message-ID: <1407151d-ba05-0666-ca5d-64ac902a62e6@redhat.com>
Date: Thu, 11 Nov 2021 09:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] tests/unit/test-smp-parse: Fix a check-patch
 complain
To: Andrew Jones <drjones@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
References: <20211111024429.10568-1-wangyanan55@huawei.com>
 <20211111024429.10568-3-wangyanan55@huawei.com>
 <20211111084352.4ursyjrrkekqo2jt@gator.home>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211111084352.4ursyjrrkekqo2jt@gator.home>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2021 09.43, Andrew Jones wrote:
> On Thu, Nov 11, 2021 at 10:44:29AM +0800, Yanan Wang wrote:
>> Checkpatch.pl reports errors like below for commit 9e8e393bb7.
>> Let's fix it with a simpler format.
>> ERROR: space required after that close brace '}'
>> +    SMPTestData *data = &(SMPTestData){{ }};
>>
>> Fixes: 9e8e393bb7 ("tests/unit: Add an unit test for smp parsing")
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   tests/unit/test-smp-parse.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
>> index 872512aa37..7805a34b29 100644
>> --- a/tests/unit/test-smp-parse.c
>> +++ b/tests/unit/test-smp-parse.c
>> @@ -514,7 +514,7 @@ static void test_generic(void)
>>       Object *obj = smp_test_machine_init();
>>       MachineState *ms = MACHINE(obj);
>>       MachineClass *mc = MACHINE_GET_CLASS(obj);
>> -    SMPTestData *data = &(SMPTestData){{ }};
>> +    SMPTestData *data = &(SMPTestData){};
>>       int i;
>>   
>>       for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>> @@ -548,7 +548,7 @@ static void test_with_dies(void)
>>       Object *obj = smp_test_machine_init();
>>       MachineState *ms = MACHINE(obj);
>>       MachineClass *mc = MACHINE_GET_CLASS(obj);
>> -    SMPTestData *data = &(SMPTestData){{ }};
>> +    SMPTestData *data = &(SMPTestData){};
>>       unsigned int num_dies = 2;
>>       int i;
>>   
>> -- 
>> 2.19.1
>>
> 
> I just did some googling to refresh my memory on this, because I recall
> {0} being recommended at some point. From what I can tell, {} is ok for
> gcc, maybe also clang, but {0} is ANSI. The reasoning was that {} should
> not be empty, and since element names are not required, '0' is enough to
> assign the first element to zero. Also, as it's not required to list
> each element, then that's enough for the whole struct. That said, {}
> seems to be more popular, so we can probably assume the tools we support
> also support it.

Some older compilers did not like {0} (see e.g. commit 555b3d67bc64), that's 
why we use {} in the QEMU code IIRC.

  Thomas



