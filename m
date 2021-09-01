Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63503FDFFE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:34:21 +0200 (CEST)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTBs-0003uq-UT
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLT2r-0003zP-UE
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:25:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLT2q-0007n0-3i
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630513498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ARHXhwWyl7yGae2sS5UxWyZ/JEheT83PdUtKk7ZD+o=;
 b=YCKvumyyxsj/YlM6AYritspw2eh9PoxgXevMZXlpkWLyijK1+AEECzH49pohbXbLD2z3UW
 RpAYcV6eKaWHz+l/7dG3HsKkuAugdhwVNUbr+6/WVHMa4kzKhdJ3UY4/QFdM4Mf4XtPPbZ
 KSs9+wz8Bixd09PQFiBnZErrO6SE0Ts=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-8d_6nVIVOz2fzv7MpIfd_Q-1; Wed, 01 Sep 2021 12:24:57 -0400
X-MC-Unique: 8d_6nVIVOz2fzv7MpIfd_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 z16-20020adfdf90000000b00159083b5966so63219wrl.23
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ARHXhwWyl7yGae2sS5UxWyZ/JEheT83PdUtKk7ZD+o=;
 b=J+zXsGOXwohjc8gEXZKyE+5MTF+u/nFHH+ncWDkWyqUBU7LXAlL1J6LE1r6Pek0hJS
 XqfUd0QNubaQ/2C5r1CAJErKdvSMuMAu5SlDLAoh7nSbGaBu9fNeWFmsXhQbhdwMG+6z
 7OFc0McnvxpXUoDhlqZcxKd+ctRiiohSDZ8Z4G5HYjB8qvoyWiYvrl57fKtSZbyqtGxH
 B0iMkDiEkPTMailXMHYrR//6ROKBkQwqo/TPqNDwJNmsuchrWdw6wQEAKtSnRKWLfbuz
 YDeOg0a3IUFAoO9ieZAnP2jZkHdsH3Hy2qHYCcjjv3K08q3Wcs6GYujczLQmByCtFgg+
 7xMA==
X-Gm-Message-State: AOAM530i63xJOKy42ARXbAMejzoqS7INI/Cwr8GwpBavx//EfkLLwqcq
 61lOX6qnDmPjsYI40dWT5obD4uhaK7p80t7I4XvVjpbHZg3GoUtUUcvtZPMYSv5wyuvA7I0Be/P
 4ssCnjYeh7xVGasA=
X-Received: by 2002:adf:82b0:: with SMTP id 45mr220774wrc.161.1630513493919;
 Wed, 01 Sep 2021 09:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJNgA1ReV/LQMvmgS4vzFZYMJxLbCNsujnYTVh9awT9DnxmL6SE7Onul8tnBGOZ/n7xbBtNg==
X-Received: by 2002:adf:82b0:: with SMTP id 45mr220740wrc.161.1630513493710;
 Wed, 01 Sep 2021 09:24:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z19sm57801wma.0.2021.09.01.09.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 09:24:53 -0700 (PDT)
Subject: Re: [PATCH] gitlab: Escape git-describe match pattern on Windows hosts
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210901145229.4132606-1-philmd@redhat.com>
 <YS+UylEr3CJyksxt@redhat.com>
 <CAFEAcA_gyZTfUTAAoKvrA-qyv-8dOvGjLSLmq2uaur8XYS6CuQ@mail.gmail.com>
 <YS+aiZep166VuVcH@redhat.com>
 <0901f6da-de5c-f9e6-5f40-e15f4a7c807d@redhat.com>
 <YS+iCgl88cmMepKl@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <33d1a40b-c242-6472-5aa4-4108668ccc84@redhat.com>
Date: Wed, 1 Sep 2021 18:24:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS+iCgl88cmMepKl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goate?= =?UTF-8?Q?r?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 5:53 PM, Daniel P. Berrangé wrote:
> On Wed, Sep 01, 2021 at 05:35:42PM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/1/21 5:21 PM, Daniel P. Berrangé wrote:
>>> On Wed, Sep 01, 2021 at 04:17:48PM +0100, Peter Maydell wrote:
>>>> On Wed, 1 Sept 2021 at 15:59, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>
>>>>> On Wed, Sep 01, 2021 at 04:52:29PM +0200, Philippe Mathieu-Daudé wrote:
>>>>>> Properly escape git-describe 'match' pattern to avoid (MinGW):
>>>>>>
>>>>>>   $ if grep -q "EXESUF=.exe" config-host.mak; then make installer;
>>>>>>     version="$(git describe --match v[0-9]*)";
>>>>>>     mv -v qemu-setup*.exe qemu-setup-${version}.exe; fi
>>>>>>   fatal: No names found, cannot describe anything.
>>>>>>   ERROR: Job failed: exit code 1
>>>>>>
>>>>>> Reported-by: Cédric Le Goater <clg@kaod.org>
>>>>>> Fixes: 8619b5ddb56 ("ci: build & store windows installer")
>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/591
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>> ---
>>>>>>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
>>>>>> index 10d22dcf6c1..62d33e6661d 100644
>>>>>> --- a/.gitlab-ci.d/crossbuild-template.yml
>>>>>> +++ b/.gitlab-ci.d/crossbuild-template.yml
>>>>>> @@ -14,7 +14,7 @@
>>>>>>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>>>>>>      - if grep -q "EXESUF=.exe" config-host.mak;
>>>>>>        then make installer;
>>>>>> -      version="$(git describe --match v[0-9]*)";
>>>>>> +      version="$(git describe --match 'v[0-9]*')";
>>>>>
>>>>> Do you have a pointer to a pipeline showing this fix works ?
>>
>> It worked on my fork but I have some versioned tag:
>> https://gitlab.com/philmd_rh/qemu/-/jobs/1553450025
> 
> I can reproduce the error msg if I do a shallow clone with no history
> 
> $ cd qemu
> $ git describe --match v[0-9]*
> v6.1.0-171-g5e8c1a0c90
> 
> $ cd ..
> $ git clone --depth 1 https://gitlab.com/qemu-project/qemu/ qemu.new
> $ cd qemu.new/
> $ git describe --match v[0-9]*
> fatal: No names found, cannot describe anything.
> 
> but the odd thing is that I think we should have been hitting the
> problem frequently if it was related to git depth. This job passes
> fine in current CI pipelines and my own fork.

FYI it didn't work out on Cédric fork:
https://gitlab.com/legoater/qemu/-/jobs/1553492082


