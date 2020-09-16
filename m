Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D326C32A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 15:14:01 +0200 (CEST)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIXG4-0007xf-HZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 09:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIXF9-0007Vm-Bg
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 09:13:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34286
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIXF6-00032R-2N
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 09:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600261979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVQ2n8zKjxaWNp9GdQgmjyZfBy/nuAy/aBY4SvMHEK0=;
 b=d8ytr0eG6LrL2r9aiI/cd0xG6B1vpSDBqktAwd1+UNXUA9qNVE5ui4UsoDtAPKeuhYuYzv
 TLuSE1CeASxmXJbu/g8/nJDSwbFUhGQ/LPZQUi5+TcJEDoLnoStXYHFZvog38aAcVCRGz7
 JiHvrBy2U4XR3K0Ye7nj9xmbht29oJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-s51YbKRTNBacBU9eXrOZFw-1; Wed, 16 Sep 2020 09:12:55 -0400
X-MC-Unique: s51YbKRTNBacBU9eXrOZFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F0E36408F;
 Wed, 16 Sep 2020 13:12:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36F0A78806;
 Wed, 16 Sep 2020 13:12:51 +0000 (UTC)
Subject: Re: [RFC PATCH] travis.yml: Drop the default softmmu builds
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20200805185403.15227-1-thuth@redhat.com>
 <c1927c74-da26-a17d-e92e-1e052540733f@redhat.com>
Message-ID: <dcf9c72a-069a-d853-594c-64a3a9187358@redhat.com>
Date: Wed, 16 Sep 2020 15:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c1927c74-da26-a17d-e92e-1e052540733f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 03:05:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.062, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/09/2020 14.15, Thomas Huth wrote:
> On 05/08/2020 20.54, Thomas Huth wrote:
>> The total runtime of all Travis jobs is very long and we are testing
>> all softmmu targets in the gitlab-CI already - so we can speed up the
>> Travis testing a little bit by not testing the softmmu targets here
>> anymore.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  Well, ok, we do not test all the softmmu targets on gitlab-CI with
>>  that same ancient version of Ubuntu ... but do we still care about
>>  testing all softmmut targets on Ubuntu Xenial at all? ... at least
>>  according to our support policy, we do not care about Xenial anymore.
>>
>>  .travis.yml | 14 --------------
>>  1 file changed, 14 deletions(-)
>>
>> diff --git a/.travis.yml b/.travis.yml
>> index 6695c0620f..18290bc51d 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -123,20 +123,6 @@ jobs:
>>          - CONFIG="--disable-system --static"
>>          - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
>>  
>> -
>> -    # we split the system builds as it takes a while to build them all
>> -    - name: "GCC (main-softmmu)"
>> -      env:
>> -        - CONFIG="--disable-user --target-list=${MAIN_SOFTMMU_TARGETS}"
>> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
>> -
>> -
>> -    - name: "GCC (other-softmmu)"
>> -      env:
>> -       - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
>> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
>> -
>> -
>>      # Just build tools and run minimal unit and softfloat checks
>>      - name: "GCC check-softfloat (user)"
>>        env:
>>
> 
> Ping?

Ping^2 ... Alex, Philippe, any opinions on this patch?

 Thomas


