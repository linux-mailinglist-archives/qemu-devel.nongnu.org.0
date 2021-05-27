Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB84392713
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 08:05:36 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm99D-0002cp-AX
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 02:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lm97s-0001RT-0p
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lm97n-0002Yt-OY
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622095443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwk5neQp1a3lSjx3uPbvJQJZX42yt1RKYHL/v3hbGn4=;
 b=djdNKphvuvtkQbLhG6LGc9T7aGeV43UILuzYLTJDxY1sI3uJ/DvoDqqTvVzKfAUPfLUDTy
 GNeDFAqM1t1soW+IiQUyBkZkKts4FCnwbHeZhJTLDiZoRKuELUF4pyhDsD/Dkobva3nsto
 RD+j6KV7CX9taijIleK/7B0wuUUf+OU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-pp8OsBOVMPyWqGgljCs76g-1; Thu, 27 May 2021 02:04:02 -0400
X-MC-Unique: pp8OsBOVMPyWqGgljCs76g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6334802950;
 Thu, 27 May 2021 06:04:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-76.ams2.redhat.com [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0AAD1658F;
 Thu, 27 May 2021 06:03:52 +0000 (UTC)
Subject: Re: [PATCH 6/9] gitlab-ci: Split gprof-gcov job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-7-f4bug@amsat.org>
 <8c74e90e-ed4c-9e96-cf87-c0c413e48eaa@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <177aee51-ac23-5321-021c-a8244ddf254e@redhat.com>
Date: Thu, 27 May 2021 08:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8c74e90e-ed4c-9e96-cf87-c0c413e48eaa@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/2021 12.21, Philippe Mathieu-Daudé wrote:
> On 5/25/21 10:25 AM, Philippe Mathieu-Daudé wrote:
>> This job is hitting the 70min limit, so split it in 2 tasks.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   .gitlab-ci.d/buildtest.yml | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index f903fdea3f4..894732e203d 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -564,16 +564,27 @@ check-deprecated:
>>     allow_failure: true
>>   
>>   # gprof/gcov are GCC features
>> -gprof-gcov:
>> +build-gprof-gcov:
>>     extends: .native_build_job_template
>>     needs:
>>       job: amd64-ubuntu2004-container
>>     variables:
>>       IMAGE: ubuntu2004
>>       CONFIGURE_ARGS: --enable-gprof --enable-gcov
>> -    MAKE_CHECK_ARGS: check
>>       TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
>> -  timeout: 70m
>> +  artifacts:
>> +    expire_in: 1 days
>> +    paths:
>> +      - build
> 
> FYI this job takes 28min:
> https://gitlab.com/philmd/qemu/-/jobs/1290778672
> 
>> +
>> +check-gprof-gcov:
>> +  extends: .native_test_job_template
>> +  needs:
>> +    - job: build-gprof-gcov
>> +      artifacts: true
>> +  variables:
>> +    IMAGE: ubuntu2004
>> +    MAKE_CHECK_ARGS: check
>>     after_script:
>>       - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
> 
> and this one 23min:
> https://gitlab.com/philmd/qemu/-/jobs/1290778751

So why are they taking less than 70 minutes when split in two parts, but are 
exceeding  the 70 minutes when done in one job?
That does not make sense...

  Thomas


