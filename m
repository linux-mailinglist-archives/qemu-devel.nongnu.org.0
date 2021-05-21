Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD1738C91F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:22:40 +0200 (CEST)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk62x-0003cI-Su
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lk61f-0002EU-So
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:21:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lk61W-0003TJ-Ie
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:21:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id 62so10214701wmb.3
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ml49wFa7MS6WybTBCyQp34Rn20IvVpe+JLM64rDXoVU=;
 b=CRXmti1HdsmHeGUJ7600dK0XY0//AH4/v75B5RGcWpXmOVnGMettVSjmRYpMt8twKy
 HZy5llNCgKUnrZmk5+dOFT/F8TmWpGP2WjlN+f7W6E35iPwrtYXKDWruOrDxdhq5+LXJ
 ViwYZFTnJAbh3trjlHzqcp8fYun58AOv5/0O5hN+Kvq9fx2TPBp6mgSIlSG1JdNIAGvX
 4FFehFFCk9H19Nzxu7m8Y1FDFZv3SEGgirIGt0XVKDlQ675AYP9hQRPzZTvDeqOkJMeI
 HyXOiIV9oKR8G3cC5rq38Ka/tBhpt4/Hnt/UIY9KZBoFq8VL8ZfmePFN84r5ZfjhRiUg
 ZKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ml49wFa7MS6WybTBCyQp34Rn20IvVpe+JLM64rDXoVU=;
 b=kG4X6ClE8FRMgeY7AUmaqzH1i5AaymmiMYeK9aXSoFC7rDj28zgWRgjAnZcZfKo1N0
 MFfwfX86s69/QKfbwh5cNxfTsazCJvpS7Es3MtqWvtP9HmaI6/fFy0eQ767TunCpMejY
 8nkDqrFwoteQwpkrz/eJvDa7H73J3T1eI/uzRLEcoV1B+tw/y73UTKTmVx3svlXb8z18
 o9mjDZqiQWDuZl7mJMJkEd6bqCiftxJKvVPBD4DIYiojgEmuG2ALzSpR2kodKUHbyEjm
 H7zcf6VL7XQSGYRG0k8wY88Nzh5As6boSrv1JAhYlkfd6gkM5BFRSoxSchM3nHcgmGeU
 GYQw==
X-Gm-Message-State: AOAM533AzZ1IMyi7npEIvCWlZdvV3s8gnsEHu0bya7LSXAxKR+6dbU9T
 TcCg0QA8c6cmYqbPcBf0ivs=
X-Google-Smtp-Source: ABdhPJwNN/yQPhMa19uuKBVZmlykIuZ2WXjHzyg4czKh54agqDCxLHk3qMlIimKRmTCYFfZzW85mLw==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr9079789wmf.10.1621606868876; 
 Fri, 21 May 2021 07:21:08 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c22sm6283276wmb.10.2021.05.21.07.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 07:21:08 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
 <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
 <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
 <396e75d2-fe22-3054-fbee-d6de02339b2a@redhat.com>
 <YKeQkqviHbxqcC6Y@redhat.com>
 <afa421f3-337a-c488-c767-b73aaf3780b8@redhat.com>
 <YKefRcVrr9Gtehlk@redhat.com>
 <c7f01111-bada-49b1-ebce-03e6eff96aae@amsat.org>
 <YKes/fqDNT4G9jx/@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c4910e92-359f-3517-fb7e-65cbbe8deb1a@amsat.org>
