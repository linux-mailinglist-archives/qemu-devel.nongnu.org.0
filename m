Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13524538A3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:38:10 +0100 (CET)
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2PJ-00029n-U0
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:38:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn2OD-0001RZ-Ka
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:37:01 -0500
Received: from [2a00:1450:4864:20::430] (port=41909
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn2O7-0005wt-VX
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:37:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id a9so12902588wrr.8
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 09:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OTYft3lSoS1InWlfvtSoUcYKMrsTz2XDc95yaKxXaUU=;
 b=XNqlmgqITe+fqSmN+aONUl4EMSg4ZRUIZuUcGTkh59Y5TuKB85O6kumFWPPFejf30F
 SLE2P5U8iM+zmCyAQ/bu+wfLVVHLtbib41mdrJ8pCdTK5vb6zDibb0yqR6XaiJSSnKlF
 iJ3x4GQzM4ZpabTy/Xgf3a2UCRqfWV73+Ljqh/0W7EHKNoN+J62nNx0Vtj/mSezzGr2Y
 +DxLgJH5ByIWZL8Ztk5cr/gJIbVpgDpuukqWUofvrVEuydynF9Z48HPlZLdoDeOGevy8
 Eses/iSTkWbbtd7wxMYqGEqGBe8La8FWfjagWs9IXqbAP/t33Az5qa0HEQ3b1tDdA7Xm
 4Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTYft3lSoS1InWlfvtSoUcYKMrsTz2XDc95yaKxXaUU=;
 b=Iu2cU9BjaFYrwthfTpFrWOJEaVBp6nAR461IPdAQp3fWaA5c8qS/hvM/ULx/U6G098
 Oa4FYjM2dmSrhmZBeIWJA9rOpiLhsKUS5HFnxZbeZMU3Y07i2C97NHmB/F+uumiKT4qZ
 AjnzijdTozs6itlK4migU1s1odRJxujjzm2MTzl5MqmpGpHGIkCgbNU8ZiDPu7H/MKl0
 BulHrpwc7OERVrx9tokijnRSk896QqeTIgUF16NIPrKY7o4lKyvTgc9SXtlmB9ldFouH
 dsQQkcPyNzo2CII3os4tVcWXKOK99013DZ7nTPbd5BeaxuXzOJKfRzgbA7tJoWIlbS5J
 eg0Q==
X-Gm-Message-State: AOAM530fozOoa6d3X/KtLnXLxccUInj6G9Bk9BXO4lclW/2bpHnxbfwb
 fEE9UxYOhr225uvOYCyzqlX8hQ==
X-Google-Smtp-Source: ABdhPJydst4ppI5Zc4zEr51xAhFmChh2Cq1CIw3+EqePo/NkUezs5BArgFaLl6ZOaHSnRxlgtqsQrQ==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr11750891wrp.29.1637084214177; 
 Tue, 16 Nov 2021 09:36:54 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id l124sm3139644wml.8.2021.11.16.09.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:36:53 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci/cirrus: Increase timeout to 80 minutes
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20211116163309.246602-1-thuth@redhat.com>
 <YZPhHt4JFcz41YFJ@redhat.com>
 <3b48a20f-c8db-9ebf-f179-f1843782c229@redhat.com>
 <632a5f2e-3e5d-1ed7-e27f-82571e374043@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a97f6776-aaef-b4da-04ec-dcb1fcd25902@linaro.org>
Date: Tue, 16 Nov 2021 18:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <632a5f2e-3e5d-1ed7-e27f-82571e374043@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.446, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 6:22 PM, Thomas Huth wrote:
> On 16/11/2021 18.09, Philippe Mathieu-Daudé wrote:
>> On 11/16/21 17:49, Daniel P. Berrangé wrote:
>>> On Tue, Nov 16, 2021 at 05:33:09PM +0100, Thomas Huth wrote:
>>>> The jobs on Cirrus-CI sometimes get delayed quite a bit, waiting to
>>>> be scheduled, so while the build test itself finishes within 60 minutes,
>>>> the total run time of the jobs can be longer due to this waiting time.
>>>> Thus let's increase the timeout on the gitlab side a little bit, so
>>>> that these jobs are not marked as failing just because of the delay.
> ...>>> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
>>>> index e7b25e7427..22d42585e4 100644
>>>> --- a/.gitlab-ci.d/cirrus.yml
>>>> +++ b/.gitlab-ci.d/cirrus.yml
>>>> @@ -14,6 +14,7 @@
>>>>     stage: build
>>>>     image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
>>>>     needs: []
>>>> +  timeout: 80m
>>>>     allow_failure: true
>>>>     script:
>>>>       - source .gitlab-ci.d/cirrus/$NAME.vars
>>>
>>> Whether 80 or 100 minute, consider it
>>>
>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>
>> This pipeline took 1h51m09s:
>> https://gitlab.com/qemu-project/qemu/-/pipelines/409666733/builds
>> But Richard restarted unstable jobs, which probably added time
>> to the total.
>>
>> IIRC from a maintainer perspective 1h15 is the upper limit.
>> 80m fits, 100m is over.
> 
> I think I agree ... I normally don't want to wait more than a little bit more than one 
> hour, so 100 minutes feels too long already. We already have some 70m timeouts in other 
> jobs, and one 80 minute timeout in .gitlab-ci.d/crossbuild-template.yml, so I'd say 80 
> minutes are really the upper boundary that we should use.

We are also talking apples and oranges:
Gitlab timeouts are on the amount of time the job runs.
Cirrus timeouts appear to be on the amount of time the job is queued.

If cirrus would just not start accounting until the thing runs we'd be fine.


r~

