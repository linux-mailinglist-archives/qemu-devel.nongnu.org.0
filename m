Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A2630ECD9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 08:01:21 +0100 (CET)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ydk-0003lT-T6
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 02:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7YbS-0002rd-6D
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:58:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7YbO-0004XN-15
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612421932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWTRCEvVDVEOCAzpmgb8yborVq2xXjlormtl1Tbjzsc=;
 b=HxmbmU2P+SyO6d4bFO8udoYnUYfrmRj0mDfhT8InYs6rjffbinHLOGQFfJNl5e55yNkWXK
 byHTpwUYO8OfR6MHkZezoMT2OgQyTsN5ypZeCuHqR/vjZaq1Gj7J9hwkV6ZxwyM86CPbpd
 RkW3kEPfbDuet0XdtvJ71uKJWkZx4mQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-DhkZ59V6M3aJADtDJV32QA-1; Thu, 04 Feb 2021 01:58:49 -0500
X-MC-Unique: DhkZ59V6M3aJADtDJV32QA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0413E746;
 Thu,  4 Feb 2021 06:58:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38745722DB;
 Thu,  4 Feb 2021 06:58:44 +0000 (UTC)
Subject: Re: [PATCH 1/6] travis.yml: Move gprof/gcov test across to gitlab
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210203113243.280883-1-thuth@redhat.com>
 <20210203113243.280883-2-thuth@redhat.com>
 <d8621cd3-7b95-10a2-8696-b4daada8b10f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <94efc386-3c6c-81e3-46d9-650351f92248@redhat.com>
Date: Thu, 4 Feb 2021 07:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d8621cd3-7b95-10a2-8696-b4daada8b10f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2021 20.32, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 2/3/21 8:32 AM, Thomas Huth wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Similarly to commit 8cdb2cef3f1, move the gprof/gcov test to GitLab.
>>
>> The coverage-summary.sh script is not Travis-CI specific, make it
>> generic.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Message-Id: <20201108204535.2319870-10-philmd@redhat.com>
>> [thuth: Add gcovr and bsdmainutils which are required for the
>>          overage-summary.sh script to the ubuntu docker file]
> s/overage/coverage/
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitlab-ci.yml                             | 12 ++++++++++++
>>   .travis.yml                                | 14 --------------
>>   MAINTAINERS                                |  2 +-
>>   scripts/{travis => ci}/coverage-summary.sh |  2 +-
>>   tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
>>   5 files changed, 16 insertions(+), 16 deletions(-)
>>   rename scripts/{travis => ci}/coverage-summary.sh (92%)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 7c0db64710..8b97b512bb 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -468,6 +468,18 @@ check-deprecated:
>>       MAKE_CHECK_ARGS: check-tcg
>>     allow_failure: true
>> +# gprof/gcov are GCC features
>> +build-gprof-gcov:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: ubuntu2004
>> +    CONFIGURE_ARGS: --enable-gprof --enable-gcov
>> +    MAKE_CHECK_ARGS: build-tcg
> 
> With build-tcg it generates an empty report, e.g., 
> https://gitlab.com/wainersm/qemu/-/jobs/1005923421
> 
> Shouldn't it run `make check`?

D'oh, you're right. I think we need to run at least a "make check-unit" 
here. I'll rework my patch accordingly...

By the way, it's broken on Travis since a long time, e.g. with version 5.0 
there is already only a stack trace:

https://travis-ci.org/github/qemu/qemu/jobs/680661167#L8411

Seems like nobody noticed this for almost a year now...

  Thomas


