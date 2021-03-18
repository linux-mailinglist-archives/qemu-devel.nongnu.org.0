Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9EB340163
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 09:57:30 +0100 (CET)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMoTB-0001oT-Fk
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 04:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMoRf-0001F8-9t
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:55:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMoRZ-0000Vz-Td
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:55:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z2so4610236wrl.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8YmXbq8VSHVi9YPaIZt4HAgwNPicH8Tv+sBwYE7FhfM=;
 b=cjABsIjHtcMaIWPxPvheWJlXo7ziECIVPioPDWP/zQLyh7op8yqyMVk75aCMyx2s2B
 ydwNaXREfv+ZEWJxXy+qb4+RpkU6hNjI3PtejWIQnoN9ZivFeAg9vUIsMLvDyJgtWhFw
 zlUv3QFwm0twngYaTPeNEOSyQI6lhTgspsNFxAzX1Stu5tAQv4c6bUIE16Waq14B4rwY
 oejbZ4cpvuPOKGXpsC9zEGZa8J6/UE/A/xi6KoEgx27v4sq99alz3EZHFmV2pbJ846Dv
 C3uSjvUQqlKjVX+DVvdryAMHuC8sqzf8zuU4+zu0VDuGTduSfd8ooo7yNwpGl4XjXCD3
 uOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8YmXbq8VSHVi9YPaIZt4HAgwNPicH8Tv+sBwYE7FhfM=;
 b=eFyPkEemKS4lhaZThyhWRGLAMc3Al7npByQIMYqaF1y+QKE8OxpVYRnl9T1U123sLU
 ifbvGZvZAAbOb2py2Zpj9SXpTUyUL/U3jSTj3ZE70MCTwJdYQ3TYbUMTeXkMBtb8teok
 EhiCHI8ymnwM4tei4zfeiehy7iZnkbfg/wQoIBluG7krj8TdSvmzinRxT30ygZNusc71
 NLXn46v/RWNk8AjPt35f3B+ZY7jznpZoT7bZGGBJtKYuo+BPt50DGVckZdjrv5yGaoag
 KdBTBPiu/NYyZwBUMn2AvlCgXr6CGCG6WCWYQvQAHDark4Iif6v19uFwKxaHOMUkd8Pc
 5+Bw==
X-Gm-Message-State: AOAM532Vw30buxpc1b6nBbFbDrmpSEzItshw4HN7GHtb0N7LrzCyI9H7
 usSQdqh1Wt+uz3UFJmv4wVY=
X-Google-Smtp-Source: ABdhPJxzkT8iMSjh/EckrYujcS0fJpVwSLsZEJPEQzcQNpG3GxMGPeN5zASD7Zg50UWNbkALKvfxYg==
X-Received: by 2002:adf:b609:: with SMTP id f9mr8159958wre.223.1616057747077; 
 Thu, 18 Mar 2021 01:55:47 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q4sm1513375wma.20.2021.03.18.01.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 01:55:46 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Bin Meng <bmeng.cn@gmail.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <CAEUhbmW=sGq+bH59xV4hiTyMp4TD6YwaTGz+K7RjyH4qQ2urFA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <88cc9f2b-71b5-665e-3513-54af29c04609@amsat.org>
Date: Thu, 18 Mar 2021 09:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW=sGq+bH59xV4hiTyMp4TD6YwaTGz+K7RjyH4qQ2urFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 2:28 AM, Bin Meng wrote:
> On Thu, Mar 18, 2021 at 4:32 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi,
>>
>> For some (unclear) reason I got my free tier Gitlab account renewed and
>> lost the privilege for users opening account before the quota limit.
>>
>> I pushed a single branch to my namespace repo to trigger a pipeline.
>> 1h later I was surprised to see the pipeline was stuck, having completed
>> 99 jobs of 119. Looking closer there is a red comment on top of the
>> pipeline:
>>
>>  philmd has exceeded its pipeline minutes quota. Unless you buy
>>  additional pipeline minutes, no new jobs or pipelines in its projects
>>  will run. [Buy more Pipelines minutes]
>>
>> So I exhausted my 400 monthly minutes credit.
>>
>> From this FAQ:
>> https://about.gitlab.com/pricing/faq-consumption-cicd/#managing-your-cicd-minutes-usage
>>
>> Q. What happens if I hit the CI/CD Minutes allotted limit and forget to
>> purchase additional CI/CD Minutes?
>>
>> A. You will not be able to run new jobs until you purchase additional
>> CI/CD Minutes, or until the next month when you receive your monthly
>> allotted CI/CD Minutes.
>>
>> Q. Will I be notified before I hit my limit on CI/CD Minutes?
>>
>> A. You will receive notification banners in-app when your group has less
>> than 30%, 5% or exceeded your total allotted CI/CD minutes.
>>
>> I indeed received 3 warnings in 7 minutes.
>>
>> Now I'm having serious doubts about Gitlab usefulness for the QEMU
>> community...
>>
>> Some screenshots FWIW:
>>
>> https://pasteboard.co/JT51wGR.png
>> https://pasteboard.co/JT51Rqq.png
> 
> This snapshot shows that 2278 / 400 minutes (569%) were used. Strange?

Checking the timestamps, the last job was created *before* the 400min
limit. Gitlab didn't killed the running jobs once the limit was reached,
so the counter kept incrementing. Now I wonder if I buy 400 new minutes
I'll have new credit or it will be used to pay my debt...

Anyhow we have more than 100 jobs, so that mean if we use Gitlab once
a month, each job can't take more than 4min...

>> https://pasteboard.co/JT52fNL.png
> 
> I checked my gitlab settings, and it shows 0 / 400 minutes. However I
> am pretty sure I have been using gitlab CI this month several times.

You likely created your account more than 6 months ago. See
previous discussions:

https://forum.gitlab.com/t/ci-cd-minutes-for-gitlab-saas-free-tier/40241/42
https://forum.gitlab.com/t/ci-cd-minutes-for-gitlab-saas-free-tier/40241/52
https://forum.gitlab.com/t/ci-cd-minutes-for-gitlab-saas-free-tier/40241/59
https://forum.gitlab.com/t/ci-cd-minutes-for-gitlab-saas-free-tier/40241/63

