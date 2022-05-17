Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B1529FC6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 12:49:42 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqulo-0005fg-Th
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 06:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nquiH-0004eR-CX
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nquiD-0001SN-2t
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652784356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zAY3Q66QbM0uib7azOaHo8UXKhhXZmSJ5qde/FsqCRo=;
 b=EHcYPgvxzgX7R2L0vHL6hwhgTXaUnM1x3RDP3MuzMtg8oTSBb6P8QtTGZZCQkEeOVIbNA6
 R9COsx2czbWeKavbpOlZFq7zUvUrtLDr8rvMBMqt/YqiLkhBxzrVVKOT2BCLVJeLZxtQLa
 SUxZsRjdAlBgSoCkP6kcANNncZ8YkAQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-Qg_HRxUSNIKJdvzxAD6wZg-1; Tue, 17 May 2022 06:45:54 -0400
X-MC-Unique: Qg_HRxUSNIKJdvzxAD6wZg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p24-20020a1c5458000000b003945d2ffc6eso8016077wmi.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 03:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zAY3Q66QbM0uib7azOaHo8UXKhhXZmSJ5qde/FsqCRo=;
 b=uMhE93teg7ncmzeqDT9j7Sduu5kc+zdpMXRQ66em7e+WJ80eM5vDGGYnwbr/rOzNUD
 QRgDPGPT1jw/ZhnFEiCNlheKVBbsqnzNImGHniak8RZYeG7tHs85Dq6xvjsaibYkiu3P
 BXLijzojT888gUpqS+0sT1eKqe3Kv7+Moo4BNGc+9jyEg9PZjnN0vTZNiLbnDXMKBuY3
 IYw6lSE+QZzqQxSAmJ0yy8XR8/5BrXsabpLxXQrI4czEKM1Ixm1TkBsRWKcqQvsQPEQb
 gN3Ks/mwK6jpiAwjS9jXXPhkdYgMDA+Yp7aVktcsKrwi5acCYTkolfD34BvyWSIZdFnn
 /hMQ==
X-Gm-Message-State: AOAM530eTH3DU9dV7K4xS93RI1ee0pTdyBuvJ1Mp9Dj14eO6wP6cwZjW
 uwRTFAypHmeYTr1NyIL+YSKEga3vxfRoIM1PSHDaxQwJbFbKmxDN86QEWvOTer4DwZD0lj6dXcN
 xfYhe566axevE++c=
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr17936725wrr.583.1652784352773; 
 Tue, 17 May 2022 03:45:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUXUTOx9x+QT465njisE+3UiJwNk5IxxEtKpwD1rLTCA46aIbr/Ln2PrwIoRQc/FDgPmL+fg==
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr17936701wrr.583.1652784352534; 
 Tue, 17 May 2022 03:45:52 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfa70d000000b0020c5253d8f7sm12121067wrd.67.2022.05.17.03.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 03:45:52 -0700 (PDT)
Message-ID: <db9c1963-36c3-8639-988d-c49109121001@redhat.com>
Date: Tue, 17 May 2022 12:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] gitlab-ci: Allow adding manual jobs on cirrus-ci
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220314143130.28503-1-philippe.mathieu.daude@gmail.com>
 <2a52914a-d129-cd20-d54d-ee8cfd38a8d7@redhat.com>
 <YoN5MMqaR8w1avU4@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YoN5MMqaR8w1avU4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/05/2022 12.30, Daniel P. Berrangé wrote:
> On Tue, May 17, 2022 at 12:10:30PM +0200, Thomas Huth wrote:
>> On 14/03/2022 15.31, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> By default, all Cirrus-CI jobs are added as 'on_success' (the
>>> default value). Add a ${MANUAL_JOB} variable (default to 0)
>>> to be able to add manual jobs.
>>>
>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>    .gitlab-ci.d/cirrus.yml       | 2 ++
>>>    .gitlab-ci.d/cirrus/build.yml | 1 +
>>>    2 files changed, 3 insertions(+)
>>>
>>> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
>>> index b96b22e269..9e640019dd 100644
>>> --- a/.gitlab-ci.d/cirrus.yml
>>> +++ b/.gitlab-ci.d/cirrus.yml
>>> @@ -44,6 +44,8 @@
>>>        # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
>>>        - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
>>>          when: never
>>> +    - if: '$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN && $MANUAL_JOB == "1"'
>>> +      when: manual
> 
> 
> 
>>>        - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
>>>    x64-freebsd-12-build:
>>> diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
>>> index c555f5d36e..c58dc86855 100644
>>> --- a/.gitlab-ci.d/cirrus/build.yml
>>> +++ b/.gitlab-ci.d/cirrus/build.yml
>>> @@ -14,6 +14,7 @@ env:
>>>      MAKE: "@MAKE@"
>>>      CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
>>>      TEST_TARGETS: "@TEST_TARGETS@"
>>> +  MANUAL_JOB: 0
> 
> This addition doesn't make sense.  build.yml is config that is run
> by Cirrus CI.
> 
> The MANUAL_JOB  env is interpreted by GitLab CI, so would only ever
> be set by jobs in .gitlab-ci.d/cirrus.yml
> 
>>>    build_task:
>>>      install_script:
>>
>>   Hi Philippe!
>>
>> Sorry for the late reply ... I think this might collide with Daniel's patch
>> that turns most jobs to manual mode
>> (https://lore.kernel.org/all/20210812180403.4129067-3-berrange@redhat.com/)
>> which he is hopefully going to respin soon ... but anyway, if you add a
>> variable like this, there should be an update to docs/devel/ci-jobs.rst.inc
>> to describe the new variable, otherwise you might be the only one who's
>> using it.
> 
> IIUC, this MANUAL_JOB variable isn't for end developer usage, rather it is
> for usage when adding jobs to .gitlab-ci.d/cirrus.yml, so I don't think it
> needs documenting there. THis simply lets us add a bunch more jobs to
> cirrus.yml without causing timeout problems by having them all run at
> once, providing we put MANUAL_JOB: 1 in the config for the new job.

Ok, but then this patch is incomplete. This should either be in a series 
that introduces such new jobs, or/and rework the NetBSD and OpenBSD jobs to 
use this variable, too.

  Thomas


