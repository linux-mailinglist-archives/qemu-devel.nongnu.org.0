Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00696A17A4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:01:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVT1M-00018h-KJ; Fri, 24 Feb 2023 03:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVT15-000162-IU
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:01:23 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVT12-00025w-LL
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:01:19 -0500
Received: by mail-wr1-x435.google.com with SMTP id 6so12597512wrb.11
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l2A0xJktijwMYvnj3SqUkR/OxyrjnD27YZQIbcG3Htg=;
 b=pJMHzvk7q1M7fIwrPMVfHf/gpI+Z1uPKYBo6MzwvLGpta+6wCJY+2BBTkBRhg3BLmZ
 sYprf4JEQh7sqNFxoEziqeNvE0WHrY5lkd5G7Yi9mRTmIoOjj11I0bRWjvNRHsnuUDVo
 5TCwVsg3BqCk09wIRGssC6UIIWPJ0BQRO3KArwFN9odONvWAtpQay+IgU8yy2tb19fSG
 j0j5r56fUfi0QwBv5eFddqlZMXzBm71BZJ+r1tFgOqHGKeBkA+m0GMN5ABbzQZv00wYP
 MWt4Tf2d3r8qwlrrXjvnPqFIUH9cSO80azw/rz3g6CPQ590mlbLzOWXNdGJJxBVkUPa+
 YfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l2A0xJktijwMYvnj3SqUkR/OxyrjnD27YZQIbcG3Htg=;
 b=CAL/Y3CgprJ2viZ5jUtGg1QANgXLFucul8oC8gXHPKccqRvsax1zEKBMveW7vHqwhC
 6K/CQkNF5yt9ciqLKWpWhIjqSSAUI1GChlYyodBtsbrYc4LIecYXuKQlhmfVYRD1mW+1
 vGkmaan1XMheYpT9FLJx6tMlR8f4Vm9Adi1VtxUWS5WUepJ+YcAqO/+9WocApaJcbmSL
 HxXvy1vthdrW4bigRsaVW3CxwFe6AbOkufMjiR8ijC9jwl+kFIeiAkKKURXJg4SzFMEh
 2o/5qlh/FqTHnplLwrubSUWKN0P/Kz3FdWfa9YkSdZDhaFyCqrzrVlJDfHgWYMsoIJkL
 xs8Q==
X-Gm-Message-State: AO0yUKWufppOV2dW+/F1KIiJhJSncw2WZOq44VUzu5SyjfFH/PCGJ90P
 BdPV+AxFB6qz6qt8XYkWEYdhlw==
X-Google-Smtp-Source: AK7set/g5AiuJWFjBXwVILBzrmCeooDf7JmlHbZHJa2kKZk2D1zEREP+Qjlymaxf+q6wCqGdZ+KsCQ==
X-Received: by 2002:adf:e701:0:b0:2c7:15a5:439d with SMTP id
 c1-20020adfe701000000b002c715a5439dmr3789943wrm.8.1677225674063; 
 Fri, 24 Feb 2023 00:01:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d51d0000000b002c56046a3b5sm12296310wrv.53.2023.02.24.00.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:01:13 -0800 (PST)
Message-ID: <9233b676-cc06-cc79-cd39-394d078d3109@linaro.org>
Date: Fri, 24 Feb 2023 09:01:12 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <56bf3f6b-92bd-0c89-b17b-1056ba02c4df@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 24/2/23 07:22, Thomas Huth wrote:
> On 23/02/2023 21.23, Philippe Mathieu-Daudé wrote:
>> On 23/2/23 20:13, Thomas Huth wrote:
>>> When handling pull requests in the staging branch, it often happens
>>> that one of the job fails due to a problem, so that the pull request
>>> can't be merged. Peter/Richard/Stefan then informs the sender of the
>>> pull request and continues by pushing the next pending pull request
>>> from another subsystem maintainer. Now the problem is that there might
>>> still be lots of other running jobs in the pipeline of the first pull
>>> request, eating up precious CI minutes though the pipeline is not
>>> needed anymore. We can avoid this by marking the jobs as 
>>> "interruptible".
>>> With this setting, the jobs from previous pipelines are automatically
>>> terminated when pushing a new one. If someone does not like this auto-
>>> matic termination, it can still be disabled in the settings of the
>>> repository. See this URL for details:
>>>
>>>   https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   .gitlab-ci.d/base.yml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
>>> index 50fb59e147..0274228de8 100644
>>> --- a/.gitlab-ci.d/base.yml
>>> +++ b/.gitlab-ci.d/base.yml
>>> @@ -11,6 +11,8 @@
>>>       # and show the duration of each line.
>>>       FF_SCRIPT_SECTIONS: 1
>>> +  interruptible: true
>>
>> It makes sense for mainstream, but seems counter-productive in forks.
>> At least in my maintainer use case.
>>
>> Is it possible to add a 'default' in .gitlab-ci.d/qemu-project.yml,
>> so we can overwrite with a different namespace? 'interruptible' is
>> listed in https://docs.gitlab.com/ee/ci/yaml/index.html#default.
> 
> As I wrote in the commit description: "If someone does not like this 
> automatic termination, it can still be disabled in the settings of the 
> repository."
> 
> See here for how to change the setting:
> 
> 
> https://docs.gitlab.com/ee/ci/pipelines/settings.html#auto-cancel-redundant-pipelines

Oh I couldn't find this. Do you mind listing this URL in the commit
description?


