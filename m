Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D16A17C2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:14:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTCP-00035E-7M; Fri, 24 Feb 2023 03:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVTCJ-00034f-MF
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:12:55 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVTC6-000779-5n
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:12:46 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so12622826wrb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=98RH0s1g9e4ICwAaNqrmAxVvh74L/YkLAgLWTidN8bo=;
 b=jyCmIqSwvot2nugk6FQF/LIh02eB+ss1o+pGXU6if39eY/oK8LPxMqtyIbowN9Tw4T
 C7FWZGnaCKfMhwJ2KXuhWtYQrLcAGE16rbKmUnJdBYabX5R6fG3NgBuEFZrwJz9/Bnp7
 jsAEP6bCaaZM+Bc7dQsWXiZ3Zh6Qu/wBS+uUHvYG3IhWoWzpsf2Kn6PgMAXWcV2K9UAq
 WZQrHhBs28ZqvXQwERj8lQIHiC8JwGUUnLXwbF8+YXCGgJjQIm0N+R1SKxoz+04keDTy
 mqTcJzM7vO1lpS6S2EjhtGenSPp37Cq96Yhv9tzDoCoNvfNtbOSCAuNqwZ84VpMNk3M5
 Bjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=98RH0s1g9e4ICwAaNqrmAxVvh74L/YkLAgLWTidN8bo=;
 b=mbGN/9SuSLUUsB8FAl5Q0pf2EnMorssY09rQPaPAfUxJvnTiMqYQFo6q+odv/RPiYR
 gyNVTKYH6qvtbkH/TM63HwwREDjuANgh4zEHvsIjRmX6DT/RTszi8Nh9QIMruaF4IemT
 4A/KqFA/pTvcEft8qpBPvi6epspQ62aveE8qz9XFDoahT9Wjbn9EgLVvEa8jiiS03Ale
 wb6xOhPug8x2dO3skZIuEYORtTjbIW2ErVDaq5MEDcFvJZcUnM46cOx1B1XvRbvADyos
 ZF2uYRoiiafuE5ak0A6I1OeB1IW2q80EtX0UJTc6Gn2Ox6L9FWZ5fgqittOYf1G8Ktu5
 7d4g==
X-Gm-Message-State: AO0yUKXBzx5WR1yN5f89mfNjUMn0HkOjX3gx1nUJWTO0945TeNSpcu8G
 BTIH+hJd7QooVigUpPwL8s+xlw==
X-Google-Smtp-Source: AK7set976FskLdt1zfZLaQJey+B9FnKOtd73BL7a+3bRFmmNb1MlSD9zXdFIRGsLlAxCYMKIaAybaQ==
X-Received: by 2002:adf:f208:0:b0:2c5:9ab9:60f6 with SMTP id
 p8-20020adff208000000b002c59ab960f6mr14740428wro.62.1677226360263; 
 Fri, 24 Feb 2023 00:12:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t6-20020a5d4606000000b002c55306f6edsm15667413wrq.54.2023.02.24.00.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:12:39 -0800 (PST)
Message-ID: <b7ece12c-f30d-820a-d4e7-7d09b1635689@linaro.org>
Date: Fri, 24 Feb 2023 09:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] .gitlab-ci.d/base: Mark jobs as interruptible by default
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel P Berrange <berrange@redhat.com>
References: <20230223191343.1064274-1-thuth@redhat.com>
 <584c71cb-02e1-9386-44d7-ca2ce1c3253e@linaro.org>
 <56bf3f6b-92bd-0c89-b17b-1056ba02c4df@redhat.com>
 <9233b676-cc06-cc79-cd39-394d078d3109@linaro.org>
 <dfbe74ab-9241-bef4-81d0-13b0550ad01e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <dfbe74ab-9241-bef4-81d0-13b0550ad01e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/2/23 09:03, Thomas Huth wrote:
> On 24/02/2023 09.01, Philippe Mathieu-Daudé wrote:
>> On 24/2/23 07:22, Thomas Huth wrote:
>>> On 23/02/2023 21.23, Philippe Mathieu-Daudé wrote:
>>>> On 23/2/23 20:13, Thomas Huth wrote:
>>>>> When handling pull requests in the staging branch, it often happens
>>>>> that one of the job fails due to a problem, so that the pull request
>>>>> can't be merged. Peter/Richard/Stefan then informs the sender of the
>>>>> pull request and continues by pushing the next pending pull request
>>>>> from another subsystem maintainer. Now the problem is that there might
>>>>> still be lots of other running jobs in the pipeline of the first pull
>>>>> request, eating up precious CI minutes though the pipeline is not
>>>>> needed anymore. We can avoid this by marking the jobs as 
>>>>> "interruptible".
>>>>> With this setting, the jobs from previous pipelines are automatically
>>>>> terminated when pushing a new one. If someone does not like this auto-
>>>>> matic termination, it can still be disabled in the settings of the
>>>>> repository. See this URL for details:
>>>>>
>>>>>   https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>   .gitlab-ci.d/base.yml | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
>>>>> index 50fb59e147..0274228de8 100644
>>>>> --- a/.gitlab-ci.d/base.yml
>>>>> +++ b/.gitlab-ci.d/base.yml
>>>>> @@ -11,6 +11,8 @@
>>>>>       # and show the duration of each line.
>>>>>       FF_SCRIPT_SECTIONS: 1
>>>>> +  interruptible: true
>>>>
>>>> It makes sense for mainstream, but seems counter-productive in forks.
>>>> At least in my maintainer use case.
>>>>
>>>> Is it possible to add a 'default' in .gitlab-ci.d/qemu-project.yml,
>>>> so we can overwrite with a different namespace? 'interruptible' is
>>>> listed in https://docs.gitlab.com/ee/ci/yaml/index.html#default.
>>>
>>> As I wrote in the commit description: "If someone does not like this 
>>> automatic termination, it can still be disabled in the settings of 
>>> the repository."
>>>
>>> See here for how to change the setting:
>>>
>>>
>>> https://docs.gitlab.com/ee/ci/pipelines/settings.html#auto-cancel-redundant-pipelines
>>
>> Oh I couldn't find this. Do you mind listing this URL in the commit
>> description?
> 
> It's linked from 
> https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible (which I 
> mentioned already in the commit description) ... isn't that enough?

Ah right. I guess it was too late when I looked at that yesterday :\


