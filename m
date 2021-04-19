Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3336487F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:48:22 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYX4O-000496-Jq
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYX31-0003HA-99
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:46:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYX2z-0004mJ-6d
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:46:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id r7so22741303wrm.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lg4wMV74Xre47W8kkxyrWdVkXyhLdS2BNn+QJ75k+Qc=;
 b=WnqEjc+i//TeqpkRmKvIGLc7jsxEQJBLqfaC79+bvhhPKzABDpaTdK9DP7e4At80a7
 WdudPdQg8PVfXoLlvL6mUbjJA6LqlAHyCZwmzc5FQ4XPPY9xhiPcOc0zsb1dBKviEJFj
 eTWyxep32TFnue0rFHYiP7vPqvm/TtmT+RjdcIKnSJDW7Vg7MjLmNIk2JtJY7FRLceRJ
 chLWaY8NOtjoIR5yDnuoRJJ3c5V6Fyumn8i1bJvWkOFn3bgxpOCoCAqn0pM+pb/Imf/I
 p7zLEYJXuQyMA3XcnitCFCenkptatQtxopzROvoNGDenpjsyA+ikBfM5V1dBCVUb1jG4
 jEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lg4wMV74Xre47W8kkxyrWdVkXyhLdS2BNn+QJ75k+Qc=;
 b=MjPsaKiE5LMAR8b1cXErDjpytl5rGAa1wB+GQnV/hx88zdAeCox6F+jYROLYTZkyeP
 4MbRx+FeoVCpmUcGIbUlbUCO2fVuZllabTAoAOj5Ry60IfBP61BJtXbyDZfXT132HhJq
 N0SjmnjzCUubKozF3Jfkix+lMsOHRG5AF+QghMmio2q2yorY3oZgi/JXsjrX1zXm06A5
 ckDkNvknmGJezyRPfzfmXKD7E87j7T/6ZSutFOhZTaP8c8WVBLsHX2buKasLhYfNazgg
 3eJ1IoEeKjz6hGZOc/XQi+x3z/pLCtg4+NKoSf0Rw/d0chFWv/ywMf+k0w0RpUHyEPTY
 spzg==
X-Gm-Message-State: AOAM532a62Bv7prwlel8zNo03ojEo/KscHZYB7aHLmDf9PXaKlWRqwP9
 ydFn4/F0VknU1pdh2DeACN0=
X-Google-Smtp-Source: ABdhPJwN77/pKfzVYnuiC+yJG2zozflkzHTXFeau5a81Dot8d2gmwmLNKvcaFCxuefOtV6OtfupflQ==
X-Received: by 2002:a5d:4308:: with SMTP id h8mr4271768wrq.371.1618850811417; 
 Mon, 19 Apr 2021 09:46:51 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f23sm31065wmf.37.2021.04.19.09.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 09:46:50 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org> <877dky9rqt.fsf@linaro.org>
 <YH2uQADHTM4pBMi1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <534d7a2c-9377-01b6-cc9f-cd1f5aaaac00@amsat.org>
Date: Mon, 19 Apr 2021 18:46:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YH2uQADHTM4pBMi1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 6:22 PM, Daniel P. Berrangé wrote:
> On Mon, Apr 19, 2021 at 04:57:55PM +0100, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> Forks run the same jobs than mainstream, which might be overkill.
>>> Allow them to easily rebase their custom set, while keeping using
>>> the mainstream templates, and ability to pick specific jobs from
>>> the mainstream set.
>>>
>>> To switch to your set, simply add your .gitlab-ci.yml as
>>> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
>>> is your gitlab 'namespace', usually username). This file will be
>>> used instead of the default mainstream set.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  .gitlab-ci.yml | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 718c8e004be..35fd35075db 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -9,7 +9,12 @@ generate-config:
>>>      paths:
>>>        - generated-config.yml
>>>    script:
>>> -    - cp .gitlab-ci.d/qemu-project.yml generated-config.yml
>>> +    - if test -e .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml ;
>>> +      then
>>> +        cp .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml generated-config.yml ;
>>> +      else
>>> +        cp .gitlab-ci.d/qemu-project.yml generated-config.yml ;
>>> +      fi
>>
>> This is going to be a little clunky. I can see a use for the static
>> forks that Danial proposes but I guess what is needed is a little
>> expressiveness. So how to express things like:
>>
>>  - I've only touched stuff in linux-user, so run only linux-user tests
> 
> This can be done with "rules" matching on files, but *only* if the
> pipeline trigger is a merge request - specifically not a git branch
> push, as the latter doesn't have the semantics you expect wrt
> determining the "ancestor" to compare against. It only looks at commits
> in the push, not those which may already have previously been pushed
> on the branch.
> 
>>  - I'm working on KVM, run all KVM enabled builds and tests
>>
>>  - I've changed the core TCG code, run everything that exercises that
>>
>>  - I'm working on ARM, only build and run jobs that have ARM targets
> 
> If the stuff you work on is fairly static, we could potentially
> allow env variables to be set by the user in their fork, which
> the CI jobs use to filter jobs.
> 
>> I think we should define a minimum set of lightweight smoke tests that
>> get the most bang for buck for catching sillies. I think checkpatch and
>> dco checking should probably be in there - and maybe one of the bog
>> standard build everything builds (maybe a random ../configure; make;
>> make check on one of the supported LTS targets).
> 
> Could we have allow an env var  "QEMU_CI_SMOKE_TEST=1" which can be
> set when pushing:
> 
>    git push  -o ci.variable="QEMU_CI_SMOKE_TEST=1"
> 
> 
> which causes it to only do the minimum neccessary.
> 
> Alternatively, invert this, so do minimum smoke test by default
> and require an env to run the full test. QEMU_CI_MAX=1
> 
> Potentially allow also  "QEMU_CI_EXTRA_JOBS=foo,bar,wizz"
> to match against job jnames ?

Is that what you mean?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg758340.html

(cover https://www.mail-archive.com/qemu-devel@nongnu.org/msg758331.html)

>> Then there is the question of defaults. Should we default to a minimised
>> set unless asked or should the default be the full fat run everything?
> 
> With the direction gitlab is taking towards limiting CI minuts, it is
> probably a safer bet to do a minimal smoke test by default and only
> do the full test when definitely needed.

Yes please.

