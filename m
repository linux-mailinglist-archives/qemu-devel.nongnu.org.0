Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C6632D1A9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:22:45 +0100 (CET)
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHm44-0008MS-6u
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHm2s-0007uj-41
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHm2q-0005ic-DI
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614856887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsm9DMVE/aLqFYphLSLOdMt3WSPhuOrr/9Qa/zITQM4=;
 b=E6Qrdyl+Rujvjh/+158LC3ISCy02/FvbmD7l70OIh1KuMzaQ/z97UNO6uFL4AQ5pQNEh24
 48muvQ898KrmH5iCfJNyXFi6r5568ubo4gtMD4HUB9ga09kpDSZrEgn9hqSga6u1cd/yBh
 4OH916LBF3LXJuxU1Njlsuh2kkOEoXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-VAswzkH9NsGl-mhLJ4G4dQ-1; Thu, 04 Mar 2021 06:21:23 -0500
X-MC-Unique: VAswzkH9NsGl-mhLJ4G4dQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D0BB80432A;
 Thu,  4 Mar 2021 11:21:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D6995C1C2;
 Thu,  4 Mar 2021 11:21:17 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] gitlab-ci.yml: Add jobs to test CFI flags
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
References: <20210304030948.9367-1-dbuono@linux.vnet.ibm.com>
 <20210304030948.9367-3-dbuono@linux.vnet.ibm.com>
 <YEC47lN4Xt3LUsP6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <571c0872-3755-3877-f284-01698264f4b7@redhat.com>
Date: Thu, 4 Mar 2021 12:21:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEC47lN4Xt3LUsP6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/03/2021 11.39, Daniel P. Berrangé wrote:
> On Wed, Mar 03, 2021 at 10:09:48PM -0500, Daniele Buono wrote:
>> QEMU has had options to enable control-flow integrity features
>> for a few months now. Add two sets of build/check/acceptance
>> jobs to ensure the binary produced is working fine.
>>
>> The three sets allow testing of x86_64 binaries for x86_64, s390x,
>> ppc64 and aarch64 targets
>>
>> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
>> ---
>>   .gitlab-ci.yml | 119 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 814f51873f..7b1f25c92e 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -483,6 +483,125 @@ clang-user:
>>         --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
>>       MAKE_CHECK_ARGS: check-unit check-tcg
>>   
>> +# Set LD_JOBS=1 because this requires LTO and ld consumes a large amount of memory.
>> +# On gitlab runners, default value sometimes end up calling 2 lds concurrently and
>> +# triggers an Out-Of-Memory error
>> +#
>> +# Since slirp callbacks are used in QEMU Timers, slirp needs to be compiled together
>> +# with QEMU and linked as a static library to avoid false positives in CFI checks.
>> +# This can be accomplished by using -enable-slirp=git, which avoids the use of
>> +# a system-wide version of the library
>> +#
>> +# Split in three sets of build/check/acceptance to limit the execution time of each
>> +# job
>> +build-cfi-arm:
> 
> s/arm/aarch64/
> 
>> +  <<: *native_build_job_definition
>> +  needs:
>> +  - job: amd64-fedora-container
>> +  variables:
>> +    LD_JOBS: 1
>> +    AR: llvm-ar
>> +    IMAGE: fedora
>> +    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
>> +      --enable-safe-stack --enable-slirp=git
>> +    TARGETS: aarch64-softmmu
>> +    MAKE_CHECK_ARGS: check-build
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build
>> +
>> +check-cfi-arm:
>> +  <<: *native_test_job_definition
>> +  needs:
>> +    - job: build-cfi-arm
>> +      artifacts: true
>> +  variables:
>> +    IMAGE: fedora
>> +    MAKE_CHECK_ARGS: check
>> +
>> +acceptance-cfi-arm:
>> +  <<: *native_test_job_definition
>> +  needs:
>> +    - job: build-cfi-arm
>> +      artifacts: true
>> +  variables:
>> +    IMAGE: fedora
>> +    MAKE_CHECK_ARGS: check-acceptance
>> +  <<: *acceptance_definition
>> +
>> +build-cfi-ibm:
> 
> Lets not use vendor names here - keep the target names. ie
> 
>    build-cfi-s390x-ppc64
> 
> and equivalent for the rest of the jobs below....

I agree for not using vendor names here ... but I've got a different 
suggestion instead: Since our list of jobs has grown very big already, I 
think it would be nicer to group the jobs, see: 
https://docs.gitlab.com/ee/ci/jobs/#group-jobs-in-a-pipeline

That means, use "build-cfi 1/3", "build-cfi 2/3" and "build-cfi 3/3" (and do 
the same numbering for the check- and acceptance- jobs, too).

  Thomas