Date: Fri, 21 May 2021 16:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKes/fqDNT4G9jx/@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 2:52 PM, Daniel P. Berrangé wrote:
> On Fri, May 21, 2021 at 02:27:26PM +0200, Philippe Mathieu-Daudé wrote:
>> On 5/21/21 1:53 PM, Daniel P. Berrangé wrote:
>>> On Fri, May 21, 2021 at 01:02:51PM +0200, Thomas Huth wrote:
>>>> On 21/05/2021 12.50, Daniel P. Berrangé wrote:
>>>>> On Fri, May 21, 2021 at 12:48:21PM +0200, Thomas Huth wrote:
>>>>>> On 20/05/2021 13.27, Philippe Mathieu-Daudé wrote:
>>>>>>> +Stefan/Daniel
>>>>>>>
>>>>>>> On 5/20/21 10:02 AM, Thomas Huth wrote:
>>>>>>>> On 19/05/2021 20.45, Philippe Mathieu-Daudé wrote:
>>>>>>>>> If a runner has ccache installed, use it and display statistics
>>>>>>>>> at the end of the build.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>>>> ---
>>>>>>>>>     .gitlab-ci.d/buildtest-template.yml | 5 +++++
>>>>>>>>>     1 file changed, 5 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/.gitlab-ci.d/buildtest-template.yml
>>>>>>>>> b/.gitlab-ci.d/buildtest-template.yml
>>>>>>>>> index f284d7a0eec..a625c697d3b 100644
>>>>>>>>> --- a/.gitlab-ci.d/buildtest-template.yml
>>>>>>>>> +++ b/.gitlab-ci.d/buildtest-template.yml
>>>>>>>>> @@ -6,13 +6,18 @@
>>>>>>>>>           then
>>>>>>>>>             JOBS=$(sysctl -n hw.ncpu)
>>>>>>>>>             MAKE=gmake
>>>>>>>>> +        PATH=/usr/local/libexec/ccache:$PATH
>>>>>>>>>             ;
>>>>>>>>>           else
>>>>>>>>>             JOBS=$(expr $(nproc) + 1)
>>>>>>>>>             MAKE=make
>>>>>>>>> +        PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
>>>>>>>>
>>>>>>>> That does not make sense for the shared runners yet. We first need
>>>>>>>> something to enable the caching there - see my series "Use ccache in the
>>>>>>>> gitlab-CI" from April (which is currently stalled unfortunately).
>>>>>>>
>>>>>>> TL;DR: I don't think we should restrict our templates to shared runners.
>>>>>>
>>>>>> I'm certainly not voting for restricting ourselves to only use shared
>>>>>> runners here - but my concern is that this actually *slows* down the shared
>>>>>> runners even more! (sorry, I should have elaborated on that in my previous
>>>>>> mail already)
>>>>>>
>>>>>> When I was experimenting with ccache in the shared runners, I saw that the
>>>>>> jobs are running even slower with ccache enabled as long as the cache is not
>>>>>> populated yet. You only get a speedup afterwards. So if you add this now
>>>>>> without also adding the possibility to store the cache persistently, the
>>>>>> shared runners will try to populate the cache each time just to throw away
>>>>>> the results afterwards again. Thus all the shared runners only get slower
>>>>>> without any real benefit here.
>>>>>>
>>>>>> Thus we either need to get ccache working properly for the shared runners
>>>>>> first, or you have to think of a different way of enabling ccache for the
>>>>>> non-shared runners, so that it does not affect the shared runners
>>>>>> negatively.
>>>>>
>>>>> Is there anything functional holding up your previous full cccache support
>>>>> series from last month ? Or is it just lack of reviews ?
>>>>
>>>> It's basically the problems mentioned in the cover letter and Stefan's
>>>> comment here:
>>>>
>>>>  https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02219.html
>>>
>>> I'm not sure I understand why Stefan thinks gitlab's caching doesn't
>>> benefit ccache. We add ccache for libvirt GitLab CI, and AFAIR it
>>> sped up our builds significantly.
>>
>> I think Stefan is referring to a comment I made, when using both
>> shared runners and dedicated runners (what I'm currently testing)
>> various jobs are stuck transferring artifacts/cache {FROM, TO}
>> {shared, dedicated} runners at the same time, which is sub-optimal
>> because it saturate the dedicated runner network link.
> 
> I think we're over thinking things a bit too much and worrying about
> scenarios that we're not actually hitting that frequently today, and
> delaying the benefit for everyone.
> 
> Our common case is that most contributors are simply using shared
> runners exclusively, as is the main qemu repo staging branch. AFAIK
> these should benefit from a simple ccache enablement today.
> 
> Since there are questions about other setups though, we can just
> provide an easy way to turn it off. eg:
> 
>   if test -z "$QEMU_CI_SKIP_CCACHE"
>   then
>      PATH=/usr/local/libexec/ccache:$PATH
>   fi
> 
> anyone who wishes to disable it, can just set that variable in their
> git repo fork. If there are specific jobs we want to disable cccache
> for, those jobs can set that too.

OK, understood. I'll see with Willian how to have ccache working.

Thanks for the feedback,

Phil.

