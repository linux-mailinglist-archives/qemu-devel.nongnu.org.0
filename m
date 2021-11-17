Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60AC454194
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:05:12 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnF0J-0003qk-KM
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:05:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnEyo-0002fA-AX
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:03:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnEyl-0006ER-1u
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637132613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrJniXSwujeM+S1kOEnch2PZrCKCIT9nouGfV+7kV9s=;
 b=duJAaNTySr1ySSOl/57p3cYuqcKpG4YwZRnizn4sj0yywXlLLnInfnNcRM9dNVnpL0nK6B
 FVS6iJSiCUPyz+BKc96G6JxVl5Fl4d3A116DHECm9Gy8AHKIBrDfbv7EjLqfvNkEtY3ruD
 yzjkLVkWfU8FoYp+Bwuz+8FSyAjLu4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-gyu5nO2oMvCjWJ0XUVd8wQ-1; Wed, 17 Nov 2021 02:03:30 -0500
X-MC-Unique: gyu5nO2oMvCjWJ0XUVd8wQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 736D0804143;
 Wed, 17 Nov 2021 07:03:29 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B23661017CE4;
 Wed, 17 Nov 2021 07:03:17 +0000 (UTC)
Message-ID: <fc453873-6d33-7289-8227-4dd39ed92beb@redhat.com>
Date: Wed, 17 Nov 2021 08:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] gitlab-ci/cirrus: Increase timeout to 80 minutes
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211116163309.246602-1-thuth@redhat.com>
 <YZPhHt4JFcz41YFJ@redhat.com>
 <3b48a20f-c8db-9ebf-f179-f1843782c229@redhat.com>
 <632a5f2e-3e5d-1ed7-e27f-82571e374043@redhat.com>
 <a97f6776-aaef-b4da-04ec-dcb1fcd25902@linaro.org>
 <YZP2esl/18WDQHlQ@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YZP2esl/18WDQHlQ@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/2021 19.20, Daniel P. Berrangé wrote:
> On Tue, Nov 16, 2021 at 06:36:50PM +0100, Richard Henderson wrote:
>> On 11/16/21 6:22 PM, Thomas Huth wrote:
>>> On 16/11/2021 18.09, Philippe Mathieu-Daudé wrote:
>>>> On 11/16/21 17:49, Daniel P. Berrangé wrote:
>>>>> On Tue, Nov 16, 2021 at 05:33:09PM +0100, Thomas Huth wrote:
>>>>>> The jobs on Cirrus-CI sometimes get delayed quite a bit, waiting to
>>>>>> be scheduled, so while the build test itself finishes within 60 minutes,
>>>>>> the total run time of the jobs can be longer due to this waiting time.
>>>>>> Thus let's increase the timeout on the gitlab side a little bit, so
>>>>>> that these jobs are not marked as failing just because of the delay.
>>> ...>>> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
>>>>>> index e7b25e7427..22d42585e4 100644
>>>>>> --- a/.gitlab-ci.d/cirrus.yml
>>>>>> +++ b/.gitlab-ci.d/cirrus.yml
>>>>>> @@ -14,6 +14,7 @@
>>>>>>      stage: build
>>>>>>      image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
>>>>>>      needs: []
>>>>>> +  timeout: 80m
>>>>>>      allow_failure: true
>>>>>>      script:
>>>>>>        - source .gitlab-ci.d/cirrus/$NAME.vars
>>>>>
>>>>> Whether 80 or 100 minute, consider it
>>>>>
>>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>
>>>> This pipeline took 1h51m09s:
>>>> https://gitlab.com/qemu-project/qemu/-/pipelines/409666733/builds
>>>> But Richard restarted unstable jobs, which probably added time
>>>> to the total.
>>>>
>>>> IIRC from a maintainer perspective 1h15 is the upper limit.
>>>> 80m fits, 100m is over.
>>>
>>> I think I agree ... I normally don't want to wait more than a little bit
>>> more than one hour, so 100 minutes feels too long already. We already
>>> have some 70m timeouts in other jobs, and one 80 minute timeout in
>>> .gitlab-ci.d/crossbuild-template.yml, so I'd say 80 minutes are really
>>> the upper boundary that we should use.
>>
>> We are also talking apples and oranges:
>> Gitlab timeouts are on the amount of time the job runs.
>> Cirrus timeouts appear to be on the amount of time the job is queued.
>>
>> If cirrus would just not start accounting until the thing runs we'd be fine.
> 
> Unfortunately it isn't that easy. Our cirrus CI jobs are launched using
> the cirrus-run tool, from a gitlab job. The timeouts we're usually
> hitting are from the gitlab job which is sitting around waiting for
> the cirrus job it launched to finish, so it can report back stats.
> 
> Cirrus CI does itself have a job timeout, but I'm not aware of us
> hitting that typically, unless i'm misinterpreting something.

Right, the problem is the timeout on the gitlab-CI side, not the timeout on 
the Cirrus-CI side. I've never seen us hitting the timeout on the Cirrus 
side either.

  Thomas


