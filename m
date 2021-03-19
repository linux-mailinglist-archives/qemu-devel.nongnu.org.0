Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1056D341B90
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:35:55 +0100 (CET)
Received: from localhost ([::1]:57850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDQ2-0000Bi-3h
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNDOI-0007Tl-7q
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:34:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNDOG-0006Fx-GI
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:34:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id j18so8766885wra.2
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n+x8yaJcADPH2MLnVL5iqU0yQI0PNjhWsoC7Sx+pjKM=;
 b=qODJs27l3CcsqV226XwTVUtUFHTZoWgJ9qJJqo0U50A+Y+9dLGyQFveDNsWKBkHDxG
 bDt1w0iab3JoWVT3Ym2AD5XqmCDDnCU0VdBNrbd8QNR/gCIH75lYpcULWrPwqGbUGpYE
 CY47z3+X9FBgfvyKYGJ49p4zlGkC+hdukwUCFInbdiGbcf19RTl1Mwh8w5u3Zckq5EeQ
 PExctv3gWNlrujwWzUjbveANwc6oSINRANb1RNLmAHvpQrtncJZV4SLYl6iOvxzL6Xml
 PxsrmUYYd9m33i54Hi+SS+/Rg3HZiMvMQxt9pixw3UK0yO0nueTPvVP5go9vryRjTRm1
 rWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n+x8yaJcADPH2MLnVL5iqU0yQI0PNjhWsoC7Sx+pjKM=;
 b=X1TxylPSqqVvwUyJisFiZGmgMmdRh8dz4iATkM9yk78utrVtNHYqD4ZReui74xuUFb
 Zqr40h3yZDIRVih5+UsvT7d5k8KS4RQkil/BZT8iZWO+HSi6dtBezjx9hfgS8+zPLFNk
 Ux8JEOy6l6IQpnUvARUDhSEo10lZ/qlcnEGA8e6+0/qu3sUZCkj/DctoJzkdchfJNWOL
 yZHzJbDQURqee9BI5pYYQHWFSPDGy5Q4aXXuSAdUd6u9QX4eBEKPSBbWf+4ESHHSSE0Q
 PZ5PF17f5Pmywr7a9f/Mf0OalF6RA9dprFAeD83iQuADhg/o2y88+j0Nmo4/bDb3NQPF
 BVbg==
X-Gm-Message-State: AOAM531Rgk9UciswqMwCbDdyhD661un7weH5VHtFQ1RUYnFPZ0Iw2qVZ
 ztIB6/xU+hN5zv5FjkXpyME=
X-Google-Smtp-Source: ABdhPJxpXB9qVDhFgyEj6hHasEvubHRLvLqgTGJQG6VeZ9NPoHce6LkzWRb7ZOKQsgMJ6ZGYtG+jSg==
X-Received: by 2002:a5d:49ca:: with SMTP id t10mr4133503wrs.76.1616153642632; 
 Fri, 19 Mar 2021 04:34:02 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c8sm6017220wmb.34.2021.03.19.04.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 04:34:02 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
Date: Fri, 19 Mar 2021 12:34:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 11:59 AM, Paolo Bonzini wrote:
> On 19/03/21 11:18, Andrew Jones wrote:
>>> Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
>>> on slow machines or if we'll hit the same issue with dedicated runners.
>>> It seems like CI optimization will be necessary...
>>>
>> We need to reduce the amount of CI we do, not only because we can't
>> afford
>> it, but because it's wasteful. I hate to think of all the kWhs spent
>> testing the exact same code in the exact same way, since everyone runs
>> everything with a simple 'git push'.
> 
> Yes, I thought the same.
> 
>> IMHO, 'git push' shouldn't trigger
>> anything. Starting CI should be an explicit step.

* tests/acceptance: Only run tests tagged 'gating-ci' on GitLab CI
https://www.mail-archive.com/qemu-devel@nongnu.org/msg756464.html

* gitlab-ci: Allow forks to select & restrict build jobs
https://www.mail-archive.com/qemu-devel@nongnu.org/msg758331.html

> It is possible to do that on a project that uses merge requests, for
> example like this:
> 
> workflow:
>   rules:
>     - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
>     - if: '$CI_COMMIT_BRANCH
>       when: never
> 
> For us it's a bit more complicated (no merge requests).
> 
> Another common feature is failing the pipeline immediately if one of the
> jobs fail, but GitLab does not support it
> (https://gitlab.com/gitlab-org/gitlab/-/issues/23605).
> 
>> Also, the default CI
>> should only trigger tests associated with the code changed. One should
>> have to explicitly trigger a complete CI when they deem it worthwhile.
> 
> This is interesting.  We could add a stage that looks for changed files
> using "git diff" and sets some variables (e.g. softmmu, user, TCG,
> various targets) based on the results.  Then you use those to skip some
> jobs or some tests, for example skipping check-tcg.  See
> https://docs.gitlab.com/ee/ci/variables/#inherit-cicd-variables for more
> information.
> 
> Paolo
> 
> 

