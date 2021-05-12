Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C81337C771
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:21:33 +0200 (CEST)
Received: from localhost ([::1]:45810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrc3-0008UH-VM
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgraW-00069Z-B7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:19:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgraR-0005B2-OB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:19:56 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 p14-20020a05600c358eb029015c01f207d7so3335142wmq.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r0N5vpd5X14IUFXdKDlNxh9c6taEBSHoCUXdwh4bZE4=;
 b=YyOrau0Ma66CZy9jYON8R3NcCxQv0CxcL82PdhnfnG7Cv/w8qYJO8G6pTIjUZt7Lw7
 47BAkaoQLcy7AfAxatoZoXNr280m1q7EHMFYJUFrPD5HOvzHmc8N/xvrskmapZngMyS6
 o5MpPJHDQk5DdWZs7BXfJcgC72FMy4ub3MMUTYHkBwWlN1QV3PRgEQb/36Kua16DDiaW
 6+zJapfdAlJfaVe65bFGpmFhxgsXVp27JRuB0O6rLegt6E+pdxhC/Pr+UqWkE55i+q49
 8kNAc/Ewkys0M/io1FeoEM/ElxGBmpzK/gLw7qlUSLn6a2BqBcCuQeKn0cS04XXQT1/p
 vaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r0N5vpd5X14IUFXdKDlNxh9c6taEBSHoCUXdwh4bZE4=;
 b=VCwiv7B789TXtkmYPWkdN5j7CSCvIYX7+0GV6EZTBWAVWXYZsy7T7IXfTncg6/09tb
 nh6F/XevHShHZU9I764+9yXtBn3eFCu9a7/5cCeebqo2VUlTfgFCN9wqDYkFlswYq7Pc
 RypHEwPIYo9wW6KQnahs3luUfOCDTZm3l0Zyz+N0NiijF3jFQa2tCCvcqTrTE/47GdYa
 ILWL695UeD3zEHM6Z7BNXwvNsAKG0txn6EYJh4V8rAqhaFVRYXbN7bfpwoTVfDJsTcxe
 6enWbQThfhSY6bYv2dpg5/8WTgJ1RGu7MGjJu78sp6qjxFa5Pg4FtpkL0tfcut67aYIa
 IlbA==
X-Gm-Message-State: AOAM532PtO+7RpyXGzgHviWfaTpT1PCvGgtQB9YxRcQkJ+NeuB1R+gXE
 MuGSCIxHCCaNVzgiMt/ywCw=
X-Google-Smtp-Source: ABdhPJxaknmcDZTrF0YtobFv4M/dJimPk85JAfOcS2zU/m+OQwYVJk+Lh559acH0pBAR4uA7p1SG8g==
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr12541012wmm.161.1620836390315; 
 Wed, 12 May 2021 09:19:50 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u9sm135537wmc.38.2021.05.12.09.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:19:49 -0700 (PDT)
Subject: Re: [PATCH 01/12] gitlab: move linux user build job from CentOS 7 to
 CentOS 8
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-2-berrange@redhat.com>
 <4f6620fd-bfed-7c35-4711-79d1625f9c7c@redhat.com>
 <YJqO6++eBH28sRtO@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0c1dc7ba-fbae-1b63-04bf-8d456fd6c3a3@amsat.org>
Date: Wed, 12 May 2021 18:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJqO6++eBH28sRtO@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Peter

On 5/11/21 4:04 PM, Daniel P. Berrangé wrote:
> On Tue, May 11, 2021 at 03:54:26PM +0200, Thomas Huth wrote:
>> On 11/05/2021 15.26, Daniel P. Berrangé wrote:
>>> It has been over two years since RHEL-8 was released, and thus per the
>>> platform build policy, we no longer need to support RHEL-7 as a build
>>> target.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>   .gitlab-ci.yml                          | 6 +++---
>>>   tests/docker/dockerfiles/centos8.docker | 1 +
>>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index dcb6317aac..23917d6d73 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -441,12 +441,12 @@ build-user-plugins:
>>>       MAKE_CHECK_ARGS: check-tcg
>>>     timeout: 1h 30m
>>> -build-user-centos7:
>>> +build-user-centos8:
>>>     <<: *native_build_job_definition
>>>     needs:
>>> -    job: amd64-centos7-container
>>> +    job: amd64-centos8-container
>>>     variables:
>>> -    IMAGE: centos7
>>> +    IMAGE: centos8
>>
>> We urgently should decrease our huge amount of jobs ... What about removing
>> this job completely? We already have the "build-user" job that tests the
>> compilation on Debian, which is likely at a similar library level as
>> centos8, so I doubt that we get much additional test coverage from this job
>> here when it's running on Centos 8.
> 
> This job was added by Philippe just a couple of months ago
> 
> 
> commit 4e41d4a34e4d9f11a99a03c2279f84e98df21984
> Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Date:   Thu Jan 21 18:28:29 2021 +0100
> 
>     gitlab-ci: Test building linux-user targets on CentOS 7
>     
>     Add a configuration tested by Peter Maydell (see [1] and [2])
>     but not covered in our CI [3]:
>     
>       [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>       FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>       ../linux-user/strace.c: In function 'do_print_sockopt':
>       ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undeclared (first use in this function)
>                case IPV6_ADDR_PREFERENCES:
>                     ^
>     
>     This job currently takes 31 minutes 32 seconds ([4]).
>     
>     [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05086.html
>     [2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05379.html
>     [3] https://gitlab.com/philmd/qemu/-/jobs/977408284
>     [4] https://gitlab.com/philmd/qemu/-/jobs/978223286
>     
>     Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>     Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>     Reviewed-by: Thomas Huth <thuth@redhat.com>
>     Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>     Message-Id: <20210121172829.1643620-3-f4bug@amsat.org>
>     Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> 
> I looked at the quoted thread, but I can't tell what the actual missing
> scenario was that motivated this. The threads don't appear to specifically
> mention CentOS 7, but if the issue was indeed specific to CentOS 7 we can
> certainly drop the job. If it was some other scenario, I defer the
> answer to someone who knows....

I was testing on CentOS 7 by accident, and noticed Peter reported the
same error on his "ppc64 box", so I figured it would be more useful
to the community if we could catch such error (old kernel headers)
before reaching Peter gating process.

Peter, is your "ppc64 box" OS version in our set of supported ones?

Thanks,

Phil.

