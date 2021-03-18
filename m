Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2327A34062D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:56:33 +0100 (CET)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMsCV-0002dR-VA
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMsAx-0001yA-DT
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMsAs-0007es-S8
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616072089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynG2mesKPIlYP7iFX6UPMoKxeMuyNHNT4ONNgxCziE4=;
 b=LTj65b/KgRMvP8ghTCFF9bNdak2nVZK8LWOQWltZNu68yXWPfzsoEvhB31ahsqfvcpK6kx
 cmqLzxxOEUiRUWQtxtnPtdwYFvUltK1IaGaeyxj6Uy4LYKdcTCXtu3jgl6U5oqja5+s3Om
 NBV8HInL06zoJA0m7Fx2Xj5xgEfqvGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-WhGxUoGTMs6_AbYYwGV73A-1; Thu, 18 Mar 2021 08:54:47 -0400
X-MC-Unique: WhGxUoGTMs6_AbYYwGV73A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96C7C108BD06;
 Thu, 18 Mar 2021 12:54:46 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A48D35C1D1;
 Thu, 18 Mar 2021 12:54:43 +0000 (UTC)
Subject: Re: [PATCH] docs/devel/testing.rst: Fix referencies to unit tests
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210317194849.2262346-1-wainersm@redhat.com>
 <6cd5da6e-c7d1-5eba-d842-4983671f5db8@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <14698b63-d3ab-eb9c-d450-6ee95d1e40a7@redhat.com>
Date: Thu, 18 Mar 2021 09:54:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6cd5da6e-c7d1-5eba-d842-4983671f5db8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/17/21 6:55 PM, John Snow wrote:
> typo in the commit summary; "references to"
>
> On 3/17/21 3:48 PM, Wainer dos Santos Moschetta wrote:
>> With the recent move of the unit tests to tests/unit directory some
>> instructions under the "Unit tests" section became imprecise, which
>> are fixed by this change.
>>
>> Related-to: da668aa15b99 (tests: Move unit tests into a separate 
>> directory)
>
> You can probably just use "Fixes", even though nothing is technically 
> broken to avoid introducing a new one-off tag type.

Yeah, I wasn't sure whether to use "Fixes" or not. Thanks for the tip!

Going to send a v2 to fix those issues.

- Wainer

>
>
>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> ---
>>   docs/devel/testing.rst | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>> index 1434a50cc4..1da4c4e4c4 100644
>> --- a/docs/devel/testing.rst
>> +++ b/docs/devel/testing.rst
>> @@ -34,17 +34,17 @@ If you are writing new code in QEMU, consider 
>> adding a unit test, especially
>>   for utility modules that are relatively stateless or have few 
>> dependencies. To
>>   add a new unit test:
>>   -1. Create a new source file. For example, ``tests/foo-test.c``.
>> +1. Create a new source file. For example, ``tests/unit/foo-test.c``.
>>     2. Write the test. Normally you would include the header file 
>> which exports
>>      the module API, then verify the interface behaves as expected 
>> from your
>>      test. The test code should be organized with the glib testing 
>> framework.
>>      Copying and modifying an existing test is usually a good idea.
>>   -3. Add the test to ``tests/meson.build``. The unit tests are 
>> listed in a
>> +3. Add the test to ``tests/unit/meson.build``. The unit tests are 
>> listed in a
>>      dictionary called ``tests``.  The values are any additional 
>> sources and
>>      dependencies to be linked with the test.  For a simple test 
>> whose source
>> -   is in ``tests/foo-test.c``, it is enough to add an entry like::
>> +   is in ``tests/unit/foo-test.c``, it is enough to add an entry like::
>>          {
>>          ...
>>
>


